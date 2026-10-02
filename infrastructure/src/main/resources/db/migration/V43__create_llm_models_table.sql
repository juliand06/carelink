CREATE TABLE IF NOT EXISTS ${db_schema}.llm_models (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    llm_vendor_id UUID NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    api_identifier VARCHAR(120) NOT NULL UNIQUE,
    price_per_input_token DECIMAL(12,8) NOT NULL,
    price_per_output_token DECIMAL(12,8) NOT NULL,
    max_output_tokens INTEGER NOT NULL,
    context_length INTEGER NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_llm_models_llm_vendor_id FOREIGN KEY (llm_vendor_id) REFERENCES ${db_schema}.llm_vendors (id)
);

CREATE INDEX IF NOT EXISTS idx_llm_models_llm_vendor_id ON ${db_schema}.llm_models (llm_vendor_id);
