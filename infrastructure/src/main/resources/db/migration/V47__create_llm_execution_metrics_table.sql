CREATE TABLE IF NOT EXISTS ${db_schema}.llm_execution_metrics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    execution_id UUID NOT NULL UNIQUE,
    input_tokens INTEGER NOT NULL DEFAULT 0,
    output_tokens INTEGER NOT NULL DEFAULT 0,
    total_tokens INTEGER NOT NULL DEFAULT 0,
    total_cost DECIMAL(10,6) NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_llm_execution_metrics_execution_id FOREIGN KEY (execution_id) REFERENCES ${db_schema}.llm_executions (id)
);
