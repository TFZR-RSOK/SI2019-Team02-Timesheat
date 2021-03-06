/*    ==Scripting Parameters==

    Source Database Engine Edition : Microsoft Azure SQL Database Edition
    Source Database Engine Type : Microsoft Azure SQL Database

    Target Server Version : SQL Server 2008 R2
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [TimesheatDB]
GO
/****** Object:  StoredProcedure [dbo].[CategoriesGetById]    Script Date: 7/3/2019 8:13:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoriesGetById]
(
	@Id int
)
AS
SELECT *
FROM CategoriesGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[CategoryDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CategoryDelete] (@Id int, @Version timestamp)
AS
BEGIN
	DELETE FROM Categories WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoryInsert]
(	
	@Id int OUTPUT,
	@Name nvarchar(100),
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Categories(Name)
		VALUES(@Name)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Categories WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CategoryUpdate]
(
    @Id int,
    @Name nvarchar(50),
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Categories
		SET Name = @Name
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Categories WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CompaniesGetById]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompaniesGetById]
(
	@Id int
)
AS
SELECT *
FROM CompaniesGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[CompanyDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CompanyDelete]
(
	@Id int,
	@Version timestamp
)
AS
BEGIN
	DELETE FROM Companies WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompanyInsert]
(	
	@Id int OUTPUT,
	@Name nvarchar(80),
	@Email nvarchar(254),
	@DailyDiscount int,
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Companies(Name, Email, DailyDiscount)
		VALUES(@Name, @Email, @DailyDiscount)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Companies WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CompanyUpdate]
(
    @Id int,
    @Name nvarchar(80),
	@Email nvarchar(254),
	@DailyDiscount int,
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Companies
		SET Name = @Name, Email = @Email, DailyDiscount = @DailyDiscount
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Companies WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[MealCompanyDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MealCompanyDelete]
(
	@MealId int,
	@CompanyId int
)
AS
BEGIN
	DELETE FROM MealsCompanies WHERE MealId = @MealId AND CompanyId = @CompanyId	
END
GO
/****** Object:  StoredProcedure [dbo].[MealCompanyInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MealCompanyInsert]
(	
	@MealId int,
	@CompanyId int
)
AS
BEGIN

	INSERT INTO MealsCompanies(MealId, CompanyId)
		VALUES(@MealId, @CompanyId)
END
GO
/****** Object:  StoredProcedure [dbo].[MealDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MealDelete]
(
	@Id int,
	@Version timestamp
)
AS
BEGIN
	DELETE FROM Meals WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[MealInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MealInsert]
(	
	@Id int OUTPUT,
	@Name nvarchar(100),
	@Price int,
	@CategoryId int,
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Meals(Name, Price, CategoryId)
		VALUES(@Name, @Price, @CategoryId)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Meals WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[MealPortionDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MealPortionDelete]
(
	@MealId int,
	@PortionId int
)
AS
BEGIN
	DELETE FROM MealsPortions WHERE MealId = @MealId AND PortionId = @PortionId	
END
GO
/****** Object:  StoredProcedure [dbo].[MealPortionInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MealPortionInsert]
(	
	@MealId int,
	@PortionId int
)
AS
BEGIN

	INSERT INTO MealsPortions(MealId, PortionId)
		VALUES(@MealId, @PortionId)
END
GO
/****** Object:  StoredProcedure [dbo].[MealsCompaniesGetByCompanyId]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[MealsCompaniesGetByCompanyId](
	@CompanyId int
)
AS
SELECT Id, Name, Price, CategoryId, Version
FROM MealsCompanies
INNER JOIN Meals ON Meals.Id = MealsCompanies.MealId
WHERE MealsCompanies.CompanyId = @CompanyId
GO
/****** Object:  StoredProcedure [dbo].[MealsGetById]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MealsGetById]
(
	@Id int
)
AS
SELECT *
FROM MealsGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[MealsPortionsGetByMealId]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MealsPortionsGetByMealId]
(
	@MealId int
)
AS
SELECT *
FROM MealsPortionsGetAll
WHERE MealId = @MealId
GO
/****** Object:  StoredProcedure [dbo].[MealUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MealUpdate]
(
    @Id int,
    @Name nvarchar(100),
	@Price int,
	@CategoryId int,
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Meals
		SET Name = @Name, Price = @Price, CategoryId = @CategoryId
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Meals WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[OrderDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OrderDelete]
(
	@Id int,
	@Version timestamp
)
AS
BEGIN
	DELETE FROM Orders WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[OrderInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderInsert]
(	
	@Id int OUTPUT,
	@Comment nvarchar(120),
	@Quantity int,
	@LunchTime time(7),
	@OrderDate date,
	@UserId int,
	@MealId int,
	@PortionId int,
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Orders(Comment, Quantity, LunchTime, OrderDate, UserId, MealId, PortionId)
		VALUES(@Comment, @Quantity, @LunchTime, @OrderDate, @UserId, @MealId, @PortionId)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Orders WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetById]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetById]
(
	@Id int
)
AS
SELECT *
FROM OrdersGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByUserIdAndDate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByUserIdAndDate]
(
@UserId int,
@Date date
)
AS
SELECT *
FROM OrdersGetAll
WHERE UserId = @UserId AND @date = OrderDate
GO
/****** Object:  StoredProcedure [dbo].[OrderUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OrderUpdate]
(
    @Id int,
    @Comment nvarchar(120),
	@Quantity int,
	@LunchTime time(7),
	@OrderDate date,
	@UserId int,
	@MealId int,
	@PortionId int,
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Orders
		SET Comment = @Comment, Quantity = @Quantity, 
		LunchTime = @LunchTime, OrderDate = @OrderDate, 
		UserId = @UserId, MealId = @MealId, PortionId = @PortionId
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Orders WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[PortionDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PortionDelete]
(
	@Id int,
	@Version timestamp
)
AS
BEGIN
	DELETE FROM Portions WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[PortionInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PortionInsert]
(	
	@Id int OUTPUT,
	@Name nvarchar(80),
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Portions(Name)
		VALUES(@Name)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Portions WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[PortionsGetById]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PortionsGetById]
(
	@Id int
)
AS
SELECT *
FROM PortionsGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[PortionUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PortionUpdate]
(
    @Id int,
	@Name nvarchar(80),
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Portions
		SET Name = @Name
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Portions WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[RoleDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RoleDelete]
(
	@Id int,
	@Version timestamp
)
AS
BEGIN
	DELETE FROM Roles WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[RoleInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleInsert]
(	
	@Id int OUTPUT,
	@Name nvarchar(50),
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Roles(Name)
		VALUES(@Name)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Roles WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[RolesGetById]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RolesGetById]
(
	@Id int
)
AS
SELECT *
FROM RolesGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RolesGetByUserId]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[RolesGetByUserId]    Script Date: 26.6.2019. 10.17 ******/
CREATE PROCEDURE [dbo].[RolesGetByUserId]
(
	@UserId int
)
AS
SELECT DISTINCT Roles.Id, Roles.Name, Roles.Version
FROM Roles
INNER JOIN UsersRoles ON RoleId = UsersRoles.RoleId
WHERE @UserId = UsersRoles.UserId

