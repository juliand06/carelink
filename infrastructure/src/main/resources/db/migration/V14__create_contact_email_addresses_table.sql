CREATE TABLE IF NOT EXISTS ${db_schema}.contact_email_addresses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    trusted_contact_id UUID NOT NULL,
    email_address VARCHAR(150) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_contact_email_addresses_trusted_contact_id FOREIGN KEY (trusted_contact_id) REFERENCES ${db_schema}.trusted_contacts (id)
);

CREATE INDEX IF NOT EXISTS idx_contact_email_addresses_trusted_contact_id ON ${db_schema}.contact_email_addresses (trusted_contact_id);
