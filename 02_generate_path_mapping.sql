WITH path_parts AS (SELECT unnest(string_to_array(path , '.'::text)) as path from iti_tmp_import)
INSERT INTO path_names(label, id)
    SELECT path_parts.path, replace(uuid_generate_v4()::text, '-', '_') as label_uuid FROM path_parts
ON CONFLICT (label)
DO NOTHING;
