CREATE TABLE IF NOT EXISTS ${db_schema}.clients (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_document_type_id UUID NOT NULL,
    document_number VARCHAR(30) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    second_last_name VARCHAR(50),
    birth_date DATE NOT NULL,
    biological_sex_id UUID NOT NULL,
    gender_identity_id UUID NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    mobile_phone VARCHAR(30),
    home_address VARCHAR(250),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by UUID,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by UUID,
    municipality_id UUID NOT NULL,
    CONSTRAINT fk_clients_id_document_type_id FOREIGN KEY (id_document_type_id) REFERENCES ${db_schema}.id_document_types (id),
    CONSTRAINT fk_clients_biological_sex_id FOREIGN KEY (biological_sex_id) REFERENCES ${db_schema}.biological_sexes (id),
    CONSTRAINT fk_clients_gender_identity_id FOREIGN KEY (gender_identity_id) REFERENCES ${db_schema}.biological_sexes (id),
    CONSTRAINT fk_clients_created_by FOREIGN KEY (created_by) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_clients_updated_by FOREIGN KEY (updated_by) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_clients_municipality_id FOREIGN KEY (municipality_id) REFERENCES ${db_schema}.municipalities (id),
    UNIQUE (id_document_type_id, document_number)
);

CREATE INDEX IF NOT EXISTS idx_clients_id_document_type_id ON ${db_schema}.clients (id_document_type_id);
CREATE INDEX IF NOT EXISTS idx_clients_biological_sex_id ON ${db_schema}.clients (biological_sex_id);
CREATE INDEX IF NOT EXISTS idx_clients_gender_identity_id ON ${db_schema}.clients (gender_identity_id);
CREATE INDEX IF NOT EXISTS idx_clients_created_by ON ${db_schema}.clients (created_by);
CREATE INDEX IF NOT EXISTS idx_clients_updated_by ON ${db_schema}.clients (updated_by);
CREATE INDEX IF NOT EXISTS idx_clients_municipality_id ON ${db_schema}.clients (municipality_id);
