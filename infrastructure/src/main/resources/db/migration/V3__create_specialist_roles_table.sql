CREATE TABLE IF NOT EXISTS ${db_schema}.specialist_roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(40) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
