# Watch Shop - Hệ thống bán đồng hồ online

## 📋 Mô tả dự án

Watch Shop là một hệ thống e-commerce hoàn chỉnh chuyên về bán đồng hồ cao cấp. Hệ thống được xây dựng với kiến trúc MVC, hỗ trợ đa vai trò người dùng và tích hợp nhiều tính năng hiện đại như thanh toán online, chatbot, và đăng nhập OAuth.

### 🎯 Tính năng chính
- **Hệ thống đa vai trò**: Admin, Manager, Shipper, Customer
- **Quản lý sản phẩm**: CRUD đầy đủ với quản lý hình ảnh
- **Giỏ hàng & Thanh toán**: Tích hợp VNPay
- **Theo dõi đơn hàng**: Real-time tracking
- **Đánh giá sản phẩm**: Hệ thống rating và feedback
- **Chatbot**: Tích hợp Dialogflow
- **OAuth**: Đăng nhập bằng Google
- **Blog system**: Quản lý bài viết
- **Thống kê**: Báo cáo bán hàng chi tiết

## 🛠️ Công nghệ sử dụng

### Backend
- **Java Servlet/JSP**
- **Microsoft SQL Server**
- **Apache Ant** (Build tool)

### Frontend
- **HTML5, CSS3, JavaScript**
- **Bootstrap 4**
- **jQuery**
- **Slick Carousel**

### Database
- **Microsoft SQL Server 2019+**
- **JDBC Driver**

### Third-party Integrations
- **VNPay Payment Gateway**
- **Google OAuth 2.0**
- **Dialogflow Chatbot**

## 📦 Cài đặt và chạy dự án

### Yêu cầu hệ thống
- **Java JDK 8+**
- **Apache Tomcat 9+**
- **Microsoft SQL Server 2019+**
- **NetBeans IDE** (khuyến nghị)

### Bước 1: Clone repository
```bash
git clone <repository-url>
cd Watch-Shop
```

### Bước 2: Cấu hình Database
1. Mở Microsoft SQL Server Management Studio
2. Tạo database mới tên `Projectswp`
3. Chạy script SQL từ file `SE1804_G4_Database.sql`
4. Cập nhật thông tin kết nối trong `DBContext.java`:
   ```java
   String url = "jdbc:sqlserver://localhost:1433;databaseName=Projectswp";
   String username = "sa";
   String password = "123";
   ```

### Bước 3: Cấu hình NetBeans
1. Mở NetBeans IDE
2. Import project từ thư mục `WatchShop`
3. Cấu hình Tomcat Server
4. Thêm thư viện JDBC vào project

### Bước 4: Chạy ứng dụng
1. Clean and Build project
2. Deploy lên Tomcat Server
3. Truy cập: `http://localhost:8080/WatchShop`

## 👥 Hệ thống vai trò

### 🔐 Admin (ID: 1)
- Quản lý toàn bộ hệ thống
- Thống kê tổng quan
- Quản lý tài khoản người dùng

### 👨‍💼 Manager (ID: 2)
- Quản lý sản phẩm và danh mục
- Quản lý đơn hàng
- Quản lý blog

### 🚚 Shipper (ID: 3)
- Xem danh sách đơn hàng cần giao
- Cập nhật trạng thái đơn hàng
- Quản lý lịch sử giao hàng

### 👤 Customer (ID: 4)
- Mua sắm sản phẩm
- Quản lý giỏ hàng
- Theo dõi đơn hàng
- Đánh giá sản phẩm

## 📁 Cấu trúc dự án

```
WatchShop/
├── src/
│   └── java/
│       ├── controller/     # Servlet controllers
│       ├── dal/           # Data Access Layer
│       ├── model/         # Entity classes
│       ├── Filter/        # Authentication filters
│       └── VNPay/         # Payment integration
├── web/
│   ├── css/              # Stylesheets
│   ├── js/               # JavaScript files
│   ├── img/              # Images
│   ├── *.jsp             # JSP pages
│   └── WEB-INF/          # Web configuration
├── lib/                  # External libraries
├── build.xml             # Ant build file
└── nbproject/            # NetBeans project files
```

## 🔧 Cấu hình thanh toán VNPay

1. Đăng ký tài khoản VNPay Merchant
2. Cập nhật thông tin trong `VNPayConfig.java`:
   ```java
   public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
   public static String vnp_ReturnUrl = "http://localhost:8080/WatchShop/vnpay_pay.jsp";
   public static String vnp_TmnCode = "YOUR_TMN_CODE";
   public static String vnp_HashSecret = "YOUR_HASH_SECRET";
   ```

## 🤖 Cấu hình Chatbot

1. Tạo project Dialogflow
2. Cập nhật Agent ID trong `home.jsp`:
   ```html
   <df-messenger
       agent-id="YOUR_AGENT_ID"
       language-code="vi">
   </df-messenger>
   ```

## 📊 Database Schema

### Bảng chính
- **Account**: Thông tin tài khoản người dùng
- **Product**: Sản phẩm đồng hồ
- **Category**: Danh mục sản phẩm
- **Brand**: Thương hiệu
- **Order/OrderDetail**: Đơn hàng
- **Feedback**: Đánh giá sản phẩm
- **Blog**: Bài viết blog
- **Payment**: Lịch sử thanh toán

## 🚀 Tính năng nổi bật

### 🛍️ Trải nghiệm mua sắm
- Tìm kiếm và lọc sản phẩm theo nhiều tiêu chí
- Giỏ hàng thông minh
- Thanh toán an toàn với VNPay
- Theo dõi đơn hàng real-time

### 📱 Responsive Design
- Giao diện tương thích mọi thiết bị
- Bootstrap 4 framework
- Slick carousel cho banner

### 🔒 Bảo mật
- Mã hóa mật khẩu
- Session management
- Role-based access control
- SQL injection prevention

## 👨‍💻 Team Development

- **Nguyễn Tiến Đăng** - HE172471 (Leader)
- **Lê Duy Quý** - HE173432
- **Bùi Minh Dũng** - HE172218
- **Bùi Khánh Duy** - HE181114

## 📝 License

Dự án được phát triển cho mục đích học tập và nghiên cứu.

## 🤝 Đóng góp

1. Fork dự án
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

## 📞 Liên hệ

- **Email**: bapthom3@gmail.com
- **Project Link**: [https://github.com/your-username/Watch-Shop](https://github.com/your-username/Watch-Shop)

---

⭐ Nếu dự án này hữu ích, hãy cho chúng tôi một star!
