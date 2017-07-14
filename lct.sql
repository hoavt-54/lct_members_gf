---------------------------------
-- create lct database 
-- 1. create lct table
-- 2. insert data

CREATE TABLE members (
    name        varchar(80),
    mem_type    varchar (20),
    nationality     varchar (80),
    age         int,
    city1  varchar(80),
    city2 varchar(80),
    gf_score    int
);


-----------------
-- Adding data
-- 

INSERT INTO members (name, mem_type, nationality, age, city1, city2, gf_score)
        VALUES ('Hoa', 'student', 'Vietnam', 26, 'Prague', 'Malta', 8),
                ('Carlos', 'student', 'Mexico', 31, 'SanSebatian', 'Malta', 9),
                ('Aina', 'student', 'Spain', 25, 'Saarland', 'Malta', 10),
                ('Liqin', 'student', 'China', 28, 'Groningen', 'Malta', 9),
                ('Isode', 'student', 'Netherland', 23, 'Groningen', 'Malta', 9),
                ('Hai', 'student', 'Vietnam', 24, 'Malta', 'Prague', 9),
                ('Vinit', 'student', 'Vietnam', 23, 'Malta', 'Prague', 9),
                ('XiaoYu', 'student', 'Germany', 25, 'Malta', 'Groningen', 9),
                ('Claudia', 'student', 'Italia', 23, 'Malta', 'Groningen', 9);


