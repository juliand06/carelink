CREATE TABLE IF NOT EXISTS ${db_schema}.countries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    iso_code VARCHAR(10) NOT NULL UNIQUE,
    notes VARCHAR(100),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    dial_prefix VARCHAR(5),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
