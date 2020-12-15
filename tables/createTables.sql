-- Table: public.Citys

-- DROP TABLE public."Citys";

CREATE TABLE public."Citys"
(
    "nameCity" character varying[] COLLATE pg_catalog."default" NOT NULL,
    "idCity" integer NOT NULL DEFAULT nextval('"Citys_idCity_seq"'::regclass),
    CONSTRAINT "Citys_pkey" PRIMARY KEY ("idCity")
)

TABLESPACE pg_default;

ALTER TABLE public."Citys"
    OWNER to postgres;

-- Table: public.Employers
-- DROP TABLE public."Employers";

CREATE TABLE public."Employers"
(
    "companyName" character varying[] COLLATE pg_catalog."default" NOT NULL,
    "idCompany" integer NOT NULL DEFAULT nextval('"Employers_idCompany_seq"'::regclass),
    rating integer,
    CONSTRAINT "Employers_pkey" PRIMARY KEY ("idCompany")
)

TABLESPACE pg_default;

ALTER TABLE public."Employers"
    OWNER to postgres;

COMMENT ON TABLE public."Employers"
    IS 'Таблица с компанией и ее id';

    -- Table: public.Responds

    -- DROP TABLE public."Responds";

    CREATE TABLE public."Responds"
    (
        "idRes" integer NOT NULL DEFAULT nextval('"Responds_idRes_seq"'::regclass),
        "idVac" integer NOT NULL DEFAULT nextval('"Responds_idVac_seq"'::regclass),
        "idSum" integer NOT NULL DEFAULT nextval('"Responds_idSum_seq"'::regclass),
        "idEmp" integer NOT NULL DEFAULT nextval('"Responds_idEmp_seq"'::regclass),
        "dateRes" date NOT NULL,
        CONSTRAINT "Responds_pkey" PRIMARY KEY ("idRes"),
        CONSTRAINT "RespEmp" FOREIGN KEY ("idEmp")
            REFERENCES public."Employers" ("idCompany") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT "RespSum" FOREIGN KEY ("idRes")
            REFERENCES public."Summarys" ("idSum") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT "RespVac" FOREIGN KEY ("idRes")
            REFERENCES public."Vacancies" ("idVac") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )

    TABLESPACE pg_default;

    ALTER TABLE public."Responds"
        OWNER to postgres;

        -- Table: public.Summarys

        -- DROP TABLE public."Summarys";

        CREATE TABLE public."Summarys"
        (
            "idSum" integer NOT NULL DEFAULT nextval('"Summarys_idSum_seq"'::regclass),
            "firstName" character(15)[] COLLATE pg_catalog."default" NOT NULL,
            "secondName" character(20)[] COLLATE pg_catalog."default" NOT NULL,
            "wannaPosition" character(30)[] COLLATE pg_catalog."default" NOT NULL,
            "wannaSalary" integer,
            "idCity" integer NOT NULL DEFAULT nextval('"Summarys_idCity_seq"'::regclass),
            graduation character(10)[] COLLATE pg_catalog."default",
            skills character(50)[] COLLATE pg_catalog."default",
            CONSTRAINT "Summarys_pkey" PRIMARY KEY ("idSum"),
            CONSTRAINT "SumCity" FOREIGN KEY ("idSum")
                REFERENCES public."Citys" ("idCity") MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
        )

        TABLESPACE pg_default;

        ALTER TABLE public."Summarys"
            OWNER to postgres;

            -- Table: public.Vacancies

            -- DROP TABLE public."Vacancies";

            CREATE TABLE public."Vacancies"
            (
                "idVac" integer NOT NULL DEFAULT nextval('"Мacancies_idVac_seq"'::regclass),
                "nameVac" character(30)[] COLLATE pg_catalog."default" NOT NULL,
                compensation_from integer,
                compensation_to integer,
                compensation_groos boolean,
                "idCity" integer NOT NULL DEFAULT nextval('"Мacancies_idCity_seq"'::regclass),
                "createdAt" date,
                CONSTRAINT "Мacancies_pkey" PRIMARY KEY ("idVac"),
                CONSTRAINT "VacCity" FOREIGN KEY ("idCity")
                    REFERENCES public."Citys" ("idCity") MATCH SIMPLE
                    ON UPDATE NO ACTION
                    ON DELETE NO ACTION
            )

            TABLESPACE pg_default;

            ALTER TABLE public."Vacancies"
                OWNER to postgres;

            COMMENT ON TABLE public."Vacancies"
                IS 'вакансии ';
