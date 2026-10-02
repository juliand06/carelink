CREATE TABLE IF NOT EXISTS ${db_schema}.care_plans (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL,
    specialist_id UUID NOT NULL,
    plan_title VARCHAR(200) NOT NULL,
    plan_description TEXT,
    start_date DATE NOT NULL,
    projected_end_date DATE,
    care_plan_status_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_care_plans_appointment_id FOREIGN KEY (appointment_id) REFERENCES ${db_schema}.appointments (id),
    CONSTRAINT fk_care_plans_specialist_id FOREIGN KEY (specialist_id) REFERENCES ${db_schema}.specialists (id),
    CONSTRAINT fk_care_plans_care_plan_status_id FOREIGN KEY (care_plan_status_id) REFERENCES ${db_schema}.care_plan_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_care_plans_appointment_id ON ${db_schema}.care_plans (appointment_id);
CREATE INDEX IF NOT EXISTS idx_care_plans_specialist_id ON ${db_schema}.care_plans (specialist_id);
CREATE INDEX IF NOT EXISTS idx_care_plans_care_plan_status_id ON ${db_schema}.care_plans (care_plan_status_id);
