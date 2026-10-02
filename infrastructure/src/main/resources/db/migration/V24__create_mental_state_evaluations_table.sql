CREATE TABLE IF NOT EXISTS ${db_schema}.mental_state_evaluations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL,
    general_appearance TEXT,
    behavioral_observation TEXT,
    attitude_toward_examiner TEXT,
    level_of_consciousness TEXT,
    orientation_status TEXT,
    attention_and_concentration TEXT,
    memory_assessment TEXT,
    speech_characteristics TEXT,
    mood_description TEXT,
    affect_description TEXT,
    thought_process TEXT,
    thought_content TEXT,
    perceptual_disturbances TEXT,
    judgment_assessment TEXT,
    insight_assessment TEXT,
    psychomotor_findings TEXT,
    examiner_remarks TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by UUID NOT NULL,
    CONSTRAINT fk_mental_state_evaluations_appointment_id FOREIGN KEY (appointment_id) REFERENCES ${db_schema}.appointments (id),
    CONSTRAINT fk_mental_state_evaluations_created_by FOREIGN KEY (created_by) REFERENCES ${db_schema}.specialists (id)
);

CREATE INDEX IF NOT EXISTS idx_mental_state_evaluations_appointment_id ON ${db_schema}.mental_state_evaluations (appointment_id);
CREATE INDEX IF NOT EXISTS idx_mental_state_evaluations_created_by ON ${db_schema}.mental_state_evaluations (created_by);
