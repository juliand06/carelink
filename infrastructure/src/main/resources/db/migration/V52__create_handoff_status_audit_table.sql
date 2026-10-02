CREATE TABLE IF NOT EXISTS ${db_schema}.handoff_status_audit (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    handoff_id UUID NOT NULL,
    handoff_status_id UUID NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    transitioned_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_handoff_status_audit_handoff_id FOREIGN KEY (handoff_id) REFERENCES ${db_schema}.handoffs (id),
    CONSTRAINT fk_handoff_status_audit_handoff_status_id FOREIGN KEY (handoff_status_id) REFERENCES ${db_schema}.handoff_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_handoff_status_audit_handoff_id ON ${db_schema}.handoff_status_audit (handoff_id);
CREATE INDEX IF NOT EXISTS idx_handoff_status_audit_handoff_status_id ON ${db_schema}.handoff_status_audit (handoff_status_id);
