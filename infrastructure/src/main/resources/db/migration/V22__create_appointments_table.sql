CREATE TABLE IF NOT EXISTS ${db_schema}.appointments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    health_record_id UUID NOT NULL,
    specialist_id UUID NOT NULL,
    appointment_type_id UUID NOT NULL,
    started_at TIMESTAMPTZ NOT NULL,
    ended_at TIMESTAMPTZ,
    chief_complaint TEXT,
    current_condition TEXT,
    modality_id UUID NOT NULL,
    status_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by UUID NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by UUID,
    CONSTRAINT fk_appointments_health_record_id FOREIGN KEY (health_record_id) REFERENCES ${db_schema}.health_records (id),
    CONSTRAINT fk_appointments_specialist_id FOREIGN KEY (specialist_id) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_appointments_appointment_type_id FOREIGN KEY (appointment_type_id) REFERENCES ${db_schema}.appointment_types (id),
    CONSTRAINT fk_appointments_modality_id FOREIGN KEY (modality_id) REFERENCES ${db_schema}.appointment_modalities (id),
    CONSTRAINT fk_appointments_status_id FOREIGN KEY (status_id) REFERENCES ${db_schema}.appointment_statuses (id),
    CONSTRAINT fk_appointments_created_by FOREIGN KEY (created_by) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_appointments_updated_by FOREIGN KEY (updated_by) REFERENCES ${db_schema}.specialists (id)
);

CREATE INDEX IF NOT EXISTS idx_appointments_health_record_id ON ${db_schema}.appointments (health_record_id);
CREATE INDEX IF NOT EXISTS idx_appointments_specialist_id ON ${db_schema}.appointments (specialist_id);
CREATE INDEX IF NOT EXISTS idx_appointments_appointment_type_id ON ${db_schema}.appointments (appointment_type_id);
CREATE INDEX IF NOT EXISTS idx_appointments_modality_id ON ${db_schema}.appointments (modality_id);
CREATE INDEX IF NOT EXISTS idx_appointments_status_id ON ${db_schema}.appointments (status_id);
CREATE INDEX IF NOT EXISTS idx_appointments_created_by ON ${db_schema}.appointments (created_by);
CREATE INDEX IF NOT EXISTS idx_appointments_updated_by ON ${db_schema}.appointments (updated_by);
