CREATE DATABASE Test18;
GO
USE [Test18];
GO

-- Tạo bảng Accounts
CREATE TABLE [dbo].[Accounts] (
    [uID] INT IDENTITY(1,1) PRIMARY KEY,
    [user] NVARCHAR(255) NOT NULL,
    [pass] NVARCHAR(255) NOT NULL,
    [email] NVARCHAR(255) NOT NULL UNIQUE,
    [isUser] INT NOT NULL,
    [isAdmin] INT NOT NULL
);
GO

-- Tạo bảng Categories
CREATE TABLE [dbo].[Categories] (
    [cID] INT IDENTITY(1,1) PRIMARY KEY,
    [cName] NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- Tạo bảng Products
CREATE TABLE [dbo].[Products] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
    [image] NVARCHAR(255) NOT NULL,
    [price] MONEY NOT NULL,
    [title] NVARCHAR(255) NOT NULL,
    [description] NVARCHAR(MAX) NOT NULL,
    [cateID] INT NULL,
    FOREIGN KEY ([cateID]) REFERENCES [dbo].[Categories]([cID]) ON DELETE SET NULL
);
GO

-- Chèn dữ liệu vào Accounts
INSERT INTO [dbo].[Accounts] ([user], [pass], [email], [isUser], [isAdmin]) VALUES 
(N'Minh', N'147', N'ducminh@gmail.com', 0, 1),
(N'Khanh', N'147', N'quockhanh@gmail.com', 0, 1),
(N'Bach', N'147', N'xuanbach@gmail.com', 0, 1),
(N'Hai', N'147', N'vanhai@gmail.com', 0, 1),
(N'Phuc', N'147', N'vanphuc@gmail.com', 0, 1),
(N'Forseken', N'123', N'forseken@gmail.com', 1, 0),
(N'Something', N'123', N'something@gmail.com', 1, 0),
(N'Jingg', N'123', N'jingg@gmail.com', 1, 0),
(N'Davai', N'123', N'davai@gmail.com', 1, 0),
(N'Mindfreak', N'123', N'mindfreak@gmail.com', 1, 0);
GO

-- Chèn dữ liệu vào Categories
INSERT INTO [dbo].[Categories] ([cName]) VALUES 
(N'Foods'),
(N'Drinks'),
(N'Snacks'),
(N'Combo');
GO

-- Chèn dữ liệu vào Products
INSERT INTO [dbo].[Products] ([name], [image], [price], [title], [description], [cateID]) 
VALUES 
(N'Instant noodles with egg', N'img/food1.png', 15000, N'Noodles', N'Delicious', 1),
(N'Yangzhou fried rice', N'img/food2.png', 20000, N'Rice', N'Tasty', 1),
(N'Stir-fried noodles with egg', N'img/food3.png', 20000, N'Noodles', N'Delicious', 1),
(N'Spicy noodles', N'img/food4.png', 30000, N'Spicy noodles', N'Hot and tasty', 1),
(N'Baguette pan dish', N'img/food5.png', 30000, N'Baguette pan', N'Savory', 1),
(N'Pho', N'img/food6.png', 25000, N'Pho', N'Traditional taste', 1),
(N'Tac Tea', N'img/drink1.png', 15000, N'Noodles', N'Delicious', 1),
(N'MilkTea', N'img/drink2.png', 20000, N'Rice', N'Tasty', 1),
(N'Bac Xiu', N'img/drink3.png', 18000, N'Noodles', N'Delicious', 1),
(N'Cocacola', N'img/drink4.png', 10000, N'Spicy noodles', N'Hot and tasty', 1),
(N'Sting', N'img/drink5.png', 10000, N'Baguette pan', N'Savory', 1),
(N'Water', N'img/drink6.png', 8000, N'Pho', N'Traditional taste', 1),
(N'Instant noodles with egg', N'img/snack1.png', 15000, N'Noodles', N'Delicious', 1),
(N'Yangzhou fried rice', N'img/snack2.png', 20000, N'Rice', N'Tasty', 1),
(N'Stir-fried noodles with egg', N'img/snack3.png', 20000, N'Noodles', N'Delicious', 1),
(N'Spicy noodles', N'img/snack4.png', 30000, N'Spicy noodles', N'Hot and tasty', 1),
(N'Baguette pan dish', N'img/snack5.png', 30000, N'Baguette pan', N'Savory', 1),
(N'Pho', N'img/snack6.png', 25000, N'Pho', N'Traditional taste', 1),
(N'Instant noodles with egg', N'img/combo1.png', 15000, N'Noodles', N'Delicious', 1),
(N'Yangzhou fried rice', N'img/combo2.png', 20000, N'Rice', N'Tasty', 1),
(N'Stir-fried noodles with egg', N'img/combo3.png', 20000, N'Noodles', N'Delicious', 1),
(N'Spicy noodles', N'img/combo4.png', 30000, N'Spicy noodles', N'Hot and tasty', 1),
(N'Baguette pan dish', N'img/combo5.png', 30000, N'Baguette pan', N'Savory', 1),
(N'Pho', N'img/combo6.png', 25000, N'Pho', N'Traditional taste', 1);
GO
CREATE TABLE [dbo].[Computers] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(50) NOT NULL,
    [zone] NVARCHAR(10) CHECK ([zone] IN (N'PRO', N'VIP', N'FPS')),
    [status] NVARCHAR(20) CHECK ([status] IN (N'Available', N'In Use')) DEFAULT N'Available'
);
GO

-- Chèn dữ liệu vào Computers
INSERT INTO [dbo].[Computers] ([name], [zone], [status]) VALUES
    (N'Computer1', N'PRO', N'Available'),
    (N'Computer2', N'PRO', N'In Use'),
    (N'Computer3', N'PRO', N'Available'),
    (N'Computer4', N'PRO', N'In Use'),
    (N'Computer5', N'PRO', N'Available'),
    (N'Computer6', N'PRO', N'In Use'),
    (N'Computer7', N'PRO', N'Available'),
    (N'Computer8', N'PRO', N'In Use'),
    (N'Computer9', N'PRO', N'Available'),
    (N'Computer10', N'PRO', N'In Use'),
    (N'Computer11', N'VIP', N'Available'),
    (N'Computer12', N'VIP', N'In Use'),
    (N'Computer13', N'VIP', N'Available'),
    (N'Computer14', N'VIP', N'In Use'),
    (N'Computer15', N'VIP', N'Available'),
    (N'Computer16', N'VIP', N'In Use'),
    (N'Computer17', N'VIP', N'Available'),
    (N'Computer18', N'VIP', N'In Use'),
    (N'Computer19', N'VIP', N'Available'),
    (N'Computer20', N'VIP', N'In Use'),
    (N'Computer21', N'FPS', N'Available'),
    (N'Computer22', N'FPS', N'In Use'),
    (N'Computer23', N'FPS', N'Available'),
    (N'Computer24', N'FPS', N'In Use'),
    (N'Computer25', N'FPS', N'Available'),
    (N'Computer26', N'FPS', N'In Use'),
    (N'Computer27', N'FPS', N'Available'),
    (N'Computer28', N'FPS', N'In Use'),
    (N'Computer29', N'FPS', N'Available'),
    (N'Computer30', N'FPS', N'In Use');
GO
