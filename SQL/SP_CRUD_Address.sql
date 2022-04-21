--Create Stored Procedure for inserting data in new row of dbo.Address--
DROP PROCEDURE IF EXISTS dbo.spInsertIntoAddress
GO

CREATE PROCEDURE spInsertIntoAddress	

	@Address VARCHAR(25),
	@City VARCHAR(25),
	@PostalCode VARCHAR(25),
	@ProvinceID INT

	AS
	BEGIN

		INSERT INTO dbo.Address(Address, City, PostalCode, ProvinceID)
		VALUES (@Address, @City, @PostalCode, @ProvinceID)

		SELECT*FROM dbo.Address

	END

	--Execution of Stored Procedure--
--EXEC dbo.spInsertIntoAddress '321 Albert St', 'Waterloo', 'N2L 5V1', 9



--Create Stored Procedure to get data from dbo.Address by addressID--
DROP PROCEDURE IF EXISTS dbo.sp_GetAddressByID
GO

CREATE PROCEDURE sp_GetAddressByID

	@AddressId INT

	AS
	BEGIN

		SELECT * FROM dbo.Address
		WHERE
		AddressID =@AddressId

	END

--Execution of Stored Procedure--
--EXECUTE sp_GetAddressByID 6



--Create Stored Procedure to get list of Addresses from the same province in dbo.Address by ProvinceAbbreviation--
DROP PROCEDURE IF EXISTS dbo.sp_GetAddressesByProvince
GO
CREATE PROCEDURE sp_GetAddressesByProvince
	
	@ProvinceAbbreviation VARCHAR(25)

	AS
	BEGIN

		WITH CTE AS (SELECT ProvinceAbbreviation, a.* FROM dbo.Province p INNER JOIN dbo.Address a ON P.ProvinceID = a.ProvinceID )

		SELECT * FROM CTE
		WHERE ProvinceAbbreviation = @ProvinceAbbreviation

	END

--Execution of Stored Procedure--
--EXECUTE  sp_GetAddressesByProvince 'ON'

--Create Stored Procedure to count total number of addresses from dbo.Address--
DROP PROCEDURE IF EXISTS dbo.sp_GetAddressCount
GO
CREATE PROCEDURE sp_GetAddressCount

	@AddressCount INT OUTPUT

	AS
	BEGIN

		SELECT @AddressCount = COUNT(*) FROM dbo.Address
		SELECT @AddressCount AS 'Total Number of Addresses';

	END

--Execution of Stored Procedure--
--DECLARE @Count INT
EXECUTE sp_GetAddressCount @Count


--Create Stored Procedure for updating data in dbo.Address by AddressID--
DROP PROCEDURE IF EXISTS dbo.sp_UpdateAddressByAddressID
GO
CREATE PROCEDURE sp_UpdateAddressByAddressID

	@AddressId INT,
	@Address VARCHAR(25),
	@City VARCHAR(25),
	@PostalCode VARCHAR(25),
	@ProvinceID INT

	AS
	BEGIN

		UPDATE Address
		SET
			Address = @Address,
			City = @City,
			PostalCode = @PostalCode,
			ProvinceID = @ProvinceID
		WHERE
			AddressID = @AddressId

			SELECT *FROM dbo.Address
	END

--Execution of Stored Procedure--
--EXECUTE sp_UpdateAddressByAddressID 2,'210 Albert St', Waterloo, 'L5C 3V5',3

--Create Stored Procedure to delete data in dbo.Address by AddressID--
DROP PROCEDURE IF EXISTS dbo.sp_DeleteAddressByAddressID
GO
CREATE PROCEDURE sp_DeleteAddressByAddressID

	@AddressId INT

	AS
	BEGIN

		DELETE FROM Address 
		WHERE
			AddressID = @AddressId

			SELECT *FROM dbo.Address
	END

--Execution of Stored Procedure--
--EXECUTE sp_DeleteAddressByAddressID 2