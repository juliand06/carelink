CREATE TABLE IF NOT EXISTS ${db_schema}.academic_programs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(40) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
