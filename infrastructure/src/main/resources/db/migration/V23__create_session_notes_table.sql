CREATE TABLE IF NOT EXISTS ${db_schema}.session_notes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL,
    specialist_id UUID NOT NULL,
    subjective TEXT,
    objective TEXT,
    assessment TEXT,
    plan TEXT,
    supplementary_notes TEXT,
    signed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_session_notes_appointment_id FOREIGN KEY (appointment_id) REFERENCES ${db_schema}.appointments (id),
    CONSTRAINT fk_session_notes_specialist_id FOREIGN KEY (specialist_id) REFERENCES ${db_schema}.specialists (id)
);

CREATE INDEX IF NOT EXISTS idx_session_notes_appointment_id ON ${db_schema}.session_notes (appointment_id);
CREATE INDEX IF NOT EXISTS idx_session_notes_specialist_id ON ${db_schema}.session_notes (specialist_id);