/****** Object:  StoredProcedure [dbo].[RoleUpdate]    Script Date: 2.6.2019. 18.43.10 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[RoleUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RoleUpdate]
(
    @Id int,
	@Name nvarchar(50),
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Roles
		SET Name = @Name
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Roles WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserDelete]
(
	@Id int,
	@Version timestamp
)
AS
BEGIN
	DELETE FROM Users WHERE Id = @Id AND [Version] = @Version	
END
GO
/****** Object:  StoredProcedure [dbo].[UserInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserInsert]
(	
	@Id int OUTPUT,
	@FullName nvarchar(80),
	@Email nvarchar(254),
	@Password nvarchar(64),
	@IsActive bit,
	@CompanyId int,
	@Version timestamp OUTPUT
)
AS
BEGIN

	INSERT INTO Users(FullName, Email, Password, IsActive, CompanyId)
		VALUES(@FullName, @Email, @Password, @IsActive, @CompanyId)

	SET @Id =  SCOPE_IDENTITY()

	SELECT @Version = [Version] FROM Users WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[UserRoleDelete]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserRoleDelete]
(
	@UserId int,
	@RoleId int
)
AS
BEGIN
	DELETE FROM UsersRoles WHERE UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[UserRoleInsert]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserRoleInsert]
(	
	@UserId int,
	@RoleId int
)
AS
BEGIN

	INSERT INTO UsersRoles(UserId, RoleId)
		VALUES(@UserId, @RoleId)
END
GO
/****** Object:  StoredProcedure [dbo].[UsersGetById]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsersGetById]
(
	@Id int
)
AS
SELECT *
FROM UsersGetAll
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UsersGetByUserId]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsersGetByUserId]
(
	@UserId int
)
AS
SELECT *
FROM UsersRolesGetAll
WHERE UserId = @UserId
GO
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 7/3/2019 8:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserUpdate]
(
    @Id int,
	@FullName nvarchar(80),
	@Email nvarchar(254),
	@Password nvarchar(64),
	@IsActive bit,
	@CompanyId int,
	@Version timestamp OUTPUT
)
AS
BEGIN


	UPDATE Users
		SET FullName = @FullName, Email = @Email, Password = @Password, 
		IsActive = @IsActive, CompanyId = @CompanyId
		WHERE Id = @Id AND [Version] = @Version

		SELECT @Version = [Version] FROM Users WHERE Id = @Id
END
GO
