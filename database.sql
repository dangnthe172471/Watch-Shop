USE [master]
GO
Create database [Projectswp]
GO
USE [Projectswp]
GO

CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1),
	[role] [nvarchar](max),
	[description] [nvarchar](max),
	PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [varchar](255) DEFAULT N'img/avata.jpg',
    [user] [varchar](255) NOT NULL,
    [pass] [varchar](255) Not NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[amount] [money] DEFAULT 0,
    [bought] [int] DEFAULT 0,
	[Address] [varchar](255) NULL,
	[status] [int] DEFAULT 0,
    [roleID] [int] NOT NULL,
	[token] [varchar](max) null,
    PRIMARY KEY CLUSTERED([id]ASC),
	foreign key ([roleID]) references [dbo].[Role]([id]),
);

CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](max) NOT NULL,
	[type] [int],
	[deleted] [int],
	PRIMARY KEY CLUSTERED ([cid] ASC)
);

CREATE TABLE [dbo].[brand] (
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[bname] [nvarchar](max) NOT NULL,
	[image][nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[deleted] [int],
	PRIMARY KEY CLUSTERED ([bid] ASC)
);

CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[sold] [int] NULL,
	[releaseDate] [date] NULL,
	[description] [nvarchar](max) NULL,
	[rate][float],
	[cateID1] [int] not NULL,
	[cateID2] [int] not NULL,
	[cateID3] [int] not NULL,
	[brandID] [int] not NULL,
	[status] [int] DEFAULT 0,
	PRIMARY KEY CLUSTERED ([id] ASC),
	FOREIGN KEY([cateID1]) REFERENCES [dbo].[Category]([cid]),
	FOREIGN KEY([cateID2]) REFERENCES [dbo].[Category]([cid]),
	FOREIGN KEY([cateID3]) REFERENCES [dbo].[Category]([cid]),
	FOREIGN KEY([brandID]) REFERENCES [dbo].[Brand]([bid])
)

create table [dbo].[ImageProduct](
	[id] [int]  IDENTITY(1,1),
	[pid] [int]  NOT NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
	[image4] [nvarchar](max) NULL,
	FOREIGN KEY([pid]) REFERENCES [dbo].[product]([id]),
	PRIMARY KEY CLUSTERED([id]),
)


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

