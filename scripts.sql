--CREATE DATABASE
CREATE DATABASE streaming_example;

-- REMEMBER TO CONNECT TO THE DATABASE BEFORE APPLY DDL SCRIPTS.
-- \c streaming_example;

-- DDL
create table table_a
(
    id bigserial not null constraint table_a_pkey primary key,
    field_a varchar(200),
    field_b varchar(200)
);

create table table_b
(
    id bigserial not null constraint table_b_pkey primary key,
    field_c varchar(50),
    table_a_id bigint not null constraint atividade_dados_origem_uk
        unique constraint atividade_fk_dados_origem_atividade references table_a
);


-- SHOWING ALL DATA
select * from table_a a join table_b tb on a.id = tb.table_a_id;


-- INSERT ONE REGISTER PER TABLE
DO $$
    DECLARE
        random_number record;
    BEGIN
        SELECT random() * 10 + 1 into random_number;
        
        -- SHIFT THE id OF table_a, WHICH WILL MAKE table_a.id <> tablea_b.id
		INSERT INTO table_a (field_a, field_b)
		VALUES ('SHIFT', 'SHIFT');
		TRUNCATE table_a CASCADE;

        INSERT INTO table_a (field_a, field_b) VALUES ('TEST', random_number);
        INSERT INTO table_b (field_c, table_a_id) VALUES ('TABLE A ' || random_number, (select max(id) from table_a));
    END;
$$;

-- INSERT 5.000.000 OF DATA
DO
$do$
    BEGIN
        FOR i IN 50..5000000 LOOP
                INSERT INTO table_a (field_a, field_b) VALUES ('TEST', i);
                INSERT INTO table_b (field_c, table_a_id) VALUES ('TABLE A ' || i, (select max(id) from table_a));
            END LOOP;
    END
$do$;
