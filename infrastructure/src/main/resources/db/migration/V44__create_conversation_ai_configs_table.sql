CREATE TABLE IF NOT EXISTS ${db_schema}.conversation_ai_configs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL UNIQUE,
    ai_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    preferred_model_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_conversation_ai_configs_conversation_id FOREIGN KEY (conversation_id) REFERENCES ${db_schema}.support_conversations (id),
    CONSTRAINT fk_conversation_ai_configs_preferred_model_id FOREIGN KEY (preferred_model_id) REFERENCES ${db_schema}.llm_models (id)
);

CREATE INDEX IF NOT EXISTS idx_conversation_ai_configs_preferred_model_id ON ${db_schema}.conversation_ai_configs (preferred_model_id);
