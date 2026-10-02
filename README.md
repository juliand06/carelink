# CareLink – Hexagonal + DDD modular (Spring Boot 4 / Java 25)

Ejercicio de práctica: estructura multimódulo Maven con **Flyway + JPA + PostgreSQL**.
Por ahora solo se crean las **52 tablas** del diagrama mediante migraciones.

## Módulos
- `domain`         → núcleo del negocio (sin frameworks)
- `application`    → casos de uso y puertos (depende de `domain`)
- `infrastructure` → Spring Boot, adaptadores, Flyway, JPA (depende de `application`)

## Cómo correrlo
1. Crear la base de datos vacía (solo la BD, el esquema lo crea Flyway):
   ```sql
   CREATE DATABASE carelinkdb;
   ```
2. Credenciales en `infrastructure/src/main/resources/application-dev.yml` (por defecto `postgres` / `123456`).
3. Desde la raíz: `mvn clean install` y ejecutar `CareLinkApplication` (VS Code: F5 con el launch incluido).
4. En DBeaver: conexión a `carelinkdb` → esquema **`carelink_schema`** → Tables (52) + `flyway_schema_history_carelink`.

## Decisiones de modelado (diagrama → proyecto)
| Diagrama (MindConnect)         | CareLink                          |
|---|---|
| `relationship_types`           | `contact_relationship_types`      |
| `genders`                      | `biological_sexes`                |
| `professional_types`           | `specialist_roles`                |
| `studies`                      | `academic_programs`               |
| `document_types`               | `id_document_types`               |
| `state_regions`                | `departments`                     |
| `city_municipalities`          | `municipalities`                  |
| `professionals`                | `specialists`                     |
| `patients`                     | `clients`                         |
| `contacts`                     | `trusted_contacts`                |
| `patient_contacts`             | `client_trusted_contacts`         |
| `phone_contacts`               | `contact_phone_numbers`           |
| `email_contacts`               | `contact_email_addresses`         |
| `professional_studies`         | `specialist_credentials`          |
| `patient_allergies`            | `client_allergies`                |
| `clinical_record_statuses`     | `health_record_statuses`          |
| `clinical_records`             | `health_records`                  |
| `encounter_types`              | `appointment_types`               |
| `encounter_modalities`         | `appointment_modalities`          |
| `encounter_statuses`           | `appointment_statuses`            |
| `encounters`                   | `appointments`                    |
| `clinical_notes`               | `session_notes`                   |
| `mental_status_exams`          | `mental_state_evaluations`        |
| `risk_levels`                  | `danger_levels`                   |
| `risk_assessments`             | `danger_assessments`              |
| `treatment_statuses`           | `care_plan_statuses`              |
| `treatment_plans`              | `care_plans`                      |
| `treatment_goal_statuses`      | `care_goal_statuses`              |
| `treatment_goals`              | `care_goals`                      |
| `medication_routes`            | `drug_administration_routes`      |
| `assessment_types`             | `evaluation_instrument_types`     |
| `consent_types`                | `informed_consent_types`          |
| `diagnostic_systems`           | `classification_systems`          |
| `sender_types`                 | `sender_roles`                    |
| `message_types`                | `message_formats`                 |
| `priorities`                   | `urgency_levels`                  |
| `chat_conversation_statuses`   | `support_conversation_statuses`   |
| `chat_conversations`           | `support_conversations`           |
| `chat_participants`            | `conversation_members`            |
| `chat_messages`                | `support_messages`                |
| `ai_providers`                 | `llm_vendors`                     |
| `ai_models`                    | `llm_models`                      |
| `chat_conversation_ai_settings`| `conversation_ai_configs`         |
| `chat_ai_run_statuses`         | `llm_execution_statuses`          |
| `chat_ai_runs`                 | `llm_executions`                  |
| `chat_ai_run_metrics`          | `llm_execution_metrics`           |
| `chat_ai_run_errors`           | `llm_execution_errors`            |
| `chat_escalation_statuses`     | `handoff_statuses`                |
| `chat_escalations`             | `handoffs`                        |
| `chat_escalation_assignments`  | `handoff_assignments`             |
| `chat_escalation_status_history`| `handoff_status_audit`           |

## Convenciones aplicadas
- PK `UUID DEFAULT gen_random_uuid()`; fechas en `TIMESTAMPTZ`.
- FK e índices por cada FK; `created_by`/`updated_by`/`evaluated_by`/`registered_by` apuntan a `specialists`.
- Campos de texto libre, fechas de cierre/fin y auditoría `*_by` opcionales son nullables; el resto `NOT NULL`.
- Únicos añadidos: `(id_document_type_id, document_number)` en clients y specialists, `professional_license`, `client_id+trusted_contact_id`, etc.
- `conversation_members`: CHECK para que no tenga cliente y especialista a la vez.
- `support_conversations.closed_by` queda como UUID sin FK (el diagrama no indica a qué tabla apunta).
- Catálogos sin datos semilla (pendiente).

## Base de datos con Docker (opcional)
```bash
docker run -d --name carelink-postgres \
  -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=123456 \
  -e POSTGRES_DB=carelinkdb -p 5435:5432 postgres:16
```
La app usa `localhost:5435` (ver `application-dev.yml`) y corre en el puerto `8083`.
Si usas un PostgreSQL propio, ajusta `url`, `username` y `password` en ese archivo.
