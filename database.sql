USE [master]
GO
Create database [Projectswp]
GO
USE [Projectswp]
GO

CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1),
	[role] [nvarchar](50),
	[description] [nvarchar](max),
	PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [varchar](255) DEFAULT N'img/avata.jpg',
    [user] [varchar](255) NOT NULL,
    [pass] [varchar](255) Not NULL,
	[email] [varchar](255) not NULL,
	[phone] [varchar](255) not NULL,
	[amount] [money] DEFAULT 0,
    [bought] [int] DEFAULT 0,
	[Address] [varchar](255) NULL,
	[status] [int] DEFAULT 0,
    [roleID] [int] NOT NULL,
    PRIMARY KEY CLUSTERED([id]ASC),
	foreign key ([roleID]) references [dbo].[Role]([id]),
);

CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED ([cid] ASC)
);

CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,	
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[sold] [int] NULL,
	[releaseDate] [date] NULL,
	[description] [nvarchar](max) NULL,
	[rate][float],
	[cateID] [int] NULL,
	CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID]) REFERENCES [dbo].[Category]([cid])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

CREATE TABLE [dbo].[Status](
	[id] [int]  IDENTITY(1,1),
	[status] [nvarchar](max),
	PRIMARY KEY CLUSTERED([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[Order](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[date] [date],
	[totalMoney] [money],
	[address]  [nvarchar](max),
	[sid] [int],
	PRIMARY KEY CLUSTERED([id]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	foreign key ([sid]) references [dbo].[Status]([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[OrderLine](
	[oid] [int],
	[pid] [int],
	[quantity] [float],
	[price] [float],
	PRIMARY KEY CLUSTERED ([oid], [pid]),
	foreign key ([oid]) references [dbo].[Order]([id]),
	foreign key ([pid]) references [dbo].[product]([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[Shipper](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[oid] [int],
	PRIMARY KEY CLUSTERED([id],[aid],[oid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	foreign key ([oid]) references [dbo].[Order]([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[Comment](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[pid] [int],
	[content] [nvarchar](max),
	[voted] [float],
	PRIMARY KEY CLUSTERED([id],[aid],[pid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	foreign key ([pid]) references [dbo].[product]([id]),
) ON [PRIMARY]
Go
CREATE TABLE [dbo].[Block](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	PRIMARY KEY CLUSTERED([id],[aid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	CONSTRAINT [UC_aid] UNIQUE ([aid])
) ON [PRIMARY]
go
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,	
	[title] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[description] [nvarchar](max) NULL,
	PRIMARY KEY CLUSTERED ([id] ASC),
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
Go
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role]([id], [Role], [description]) VALUES (1, N'Admin', N'Người lãnh đạo, quản lý tổ chức, đóng vai trò là quản trị viên hệ thống')
INSERT [dbo].[Role]([id], [Role], [description]) VALUES (2, N'Manager', N'Người quản lý trong tổ chức')
INSERT [dbo].[Role]([id], [Role], [description]) VALUES (3, N'Shipper', N'Nguời giao hàng cho shop')
INSERT [dbo].[Role]([id], [Role], [description]) VALUES (4, N'Customer', N'Người mua hàng, sử dụng dịch vụ của shop')
SET IDENTITY_INSERT [dbo].[Role] OFF

SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES (1, N'admin',  N'1', N'bapthom3@gmail.com', N'0123456789',9999, 0, N'Bac Ninh', 1)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES (2, N'admin1', N'1', N'bapthom3@gmail.com',N'0987654321',800, 1500, N'Ha Noi', 2)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES (3, N'user1', N'123456', N'user1@gmail.com',N'0123654789',600, 2000, N'Sơn La', 4)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES (4, N'user2', N'123456', N'user2@gmail.com',N'0987456321',1000, 1500, N'Bac Giang', 4)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES (5, N'shiper1', N'123456', N'shiper2@gmail.com',N'0147258369',2000, 2250, N'Hai Phong', 3)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES (6, N'shiper2', N'123456', N'shiper2@gmail.com',N'0963258741',1500, 1000, N'Hung Yen', 3)
SET IDENTITY_INSERT [dbo].[Account] OFF

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Đồng hồ Rolex')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Đồng hồ Cartier')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Đồng hồ Audemars Piguet')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Đồng hồ Patek Philippe')

INSERT [dbo].[product] ([name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES 
(N'Rolex COSMOGRAPH DAYTONA', N'img/rolex1.png', 3550, 2000, 1000, CAST(N'2023-06-12' AS Date), N'Rolex Cosmograph Daytona là một trong những biểu tượng không thể phủ nhận trong thế giới đồng hồ thể thao cao cấp. Được giới thiệu lần đầu vào năm 1963, Daytona nhanh chóng trở thành biểu tượng của tốc độ và sự chính xác. Với thiết kế đặc trưng của mặt số có 3 sub-dials và bezel có thể xoay, nó không chỉ là một chiếc đồng hồ mà còn là biểu tượng của phong cách và sự sang trọng.<br><br>
Được thiết kế để đáp ứng nhu cầu của các tay đua, Cosmograph Daytona của Rolex sở hữu một bộ máy cơ chuyên nghiệp và chính xác, cho phép đo thời gian đến từng phần nhỏ nhất. Mỗi chi tiết trên chiếc đồng hồ này đều được chăm chút tỉ mỉ, từ vỏ thép không gỉ, vàng hoặc các kim loại quý khác, đến các chi tiết nhỏ như các chỉ số và kim của mặt số.<br><br>
Ngoài tính năng đo thời gian, Daytona còn được biết đến với sự đa dạng về màu sắc và vật liệu, từ các phiên bản cổ điển với mặt số trắng vàng hoặc đen, đến các phiên bản hiện đại với mặt số màu xanh lá cây hoặc đỏ. Bất kỳ ai đeo một chiếc Cosmograph Daytona cũng có thể tự tin khẳng định phong cách của mình trong mọi tình huống, từ sân đua đến bữa tiệc sang trọng.<br><br>
Với sự kết hợp hoàn hảo giữa tính năng và kiểu dáng, Rolex Cosmograph Daytona không chỉ là một chiếc đồng hồ mà còn là biểu tượng của sự thành công và đẳng cấp.', 4.8, 1),

(N'Rolex YACHT-MASTER 42', N'img/rolex3.png', 3650, 1500, 1200, CAST(N'2023-12-12' AS Date), N'Rolex Yacht-Master 42 là một trong những phiên bản đặc biệt của dòng Yacht-Master của Rolex, nổi tiếng với sự kết hợp hoàn hảo giữa tính năng thể thao và phong cách sang trọng. Với kích thước lớn hơn so với các phiên bản trước đó, chiếc đồng hồ này mang lại sự ấn tượng mạnh mẽ trên cổ tay và đồng thời tôn lên vẻ đẳng cấp và quý phái.<br><br>
Vỏ và dây đeo của Yacht-Master 42 có thể làm từ các vật liệu cao cấp như thép không gỉ Oystersteel, vàng Everose 18ct hoặc bạch kim 18ct, tạo nên sự đa dạng trong lựa chọn phong cách. Mặt số được thiết kế cẩn thận với các chỉ số và kim loại quý, đồng hồ còn đi kèm với bezel xoay có thể điều chỉnh, giúp đo lường thời gian và các chức năng liên quan đến lễ hội biển.<br><br>
Với bộ máy cơ tự động Rolex calibre 3235, Yacht-Master 42 không chỉ đảm bảo độ chính xác cao mà còn có khả năng chống nước đến độ sâu 100 mét (330 feet), phù hợp cho các hoạt động trên biển. Chiếc đồng hồ này không chỉ là một phụ kiện thể thao mà còn là biểu tượng của sự hiện đại và đẳng cấp trong thế giới đồng hồ cao cấp.',4.7, 1),

(N'Đồng Hồ Santos de Carter WSSA0061', N'img/cartier3.png', 3500, 1500, 800, CAST(N'2023-03-19' AS Date), N'Đồng hồ Santos de Cartier WSSA0061 là một biểu tượng của sự tinh tế và đẳng cấp từ nhà sản xuất đồng hồ danh tiếng Cartier. Thiết kế của nó lấy cảm hứng từ phiên bản ban đầu được sáng tạo bởi Louis Cartier cho người bạn thân của mình, Alberto Santos-Dumont, một nhà hàng không nổi tiếng.<br><br>
Với vỏ hình vuông và góc bo tròn, cùng với mặt số trắng bạc đơn giản nhưng tinh tế, chiếc đồng hồ này thể hiện sự thanh lịch và hiện đại. Dây đeo bằng da cá sấu cải tiến mang lại sự thoải mái và sang trọng cho người đeo.<br><br>
Santos de Cartier WSSA0061 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Đồng hồ cũng có khả năng chống nước đến mức độ nhất định, làm cho nó trở thành một lựa chọn lý tưởng không chỉ cho việc đeo',4.5, 3),

(N'Đồng Hồ Audemars Piguet 41mm Royal Oak Blue Dial Automatic', N'img/audemars2.png', 2000, 1000, 900, CAST(N'2023-03-14' AS Date), N'Đồng Hồ Audemars Piguet 41mm Royal Oak Blue Dial Automatic là một biểu tượng của sự tinh tế và sang trọng từ nhà sản xuất đồng hồ Thụy Sĩ nổi tiếng. Royal Oak là dòng sản phẩm đặc biệt của Audemars Piguet, được giới thiệu vào năm 1972 và nhanh chóng trở thành một trong những biểu tượng của ngành công nghiệp đồng hồ cao cấp.<br><br>
Với vỏ thép không gỉ 41mm, đồng hồ này có kích thước vừa phải, phù hợp với cả nam và nữ. Mặt số màu xanh lam tinh tế với các chỉ số và kim loại quý làm nổi bật vẻ đẳng cấp và lịch lãm của chiếc đồng hồ. Vỏ và dây đeo của Royal Oak',4.9, 2),

(N'Đồng Hồ Audemars Piguet Royal Oak Selfwinding Chronograph', N'img/audemars1.png', 3600, 2000, 1500, CAST(N'2023-01-12' AS Date), N'Đồng Hồ Audemars Piguet Royal Oak Selfwinding Chronograph là một biểu tượng của sự tinh tế và hiệu suất từ thương hiệu đồng hồ đẳng cấp Audemars Piguet. Royal Oak là một trong những dòng sản phẩm phổ biến nhất của hãng, với thiết kế độc đáo và sang trọng.<br><br>
Chiếc đồng hồ này được trang bị chức năng chronograph tự động, cho phép người đeo đo lường thời gian trong các hoạt động thể thao hoặc trong cuộc sống hàng ngày. Với vỏ thép không gỉ hoặc vàng, Royal Oak Selfwinding Chronograph thể hiện sự bền bỉ và đẳng cấp.<br><br>
Mặt số có thể có nhiều màu sắc và chi tiết khác nhau, nhưng vẫn giữ được sự tinh tế và độc đáo của dòng Royal Oak. Dây đeo có thể là thép không gỉ hoặc da cá sấu, tùy thuộc vào phiên bản cụ thể.<br><br>
Với sự kết hợp hoàn hảo giữa tính năng và thiết kế, đồng hồ Audemars Piguet Royal Oak Selfwinding Chronograph là một lựa chọn lý tưởng cho những người yêu thích đồng hồ cao cấp và độc đáo',4.8, 2),

(N'Rolex 1908', N'img/rolex2.png', 3700, 700, 2000, CAST(N'2024-01-30' AS Date), N'Rolex 1908 là một trong những mảnh ghép quan trọng trong hành trình phát triển của hãng đồng hồ danh tiếng này. Năm 1908, Rolex đã đặt nền móng cho sự nghiên cứu và phát triển về độ chính xác và độ bền bỉ của các thiết bị đo thời gian, tạo ra những tiêu chuẩn mới trong ngành công nghiệp đồng hồ. Sự cam kết này đã điểm đặc biệt cho Rolex và làm nên tên tuổi của họ trong thế giới đồng hồ cao cấp. <br><br>
Từ khi thành lập, Rolex đã không ngừng tiến xa hơn trong việc phát triển và cải tiến công nghệ đồng hồ, từ việc chế tạo ra những bộ máy cơ chính xác đến việc thiết kế các thiết kế vỏ độc đáo và tinh tế. Rolex 1908 đóng vai trò là cột mốc quan trọng trong hành trình không ngừng của hãng để đem lại những chiếc đồng hồ tinh tế và đáng tin cậy nhất cho người đeo trên toàn thế giới.',4.6, 1),

(N'Đồng hồ Patek Philippe Nautilus', N'img/patek3.png', 3880, 800, 500, CAST(N'2023-08-15' AS Date), N'Đồng hồ Patek Philippe Nautilus là một biểu tượng của sự tinh tế và sang trọng từ thương hiệu đồng hồ xa xỉ Patek Philippe. Được giới thiệu lần đầu vào năm 1976, Nautilus nhanh chóng trở thành một trong những mẫu đồng hồ thể thao cao cấp được ưa chuộng nhất trên thị trường.<br><br>
Thiết kế của Nautilus nổi bật với vỏ hình chiếc thuyền và mặt số dạng tinh tế, mang lại vẻ đẳng cấp và sang trọng. Dòng Nautilus thường được làm từ các vật liệu cao cấp như thép không gỉ, vàng hoặc bạch kim, kết hợp cùng với dây đeo chất lượng cao như dây đeo thép hoặc dây đeo da cá sấu.<br><br>
Bên trong, Nautilus thường được trang bị bộ máy cơ tự động hoặc cơ quang, đảm bảo độ chính xác và độ tin cậy. Với sự kết hợp hoàn hảo giữa thiết kế tinh tế và tính năng cao cấp, đồng hồ Patek Philippe Nautilus không chỉ là một phụ kiện mà còn là biểu tượng của sự thượng lưu và đẳng cấp trong thế giới đồng hồ cao cấp.',4.4, 4),

(N'Đồng Hồ Cartier Santos WSSA0030', N'img/cartier2.png', 3750, 500, 600, CAST(N'2023-11-12' AS Date), N'Đồng Hồ Cartier Santos WSSA0030 là một biểu tượng của sự tinh tế và đẳng cấp từ nhà sản xuất đồng hồ danh tiếng Cartier. Santos là một trong những dòng sản phẩm đáng chú ý nhất của Cartier, với thiết kế độc đáo và lịch lãm.<br><br>
Với vỏ và dây đeo bằng thép không gỉ, đồng hồ Santos WSSA0030 mang lại vẻ ngoài mạnh mẽ và bền bỉ, phù hợp cho cả các hoạt động thể thao và các dịp trang trọng. Mặt số màu bạc với các chỉ số và kim loại quý tạo ra một diện mạo đẳng cấp và sang trọng.<br><br>
Bên trong, Santos WSSA0030 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Thiết kế này không chỉ mang lại sự tiện dụng mà còn thể hiện phong cách và đẳng cấp đặc trưng của thương hiệu Cartier.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng tinh tế và tính năng cao cấp, đồng hồ Cartier Santos WSSA0030 là một lựa chọn lý tưởng cho những người đam mê đồng hồ cao cấp và đẳng cấp.',4.7, 3),

(N'Đồng hồ Patek Philippe Complications', N'img/patek1.png', 3150, 800, 600, CAST(N'2023-05-21' AS Date), N'Đồng hồ Patek Philippe Complications User là một biểu tượng của sự tinh tế và tinh thần sáng tạo từ nhà sản xuất đồng hồ xa xỉ Patek Philippe. Với dòng sản phẩm Complications, Patek Philippe không chỉ mang đến sự đẳng cấp mà còn thể hiện sự phức tạp và khả năng sáng tạo trong thiết kế và công nghệ đồng hồ.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như vàng hoặc bạch kim, đồng hồ Patek Philippe Complications User mang lại sự sang trọng và đẳng cấp đặc trưng của thương hiệu. Mặt số được thiết kế tinh xảo với các chỉ số và kim loại quý, tạo nên một diện mạo lịch lãm và sang trọng.<br><br>
Bên cạnh đó, với các tính năng phức tạp như lịch thứ, lịch ngày, và một số tính năng khác, đồng hồ Complications User không chỉ là một phụ kiện mà còn là một công cụ hữu ích trong cuộc sống hàng ngày của người sử dụng.<br><br>
Với sự kết hợp hoàn hảo giữa tính năng cao cấp và kiểu dáng đẳng cấp, đồng hồ Patek Philippe Complications User là lựa chọn lý tưởng cho những người đam mê đồng hồ cao cấp và đòi hỏi tính ứng dụng cao trong mọi tình huống.',4.5, 4),

(N'Đồng Hồ AP Royal Oak Concept Flying Tourbillon', N'img/audemars3.png', 3550, 2000, 1250, CAST(N'2024-01-12' AS Date), N'Đồng Hồ AP Royal Oak Concept Flying Tourbillon là một biểu tượng của sự sáng tạo và đẳng cấp từ thương hiệu đồng hồ cao cấp Audemars Piguet. Royal Oak Concept là dòng sản phẩm độc đáo, thường được biết đến với các tính năng và công nghệ tiên tiến.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như titan hoặc cermet, đồng hồ AP Royal Oak Concept Flying Tourbillon mang lại sự hiện đại và sang trọng. Thiết kế của nó thường mang phong cách công nghệ, với các đường viền sắc nét và các chi tiết tinh xảo.<br><br>
Các tính năng tiên tiến như Flying Tourbillon, một cơ chế phức tạp giúp cải thiện độ chính xác của đồng hồ, làm cho Royal Oak Concept trở thành một biểu tượng của sự chuyên môn và đẳng cấp trong thế giới đồng hồ cao cấp.<br><br>
Với sự kết hợp hoàn hảo giữa công nghệ và thiết kế đột phá, đồng hồ AP Royal Oak Concept Flying Tourbillon là một lựa chọn lý tưởng cho những người yêu thích đồng hồ cao cấp và đam mê sự đổi mới.',4.8, 2),

(N'Đồng Hồ Cartier Santos W2SA0007', N'img/cartier1.png', 3850, 1500, 1500, CAST(N'2023-05-30' AS Date), N'Đồng Hồ Cartier Santos W2SA0007 là một biểu tượng của sự tinh tế và sang trọng từ thương hiệu đồng hồ danh tiếng Cartier. Santos là một trong những dòng sản phẩm đáng chú ý nhất của Cartier, với thiết kế độc đáo và lịch lãm.<br><br>
Với vỏ và dây đeo bằng thép không gỉ, đồng hồ Santos W2SA0007 mang lại vẻ ngoài mạnh mẽ và bền bỉ, phù hợp cho cả các hoạt động thể thao và các dịp trang trọng. Mặt số màu bạc với các chỉ số và kim loại quý tạo ra một diện mạo đẳng cấp và sang trọng.<br><br>
Bên trong, Santos W2SA0007 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Thiết kế này không chỉ mang lại sự tiện dụng mà còn thể hiện phong cách và đẳng cấp đặc trưng của thương hiệu Cartier.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng tinh tế và tính năng cao cấp, đồng hồ Cartier Santos W2SA0007 là một lựa chọn lý tưởng cho những người đam mê đồng hồ cao cấp và đẳng cấp.',4.9, 3),

(N'Đồng hồ Patek Philippe Perpetual Calendar', N'img/patek2.png', 3500, 2500, 800, CAST(N'2022-07-17' AS Date), N'Đồng hồ Patek Philippe Perpetual Calendar là một tác phẩm nghệ thuật của sự tinh tế và độ chính xác từ nhà sản xuất đồng hồ cao cấp Patek Philippe. Với dòng sản phẩm Perpetual Calendar, Patek Philippe mang lại sự kết hợp tuyệt vời giữa thiết kế đẳng cấp và tính năng cao cấp.<br><br>
Thiết kế của Perpetual Calendar thường mang đậm dấu ấn của Patek Philippe với vỏ vàng hoặc bạch kim, kết hợp cùng với mặt số tinh tế và các chỉ số kim cương. Đồng hồ này không chỉ là một công cụ đo thời gian mà còn là một biểu tượng của phong cách và đẳng cấp.<br><br>
Tính năng chính của Perpetual Calendar là khả năng hiển thị ngày, tháng và năm mà không cần điều chỉnh thủ công, thậm chí trong các năm nhuận. Điều này là nhờ vào cơ chế phức tạp và chính xác của bộ máy cơ tự động bên trong.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng đẳng cấp và tính năng thông minh, đồng hồ Patek Philippe Perpetual Calendar là một biểu tượng của sự sang trọng và tinh tế trong thế giới đồng hồ cao cấp.',4.9, 4),

(N'Đồng Hồ Audemars Piguet Royal Oak Concept Flying Tourbillon', N'img/audemars4.png', 3100, 1500, 1800, CAST(N'2023-07-17' AS Date), N'Đồng Hồ Audemars Piguet Royal Oak Concept Flying Tourbillon là một biểu tượng của sự sáng tạo và đẳng cấp từ thương hiệu đồng hồ cao cấp Audemars Piguet. Royal Oak Concept là dòng sản phẩm độc đáo, thường được biết đến với các tính năng và công nghệ tiên tiến.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như titan hoặc cermet, đồng hồ AP Royal Oak Concept Flying Tourbillon mang lại sự hiện đại và sang trọng. Thiết kế của nó thường mang phong cách công nghệ, với các đường viền sắc nét và các chi tiết tinh xảo.<br><br>
Các tính năng tiên tiến như Flying Tourbillon, một cơ chế phức tạp giúp cải thiện độ chính xác của đồng hồ, làm cho Royal Oak Concept trở thành một biểu tượng của sự chuyên môn và đẳng cấp trong thế giới đồng hồ cao cấp.<br><br>
Với sự kết hợp hoàn hảo giữa công nghệ và thiết kế đột phá, đồng hồ Audemars Piguet Royal Oak Concept Flying Tourbillon là một lựa chọn lý tưởng cho những người yêu thích đồng hồ cao cấp và đam mê sự đổi mới.',4.6, 2),

(N'Rolex YACHT-MASTER 42', N'img/rolex4.png', 2900, 1000, 1600, CAST(N'2023-09-19' AS Date), N'Rolex YACHT-MASTER 42 là một biểu tượng của sự sang trọng và chuyên nghiệp từ thương hiệu đồng hồ danh tiếng Rolex. Với dòng sản phẩm YACHT-MASTER, Rolex mang lại sự kết hợp hoàn hảo giữa thiết kế năng động và tính năng cao cấp.<br><br>
Với vỏ thép không gỉ 42mm, YACHT-MASTER 42 có kích thước vừa phải, phù hợp với cả nam và nữ. Thiết kế của nó thường mang đậm dấu ấn của Rolex với mặt số và chỉ số lấp lánh, tạo nên vẻ đẳng cấp và sang trọng.<br><br>
Đồng hồ này được trang bị bộ máy cơ tự động, đảm bảo độ chính xác và độ tin cậy trong mọi điều kiện. Ngoài ra, YACHT-MASTER 42 còn có tính năng chống nước đến mức độ sâu nước nổi tiếng của Rolex, làm cho nó trở thành lựa chọn lý tưởng cho các hoạt động trên biển.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng năng động và tính năng chuyên nghiệp, Rolex YACHT-MASTER 42 là một biểu tượng của sự sang trọng và đẳng cấp trong thế giới đồng hồ cao cấp',4.5, 1),

(N'Đồng hồ Patek Philippe Nautilus Annual Calendar Blue Dial', N'img/patek4.png', 2800, 1500, 2000, CAST(N'2023-10-17' AS Date), N'Đồng hồ Patek Philippe Nautilus Annual Calendar Blue Dial là biểu tượng của sự tinh tế và đẳng cấp từ thương hiệu đồng hồ xa xỉ Patek Philippe. Nautilus là một trong những dòng sản phẩm phổ biến nhất của Patek Philippe, với thiết kế độc đáo và sang trọng.<br><br>
Mặt số màu xanh đặc trưng của Nautilus Annual Calendar tạo điểm nhấn nổi bật và phong cách. Việc sử dụng lịch hàng năm (Annual Calendar) cho phép đồng hồ hiển thị ngày, tháng và ngày trong tuần mà không cần điều chỉnh hàng tháng, tạo ra sự thuận tiện cho người sử dụng.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như thép không gỉ hoặc vàng, Nautilus Annual Calendar Blue Dial mang lại sự đẳng cấp và sang trọng. Thiết kế vỏ lịch lãm và đường nét mạnh mẽ là điểm nhấn của dòng Nautilus.<br><br>
Bên trong, Nautilus Annual Calendar Blue Dial được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Đồng hồ này không chỉ là một phụ kiện mà còn là biểu tượng của sự thượng lưu và phong cách trong thế giới đồng hồ cao cấp.',4.8, 4),

(N'Rolex GMT-MASTER II', N'img/rolex5.png', 3120, 1500, 2000, CAST(N'2023-12-17' AS Date), N'Đồng hồ Rolex GMT-MASTER II là một trong những biểu tượng của sự chuyên nghiệp và đẳng cấp từ thương hiệu đồng hồ danh tiếng Rolex. GMT-MASTER II được thiết kế đặc biệt để đáp ứng nhu cầu của những người thường xuyên di chuyển giữa múi giờ khác nhau.<br><br>
Với tính năng GMT kép, Rolex GMT-MASTER II cho phép người đeo theo dõi hai múi giờ cùng một lúc, tạo thuận lợi cho các chuyến đi công tác hoặc du lịch quốc tế. Việc điều chỉnh múi giờ dễ dàng và chính xác nhờ vào núm xoay đặc biệt.<br><br>
Vỏ và dây đeo của GMT-MASTER II thường được làm từ các vật liệu cao cấp như thép không gỉ, vàng hoặc chất liệu hai tông. Thiết kế vỏ đặc trưng và mặt số dễ nhận biết là những điểm nhấn của dòng GMT-MASTER II.<br><br>
Bên trong, GMT-MASTER II được trang bị bộ máy cơ tự động, đảm bảo độ chính xác và độ tin cậy trong mọi tình huống. Đồng hồ này không chỉ là một công cụ hữu ích mà còn là biểu tượng của phong cách và sự chuyên nghiệp trong thế giới đồng hồ cao cấp.',4.6, 1),

(N'Đồng Hồ Cartier Santos Dumont WSSA0062', N'img/cartier4.png', 3100, 1500, 2000, CAST(N'2023-12-17' AS Date), N'Đồng Hồ Cartier Santos Dumont WSSA0062 là một biểu tượng của sự tinh tế và đẳng cấp từ thương hiệu đồng hồ danh tiếng Cartier. Santos Dumont là một trong những dòng sản phẩm được Cartier vinh danh để tưởng nhớ nhà phát minh hàng không nổi tiếng Alberto Santos-Dumont.<br><br>
Với vỏ vàng hoặc thép không gỉ, Santos Dumont WSSA0062 mang lại vẻ ngoài lịch lãm và sang trọng. Thiết kế mặt số trắng hoặc bạc với các chỉ số thanh mãnh tạo ra một diện mạo thanh lịch và tinh tế.<br><br>
Đồng hồ này được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy trong mọi hoàn cảnh. Thiết kế đơn giản và thanh lịch của Santos Dumont WSSA0062 thường được ưa chuộng bởi những người thích phong cách cổ điển và tinh tế của Cartier.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng lịch lãm và tính năng chuyên nghiệp, Đồng Hồ Cartier Santos Dumont WSSA0062 là một lựa chọn tuyệt vời cho những người đam mê đồng hồ cao cấp và đòi hỏi sự đẳng cấp.',4.7, 3),

(N'Đồng Hồ AP Royal Oak Concept Flying Tourbillon', N'img/audemars5.png', 3110, 500, 2000, CAST(N'2024-01-17' AS Date), N'Đồng Hồ AP Royal Oak Concept Flying Tourbillon là một biểu tượng của sự sáng tạo và đẳng cấp từ thương hiệu đồng hồ cao cấp Audemars Piguet. Royal Oak Concept là dòng sản phẩm độc đáo, thường được biết đến với các tính năng và công nghệ tiên tiến.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như titan hoặc cermet, đồng hồ AP Royal Oak Concept Flying Tourbillon mang lại sự hiện đại và sang trọng. Thiết kế của nó thường mang phong cách công nghệ, với các đường viền sắc nét và các chi tiết tinh xảo.<br><br>
Các tính năng tiên tiến như Flying Tourbillon, một cơ chế phức tạp giúp cải thiện độ chính xác của đồng hồ, làm cho Royal Oak Concept trở thành một biểu tượng của sự chuyên môn và đẳng cấp trong thế giới đồng hồ cao cấp.<br><br>
Với sự kết hợp hoàn hảo giữa công nghệ và thiết kế đột phá, đồng hồ AP Royal Oak Concept Flying Tourbillon là một lựa chọn lý tưởng cho những người yêu thích đồng hồ cao cấp và đam mê sự đổi mới.',4.6, 2),

(N'Đồng Hồ Cartier Tank Solo W5200028', N'img/cartier5.png', 3100, 1500, 2000, CAST(N'2021-12-17' AS Date), N'Đồng Hồ Cartier Tank Solo W5200028 là biểu tượng của sự tinh tế và đẳng cấp từ thương hiệu đồng hồ danh tiếng Cartier. Loạt đồng hồ Tank của Cartier nổi tiếng với thiết kế hình hộp chữ nhật, tạo ra một vẻ đẹp thanh lịch và tinh tế.<br><br>
Với vỏ vàng hoặc thép không gỉ, Cartier Tank Solo W5200028 mang lại vẻ ngoài sang trọng và lịch lãm. Mặt số trắng với các chỉ số La Mỹ và kim loại quý tạo ra một diện mạo thanh lịch và tinh tế, phản ánh phong cách cổ điển của Cartier.<br><br>
Bên trong, Tank Solo W5200028 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Thiết kế đơn giản và tinh tế của nó làm cho đồng hồ này trở thành một lựa chọn lý tưởng cho những người ưa chuộng phong cách cổ điển và thanh lịch.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng đẳng cấp và tính năng chuyên nghiệp, Đồng Hồ Cartier Tank Solo W5200028 là một biểu tượng của sự sang trọng và đẳng cấp trong thế giới đồng hồ cao cấp.',4.8, 3),

(N'Đồng Hồ Patek Philippe Nautilus', N'img/patek5.png', 3100, 1500, 2000, CAST(N'2022-12-17' AS Date), N'Đồng Hồ Patek Philippe Nautilus là một trong những biểu tượng của sự tinh tế và sang trọng từ thương hiệu đồng hồ Patek Philippe. Với thiết kế đặc trưng của Nautilus, nó là một biểu tượng của phong cách thể thao và đẳng cấp.<br><br>
Với vỏ thép không gỉ hoặc vàng, Nautilus thường có một sự kết hợp tinh tế giữa màu sắc và kim loại quý. Thiết kế mặt số và vỏ nổi bật với các chi tiết chăm chút tạo ra một vẻ đẹp độc đáo và đặc trưng của Nautilus.<br><br>
Bên trong, Nautilus thường được trang bị bộ máy cơ tự động hoặc cơ tự động cao cấp, đảm bảo độ chính xác và độ tin cậy. Các tính năng tiên tiến như lịch ngày và lịch thứ thường là một phần của các mẫu Nautilus.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng đẳng cấp và tính năng cao cấp, Đồng Hồ Patek Philippe Nautilus là một biểu tượng của sự sang trọng và phong cách trong thế giới đồng hồ cao cấp.',4.7, 4)

SET IDENTITY_INSERT [dbo].[Status] ON 
INSERT [dbo].[Status]([id], [status]) VALUES (1,N'Chờ giao hàng')
INSERT [dbo].[Status]([id], [status]) VALUES (2,N'Đang giao hàng')
INSERT [dbo].[Status]([id], [status]) VALUES (3,N'Hoàn thành')
SET IDENTITY_INSERT [dbo].[Status] OFF

INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (2, CAST(N'2020-06-12' AS Date),7400,N'Ha Noi', 3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (1, CAST(N'2021-05-05' AS Date),10650,N'Hai phong',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (1, CAST(N'2021-10-12' AS Date),3700,N'Hue',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2021-12-12' AS Date),10500,N'Bac Giang',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (1, CAST(N'2022-01-05' AS Date),7300,N'Hai Duong',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2022-03-12' AS Date),7400,N'Bac Ninh',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (5, CAST(N'2022-08-05' AS Date),7100,N'Ninh Binh',2)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2022-12-12' AS Date),3700,N'Cao Bang',2)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (2, CAST(N'2023-01-12' AS Date),10500,N'Ca Mau',1)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2023-02-05' AS Date),14600,N'Ha Long',1)

INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (1,6,2,3700)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (2,10,3,3550)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (3,6,1,3700)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (4,12,3,3500)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (5,2,2,3650)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (6,6,2,3700)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (7,10,2,3550)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (8,6,1,3700)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (9,12,3,3500)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (10,2,4,3650)

INSERT [dbo].[Shipper]([oid],[aid]) VALUES (1,5)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (2,5)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (3,6)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (4,6)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (5,5)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (6,6)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (7,6)
INSERT [dbo].[Shipper]([oid],[aid]) VALUES (8,5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,1,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,1,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,1,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,1,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,1,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,1,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,2,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,2,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,2,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,2,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,2,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,2,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,3,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,3,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,3,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,3,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,3,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,3,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,4,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,4,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,4,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,4,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,4,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,4,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,5,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,5,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,5,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,5,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,5,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,5,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,6,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,6,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,6,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,6,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,6,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,6,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,7,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,7,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,7,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,7,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,7,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,7,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,8,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,8,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,8,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,8,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,8,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,8,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,9,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,9,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,9,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,9,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,9,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,9,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,10,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,10,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,10,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,10,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,10,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,10,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,11,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,11,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,11,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,11,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,11,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,11,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,12,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,12,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,12,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,12,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,12,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,12,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,13,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,13,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,13,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,13,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,13,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,13,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,13,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,13,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,13,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,13,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,13,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,13,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,14,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,14,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,14,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,14,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,14,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,14,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,14,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,14,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,14,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,14,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,14,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,14,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,15,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,15,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,15,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,15,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,15,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,15,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,15,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,15,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,15,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,15,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,15,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,15,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,16,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,16,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,16,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,16,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,16,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,16,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,16,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,16,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,16,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,16,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,16,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,16,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,17,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,17,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,17,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,17,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,17,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,17,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,17,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,17,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,17,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,17,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,17,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,17,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,18,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,18,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,18,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,18,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,18,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,18,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,18,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,18,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,18,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,18,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,18,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,18,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,19,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,19,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,19,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,19,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,19,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,19,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,19,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,19,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,19,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,19,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,19,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,19,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,20,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,20,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,20,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,20,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,20,N'Oke VIP',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,20,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,20,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,20,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,20,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,20,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,20,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,20,N'sản phẩm rất đẹp',5)

SET IDENTITY_INSERT [dbo].[Blog] ON
INSERT [dbo].[Blog]([id], [title], [image], [Date], [description]) VALUES (1, N'Trộm đồng hồ Rolex của người tình, hoa hậu Kỳ Anh lĩnh 7 năm tù', N'img/blog1.jpg', CAST(N'2022-12-13' AS Date), N'Miss Viet Nam Continents 2018 Lã Kỳ Anh bị đưa ra xét xử sau hơn một năm trộm đồng hồ Rolex giá gần 2 tỷ đồng của người tình.<br><br>Sáng 13/12, Lã Thị Anh (32 tuổi, tên khác là Lã Kỳ Anh) bị TAND TP HCM xét xử về tội Trộm cắp tài sản theo khoản 4 Điều 173 Bộ luật Hình sự, khung hình phạt 12-20 năm tù.<br><br>Kỳ Anh từng theo học trường Điện ảnh New York - khoa Sản xuất phim, đăng quang cuộc thi Miss Viet Nam Continents 2018 tại Mỹ. Cô quen biết thiếu gia Tuấn, 25 tuổi, qua mạng xã hội. Đầu tháng 8/2021, người đẹp thường đến nhà anh này ở quận 3 chơi và ngủ lại. Kỳ Anh được bạn trai giới thiệu đang sở hữu bộ sưu tập đồng hồ hàng hiệu, trong đó có chiếc Rolex Daytona giá 80.000-90.000 USD (khoảng 2 tỷ đồng).<br><br>Cáo trạng xác định, do chơi ngoại hối Forex thua lỗ, thiếu nợ, Kỳ Anh nảy sinh ý định lấy trộm đồng hồ quý của người tình. Lợi dụng lúc anh Tuấn ngủ say, Kỳ Anh chụp ảnh đồng hồ Rolex gửi cho anh Tô Văn Toàn nhờ lên mạng tìm và đặt mua đồng hồ "nhái". Hai hôm sau, anh Toàn báo đã tìm được một chiếc ưng ý ở Hà Nội với giá 13,5 triệu đồng, nếu Kỳ Anh mua phải trả thêm phí vận chuyển 1,2 triệu và đặt cọc trước 2 triệu. Hai tuần sau, người đẹp đến nhà anh Toàn lấy đồng hồ và trả hết số tiền còn lại.')
INSERT [dbo].[Blog]([id], [title], [image], [Date], [description]) VALUES (2, N'Dấu ấn thành công của hãng đồng hồ Rolex', N'img/blog2.jpg',CAST(N'2018-07-06' AS Date), N'Vị thế của Rolex gắn với Hans Wilsdorf, người sáng lập và tiên phong sáng tạo tính năng kháng nước, tự động lên cót… cho đồng hồ đeo tay.<br><br>Thương hiệu Rolex gắn liền với những mẫu đồng hồ đắt tiền, đẳng cấp. Vị thế dẫn đầu này chưa từng bị lung lay suốt 100 năm qua. Tạp chí Forbes xếp hạng Rolex là một trong những thương hiệu có giá trị nhất vào năm 2016, và là công ty sản xuất đồng hồ cao cấp hàng đầu thế giới. Mặc dù không công bố doanh số, nhưng các chuyên gia ước tính Rolex bán ra một triệu chiếc đồng hồ mỗi năm.<br><br>Sự thành công của Rolex nhờ Hans Wilsdorf, người sáng lập và cũng là bộ não đưa đến nhiều cải tiến cho đồng hồ đeo tay, xác lập vị thế tiên phong cho thương hiệu có tuổi đời hơn một thế kỷ này.<br><br>Sinh ra tại Đức vào năm 1881, Hans có tuổi thơ không mấy êm đẹp. Mất cha mẹ khi chỉ mới 12 tuổi, ông cùng anh chị em sống trong sự bảo bọc của họ hàng. Sau khi tốt nghiệp đại học, Hans làm việc cho công ty chuyên cung cấp ngọc trai và học hỏi những bài học đầu tiên về thương mại và chiến lược phát triển.<br><br>Dù không thể lý giải, nhưng Hans có một niềm đam mê với đất nước Thụy Sĩ. Ước mơ về việc thành lập một công ty đồng hồ nhen nhóm trong chàng trai trẻ khi ông chuyển qua làm việc cho công ty xuất khẩu đồng hồ Cuno Korten, nơi vẫn thường nhập linh kiện từ Đức, Pháp và Thụy Sĩ.')
INSERT [dbo].[Blog]([id], [title], [image], [Date], [description]) VALUES (3, N'3 đồng hồ Rolex đắt nhất mọi thời', N'img/blog3.jpg', CAST(N'2020-03-28' AS Date), N'Chiếc Daytona của sao quá cố Paul Newman, Rolex Bao Dai từng thuộc sở hữu của vua Bảo Đại... là một trong những mẫu Rolex đắt nhất mọi thời.<br><br>Qua giá bán từ nhà sản xuất đưa ra và các cuộc đấu giá, tạp chí thời trang Lux Digital chọn 3 chiếc đồng hồ Rolex (Thuỵ Sĩ) đắt nhất mọi thời.<br><br>Chiếc Rolex Daytona của diễn viên quá cố Paul Newman (Mỹ) được đấu giá đắt nhất đến hiện tại, 17,8 triệu USD (hơn 419 tỷ đồng) vào tháng 10/2017. Giá này đắt hơn nhiều so với chiếc 1943 Patek Philippe được bán 16 triệu USD (gần 377 tỷ đồng) năm 2016. Thiết kế đặc sắc không phải do chất liệu hay sự quý hiếm, mà nằm ở ý nghĩa của nó. Minh tinh Joan Woodward - vợ Paul - tặng chồng khi ông đóng phim Winning năm 1969.<br><br>Chiếc Rolex Daytona của diễn viên quá cố Paul Newman (Mỹ) đắt nhất đến hiện tại, được đấu giá lên tới 17,8 triệu USD (hơn 419 tỷ đồng) vào tháng 10/2017. Thiết kế đắt đỏ không phải do chất liệu hay quý hiếm, mà ở ý nghĩa của nó. Minh tinh Joan Woodward - vợ Paul - tặng chồng khi ông đóng phim "Winning" năm 1969.<br><br>Dòng The 1971 Rolex Daytona Reference 626 Unicorn có giá 5,9 triệu USD (gần 139 tỷ đồng), là mẫu duy nhất sử dụng vàng trắng 18 kara nên được gọi là Unicorn. Đầu thập niên 1970, phần lớn mẫu Rolex Daytona được chế tác từ thép không gỉ.')
SET IDENTITY_INSERT [dbo].[Blog] OFF