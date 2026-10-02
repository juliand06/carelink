CREATE TABLE IF NOT EXISTS ${db_schema}.trusted_contacts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name VARCHAR(150) NOT NULL,
    relationship_type_id UUID NOT NULL,
    is_primary_contact BOOLEAN NOT NULL DEFAULT FALSE,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_trusted_contacts_relationship_type_id FOREIGN KEY (relationship_type_id) REFERENCES ${db_schema}.contact_relationship_types (id)
);

CREATE INDEX IF NOT EXISTS idx_trusted_contacts_relationship_type_id ON ${db_schema}.trusted_contacts (relationship_type_id);
