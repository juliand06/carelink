CREATE TABLE IF NOT EXISTS ${db_schema}.client_trusted_contacts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id UUID NOT NULL,
    trusted_contact_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_client_trusted_contacts_client_id FOREIGN KEY (client_id) REFERENCES ${db_schema}.clients (id),
    CONSTRAINT fk_client_trusted_contacts_trusted_contact_id FOREIGN KEY (trusted_contact_id) REFERENCES ${db_schema}.trusted_contacts (id),
    UNIQUE (client_id, trusted_contact_id)
);

CREATE INDEX IF NOT EXISTS idx_client_trusted_contacts_client_id ON ${db_schema}.client_trusted_contacts (client_id);
CREATE INDEX IF NOT EXISTS idx_client_trusted_contacts_trusted_contact_id ON ${db_schema}.client_trusted_contacts (trusted_contact_id);
