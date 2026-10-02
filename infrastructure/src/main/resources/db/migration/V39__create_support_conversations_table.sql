CREATE TABLE IF NOT EXISTS ${db_schema}.support_conversations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_status_id UUID NOT NULL,
    urgency_level_id UUID NOT NULL,
    last_interaction_at TIMESTAMPTZ,
    is_closed BOOLEAN NOT NULL DEFAULT FALSE,
    closed_at TIMESTAMPTZ,
    closed_by UUID,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_support_conversations_conversation_status_id FOREIGN KEY (conversation_status_id) REFERENCES ${db_schema}.support_conversation_statuses (id),
    CONSTRAINT fk_support_conversations_urgency_level_id FOREIGN KEY (urgency_level_id) REFERENCES ${db_schema}.urgency_levels (id)
);

CREATE INDEX IF NOT EXISTS idx_support_conversations_conversation_status_id ON ${db_schema}.support_conversations (conversation_status_id);
CREATE INDEX IF NOT EXISTS idx_support_conversations_urgency_level_id ON ${db_schema}.support_conversations (urgency_level_id);
