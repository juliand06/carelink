CREATE TABLE IF NOT EXISTS ${db_schema}.llm_execution_statuses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    label VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
