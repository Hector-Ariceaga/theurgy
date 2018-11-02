user1 = User.new(name: 'Standard User', username: 's_user', clinic: 'Mayo', admin: false, password: '123')
user2 = User.new(name: "Admin User", username: 'a_user', admin: true, password: '456')
user1.save
user2.save

patient1 = user1.patients.create(name: 'John Smith', dob: 1980-01-01)
patient2 = user1.patients.create(name: 'Jane Smith', dob: 1990-01-01)
patient3 = user1.patients.create(name: 'John Doe', dob: 1970-02-02)
patient4 = user1.patients.create(name: 'Jane Doe', dob: 1975-03-03)

symptom1 = Symptom.create(name: 'Depression')
symptom2 = Symptom.create(name: 'Anxiety')
symptom3 = Symptom.create(name: 'insomnia')
symptom4 = Symptom.create(name: 'History of Physical Abuse')
symptom5 = Symptom.create(name: 'Psychomotor retardation')
symptom6 = Symptom.create(name: 'Psychomotor Agitation')
symptom7 = Symptom.create(name: 'Suicidal Ideation')

diagnosis1 = Diagnosis.create(name: 'Major Depressive Disorder')
diagnosis2 = Diagnosis.create(name: 'Generalized Anxiety Disorder')
diagnosis3 = Diagnosis.create(name: 'Bipolar Disorder I')
diagnosis4 = Diagnosis.create(name: 'Bipolar Disorder II')
diagnosis5 = Diagnosis.create(name: 'PTSD')
diagnosis6 = Diagnosis.create(name: 'Borderline Personality Disorder')
diagnosis7 = Diagnosis.create(name: 'Schizoaffective Disorder')

treatment1 = Treatment.create(name: 'Medication Management', details: 'Another provider, such as PNP, psychiatrist, or other prescriber, manages prescribing and provides follow up on psychotropic medications and psychiatric outcomes.')
treatment2 = Treatment.create(name: 'Behavioral Health Counseling', details: 'Brief counseling intervention to introduce therapy and refer to long term counseling resources. Also utilized to assist in activiating healthy behaviors (e.g., smoking cessation, insomnia treatment, diabetes managment)')
treatment3 = Treatment.create(name: 'ACT', details: 'Acceptance and Commitment Theray is a form of psychotherapy that focuses on treatment trauma and chronic health conditions.')
treatment4 = Treatment.create(name: 'DBT', details: 'Dialectial Behavior Therapy focuses on improving interpersonal relationships and developing distress tolerance')
treatment5 = Treatment.create(name: 'CBT', details: 'Cognitive Behavioral Therapy is focuses changing the cognitions and ideas that influence our behaviors.')
treatment6 = Treatment.create(name: 'Care Coordination', details: "Focuses on gathering and connecting the patient to resources in an effort to reduce psychosocial stressors (e.g., housing assistance, financial assistance, food assistance)")
