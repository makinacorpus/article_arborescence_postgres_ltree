create table iti
(
    id   text                            not null
        primary key,
    name text                            not null,
    path ltree                           not null,
    geom geometry(MultiLineString, 3857) not null
);
