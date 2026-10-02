CREATE TABLE IF NOT EXISTS ${db_schema}.departments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    iso_code VARCHAR(10) NOT NULL,
    notes VARCHAR(100),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    country_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_departments_country_id FOREIGN KEY (country_id) REFERENCES ${db_schema}.countries (id),
    UNIQUE (country_id, iso_code)
);

CREATE INDEX IF NOT EXISTS idx_departments_country_id ON ${db_schema}.departments (country_id);
