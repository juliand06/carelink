CREATE TABLE IF NOT EXISTS ${db_schema}.llm_vendors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_name VARCHAR(100) NOT NULL UNIQUE,
    legal_name VARCHAR(255),
    website_url TEXT,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
