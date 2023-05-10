create table if not exists public.codigos_nfce(
    id serial not null primary key,
    codigo character varying not null,
    status boolean default false,
    create_at timestamp without time default now()
);