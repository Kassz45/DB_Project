CREATE TABLE Bill
(BillingID VARCHAR(15),
Date_ Date,
PatientID VARCHAR(15),
Payment VARCHAR(30),
Cost int,
Medication VARCHAR(30),
ProcedureID VARCHAR(15),
AppointmentID VARCHAR(15),
FOREIGN KEY(ProcedureID) REFERENCES Procedure(ProcedureID) ,
FOREIGN KEY(AppointmentID) REFERENCES Appointments(AppointmentID),
PRIMARY KEY(BillingID));
CREATE TABLE TreatmentRecords
(RecordID VARCHAR(15),
Date_ Date,
PatientID VARCHAR(15),
AppointmentID VARCHAR(15),
FOREIGN KEY(AppointmentID) REFERENCES Appointments(AppointmentID),
PRIMARY KEY(RecordID));
CREATE TABLE Appointments
(AppointmentID VARCHAR(15),
ProcedureID VARCHAR(15),
Date_Time VARCHAR(30),
EmpID VARCHAR(15),
PatientID VARCHAR(15),
PRIMARY KEY(AppointmentID));
CREATE TABLE Walkin
(WalkinID VARCHAR(15),
Reason VARCHAR(30),
DoctorAvailability VARCHAR(30),
Date_Time VARCHAR(30),
PatientID VARCHAR(15),
FOREIGN KEY(PatientID) REFERENCES Patient(PatientID)
PRIMARY KEY(WalkinID));
CREATE TABLE Patient (
    Address VARCHAR(30),
    Name VARCHAR(15),
    PatientID VARCHAR(15),
    Phone_Number VARCHAR(15),
    Date_of_Birth VARCHAR(15),
    Consent_Forms CHAR(1),
    Dental_History CHAR(1),
    ContactID VARCHAR(15),
    PRIMARY KEY(PatientID),
    FOREIGN KEY(ContactID) REFERENCES Emergency_Contact(ContactID)
);
CREATE TABLE Procedure(
    ProcedureID VARCHAR(15),
    Diagnostic_Info CHAR(1),
    Date_Time VARCHAR(15),
    Availability CHAR(1),
    EmpID VARCHAR(15),
    PatientID VARCHAR(15),
    PRIMARY KEY(ProcedureID),
    FOREIGN KEY(PatientID) REFERENCES Patient(PatientID)
);
CREATE TABLE Medical_History(
    Medical_HistoryID VARCHAR(15),
    PatientID VARCHAR(15),
    Existing_Medical_Con CHAR(1),
    Allergies CHAR(1),
    Past_Procedure CHAR(1),
    PRIMARY KEY(Medical_HistoryID),
    FOREIGN KEY(PatientID) REFERENCES Patient(PatientID)

);
CREATE TABLE Emergency_Contact(
    ContactID VARCHAR(15),
    Name VARCHAR(15),
    Phone_Number VARCHAR(15),
    PRIMARY KEY(ContactID),
);
CREATE TABLE Insurance_Info(
    InsuracneID VARCHAR(15),
    Insurance_Provider VARCHAR(30),
    Policy_Number VARCHAR(15),
    PatientID VARCHAR(15),
    EmpID VARCHAR(15),
    PRIMARY KEY(InsuracneID),
    FOREIGN KEY(PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)
);
CREATE TABLE Employee(
    EmpID VARCHAR(15),
    SSN VARCHAR(15),
    Name VARCHAR(15),
    Address VARCHAR(15),
    Email VARCHAR(30),
    Phone_Number VARCHAR(15),
    PRIMARY KEY(EmpID)
);
CREATE TABLE Training(
    RecordID VARCHAR(15),
    Certificates CHAR(1),
    EmpID VARCHAR(15),
    PRIMARY KEY(RecordID),
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)
);
CREATE TABLE Tax_Info(
    InfoID VARCHAR(15),
    EmpID VARCHAR(15),
    W4Form CHAR(1),
    Filing_Status CHAR(1),
    PRIMARY KEY(InfoID),
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)
);
CREATE TABLE Works(
    EmpID VARCHAR(15),
    ProcedureID VARCHAR(15),
    Hours HOURS
);
CREATE Table Records_Procedures(
    ProcedureId VARCHAR(15),
    RecordID VARCHAR(15),

);
CREATE TABLE Employment_History(
    EmpID VARCHAR(15),
    Emp_History VARCHAR(100),

);
CREATE TABLE Allergies(
    Medical_History CHAR(1),
    Allergy CHAR(1)
);



