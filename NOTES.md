NOTES

Models
USER PATIENT THERAPY TREATMENT SYMPTOMS DIAGNOSES

Relationships
user has many patients
patients have many therapies
patients have many treatments through therapy
therapies belong to patients
therapies belong to treatments
treatments have many therapies
treatment have many patients through therapy

Database
USER name username clinic

PATIENT
name string age integer symptoms diagnoses

SYMPTOMS
name patient_id

DIAGNOSES
name patient_id

THERAPY
user_id integer treatment_id integer active? boolean

TREATMENT
name string
modality (maybe a list of options and ability to add new option- med managment, counseling, testing, care coordination) string
details of treatment string

Features view

List users patients
a. be able to look at patient details inluding current treatments undergoing
b. link to show pages for treatments
Sort by those who have had therapy (later by type, or by active in therapy )
actions
2. alter patients db
3. Can take patients in and out of therapy or assign them a treatment
4. Count the number of patients getting a particular treatment, display total gross revenue
5. if admin can alter patient and treatment db

authorization
0. not logged in can only view treatment details and home page
1. logged in users have full patient access to their patients, but not alter treatment table
2. admins can get full access to ALL patients and ALL treatments

Development questions:
new user that is not valid is routing to /users and messing with formatting
