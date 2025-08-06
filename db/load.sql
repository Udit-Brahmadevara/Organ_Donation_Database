\COPY BloodGroups(BloodTypeID, BloodGroup, RhesusFactor) FROM 'data/blood_grp.csv' DELIMITER ',' CSV HEADER;

\COPY OrganType(OrganTypeID, Name, Text) FROM 'data/organtype.csv' DELIMITER ',' CSV HEADER;

\COPY Hospitals(HospitalID, Name, Address, City, State, ZIPCode, ContactNumber) FROM 'data/hospitals.csv' DELIMITER ',' CSV HEADER;

\COPY Donors(DonorID, Name, Age, Gender, BloodTypeID, DateOfDeath, HospitalID, Status) FROM 'data/donors.csv' DELIMITER ',' CSV HEADER;

\COPY Recipients(RecipientID, Name, Age, Gender, BloodTypeID, OrganNeededID, PriorityScore, HospitalID, Status) FROM 'data/recipients.csv' DELIMITER ',' CSV HEADER;

\COPY Organs(OrganID, DonorID, OrganTypeID, AvailabilityStatus, ExtractionDate) FROM 'data/organs.csv' DELIMITER ',' CSV HEADER;

\COPY Matches(MatchID, RecipientID, OrganID, MatchDate, CompatibilityScore) FROM 'data/matches.csv' DELIMITER ',' CSV HEADER;

\COPY Transplants(TransplantID, MatchID, HospitalID, LeadSurgeonID, TransplantDate, Outcome) FROM 'data/transplants.csv' DELIMITER ',' CSV HEADER;

\COPY OrganTransfer(TransferID, OrganID, FromHospitalID, ToHospitalID, PickupTime, DeliveryTime, TransportationMode, Preservation, ConditionOnArrivial) FROM 'data/transfers.csv' DELIMITER ',' CSV HEADER;

\COPY MedicalStaff(StaffID, HospitalID, FirstName, LastName, Role, ContactInfo) FROM 'data/medicalstaff.csv' DELIMITER ',' CSV HEADER;

\COPY OrganTests(OrganTestID, OrganID, TestName, Result, TestDate, PerformedByID, Notes) FROM 'data/organtest.csv' DELIMITER ',' CSV HEADER;

\COPY MedicalTests(TestID, PersonType, PersonID, TestName, Result, TestDate, DonorID, RecipientID, HospitalID, Status) FROM 'data/medicaltests.csv' DELIMITER ',' CSV HEADER;