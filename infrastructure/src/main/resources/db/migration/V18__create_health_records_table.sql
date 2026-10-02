CREATE TABLE IF NOT EXISTS ${db_schema}.health_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id UUID NOT NULL,
    opening_date TIMESTAMPTZ NOT NULL DEFAULT now(),
    record_code VARCHAR(50) NOT NULL,
    opened_at TIMESTAMPTZ,
    closed_at TIMESTAMPTZ,
    status_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by UUID NOT NULL,
    CONSTRAINT fk_health_records_client_id FOREIGN KEY (client_id) REFERENCES ${db_schema}.clients (id),
    CONSTRAINT fk_health_records_status_id FOREIGN KEY (status_id) REFERENCES ${db_schema}.health_record_statuses (id),
    CONSTRAINT fk_health_records_created_by FOREIGN KEY (created_by) REFERENCES ${db_schema}.specialists (id)
);

CREATE INDEX IF NOT EXISTS idx_health_records_client_id ON ${db_schema}.health_records (client_id);
CREATE INDEX IF NOT EXISTS idx_health_records_status_id ON ${db_schema}.health_records (status_id);
CREATE INDEX IF NOT EXISTS idx_health_records_created_by ON ${db_schema}.health_records (created_by);