CREATE TABLE [dbo].[OrderDetail](
	[oid] [int],
	[pid] [int],
	[quantity] [float],
	[price] [float],
	PRIMARY KEY CLUSTERED ([oid], [pid]),
	foreign key ([oid]) references [dbo].[Order]([id]),
	foreign key ([pid]) references [dbo].[product]([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[ShippingHistory](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[oid] [int],
	PRIMARY KEY CLUSTERED([id],[aid],[oid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	foreign key ([oid]) references [dbo].[Order]([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[Feedback](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[pid] [int],
	[content] [nvarchar](max),
	[voted] [float],
	PRIMARY KEY CLUSTERED([id],[aid],[pid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	foreign key ([pid]) references [dbo].[product]([id]),
) ON [PRIMARY]
go
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,	
	[title] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[description] [nvarchar](max) NULL,
	[status] [int],
	[created_by] [int], 
	PRIMARY KEY CLUSTERED ([id] ASC),
	foreign key ([created_by]) references [dbo].[Account]([id]),
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
go

SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role]([id], [Role], [description]) VALUES 
(1, N'Admin', N'Người lãnh đạo, quản lý tổ chức, đóng vai trò là quản trị viên hệ thống'),
(2, N'Manager', N'Người quản lý trong tổ chức'),
(3, N'Shipper', N'Nguời giao hàng cho shop'),
(4, N'Customer', N'Người mua hàng, sử dụng dịch vụ của shop')
SET IDENTITY_INSERT [dbo].[Role] OFF

SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [roleID]) VALUES
(1, N'admin',  N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'bapthom3@gmail.com', N'0123456789',9999, 0, N'Bac Ninh', 1),
(2, N'staff', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'staff@gmail.com',N'0987654321',800, 1500, N'Ha Noi', 2),
(3, N'user1', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'user1@gmail.com',N'0123654789',600, 2000, N'Sơn La', 4),
(4, N'user2', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'user2@gmail.com',N'0123654789',800, 1000, N'Vinh Phuc', 4),
(5, N'shiper1', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'shiper2@gmail.com',N'0147258369',2000, 2250, N'Hai Phong', 3),
(6, N'shiper2', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'shiper2@gmail.com',N'0963258741',1500, 1000, N'Hung Yen', 3)
SET IDENTITY_INSERT [dbo].[Account] OFF

SET IDENTITY_INSERT [dbo].[brand] ON 
INSERT [dbo].[brand] ([bid], [bname], [image], [description], [deleted]) VALUES 
(1, N'Đồng hồ Rolex',N'img/logorolex.jpg',N'Đồng hồ Rolex là biểu tượng của sự sang trọng, đẳng cấp và chất lượng tinh tế. Thương hiệu này nổi tiếng với các mẫu đồng hồ chính xác và bền bỉ, được ưa chuộng trong giới thượng lưu và đam mê đồng hồ trên khắp thế giới.',0),
(2, N'Đồng hồ Cartier',N'img/logocartier.jpg',N'Đồng hồ Cartier mang đến sự kết hợp tinh tế giữa nghệ thuật, thời trang và chất lượng hàng đầu. Thương hiệu này nổi tiếng với thiết kế độc đáo, đẳng cấp và sang trọng, thu hút người đam mê đồng hồ từ mọi lứa tuổi và vị trí xã hội.',0),
(3, N'Đồng hồ Audemars Piguet',N'img/logoAude.jpg',N'Đồng hồ Audemars Piguet là biểu tượng của sự độc đáo, sáng tạo và chất lượng tinh tế. Với hơn 140 năm lịch sử, thương hiệu này nổi tiếng với các mẫu đồng hồ cao cấp, thiết kế độc đáo và công nghệ chế tác tiên tiến, thu hút sự ngưỡng mộ của những người yêu thích đồng hồ trên toàn thế giới.',0),
(4, N'Đồng hồ Patek Philippe',N'img/logoPatek.png',N'Đồng hồ Patek Philippe là biểu tượng của sự tinh tế, đẳng cấp và thủ công tinh xảo. Với hơn 180 năm lịch sử, thương hiệu này nổi tiếng với sự sang trọng, chất lượng vượt thời gian và những thiết kế độc đáo. Đồng hồ Patek Philippe không chỉ là một món đồ trang sức, mà còn là một biểu tượng của phong cách và vị thế xã hội.',0)
SET IDENTITY_INSERT [dbo].[brand] OFF

SET IDENTITY_INSERT [dbo].[Category] ON 
INSERT [dbo].[Category] ([cid], [cname],[type],[deleted]) VALUES 
(1, N'Đồng hồ Nam',1,0),
(2, N'Đồng hồ Nữ',1,0),
(3, N'30m (3ATM)',2,0),
(4, N'50m (5ATM)',2,0),
(5, N'100m (10ATM)',2,0),
(6, N'30mm',3,0),
(7, N'38mm',3,0),
(8, N'42mm',3,0)
SET IDENTITY_INSERT [dbo].[Category] OFF

INSERT [dbo].[product] ([code], [name], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID1], [cateID2], [cateID3], [brandID]) VALUES 
(N'RLX001',N'Rolex COSMOGRAPH DAYTONA', 3550, 2000, 1000, CAST(N'2023-06-12' AS Date), N'Rolex Cosmograph Daytona là một trong những biểu tượng không thể phủ nhận trong thế giới đồng hồ thể thao cao cấp. Được giới thiệu lần đầu vào năm 1963, Daytona nhanh chóng trở thành biểu tượng của tốc độ và sự chính xác. Với thiết kế đặc trưng của mặt số có 3 sub-dials và bezel có thể xoay, nó không chỉ là một chiếc đồng hồ mà còn là biểu tượng của phong cách và sự sang trọng.<br><br>
Được thiết kế để đáp ứng nhu cầu của các tay đua, Cosmograph Daytona của Rolex sở hữu một bộ máy cơ chuyên nghiệp và chính xác, cho phép đo thời gian đến từng phần nhỏ nhất. Mỗi chi tiết trên chiếc đồng hồ này đều được chăm chút tỉ mỉ, từ vỏ thép không gỉ, vàng hoặc các kim loại quý khác, đến các chi tiết nhỏ như các chỉ số và kim của mặt số.<br><br>
Ngoài tính năng đo thời gian, Daytona còn được biết đến với sự đa dạng về màu sắc và vật liệu, từ các phiên bản cổ điển với mặt số trắng vàng hoặc đen, đến các phiên bản hiện đại với mặt số màu xanh lá cây hoặc đỏ. Bất kỳ ai đeo một chiếc Cosmograph Daytona cũng có thể tự tin khẳng định phong cách của mình trong mọi tình huống, từ sân đua đến bữa tiệc sang trọng.<br><br>
Với sự kết hợp hoàn hảo giữa tính năng và kiểu dáng, Rolex Cosmograph Daytona không chỉ là một chiếc đồng hồ mà còn là biểu tượng của sự thành công và đẳng cấp.', 4.8, 2,3,6, 1),

(N'RLX002',N'Rolex YACHT-MASTER 42', 3650, 1500, 1200, CAST(N'2023-12-12' AS Date), N'Rolex Yacht-Master 42 là một trong những phiên bản đặc biệt của dòng Yacht-Master của Rolex, nổi tiếng với sự kết hợp hoàn hảo giữa tính năng thể thao và phong cách sang trọng. Với kích thước lớn hơn so với các phiên bản trước đó, chiếc đồng hồ này mang lại sự ấn tượng mạnh mẽ trên cổ tay và đồng thời tôn lên vẻ đẳng cấp và quý phái.<br><br>
Vỏ và dây đeo của Yacht-Master 42 có thể làm từ các vật liệu cao cấp như thép không gỉ Oystersteel, vàng Everose 18ct hoặc bạch kim 18ct, tạo nên sự đa dạng trong lựa chọn phong cách. Mặt số được thiết kế cẩn thận với các chỉ số và kim loại quý, đồng hồ còn đi kèm với bezel xoay có thể điều chỉnh, giúp đo lường thời gian và các chức năng liên quan đến lễ hội biển.<br><br>
Với bộ máy cơ tự động Rolex calibre 3235, Yacht-Master 42 không chỉ đảm bảo độ chính xác cao mà còn có khả năng chống nước đến độ sâu 100 mét (330 feet), phù hợp cho các hoạt động trên biển. Chiếc đồng hồ này không chỉ là một phụ kiện thể thao mà còn là biểu tượng của sự hiện đại và đẳng cấp trong thế giới đồng hồ cao cấp.',4.7, 2,4,6,2),

(N'CTR001',N'Đồng Hồ Santos de Carter WSSA0061', 3500, 1500, 800, CAST(N'2023-03-19' AS Date), N'Đồng hồ Santos de Cartier WSSA0061 là một biểu tượng của sự tinh tế và đẳng cấp từ nhà sản xuất đồng hồ danh tiếng Cartier. Thiết kế của nó lấy cảm hứng từ phiên bản ban đầu được sáng tạo bởi Louis Cartier cho người bạn thân của mình, Alberto Santos-Dumont, một nhà hàng không nổi tiếng.<br><br>
Với vỏ hình vuông và góc bo tròn, cùng với mặt số trắng bạc đơn giản nhưng tinh tế, chiếc đồng hồ này thể hiện sự thanh lịch và hiện đại. Dây đeo bằng da cá sấu cải tiến mang lại sự thoải mái và sang trọng cho người đeo.<br><br>
Santos de Cartier WSSA0061 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Đồng hồ cũng có khả năng chống nước đến mức độ nhất định, làm cho nó trở thành một lựa chọn lý tưởng không chỉ cho việc đeo',4.5, 1,5,8,3),

(N'APT001',N'Đồng Hồ Audemars Piguet 41mm Royal Oak Blue Dial Automatic', 2000, 1000, 900, CAST(N'2023-03-14' AS Date), N'Đồng Hồ Audemars Piguet 41mm Royal Oak Blue Dial Automatic là một biểu tượng của sự tinh tế và sang trọng từ nhà sản xuất đồng hồ Thụy Sĩ nổi tiếng. Royal Oak là dòng sản phẩm đặc biệt của Audemars Piguet, được giới thiệu vào năm 1972 và nhanh chóng trở thành một trong những biểu tượng của ngành công nghiệp đồng hồ cao cấp.<br><br>
Với vỏ thép không gỉ 41mm, đồng hồ này có kích thước vừa phải, phù hợp với cả nam và nữ. Mặt số màu xanh lam tinh tế với các chỉ số và kim loại quý làm nổi bật vẻ đẳng cấp và lịch lãm của chiếc đồng hồ. Vỏ và dây đeo của Royal Oak',4.9, 1,3,8,4),

(N'APT002',N'Đồng Hồ Audemars Piguet Royal Oak Selfwinding Chronograph', 3600, 2000, 1500, CAST(N'2023-01-12' AS Date), N'Đồng Hồ Audemars Piguet Royal Oak Selfwinding Chronograph là một biểu tượng của sự tinh tế và hiệu suất từ thương hiệu đồng hồ đẳng cấp Audemars Piguet. Royal Oak là một trong những dòng sản phẩm phổ biến nhất của hãng, với thiết kế độc đáo và sang trọng.<br><br>
Chiếc đồng hồ này được trang bị chức năng chronograph tự động, cho phép người đeo đo lường thời gian trong các hoạt động thể thao hoặc trong cuộc sống hàng ngày. Với vỏ thép không gỉ hoặc vàng, Royal Oak Selfwinding Chronograph thể hiện sự bền bỉ và đẳng cấp.<br><br>
Mặt số có thể có nhiều màu sắc và chi tiết khác nhau, nhưng vẫn giữ được sự tinh tế và độc đáo của dòng Royal Oak. Dây đeo có thể là thép không gỉ hoặc da cá sấu, tùy thuộc vào phiên bản cụ thể.<br><br>
Với sự kết hợp hoàn hảo giữa tính năng và thiết kế, đồng hồ Audemars Piguet Royal Oak Selfwinding Chronograph là một lựa chọn lý tưởng cho những người yêu thích đồng hồ cao cấp và độc đáo',4.8, 1,4,7,1),

(N'RLX003',N'Rolex 1908', 3700, 700, 2000, CAST(N'2024-01-30' AS Date), N'Rolex 1908 là một trong những mảnh ghép quan trọng trong hành trình phát triển của hãng đồng hồ danh tiếng này. Năm 1908, Rolex đã đặt nền móng cho sự nghiên cứu và phát triển về độ chính xác và độ bền bỉ của các thiết bị đo thời gian, tạo ra những tiêu chuẩn mới trong ngành công nghiệp đồng hồ. Sự cam kết này đã điểm đặc biệt cho Rolex và làm nên tên tuổi của họ trong thế giới đồng hồ cao cấp. <br><br>
Từ khi thành lập, Rolex đã không ngừng tiến xa hơn trong việc phát triển và cải tiến công nghệ đồng hồ, từ việc chế tạo ra những bộ máy cơ chính xác đến việc thiết kế các thiết kế vỏ độc đáo và tinh tế. Rolex 1908 đóng vai trò là cột mốc quan trọng trong hành trình không ngừng của hãng để đem lại những chiếc đồng hồ tinh tế và đáng tin cậy nhất cho người đeo trên toàn thế giới.',4.6, 2,5,6,4),

(N'PTH001',N'Đồng hồ Patek Philippe Nautilus', 3880, 800, 500, CAST(N'2023-08-15' AS Date), N'Đồng hồ Patek Philippe Nautilus là một biểu tượng của sự tinh tế và sang trọng từ thương hiệu đồng hồ xa xỉ Patek Philippe. Được giới thiệu lần đầu vào năm 1976, Nautilus nhanh chóng trở thành một trong những mẫu đồng hồ thể thao cao cấp được ưa chuộng nhất trên thị trường.<br><br>
Thiết kế của Nautilus nổi bật với vỏ hình chiếc thuyền và mặt số dạng tinh tế, mang lại vẻ đẳng cấp và sang trọng. Dòng Nautilus thường được làm từ các vật liệu cao cấp như thép không gỉ, vàng hoặc bạch kim, kết hợp cùng với dây đeo chất lượng cao như dây đeo thép hoặc dây đeo da cá sấu.<br><br>
Bên trong, Nautilus thường được trang bị bộ máy cơ tự động hoặc cơ quang, đảm bảo độ chính xác và độ tin cậy. Với sự kết hợp hoàn hảo giữa thiết kế tinh tế và tính năng cao cấp, đồng hồ Patek Philippe Nautilus không chỉ là một phụ kiện mà còn là biểu tượng của sự thượng lưu và đẳng cấp trong thế giới đồng hồ cao cấp.',4.4, 2,3,7,2),

(N'CTR002',N'Đồng Hồ Cartier Santos WSSA0030', 3750, 500, 600, CAST(N'2023-11-12' AS Date), N'Đồng Hồ Cartier Santos WSSA0030 là một biểu tượng của sự tinh tế và đẳng cấp từ nhà sản xuất đồng hồ danh tiếng Cartier. Santos là một trong những dòng sản phẩm đáng chú ý nhất của Cartier, với thiết kế độc đáo và lịch lãm.<br><br>
Với vỏ và dây đeo bằng thép không gỉ, đồng hồ Santos WSSA0030 mang lại vẻ ngoài mạnh mẽ và bền bỉ, phù hợp cho cả các hoạt động thể thao và các dịp trang trọng. Mặt số màu bạc với các chỉ số và kim loại quý tạo ra một diện mạo đẳng cấp và sang trọng.<br><br>
Bên trong, Santos WSSA0030 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Thiết kế này không chỉ mang lại sự tiện dụng mà còn thể hiện phong cách và đẳng cấp đặc trưng của thương hiệu Cartier.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng tinh tế và tính năng cao cấp, đồng hồ Cartier Santos WSSA0030 là một lựa chọn lý tưởng cho những người đam mê đồng hồ cao cấp và đẳng cấp.',4.7, 1,4,7,3),

(N'PTR002',N'Đồng hồ Patek Philippe Complications', 3150, 800, 600, CAST(N'2023-05-21' AS Date), N'Đồng hồ Patek Philippe Complications User là một biểu tượng của sự tinh tế và tinh thần sáng tạo từ nhà sản xuất đồng hồ xa xỉ Patek Philippe. Với dòng sản phẩm Complications, Patek Philippe không chỉ mang đến sự đẳng cấp mà còn thể hiện sự phức tạp và khả năng sáng tạo trong thiết kế và công nghệ đồng hồ.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như vàng hoặc bạch kim, đồng hồ Patek Philippe Complications User mang lại sự sang trọng và đẳng cấp đặc trưng của thương hiệu. Mặt số được thiết kế tinh xảo với các chỉ số và kim loại quý, tạo nên một diện mạo lịch lãm và sang trọng.<br><br>
Bên cạnh đó, với các tính năng phức tạp như lịch thứ, lịch ngày, và một số tính năng khác, đồng hồ Complications User không chỉ là một phụ kiện mà còn là một công cụ hữu ích trong cuộc sống hàng ngày của người sử dụng.<br><br>
Với sự kết hợp hoàn hảo giữa tính năng cao cấp và kiểu dáng đẳng cấp, đồng hồ Patek Philippe Complications User là lựa chọn lý tưởng cho những người đam mê đồng hồ cao cấp và đòi hỏi tính ứng dụng cao trong mọi tình huống.',4.5, 2,5,8,1),

(N'APT003',N'Đồng Hồ AP Royal Oak Concept Flying Tourbillon', 3550, 2000, 1250, CAST(N'2024-01-12' AS Date), N'Đồng Hồ AP Royal Oak Concept Flying Tourbillon là một biểu tượng của sự sáng tạo và đẳng cấp từ thương hiệu đồng hồ cao cấp Audemars Piguet. Royal Oak Concept là dòng sản phẩm độc đáo, thường được biết đến với các tính năng và công nghệ tiên tiến.<br><br>
Với vỏ và dây đeo được làm từ các vật liệu cao cấp như titan hoặc cermet, đồng hồ AP Royal Oak Concept Flying Tourbillon mang lại sự hiện đại và sang trọng. Thiết kế của nó thường mang phong cách công nghệ, với các đường viền sắc nét và các chi tiết tinh xảo.<br><br>
Các tính năng tiên tiến như Flying Tourbillon, một cơ chế phức tạp giúp cải thiện độ chính xác của đồng hồ, làm cho Royal Oak Concept trở thành một biểu tượng của sự chuyên môn và đẳng cấp trong thế giới đồng hồ cao cấp.<br><br>
Với sự kết hợp hoàn hảo giữa công nghệ và thiết kế đột phá, đồng hồ AP Royal Oak Concept Flying Tourbillon là một lựa chọn lý tưởng cho những người yêu thích đồng hồ cao cấp và đam mê sự đổi mới.',4.8, 1,3,8,2),

(N'CTR003',N'Đồng Hồ Cartier Santos W2SA0007', 3850, 1500, 1500, CAST(N'2023-05-30' AS Date), N'Đồng Hồ Cartier Santos W2SA0007 là một biểu tượng của sự tinh tế và sang trọng từ thương hiệu đồng hồ danh tiếng Cartier. Santos là một trong những dòng sản phẩm đáng chú ý nhất của Cartier, với thiết kế độc đáo và lịch lãm.<br><br>
Với vỏ và dây đeo bằng thép không gỉ, đồng hồ Santos W2SA0007 mang lại vẻ ngoài mạnh mẽ và bền bỉ, phù hợp cho cả các hoạt động thể thao và các dịp trang trọng. Mặt số màu bạc với các chỉ số và kim loại quý tạo ra một diện mạo đẳng cấp và sang trọng.<br><br>
Bên trong, Santos W2SA0007 được trang bị bộ máy cơ tự động, đảm bảo tính chính xác và độ tin cậy. Thiết kế này không chỉ mang lại sự tiện dụng mà còn thể hiện phong cách và đẳng cấp đặc trưng của thương hiệu Cartier.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng tinh tế và tính năng cao cấp, đồng hồ Cartier Santos W2SA0007 là một lựa chọn lý tưởng cho những người đam mê đồng hồ cao cấp và đẳng cấp.',4.9, 1,4,7,4),

(N'PTR003',N'Đồng hồ Patek Philippe Perpetual Calendar', 3500, 2500, 800, CAST(N'2022-07-17' AS Date), N'Đồng hồ Patek Philippe Perpetual Calendar là một tác phẩm nghệ thuật của sự tinh tế và độ chính xác từ nhà sản xuất đồng hồ cao cấp Patek Philippe. Với dòng sản phẩm Perpetual Calendar, Patek Philippe mang lại sự kết hợp tuyệt vời giữa thiết kế đẳng cấp và tính năng cao cấp.<br><br>
Thiết kế của Perpetual Calendar thường mang đậm dấu ấn của Patek Philippe với vỏ vàng hoặc bạch kim, kết hợp cùng với mặt số tinh tế và các chỉ số kim cương. Đồng hồ này không chỉ là một công cụ đo thời gian mà còn là một biểu tượng của phong cách và đẳng cấp.<br><br>
Tính năng chính của Perpetual Calendar là khả năng hiển thị ngày, tháng và năm mà không cần điều chỉnh thủ công, thậm chí trong các năm nhuận. Điều này là nhờ vào cơ chế phức tạp và chính xác của bộ máy cơ tự động bên trong.<br><br>
Với sự kết hợp hoàn hảo giữa kiểu dáng đẳng cấp và tính năng thông minh, đồng hồ Patek Philippe Perpetual Calendar là một biểu tượng của sự sang trọng và tinh tế trong thế giới đồng hồ cao cấp.',4.9, 2,5,6,3)

INSERT [dbo].[ImageProduct]([pid],[image1],[image2],[image3],[image4]) VALUES 
(1,N'img/rolex1.png',N'img/rolex1-1.jpg',N'img/rolex1-2.jpg',N'img/rolex1-3.jpg'),
(2,N'img/rolex3.png',N'img/rolex3-1.jpg',N'img/rolex3-2.jpg',N'img/rolex3-3.jpg'),
(3,N'img/cartier3.png',N'img/cartier3-1.png',N'img/cartier3-2.jpg',N'img/cartier3-3.jpg'),
(4,N'img/audemars2.png',N'img/audemars2-1.png',N'img/audemars2-2.jpg',N'img/audemars2-3.jpg'),
(5,N'img/audemars1.png',N'img/audemars1-1.jpg',N'img/audemars1-2.jpg',N'img/audemars1-3.jpg'),
(6,N'img/rolex2.png',N'img/rolex2-1.jpg',N'img/rolex2-2.jpg',N'img/rolex2-3.jpg'),
(7,N'img/patek3.png',N'img/patek3-1.png',N'img/patek3-2.jpg',N'img/patek3-3.jpg'),
(8,N'img/cartier2.png',N'img/cartier2-1.jpg',N'img/cartier2-2.jpg',N'img/cartier2-3.jpg'),
(9,N'img/patek1.png',N'img/patek1-1.jpg',N'img/patek1-2.jpg',N'img/patek1-3.jpg'),
(10,N'img/audemars3.png',N'img/audemars3-1.jpg',N'img/audemars3-2.jpg',N'img/audemars3-3.jpg'),
(11,N'img/cartier1.png',N'img/cartier1-1.jpg',N'img/cartier1-2.jpg',N'img/cartier1-3.jpg'),
(12,N'img/patek2.png',N'img/patek2-1.jpg',N'img/patek2-2.jpg',N'img/patek2-3.jpg')

SET IDENTITY_INSERT [dbo].[Status] ON 
INSERT [dbo].[Status]([id], [status]) VALUES (1,N'Chờ giao hàng')
INSERT [dbo].[Status]([id], [status]) VALUES (2,N'Đang giao hàng')
INSERT [dbo].[Status]([id], [status]) VALUES (3,N'Hoàn thành')
INSERT [dbo].[Status]([id], [status]) VALUES (4,N'Đã hủy')
SET IDENTITY_INSERT [dbo].[Status] OFF

INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2020-06-12' AS Date),7400,N'Ha Noi', 3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2021-05-05' AS Date),10650,N'Hai phong',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2021-10-12' AS Date),3700,N'Hue',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2021-12-12' AS Date),10500,N'Bac Giang',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2022-01-05' AS Date),7300,N'Hai Duong',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2022-03-12' AS Date),7400,N'Bac Ninh',3)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2022-08-05' AS Date),7100,N'Ninh Binh',2)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2022-12-12' AS Date),3700,N'Cao Bang',2)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (3, CAST(N'2023-01-12' AS Date),10500,N'Ca Mau',1)
INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) VALUES (4, CAST(N'2023-02-05' AS Date),14600,N'Ha Long',1)

INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (1,6,2,3700)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (2,10,3,3550)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (3,6,1,3700)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (4,12,3,3500)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (5,2,2,3650)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (6,6,2,3700)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (7,10,2,3550)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (8,6,1,3700)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (9,12,3,3500)
INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) VALUES (10,2,4,3650)

INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (1,5)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (2,5)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (3,6)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (4,6)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (5,5)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (6,6)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (7,6)
INSERT [dbo].[ShippingHistory]([oid],[aid]) VALUES (8,5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,1,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,1,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,2,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,2,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,3,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,3,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,4,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,4,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,5,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,5,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,6,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,6,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,7,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,7,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,8,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,8,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,9,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,9,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,10,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,10,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,11,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,11,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,12,N'Oke',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,12,N'Vip',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Feedback]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm rất đẹp',5)

SET IDENTITY_INSERT [dbo].[Blog] ON
INSERT [dbo].[Blog]([id], [title], [image], [image2], [Date], [description], [status], [created_by]) VALUES 
(1, N'Trộm đồng hồ Rolex của người tình, hoa hậu Kỳ Anh lĩnh 7 năm tù',N'img/blog1.jpg',N'img/blog1-1.jpg', CAST(N'2022-12-13' AS Date), N'Miss Viet Nam Continents 2018 Lã Kỳ Anh bị đưa ra xét xử sau hơn một năm trộm đồng hồ Rolex giá gần 2 tỷ đồng của người tình.<br><br>Sáng 13/12, Lã Thị Anh (32 tuổi, tên khác là Lã Kỳ Anh) bị TAND TP HCM xét xử về tội Trộm cắp tài sản theo khoản 4 Điều 173 Bộ luật Hình sự, khung hình phạt 12-20 năm tù.<br><br>Kỳ Anh từng theo học trường Điện ảnh New York - khoa Sản xuất phim, đăng quang cuộc thi Miss Viet Nam Continents 2018 tại Mỹ. Cô quen biết thiếu gia Tuấn, 25 tuổi, qua mạng xã hội. Đầu tháng 8/2021, người đẹp thường đến nhà anh này ở quận 3 chơi và ngủ lại. Kỳ Anh được bạn trai giới thiệu đang sở hữu bộ sưu tập đồng hồ hàng hiệu, trong đó có chiếc Rolex Daytona giá 80.000-90.000 USD (khoảng 2 tỷ đồng).<br><br>Cáo trạng xác định, do chơi ngoại hối Forex thua lỗ, thiếu nợ, Kỳ Anh nảy sinh ý định lấy trộm đồng hồ quý của người tình. Lợi dụng lúc anh Tuấn ngủ say, Kỳ Anh chụp ảnh đồng hồ Rolex gửi cho anh Tô Văn Toàn nhờ lên mạng tìm và đặt mua đồng hồ "nhái". Hai hôm sau, anh Toàn báo đã tìm được một chiếc ưng ý ở Hà Nội với giá 13,5 triệu đồng, nếu Kỳ Anh mua phải trả thêm phí vận chuyển 1,2 triệu và đặt cọc trước 2 triệu. Hai tuần sau, người đẹp đến nhà anh Toàn lấy đồng hồ và trả hết số tiền còn lại.',1,2),
(2, N'Dấu ấn thành công của hãng đồng hồ Rolex',N'img/blog2.jpg',N'img/blog2-1.jpg',CAST(N'2018-07-06' AS Date), N'Vị thế của Rolex gắn với Hans Wilsdorf, người sáng lập và tiên phong sáng tạo tính năng kháng nước, tự động lên cót… cho đồng hồ đeo tay.<br><br>Thương hiệu Rolex gắn liền với những mẫu đồng hồ đắt tiền, đẳng cấp. Vị thế dẫn đầu này chưa từng bị lung lay suốt 100 năm qua. Tạp chí Forbes xếp hạng Rolex là một trong những thương hiệu có giá trị nhất vào năm 2016, và là công ty sản xuất đồng hồ cao cấp hàng đầu thế giới. Mặc dù không công bố doanh số, nhưng các chuyên gia ước tính Rolex bán ra một triệu chiếc đồng hồ mỗi năm.<br><br>Sự thành công của Rolex nhờ Hans Wilsdorf, người sáng lập và cũng là bộ não đưa đến nhiều cải tiến cho đồng hồ đeo tay, xác lập vị thế tiên phong cho thương hiệu có tuổi đời hơn một thế kỷ này.<br><br>Sinh ra tại Đức vào năm 1881, Hans có tuổi thơ không mấy êm đẹp. Mất cha mẹ khi chỉ mới 12 tuổi, ông cùng anh chị em sống trong sự bảo bọc của họ hàng. Sau khi tốt nghiệp đại học, Hans làm việc cho công ty chuyên cung cấp ngọc trai và học hỏi những bài học đầu tiên về thương mại và chiến lược phát triển.<br><br>Dù không thể lý giải, nhưng Hans có một niềm đam mê với đất nước Thụy Sĩ. Ước mơ về việc thành lập một công ty đồng hồ nhen nhóm trong chàng trai trẻ khi ông chuyển qua làm việc cho công ty xuất khẩu đồng hồ Cuno Korten, nơi vẫn thường nhập linh kiện từ Đức, Pháp và Thụy Sĩ.',1,2),
(3, N'3 đồng hồ Rolex đắt nhất mọi thời',N'img/blog3.jpg',N'img/blog3-1.png', CAST(N'2020-03-28' AS Date), N'Chiếc Daytona của sao quá cố Paul Newman, Rolex Bao Dai từng thuộc sở hữu của vua Bảo Đại... là một trong những mẫu Rolex đắt nhất mọi thời.<br><br>Qua giá bán từ nhà sản xuất đưa ra và các cuộc đấu giá, tạp chí thời trang Lux Digital chọn 3 chiếc đồng hồ Rolex (Thuỵ Sĩ) đắt nhất mọi thời.<br><br>Chiếc Rolex Daytona của diễn viên quá cố Paul Newman (Mỹ) được đấu giá đắt nhất đến hiện tại, 17,8 triệu USD (hơn 419 tỷ đồng) vào tháng 10/2017. Giá này đắt hơn nhiều so với chiếc 1943 Patek Philippe được bán 16 triệu USD (gần 377 tỷ đồng) năm 2016. Thiết kế đặc sắc không phải do chất liệu hay sự quý hiếm, mà nằm ở ý nghĩa của nó. Minh tinh Joan Woodward - vợ Paul - tặng chồng khi ông đóng phim Winning năm 1969.<br><br>Chiếc Rolex Daytona của diễn viên quá cố Paul Newman (Mỹ) đắt nhất đến hiện tại, được đấu giá lên tới 17,8 triệu USD (hơn 419 tỷ đồng) vào tháng 10/2017. Thiết kế đắt đỏ không phải do chất liệu hay quý hiếm, mà ở ý nghĩa của nó. Minh tinh Joan Woodward - vợ Paul - tặng chồng khi ông đóng phim "Winning" năm 1969.<br><br>Dòng The 1971 Rolex Daytona Reference 626 Unicorn có giá 5,9 triệu USD (gần 139 tỷ đồng), là mẫu duy nhất sử dụng vàng trắng 18 kara nên được gọi là Unicorn. Đầu thập niên 1970, phần lớn mẫu Rolex Daytona được chế tác từ thép không gỉ.',1,2),
(4, N'Đồng Hồ Tsar Bomba: Sức mạnh bùng nổ',N'img/blog4.jpg',N'img/blog4-1.jpg', CAST(N'2022-12-13' AS Date), N'Đồng hồ Tsar Bomba được tạo ra như một sự tôn vinh đầy tôn trọng đối với loại bom hạt nhân cùng tên từ thế kỷ 20. Sự tái hiện này không chỉ là một tín hiệu về khả năng kỹ thuật mà còn thể hiện lòng kính trọng với lịch sử và sự phát triển của loài người trong việc kiểm soát và sử dụng sức mạnh.<br><br>Đồng hồ Tsar Bomba đặc biệt bởi thiết kế độc đáo của nó. Với mặt số và vỏ được chế tác cẩn thận, nó mang trong mình hình ảnh và ý nghĩa của bom Tsar Bomba.<br><br>Đồng hồ Tsar Bomba không chỉ là một tác phẩm nghệ thuật mà còn là một biểu hiện của kỹ thuật tinh xảo. Được trang bị các tính năng hiện đại, sản phẩm được sự dụng bộ máy Nhật có độ chính xác cao, chống nước tốt, kính Sapphire nguyên khối chống xước hoàn hảo, dây đeo Silicon siêu bền bất chấp mưa, nắng và bẻ cong. Nó không chỉ là một chiếc đồng hồ đẹp mắt mà còn là một công cụ hoàn hảo để đo thời gian với độ tin cậy cao. Điểm đặc biệt của chiếc đồng hồ Tsar Bomba đó chính là sự phong cách, phá cách, mang lại nhiều trải nghiệm mới lạ cho khách hàng sử dụng với những BST thiết kế đặc biệt có thể thay thế dễ dàng núm, mặt, dây tạo nên những chiếc đồng hồ độc đáo, mang phong cách cá nhân.',1,2),
(5, N'BST đồng hồ đeo tay đẳng cấp triệu đô của CR7' ,N'img/blog5.jpg',N'img/blog5-1.jpg',CAST(N'2012-07-06' AS Date), N'CR7 được coi là một trong những cầu thủ xuất sắc nhất thế giới. Và là một trong những cầu thủ vĩ đại nhất mọi thời đại.<br><br>CR7 còn khiến công chúng nể phục, ngưỡng mộ vì gu thời trang đẳng cấp, xa xỉ cực chất. Đặc biệt CR7 còn sở hữu bộ sưu tập đồng hồ khủng mà bất cứ ai cũng phải mê đắm.<br><br>Đồng hồ Franck Muller Invisible Baguette Diamonds Imperial Tourbillon<br><br>CR7 cùng bạn gái Georgina Rodriguez tham gia sự sự kiện. CR7 đeo đồng hồ kim cương Franck Muller, 424 viên kim cương trắng và đỏ được xếp thành hình vòng cung ở mặt số, bên ngoài bọc lớp vỏ vàng trắng. Đồng hồ có giá khoảng 2 triệu EUR tương đương 54,7 tỷ đồng',1,2)
SET IDENTITY_INSERT [dbo].[Blog] OFF