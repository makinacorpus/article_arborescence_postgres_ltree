CREATE OR REPLACE FUNCTION normalize_path(path text)
    -- Reçois un chemin au format 'A.B.C' et renvoie une version normalisée de celui ci (ie : <uuid_mapping_A>.<uuid_mapping_B>.<uuid_mapping_C>)
    RETURNS ltree
    AS
    $$
    DECLARE result ltree;
    BEGIN
        WITH path_parts AS (
                SELECT parts, n
                FROM unnest(string_to_array(path , '.') ) WITH ORDINALITY AS t(parts,n) -- WITH ORDINALITY est nécessaire pour génerer 'n' qui peux ensuite être utilisé pour rendre l'ordre cohérent durant l'aggrégation
            )
            SELECT string_agg(p.id,'.' ORDER BY parts.n)::ltree INTO result -- Remarquez le ORDER BY, très important si vous voulez conservez la hiérarchie de votre chemin
            FROM path_names p
            LEFT JOIN path_parts parts
                ON parts = p.label
            WHERE parts = p.label;
        RETURN result;
    END;
$$ STABLE PARALLEL SAFE LANGUAGE plpgsql;
