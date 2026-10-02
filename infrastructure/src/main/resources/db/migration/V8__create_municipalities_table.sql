CREATE TABLE IF NOT EXISTS ${db_schema}.municipalities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    iso_code VARCHAR(10) NOT NULL,
    notes VARCHAR(100),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    department_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_municipalities_department_id FOREIGN KEY (department_id) REFERENCES ${db_schema}.departments (id),
    UNIQUE (department_id, iso_code)
);

CREATE INDEX IF NOT EXISTS idx_municipalities_department_id ON ${db_schema}.municipalities (department_id);
