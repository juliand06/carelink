CREATE TABLE IF NOT EXISTS ${db_schema}.specialist_credentials (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    academic_program_id UUID NOT NULL,
    specialist_id UUID NOT NULL,
    degree_title VARCHAR(100) NOT NULL,
    institution VARCHAR(100) NOT NULL,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    resolution_code VARCHAR(60),
    country_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_specialist_credentials_academic_program_id FOREIGN KEY (academic_program_id) REFERENCES ${db_schema}.academic_programs (id),
    CONSTRAINT fk_specialist_credentials_specialist_id FOREIGN KEY (specialist_id) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_specialist_credentials_country_id FOREIGN KEY (country_id) REFERENCES ${db_schema}.countries (id)
);

CREATE INDEX IF NOT EXISTS idx_specialist_credentials_academic_program_id ON ${db_schema}.specialist_credentials (academic_program_id);
CREATE INDEX IF NOT EXISTS idx_specialist_credentials_specialist_id ON ${db_schema}.specialist_credentials (specialist_id);
CREATE INDEX IF NOT EXISTS idx_specialist_credentials_country_id ON ${db_schema}.specialist_credentials (country_id);
