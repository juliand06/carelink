CREATE TABLE IF NOT EXISTS ${db_schema}.client_allergies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id UUID NOT NULL,
    allergen VARCHAR(200) NOT NULL,
    reaction_description TEXT,
    severity_level VARCHAR(20),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    registered_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    registered_by UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_client_allergies_client_id FOREIGN KEY (client_id) REFERENCES ${db_schema}.clients (id),
    CONSTRAINT fk_client_allergies_registered_by FOREIGN KEY (registered_by) REFERENCES ${db_schema}.specialists (id)
);

CREATE INDEX IF NOT EXISTS idx_client_allergies_client_id ON ${db_schema}.client_allergies (client_id);
CREATE INDEX IF NOT EXISTS idx_client_allergies_registered_by ON ${db_schema}.client_allergies (registered_by);
