CREATE TABLE IF NOT EXISTS ${db_schema}.handoffs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL,
    handoff_status_id UUID NOT NULL,
    originated_from_ai BOOLEAN NOT NULL DEFAULT FALSE,
    handoff_reason TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_handoffs_conversation_id FOREIGN KEY (conversation_id) REFERENCES ${db_schema}.support_conversations (id),
    CONSTRAINT fk_handoffs_handoff_status_id FOREIGN KEY (handoff_status_id) REFERENCES ${db_schema}.handoff_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_handoffs_conversation_id ON ${db_schema}.handoffs (conversation_id);
CREATE INDEX IF NOT EXISTS idx_handoffs_handoff_status_id ON ${db_schema}.handoffs (handoff_status_id);
