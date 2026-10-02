CREATE TABLE IF NOT EXISTS ${db_schema}.danger_assessments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL,
    danger_level_id UUID NOT NULL,
    suicidal_ideation BOOLEAN NOT NULL DEFAULT FALSE,
    has_suicide_plan BOOLEAN NOT NULL DEFAULT FALSE,
    has_suicide_intent BOOLEAN NOT NULL DEFAULT FALSE,
    self_harm_behavior BOOLEAN NOT NULL DEFAULT FALSE,
    risk_to_others BOOLEAN NOT NULL DEFAULT FALSE,
    protective_factors TEXT,
    identified_risk_factors TEXT,
    clinical_actions_taken TEXT,
    evaluator_observations TEXT,
    evaluated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    evaluated_by UUID NOT NULL,
    CONSTRAINT fk_danger_assessments_appointment_id FOREIGN KEY (appointment_id) REFERENCES ${db_schema}.appointments (id),
    CONSTRAINT fk_danger_assessments_danger_level_id FOREIGN KEY (danger_level_id) REFERENCES ${db_schema}.danger_levels (id),
    CONSTRAINT fk_danger_assessments_evaluated_by FOREIGN KEY (evaluated_by) REFERENCES ${db_schema}.specialists (id)
);

CREATE INDEX IF NOT EXISTS idx_danger_assessments_appointment_id ON ${db_schema}.danger_assessments (appointment_id);
CREATE INDEX IF NOT EXISTS idx_danger_assessments_danger_level_id ON ${db_schema}.danger_assessments (danger_level_id);
CREATE INDEX IF NOT EXISTS idx_danger_assessments_evaluated_by ON ${db_schema}.danger_assessments (evaluated_by);
