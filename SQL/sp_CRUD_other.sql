------------------Get All Info by email id---------------------
USE MVCDatabase
GO

Drop procedure IF Exists spGetAllInfoByEmailId
GO
CREATE PROCEDURE spGetAllInfoByEmailId
(@EmailId varchar(25) )
AS 
BEGIN
IF EXISTS (SELECT EmailID = @EmailId FROM DBO.Person)
BEGIN
SELECT P.FirstName,P.LastName,P.Age, P.Gender,A.Address,A.City, Prov.ProvinceName
FROM Person P
JOIN DBO.Address A
ON P.AddressID = A.AddressID
JOIN DBO.Province Prov
ON A.ProvinceID = Prov.ProvinceID
WHERE P.EmailID = @EmailId
END
END

--EXECUTE spGetAllInfoByEmailId 'harshpatel@gmail.com'



---------------------Get all info including Address, Province by Gender -----------------------

Drop procedure IF Exists spGetPersonInfoByGender
GO
CREATE PROCEDURE spGetPersonInfoByGender
@gender varchar(25)
AS 
BEGIN 
SELECT P.FirstName,P.LastName,P.Age, P.Gender,A.Address,A.City, Prov.ProvinceName
FROM Person P
JOIN DBO.Address A
ON P.AddressID = A.AddressID
JOIN DBO.Province Prov
ON A.ProvinceID = Prov.ProvinceID
WHERE Gender = @gender
ORDER BY LastName, FirstName, AGE ASC
END

--EXECUTE spGetPersonInfoByGender 'Male'


------------ Get population Province wise------------------
DROP PROC IF EXISTS GetPopulationByProvince
GO
CREATE PROC GetPopulationByProvince
@Population int OUTPUT,
@Province varchar(25)
AS
BEGIN
SET @Population = (SELECT Count(P.PersonId) 
FROM Person P
JOIN DBO.Address A
ON P.AddressID = A.AddressID
JOIN DBO.Province Prov
ON A.ProvinceID = Prov.ProvinceID
WHERE Prov.ProvinceName = @Province)
END

-------------Execution-------------------------
/*DECLARE @count int
EXECUTE GetPopulationByProvince @Province = "Ontario" ,
@Population = @count OUTPUT
SELECT @count AS POPULATION*/





-- Get population age wise
DROP PROC IF EXISTS GetCountByAge
GO
CREATE PROC GetCountByAge
@TotalNumber int OUTPUT,
@AGE int
AS
BEGIN
SET @TotalNumber = (SELECT Count(PersonId) 
FROM Person 
WHERE AGE = @AGE)
END

/*DECLARE @count int
EXECUTE GetCountByAge @Age = 26,
@TotalNumber = @count OUTPUT
SELECT @count AS 'CountByAge'*/

--SELECT * FROM PERSON
--SELECT * FROM Address
--SELECT * FROM Province