CREATE TABLE IF NOT EXISTS ${db_schema}.care_goals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    care_plan_id UUID NOT NULL,
    goal_description TEXT NOT NULL,
    target_date DATE,
    achieved_at TIMESTAMPTZ,
    progress_notes TEXT,
    care_goal_status_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT fk_care_goals_care_plan_id FOREIGN KEY (care_plan_id) REFERENCES ${db_schema}.care_plans (id),
    CONSTRAINT fk_care_goals_care_goal_status_id FOREIGN KEY (care_goal_status_id) REFERENCES ${db_schema}.care_goal_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_care_goals_care_plan_id ON ${db_schema}.care_goals (care_plan_id);
CREATE INDEX IF NOT EXISTS idx_care_goals_care_goal_status_id ON ${db_schema}.care_goals (care_goal_status_id);
