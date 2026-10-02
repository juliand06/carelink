CREATE TABLE IF NOT EXISTS ${db_schema}.llm_executions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL,
    message_id UUID NOT NULL,
    model_id UUID NOT NULL,
    execution_status_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_llm_executions_conversation_id FOREIGN KEY (conversation_id) REFERENCES ${db_schema}.support_conversations (id),
    CONSTRAINT fk_llm_executions_message_id FOREIGN KEY (message_id) REFERENCES ${db_schema}.support_messages (id),
    CONSTRAINT fk_llm_executions_model_id FOREIGN KEY (model_id) REFERENCES ${db_schema}.llm_models (id),
    CONSTRAINT fk_llm_executions_execution_status_id FOREIGN KEY (execution_status_id) REFERENCES ${db_schema}.llm_execution_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_llm_executions_conversation_id ON ${db_schema}.llm_executions (conversation_id);
CREATE INDEX IF NOT EXISTS idx_llm_executions_message_id ON ${db_schema}.llm_executions (message_id);
CREATE INDEX IF NOT EXISTS idx_llm_executions_model_id ON ${db_schema}.llm_executions (model_id);
CREATE INDEX IF NOT EXISTS idx_llm_executions_execution_status_id ON ${db_schema}.llm_executions (execution_status_id);
