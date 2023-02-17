INSERT INTO iti(id, name, path, geom)
    SELECT id, name, normalize_path(path), geom
    FROM iti_tmp_import p
ON CONFLICT(id) DO UPDATE
    SET name = excluded.name, geom = excluded.geom, path = excluded.path;
