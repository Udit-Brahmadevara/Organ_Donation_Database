🏥 Centralized Organ Donation and Transplant System – PostgreSQL Project
📌 Overview
This project implements a Centralized Organ Donation and Transplant System using PostgreSQL to manage the full lifecycle of organ donation—from donor registration to transplant tracking—across multiple hospitals.

It ensures data integrity, compatibility-based matching, and end-to-end traceability of organ transfers and transplants. The system follows best practices in database design and normalization, built for reliability and scalability in real-world healthcare scenarios.

🧠 Key Features
📁 Centralized Record Management: Unified tracking of donors, recipients, organs, hospitals, and transplant logistics.

🧬 Compatibility Matching: Automated matching of donors and recipients based on organ type, blood group, and medical compatibility.

🚑 Logistics and Tracking: Full audit trail of organ transfers, preservation timelines, and surgical outcomes.

🔐 Data Integrity: BCNF-compliant schema with well-defined primary and foreign keys, constraints, and cascading behavior.

⚙️ Procedural Support: PL/pgSQL stored procedures and triggers for encapsulated logic and secure transactions.

⚡ Performance Optimized: Indexing and query optimization for high efficiency on large datasets.

🧩 Entity-Relationship Diagram (ERD)
Below is the visual representation of the database schema:

![ER Diagram](/images/ER_Diagram.jpeg)

🗂️ Project Structure
plaintext
Copy
Edit
.
├── db/
│   ├── create.sql           # Schema definitions (tables, keys, constraints, indexes)
│   ├── load.sql             # Script to load CSV data using \COPY
│   ├── er_diagram.png       # ER diagram (include in README)
│   └── data/                # Folder containing mock/generated CSV data
├── .gitignore
└── README.md                # Project documentation (this file)
🗃️ Core Schema Components
🏥 Core Tables
Hospitals, Donors, Recipients, Organs, OrganType, BloodGroups

🧪 Test & Medical Data
MedicalTests, OrganTests, MedicalStaff

⚖️ Coordination & Tracking
Matches: Compatibility between organs and recipients

Transplants: Records of completed surgeries

OrganTransfer: Tracks preservation and logistics of each organ

🛠️ Setup Instructions
Follow the steps below to recreate the database environment:

1. Create a New PostgreSQL Database
bash
Copy
Edit
createdb -U your_username transplant_db
2. Apply the Schema
bash
Copy
Edit
psql -U your_username -d transplant_db -f db/create.sql
3. Load Sample Data
Ensure the db/data/ directory contains all necessary CSV files, then run:

bash
Copy
Edit
psql -U your_username -d transplant_db -f db/load.sql
✅ The database is now ready for use.

⚙️ Technical Highlights
Normalization: All tables are designed in Boyce-Codd Normal Form (BCNF) for optimal consistency and minimal redundancy.

Stored Procedures & Functions:

add_recipient(), delete_transplant(), update_status()

Custom Logging & Error Handling: Transactions are logged and rolled back safely upon errors.

Extensibility: Easily scalable for national-level transplant registries and analytics dashboards.

📌 Notes
The \COPY command used in load.sql reads from the client file system. Ensure correct relative paths.

Indexes can be added for analytical queries and optimized JOIN operations as per performance needs.

Sample queries and test cases are included in the report (if applicable) for reference.

👨‍💻 Team
Udit Bharmadevara – uditbrah@buffalo.edu

Mohan Kakarla – mkakarla@buffalo.edu

Santosh Mohan Jena – sjena@buffalo.edu

University at Buffalo, CSE 560