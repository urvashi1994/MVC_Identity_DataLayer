select * from Province
select * from Person
select * from Address
select * from UserInfo

INSERT INTO MVCDatabase.dbo.UserInfo(Username, Password, Role)
VALUES ( 'Urvashi', 'Test', 'Admin');
INSERT INTO MVCDatabase.dbo.UserInfo(Username, Password, Role)
VALUES ( 'Ruchi', 'Test1', 'Admin');
INSERT INTO MVCDatabase.dbo.UserInfo(Username, Password, Role)
VALUES ( 'Nirav', 'Test2', 'Admin');
INSERT INTO MVCDatabase.dbo.UserInfo(Username, Password, Role)
VALUES ( 'Vivek', 'Test3', 'User');
INSERT INTO MVCDatabase.dbo.UserInfo(Username, Password, Role)
VALUES ( 'Harsh', 'Test4', 'Reviewer');
INSERT INTO MVCDatabase.dbo.UserInfo(Username, Password, Role)
VALUES ( 'Niruxa', 'Test5', 'Tester');

--get UserInfo

drop procedure if exists SP_get_User
go
create procedure SP_get_User
@Username nvarchar(50) Output,
@Password nvarchar(50) output
as
begin
select Username, Password, Role
from UserInfo
where(Username = @Username AND Password = @Password)
end 
go

--SP_Create_User

drop procedure if exists SP_Create_User
go
create procedure SP_Create_User
@Username nvarchar(50),
@Password nvarchar(50),
@Role nvarchar(50) = "User"
as
begin
insert into UserInfo(Username, Password, Role)
values(@Username, @Password, @Role)
end


/*DROP TABLE dbo.Address
DROP TABLE dbo.Person
DROP TABLE dbo.Province*/



