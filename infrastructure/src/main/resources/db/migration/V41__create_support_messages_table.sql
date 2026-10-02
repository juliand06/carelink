CREATE TABLE IF NOT EXISTS ${db_schema}.support_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL,
    message_format_id UUID NOT NULL,
    member_id UUID NOT NULL,
    payload JSONB NOT NULL,
    extra_data JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_support_messages_conversation_id FOREIGN KEY (conversation_id) REFERENCES ${db_schema}.support_conversations (id),
    CONSTRAINT fk_support_messages_message_format_id FOREIGN KEY (message_format_id) REFERENCES ${db_schema}.message_formats (id),
    CONSTRAINT fk_support_messages_member_id FOREIGN KEY (member_id) REFERENCES ${db_schema}.conversation_members (id)
);

CREATE INDEX IF NOT EXISTS idx_support_messages_conversation_id ON ${db_schema}.support_messages (conversation_id);
CREATE INDEX IF NOT EXISTS idx_support_messages_message_format_id ON ${db_schema}.support_messages (message_format_id);
CREATE INDEX IF NOT EXISTS idx_support_messages_member_id ON ${db_schema}.support_messages (member_id);
