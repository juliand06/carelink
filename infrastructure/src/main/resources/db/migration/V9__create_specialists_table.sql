CREATE TABLE IF NOT EXISTS ${db_schema}.specialists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_document_type_id UUID NOT NULL,
    document_number VARCHAR(30) NOT NULL,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    specialist_role_id UUID NOT NULL,
    professional_license VARCHAR(100) NOT NULL UNIQUE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    municipality_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_specialists_id_document_type_id FOREIGN KEY (id_document_type_id) REFERENCES ${db_schema}.id_document_types (id),
    CONSTRAINT fk_specialists_specialist_role_id FOREIGN KEY (specialist_role_id) REFERENCES ${db_schema}.specialist_roles (id),
    CONSTRAINT fk_specialists_municipality_id FOREIGN KEY (municipality_id) REFERENCES ${db_schema}.municipalities (id),
    UNIQUE (id_document_type_id, document_number)
);

CREATE INDEX IF NOT EXISTS idx_specialists_id_document_type_id ON ${db_schema}.specialists (id_document_type_id);
CREATE INDEX IF NOT EXISTS idx_specialists_specialist_role_id ON ${db_schema}.specialists (specialist_role_id);
CREATE INDEX IF NOT EXISTS idx_specialists_municipality_id ON ${db_schema}.specialists (municipality_id);
