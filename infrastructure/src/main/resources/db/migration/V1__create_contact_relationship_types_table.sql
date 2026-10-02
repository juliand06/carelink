CREATE TABLE IF NOT EXISTS ${db_schema}.contact_relationship_types (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    label VARCHAR(50) NOT NULL UNIQUE
);
