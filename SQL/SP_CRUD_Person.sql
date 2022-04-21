select * from Person;
DROP PROCEDURE IF EXISTS dbo.SP_insert_person
GO
CREATE PROCEDURE SP_insert_person
@FirstName varchar(25),  
@LastName varchar(25),
@Age int,
@EmailID varchar(25),  
@Gender varchar(25),
@AddressID int
AS  
BEGIN  
INSERT INTO Person (  
FirstName,  
LastName,  
Age,  
EmailID,
Gender,
AddressID)  
VALUES (  
@FirstName,  
@LastName,  
@Age,  
@EmailID,
@Gender,
@AddressID)  
END

--EXECUTE INSERT PROCEDURE
--EXEC SP_insert_person 'Urviii','Kapadiya',27,'Urviii@gmail.com',Female,3;

drop procedure if exists SP_update_person
go
create proc SP_update_person
@PersonID int,
@FirstName varchar(25),  
@LastName varchar(25),
@Age int,
@EmailID varchar(25),  
@Gender varchar(25),
@AddressID int
as
begin
update Person set
FirstName = @FirstName,
LastName = @LastName,
Age = @Age,
EmailID = @EmailID,
Gender = @Gender,
AddressID = @AddressID
where PersonID = @PersonID
end

--EXECUTE UPDATE PERSON
--EXEC SP_update_person 7,'testF','testL',28,'test','test',4;

--Read procedure

DROP PROCEDURE IF EXISTS dbo.SP_get_person
GO
CREATE PROCEDURE SP_get_person  
@PersonID int
AS  
BEGIN  
  
SELECT *  
FROM Person   
WHERE (PersonID = @PersonID);
END  

--EXEC SP_get_person 6;

DROP PROCEDURE IF EXISTS dbo.SP_get_all_persons
GO

CREATE PROCEDURE SP_get_all_persons  
@PersonCount int OUTPUT
AS  
BEGIN  
  
SELECT *  
FROM Person;   
SELECT @PersonCount = @@ROWCOUNT;
END  

--EXECUTE READ PERSON 
/*DECLARE @count int;
EXEC SP_get_all_persons @count OUTPUT;
SELECT @count as 'Total number of persons';*/

--Drop Procedure--
DROP PROCEDURE IF EXISTS dbo.SP_delete_person
GO
CREATE PROCEDURE SP_delete_person  
@PersonID int  
AS  
BEGIN  
DELETE  
FROM Person  
WHERE PersonID= @PersonID  
  
END  

--EXECUTE DELETE PERSON
--EXEC SP_delete_person 7;

