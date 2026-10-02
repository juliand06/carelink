CREATE TABLE IF NOT EXISTS ${db_schema}.handoff_assignments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    handoff_id UUID NOT NULL,
    specialist_id UUID NOT NULL,
    assigned_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_handoff_assignments_handoff_id FOREIGN KEY (handoff_id) REFERENCES ${db_schema}.handoffs (id),
    CONSTRAINT fk_handoff_assignments_specialist_id FOREIGN KEY (specialist_id) REFERENCES ${db_schema}.specialists (id),
    UNIQUE (handoff_id, specialist_id)
);

CREATE INDEX IF NOT EXISTS idx_handoff_assignments_handoff_id ON ${db_schema}.handoff_assignments (handoff_id);
CREATE INDEX IF NOT EXISTS idx_handoff_assignments_specialist_id ON ${db_schema}.handoff_assignments (specialist_id);
