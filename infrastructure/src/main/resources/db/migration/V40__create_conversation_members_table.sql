CREATE TABLE IF NOT EXISTS ${db_schema}.conversation_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL,
    client_id UUID,
    specialist_id UUID,
    sender_role_id UUID NOT NULL,
    joined_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_conversation_members_conversation_id FOREIGN KEY (conversation_id) REFERENCES ${db_schema}.support_conversations (id),
    CONSTRAINT fk_conversation_members_client_id FOREIGN KEY (client_id) REFERENCES ${db_schema}.clients (id),
    CONSTRAINT fk_conversation_members_specialist_id FOREIGN KEY (specialist_id) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_conversation_members_sender_role_id FOREIGN KEY (sender_role_id) REFERENCES ${db_schema}.sender_roles (id),
    CONSTRAINT chk_conversation_members_single_actor CHECK (
        (client_id IS NOT NULL AND specialist_id IS NULL) OR
        (client_id IS NULL AND specialist_id IS NOT NULL)
    )
);

CREATE INDEX IF NOT EXISTS idx_conversation_members_conversation_id ON ${db_schema}.conversation_members (conversation_id);
CREATE INDEX IF NOT EXISTS idx_conversation_members_client_id ON ${db_schema}.conversation_members (client_id);
CREATE INDEX IF NOT EXISTS idx_conversation_members_specialist_id ON ${db_schema}.conversation_members (specialist_id);
CREATE INDEX IF NOT EXISTS idx_conversation_members_sender_role_id ON ${db_schema}.conversation_members (sender_role_id);
