CREATE TABLE IF NOT EXISTS ${db_schema}.llm_execution_errors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    execution_id UUID NOT NULL,
    error_detail TEXT NOT NULL,
    error_code VARCHAR(80),
    vendor_error_ref VARCHAR(120),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_llm_execution_errors_execution_id FOREIGN KEY (execution_id) REFERENCES ${db_schema}.llm_executions (id)
);

CREATE INDEX IF NOT EXISTS idx_llm_execution_errors_execution_id ON ${db_schema}.llm_execution_errors (execution_id);
