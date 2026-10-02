CREATE TABLE IF NOT EXISTS ${db_schema}.message_formats (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    label VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
