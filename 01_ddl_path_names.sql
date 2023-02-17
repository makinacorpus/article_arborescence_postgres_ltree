create table path_names
(
    id    text not null
        primary key,
    label text not null
        unique
);
