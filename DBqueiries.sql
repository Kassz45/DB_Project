CREATE VIEW DoctorInfo(Procedures,doctor,cost)
AS SELECT
    pr.ProcedureType,name,
    AVG(CAST(REPLACE(b.Cost,'$','') AS DECIMAL(10,2))) AS ProcedurePrice
FROM
    ProcedureInfo pr  
JOIN
    Bill b ON pr.ProcedureID = b.ProcedureID, Employee e  
WHERE pr.EmpID=e.EmpID
GROUP BY
    pr.ProcedureType
HAVING avg(cost)
ORDER BY
    ProcedurePrice DESC;


BEGIN TRANSACTION Change Bill Cost 
UPDATE Bill SET cost = '400';
WHERE ProcedureID = 'PROC001';
IF ERROR THEN GO TO UNDO; END IF;
UPDATE ProcedureInfo SET Proceduretype = 'Filling';
WHERE ProcedureId = 'Proc001';
IF ERROR THEN GO TO UNDO; END IF;
COMMIT;
GO TO FINISH;
UNDO: ROLLBACK;
FINISH:
END TRANSACTION;

BEGIN TRANSACTION New_Walkin
INSERT INTO Walkin VALUES('Bleading Gums',1,2023-10-20,10:00:00,PAT013)
IF ERROR THEN GO TO UNDO; END IF;
INSERT INTO Patient VALUES('1345 Briggin Ln','Ethan Walker',PAT013,'509-203-4564')
IF ERROR THEN GO TO UNDO; END IF;
COMMIT;
GO TO FINISH;
UNDO: ROLLBACK;
FINISH:
END TRANSACTION;