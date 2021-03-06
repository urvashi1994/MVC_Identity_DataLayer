USE [MVCDatabase]
GO
/****** Object:  StoredProcedure [dbo].[SpInsertIntoProvince]    Script Date: 2022-04-19 4:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SpInsertIntoProvince]
	@provincename varchar(25),
	@province varchar(25)
	as
	begin

		insert into dbo.Province(ProvinceName, ProvinceAbbreviation)
		values(@provincename, @province)

		select * from dbo.Province		
	end

--Execution of Stored Procedure--
--exec dbo.SpInsertIntoProvince 'Ontario', 'ON'

drop procedure if exists sp_GetProvinceByID
go
create procedure sp_GetProvinceByID
	@provinceId int
	as
	begin

	select * from dbo.Province where ProvinceID = @provinceId

	end

--Execution of Stored Procedure--
--exec dbo.sp_GetProvinceByID 5

--Create Stored Procedure to count total number of Provinces from dbo.Province--


DROP PROCEDURE IF EXISTS sp_GetProvinceCount
GO
create procedure sp_GetProvinceCount
@ProvinceCount int OUTPUT
as
begin
select @ProvinceCount = count(*) from Province
select @ProvinceCount as 'Number of Provinces';
end

--Execution of Stored Procedure--
--declare @Count int
--exec dbo.sp_GetProvinceCount @Count

--Create Stored Procedure for update into dbo.Province by ProvinceID--
DROP PROCEDURE IF EXISTS dbo.sp_UpdateProvincebyID
GO
create procedure sp_UpdateProvincebyID
	@provinceId int,
	@provincename varchar(25),
	@provinceabbreviation varchar(25)
	as
	begin

	update dbo.Province 
	set
		ProvinceName = @provincename,
		ProvinceAbbreviation = @provinceabbreviation
	where
		ProvinceID = @provinceId
	end

--Execution of Stored Procedure--
--exec dbo.sp_UpdateProvincebyID 14,'Ontario','ONT'

--Create Stored Procedure for delete from dbo.Province by ProvinceID--
DROP PROCEDURE IF EXISTS dbo.sp_DeleteProvinceById
GO
create procedure sp_DeleteProvinceById
	@provinceId int
	as
	begin

		delete from dbo.Province where ProvinceID = @provinceId
	end

--Execution of Stored Procedure--
--exec dbo.sp_DeleteProvinceById 14;


