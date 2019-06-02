-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 02, 2019 lúc 10:52 AM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Nông Sản'),
(2, 'Hải sản'),
(3, 'Máy chụp hình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `CatID` int(11) NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `TinyDes`, `FullDes`, `CatID`, `category`, `date`) VALUES
(1, 'Bệnh Đạo ôn trên lúa', 'Bệnh hại trên lúa có khoảng 20 loài thường xuất hiện trên lúa ở khu..', ' Bệnh hại trên lúa có khoảng 20 loài thường xuất hiện trên lúa ở khu vực các tỉnh phía Nam. Tuy nhiên, chúng còn tùy thuộc vào rất nhiều yếu tố tác động vào để trở thành dịch hay xuất hiện ở một mức độ trung bình hoặc thấp.\r\n\r\nNếu chỉ tính riêng cho bệnh hại trên lúa ở năm 1967 năng suất lúa đã mất đến 8,9% và đến năm 1987 năng suất bị mất do bệnh đã tăng lên đến 17,0% cho toàn khu vực trồng lúa trên thế giới (Cramer, 1987; Jame và ctv., 1991).\r\n\r\nBệnh Đạo ôn trên lúa: Tác nhân là do nấm (Pyricularia oryzae hay Magnaporthe grisea). Bệnh đạo ôn tấn công trên nhiều bộ phận của cây lúa như: trên hạt, trên gié thứ cấp, trên cổ bông, trên đốt, trên lá và cả trên cổ lá cờ. Bệnh nầy phân bố rất rộng và có mặt ở hầu hết các vùng trồng luá; về sự gây thiệt hại cho năng suất do bệnh nầy rất khó tính toán vì còn nhiều yếu tố khác kết hợp mà chưa thể đo đạt được hết. Tuy nhiên, khi dịch đạo ôn xảy ra thì sự thiệt hại cho năng suất thấy rõ nét và luôn có ý nghĩa.\r\n\r\n Đạo ôn lá: Nấm bệnh đạo ôn thường xuất hiện trên phần gần chóp lá hoặc ở mép lá. Lúc ban đầu chỉ là những chấm nhỏ lần lần phát triển lớn hơn kéo dài ra và nhọn ở 2 đầu, xung quanh vết bệnh có viền màu nâu hoặc nâu đỏ, phần giữa có màu xám tro. Vết bệnh điển hình bình thường có chiều dài khoảng 1,0-1,5cm và chiều rộng từ 0,3-0,5cm. Về kích thước vết bệnh còn tùy thuộc rất nhiều vào giai đoạn lúa bị nhiễm, mức độ kháng nhiễm của giống và các yếu tố về môi trường. Những lá bị nhiễm nặng lá bị khô và chết.\r\n\r\nĐạo ôn Trên cổ bông: khi bệnh tấn công nơi bị bệnh sẽ bị thối nếu bệnh xuất hiện sớm toàn bộ bông lúa sẽ bị lép, nếu bệnh xuất hiện trễ thì bông lúa thường bị gẫy. Ảnh hưởng lớn cho năng suất lúa. Bệnh đạo ôn trên lá và bệnh đạo ôn trên cổ bông 2 giai đoạn này độc lập nhau tuỳ thuộc vào giống:\r\n\r\nGiống nhiễm nặng trên lá và nhiễm nặng trên cổ bông (Giống nhiễm)\r\n\r\nGiống nhiễm nặng trên lá nhưng nhẹ trên cổ bông (Nhiễm trung bình)\r\n\r\nGiống nhiễm nhẹ trên lá nhưng nặng trên cổ bông (Nhiễm trung bình)\r\n\r\nGiống kháng trên lá và kháng trên cổ bông (Giống kháng)\r\n\r\nNếu biết được thì dễ dàng theo dõi để quyết định phun thuốc.  \r\n\r\n', 1, 'Nông sản', '2019-06-26'),
(2, 'Nông sản xuất giảm nhập tăng, suất siêu giảm 8,7%', 'Báo cáo của Bộ Nông nghiệp và Phát triển nông.', ' Báo cáo của Bộ Nông nghiệp và Phát triển nông thôn cho biết: Trong 4 tháng đầu năm 2019, kim ngạch xuất khẩu các mặt hàng nông, lâm, thủy sản ước đạt 12,4 tỉ USD. Trong đó, nhóm hàng nông sản chính ước đạt 5,2 tỉ USD, so với cùng kỳ năm 2018 giảm 5,6%. Nhiều mặt hàng giảm mạnh như: gạo khối lượng xuất khẩu giảm 8%, giá trị giảm đến 19%); cà phê khối lượng giảm 13%, giá trị cũng giảm 19%; sắn và sản phẩm từ sắn khối lượng giảm 14%, giá trị giảm 3,3%.\r\n\r\nỞ chiều ngược lại, tổng giá trị nhập khẩu nông, lâm, thủy sản và vật tư nông nghiệp 4 tháng đạt khoảng 9,7 tỉ USD, tăng 3,2% so với cùng kỳ năm trước.\r\n\r\nViệc nhóm ngành nông lâm thủy hải sản xuất giảm nhập tăng đã làm thặng dự thương mại giảm 8,7% so với cùng kỳ 2018, hiện xuất siêu chỉ đạt 2,68 tỉ USD.\r\n\r\nTrong khi đó, báo cáo của Tổng cục Hải quan cho biết: Trong 4 tháng đầu năm nay, nhóm hàng nông sản (bao gồm hàng rau quả, hạt điều, hạt tiêu, chè, cà phê, gạo, sắn và sản phẩm sắn, cao su) xuất khẩu đạt 5,56 tỉ USD, giảm 8,9% so với cùng kỳ năm trước.\r\n\r\nTrung Quốc vẫn là thị trường lớn nhất nhập khẩu mặt hàng nông sản của Việt Nam với 1,98 tỉ USD, giảm 8,7% so với cùng kỳ năm 2018; tiếp theo là thị trường EU đạt 866 triệu USD, giảm 9,7%; sang Mỹ với 522 triệu USD, giảm 19,8%...\r\n\r\nNhóm hàng thủy sản đạt 2,42 tỉ USD, giảm 0,9% so với cùng thời gian năm 2018. Trong 4 tháng tính từ đầu năm 2019 chủ yếu được xuất khẩu sang thị trường Nhật Bản đạt 411 triệu USD, tăng 9,7%; Mỹ đạt 386 triệu USD, tăng 1,9%; EU với 393 triệu USD, giảm 9,6%; Trung Quốc đạt 268 triệu USD, giảm 8,6%.\r\n\r\nGỗ và sản phẩm gỗ là ngành hàng tăng trưởng ấn tượng với tỷ lệ đến gần 18% so với cùng kỳ năm trước, đạt 3,1 tỉ USD. Đáng chú ý, xuất khẩu sang Mỹ đạt trên 1,4 tỉ USD, tăng đến gần 35% và Nhật Bản đạt 414 triệu USD, tăng trên 18%.', 1, 'Nông sản', '2019-06-24'),
(3, 'Lĩnh vực nông nghiệp xuất khẩu được 8,8 tỉ USD', 'Ba tháng đầu năm, lĩnh vực nông nghiệp xuất khẩu được 8,8 tỉ USD', ' Ba tháng đầu năm, lĩnh vực nông nghiệp xuất khẩu được 8,8 tỉ USD, giảm gần 3% so với cùng kỳ năm 2018. Nguyên nhân là do giá nhiều mặt hàng xuất khẩu sụt giảm mạnh.\r\n\r\nCó đến 4 mặt hàng nông sản xuất khẩu mà tỷ lệ giá giảm đến hai con số, so với cùng kỳ năm trước. Dẫn đầu danh sách này là giá tiêu với mức giảm đến 27% nên dù lượng xuất khẩu tăng đến 19% nhưng giá trị vẫn giảm gần 18% so với cùng kỳ năm ngoái.\r\n\r\nĐứng ngay sau tiêu là giá điều với mức giảm đến gần 21% so với cùng kỳ năm 2018, mức giá xuất khẩu bình quân hạt điều đạt mức 8.043 USD/tấn. Xuất khẩu hạt điều tăng gần 5% về lượng nhưng giảm đến trên 17% về giá trị.\r\n\r\nGạo đứng thứ 3 với mức giảm gần 18%, chỉ còn 404 USD/tấn. Đây là yếu tố làm giá trị xuất khẩu trong 3 tháng qua giảm trên 20% so với cùng kỳ năm 2018 dù lượng chỉ giảm có 3,5%.\r\n\r\nCùng giai đoạn trên, giá cà phê xuất khẩu cũng sụt giảm đến trên 14%, hiện chỉ còn 4.894 USD/tấn. Tổng giá trị xuất khẩu cà phê giảm gần 24%, chỉ thu về có 830 triệu USD trong quý 1 dù lượng giảm chỉ có 15,3%.\r\n\r\nNgoài ra, hàng loạt nông sản khác cũng có mức sụt giảm đến gần 10% về giá trị so với cùng kỳ, cụ thể như xuất khẩu rau quả đạt 879 triệu USD, giảm 9,3% về giá trị; mặt hàng sắn và các sản phẩm từ sắn, giảm 9,4%; tôm các loại ước đạt 676 triệu USD, giảm 9,1%. Cũng cần phải nói thêm, trong nhóm này mặt hàng rau quả liên tục trong 3 năm gần đây luôn có tốc độ tăng trưởng dẫn đầu trong nhóm ngành nông lâm thủy hải sản. Tuy nhiên do quá phụ thuộc vào thị trường Trung Quốc (75-80%) nên khi gặp khó thì các thị trường còn lại không \"đỡ\" nỗi, tăng trưởng quay đầu đi xuống. \r\n\r\nNgoài lý do khách quan là xu thế chung của thế giới thì phần lớn những mặt hàng này nông sản này đã tăng mạnh diện tích và sản lượng trong thời gian qua. Cụ thể những năm gần đây, diện tích trồng cà phê robusta đang được mở rộng ở Tây nguyên, Đông Nam bộ. Cà phê arabica thậm chí còn phát triển ở tỉnh Sơn La, Lai Châu, Yên Bái, Hà Giang, Tuyên Quang.\r\n', 1, 'Nông sản', '2019-06-03'),
(4, 'Áp lực không nhỏ cho nông sản Việt Nam', 'Liên minh châu Âu (EU) đang tăng cường bảo hộ hàng nông sản thông qua tiêu chuẩn..', ' EU vừa thông báo sửa đổi phụ lục II, III, IV trong Quy định số 396/2005 của EU liên quan đến quy định dư lượng tối đa các loại hóa chất như chlorantraniliprole, clomazone, cyclaniliprole, fenazaquin... trên một số sản phẩm như rau, quả và thực phẩm.\r\n\r\nNhững thay đổi này, theo ông Vương Trường Giang, Trưởng phòng An toàn thực phẩm và Môi trường, Cục Bảo vệ thực vật, Bộ Nông nghiệp và Phát triển nông thôn (NN&PTNT), sẽ ảnh hưởng tới một số loại nông sản mà Việt Nam xuất sang EU. Hiện nay, Việt Nam chủ yếu xuất khẩu các mặt hàng như cà phê, tiêu, điều, gạo, thanh long, và một số ít loại rau gia vị khác.\r\n\r\nSố liệu của Cục Chế biến và Phát triển thị trường nông sản, Bộ NN&PTNT cho thấy, một số mặt hàng nông sản chủ lực xuất khẩu sang EU như tiêu, điều, cà phê đều có kim ngạch xuất khẩu giảm trong tháng 2. Ví dụ, khối lượng xuất khẩu hồ tiêu tháng 2-2019 ước đạt 12.000 tấn, với giá trị đạt 35 triệu đô la Mỹ, giảm tới hơn 20% về giá trị so với cùng kỳ năm 2018. Đây là một trong những mặt hàng có kim ngạch xuất khẩu giảm mạnh nhất.\r\n\r\nTổng kim ngạch xuất khẩu nông lâm thủy sản hai tháng đầu năm 2019 đạt 5,5 tỉ đô la Mỹ, giảm 1,6% so với cùng kỳ năm ngoái, trong đó giá trị xuất khẩu các mặt hàng nông sản chính ước đạt 2,71 tỉ đô la, giảm 10,1%.\r\n\r\nEU là một trong những thị trường xuất khẩu nông sản lớn nhất của Việt Nam, song cũng là thị trường có yêu cầu khắt khe về vệ sinh an toàn thực phẩm, dán nhãn, môi trường… Dù lần thay đổi này tác động không quá lớn đối với các mặt hàng nông sản chủ lực mà Việt Nam xuất sang EU, nhưng theo đánh giá của ông Giang, các quy định pháp lý liên quan tới hàng rào kỹ thuật liên tục được EU “rà soát” và “điều chỉnh”.\r\n', 1, 'Nông sản', '2019-06-17'),
(5, 'Các tỉnh ĐBSCL vụ lúa hè thu', 'Hiện tại thương lái thu mua lúa tươi hạt dài OM 5', ' Nhiều trà sớm chỉ đạt năng suất từ 650 - 800kg lúa tươi/công, giá bán thấp hơn nhiều so với cùng kỳ, do những tháng đầu năm 2019 xuất khẩu gạo gặp khó. Nhiều nông dân hòa vốn hoặc có lời rất ít.\r\n\r\nÔng Dương Văn Thiệp ở ấp Hoàng Mai, xã Tân Thành Đông, huyện Tân Thạnh, Long An vừa thu hoạch 2ha cho biết, vụ này thời tiết không thuận lợi, sâu bệnh nhiều, năng suất chỉ đạt 650.000 kg/công, giảm 20 -30% so với vụ hè thu năm rồi. Sau khi trừ hết chi phí còn lời 400.000 đồng/công.\r\nHiện tại thương lái thu mua lúa tươi hạt dài OM 5451, OM 4218 với giá 4.800 - 4.900 đồng/kg, lúa tươi IR 50404 từ 4.400 - 4.500 đồng/kg giảm 700 - 800 đồng/kg so với cùng kỳ năm 2018.', 1, 'Nông sản', '2019-06-10'),
(6, 'Giá lúa tại miền Tây cuối vụ Đông Xuân', 'Giá lúa tại miền Tây cuối vụ Đông Xuân đang ở mức 4.800', '\r\nTrang chủ » 02. Thị trường lúa gạo » Góc chia sẻ - Nông nghiệp Việt Nam » Nông dân miền Tây chán trồng lúa\r\nNông dân miền Tây chán trồng lúa\r\n\r\nTin tức nông nghiệp cách đây 22 ngày 0 No comments\r\n\r\nNông dân cùng các chuyên gia xác định cây lúa cho thu nhập thấp và khó có thể làm giàu nên cần thiết cắt giảm mạnh diện tích sản xuất.\r\n\r\nGiá lúa tại miền Tây cuối vụ Đông Xuân đang ở mức 4.800 – 5.500 đồng mỗi kg (tùy loại), cao hơn 300 - 600 đồng so với đợt thu hoạch rộ hai tháng trước. Tuy nhiên, rất nhiều nhà nông dân không vui vì đã bán hết lúa khi giá ở mức thấp, 4.200 – 5.000 đồng mỗi kg, kém gần 1.000 đồng so với cùng kỳ năm ngoái. \r\n\r\nNông dân vùng biên giới An Giang thu hoạch lúa. Ảnh: Cửu Long.\r\n\r\nCó 50 năm gắn bó với cây lúa ở xã Tân Phước, huyện Tân Hồng, tỉnh Đồng Tháp, lão nông Lê Văn Lam (68 tuổi) cho biết, vụ này giá phân bón tăng 20%, thuốc trừ sâu tăng 10%, giá công lao động cũng nhích lên 20%. Do đó, giá thành sản xuất tăng cao, khoảng 4.100 - 4.200 đồng mỗi kg. Trong khi đó năng suất khoảng 4,8 – 6 tấn mỗi ha, giảm khoảng 10%, do thời tiết bất thường và rầy nâu gây hại.\r\n\r\n\"Đa phần nông dân ở đây đã thu hoạch và bán hết tại ruộng từ hai tháng trước để thanh toán tiền vật tư, giống và đầu tư tiếp vụ sau nên khi giá lên như hiện nay, họ không được lợi gì\", ông Lam nói và cho biết với giá lúa bán thấp, nông dân lãi rất ít, mỗi ha chỉ lời 7-8 triệu đồng sau hơn 3 tháng canh tác. \r\n\r\nMấy chục năm làm ruộng, ông Lam khẳng định cây lúa cho thu nhập thấp nhất ngành nông nghiệp. \"Mỗi ha lúa chỉ lãi  20 - 30 triệu đồng một năm, là quá tệ. 10 năm trước xóm này 100 hộ đều trồng lúa nhưng không đủ trang trải. Hiện, 30% trong số đó đã bán đất rồi đi làm thuê kiếm sống\", ông nói. \r\n\r\nTheo thống kê, tại miền Tây, quy mô sản xuất trung bình của hộ trồng lúa là một ha mỗi hộ. Sáu năm trước, lúc giá lúa dao động 5.000 đồng mỗi kg, một nghiên cứu của các chuyên gia trong nước và quốc tế cho thấy, thu nhập trung bình của nông dân chỉ đạt 535.000 đồng mỗi tháng, tương đương một nửa mức lương tối thiểu khi đó. Các hộ sản xuất lúa quy mô nhỏ không thể sống dựa vào trồng lúa mà phải nhờ vào thu nhập từ chăn nuôi hay các hoạt động phi nông nghiệp khác.\r\n\r\n\"Cái bệnh an ninh lương thực làm chết nông dân chúng tôi\", lão nông Lê Văn Lam nói và đề nghị Nhà nước đừng gò bó nông dân ở Đồng Tháp Mười làm lúa mãi, cho họ chuyển đổi đất đai cây trồng để có lợi nhuận cao hơn. Ông dự tính, nếu được cho chuyển đổi, 30 ha đất của gia đình 25 nhân khẩu của mình, ông sẽ giữ một phần trồng lúa, hai phần còn lại trồng cây ăn trái và nuôi tôm cá. \r\n\r\nGiám đốc sở nông nghiệp một địa phương có diện tích lúa lớn ở miền Tây cho rằng, đa phần nông dân bán lúa tại ruộng với giá thấp, cuộc sống khó khăn nhưng rất khó thực hiện chuyển đổi diện tích lớn những vùng trồng lúa sang cây khác. Bởi hiện nay không có chủ trương, không đảm bảo đầu ra và khả năng ảnh hưởng đến tổng sản lượng lúa gạo và an ninh lương thực.\r\n\r\nCó hàng chục năm gắn bó với nền nông nghiệp, đặc biệt là cây lúa, GS.TS Võ Tòng Xuân cho rằng, Việt Nam sản xuất lúa gạo nhiều quá. Lãnh đạo các địa phương thừa biết rằng nông dân trồng lúa gặp nhiều khó khăn, nhưng vì chỉ tiêu trên giao xuống phải làm, tình trạng này kéo dài nhiều năm qua. Và ngày càng đẻ ra nhiều công trình thủy lợi nghìn tỷ đồng để phục vụ một trong những mục đích chính là tăng thêm sản lượng lúa gạo.\r\n\r\n\"Mỗi năm dư để xuất khẩu 5-7 triệu tấn gạo nhưng nông dân trồng lúa có giàu được đâu?\", Giáo sư Xuân nói. Theo ông, giải pháp ổn định lâu dài là giảm bớt diện tích cây trồng này, cần đầu tư tổ chức sản xuất các loại cây, con mà nông dân có lợi tức cao hơn, như nuôi tôm, cây ăn trái, rau quả cao cấp...', 1, 'Nông sản', '2019-06-10'),
(7, 'Giá cà phê tháng 5', 'Các sàn giao dịch tài chính hay nhắc nhau câu châm ngôn ‘’Sell in May and go away’’ ', '\r\nTrang chủ » 03. Thị trường cà phê » Giá cà phê nhảy múa, chạm cả đáy và đỉnh trong tháng 5\r\nGiá cà phê nhảy múa, chạm cả đáy và đỉnh trong tháng 5\r\n\r\nTin tức nông nghiệp cách đây khoảng 6 giờ 0 No comments\r\n\r\nGiá cà phê tháng 5 đã có lúc rớt xuống đáy của vụ 2018-2019, nhưng sau đó bùng phát tăng mạnh trong những ngày cuối tháng 5, từ mức đáy 1.267 đô la/tấn lên chạm đỉnh 1.482 đô la/tấn đúng vào ngày kết thúc tháng 31-5, lợi suất đầu tư tính từ đáy lên đỉnh tăng 16,65%.\r\n\r\nRớt xuống mức thấp nhất trong vòng 9 năm trước khi chạm đỉnh\r\n\r\nNgười kinh doanh trên các sàn giao dịch tài chính hay nhắc nhau câu châm ngôn ‘’Sell in May and go away’’ (có thể dịch vui là ‘’tháng Năm lo bán, chớ rán làm chi’’).\r\n\r\nVới thị trường cà phê, câu này được áp dụng triệt để vì tháng 5 là tháng vào hè, thời tiết nhiều nơi nóng bức, sức tiêu thụ cà phê giảm, hệ quả là nhu cầu mua rất hạn chế. Đây cũng là lúc mùa vụ cà phê của nước sản xuất và xuất khẩu hàng đầu thế giới Brazil vào mùa thu hoạch và bắt đầu niên vụ mới của họ (được tính nội bộ từ ngày 1-7 đến 30-6 hàng năm).\r\n\r\nTháng 5 hàng năm được xem là mùa \"giáp hạt\" và người sản xuất và kinh doanh đảo hàng, làm vệ sinh kho để chuẩn bị đón cà phê vụ mới. Thị trường hàng thực giảm nhu cầu mua, sàn kỳ hạn (hàng giấy) hoạt động cầm chừng, giá cà phê bấy giờ ‘’nguội lạnh’’ là chuyện dễ hiểu.\r\n\r\nXét cả tháng 5, giá cà phê robusta London có lúc xuống mức 1.267 đô la Mỹ/tấn vào ngày 8-5, đây là mức thấp nhất tính từ 9 năm trở lại đây.\r\n\r\nuy nhiên, giá cà phê đã bùng phát tăng mạnh trong những ngày cuối tháng 5, từ mức đáy 1.267 đô la/tấn lên chạm đỉnh 1.482 đô la/tấn đúng vào ngày kết thúc tháng 31-5, lợi suất đầu tư tính từ đáy lên đỉnh tăng 16,65%.', 1, 'Nông sản', '2019-06-26'),
(9, 'Nếu hay ăn cá biển, tốt nhất đừng ham', 'ia đình chị Hoa (Hà Nội) được biếu một khúc cá Thu to hơn 10kg. Nghĩ rằng', 'GiadinhNet - Gia đình chị Hoa (Hà Nội) được biếu một khúc cá Thu to hơn 10kg. Nghĩ rằng cá ngon nên chị Hoa chế biến và mời bố mẹ hai bên nội ngoại sang ăn tối cùng gia đình.\r\n\r\nTuy nhiên, nửa đêm hai con gái chị Hoa bị đau bụng, nôn mửa, tiêu chảy. Rất may sau gần một đêm cả nhà thức trắng vì các con chạy ra chạy vào toilet, gần sáng hai bé cũng yên bụng và ngủ tiếp.\r\n\r\nChưa hết, sáng hôm sau, mẹ đẻ chị Hoa gọi điện cho con gái hỏi nguồn gốc các món ăn tối qua vì về nhà bà bị mẩn ngứa, nổi mề đay. Chị Hoa cũng kể cho mẹ chuyện hai con gái bị “miệng nôn, trôn tháo” tối qua. Hai mẹ con chị Hoa đã nghĩ đến nguyên nhân do thức ăn, nhưng lại gạt đi vì nghĩ cá biển tươi, sạch như thế thì làm sao gây ngộ độc được.Theo các chuyên gia dinh dưỡng, có khá nhiều người cho rằng nước biển mặn sẽ không có vi khuẩn hoặc hạn chế vi khuẩn phát triển. Nhưng thực ra có những loại vi khuẩn ưa mặn sống được cả trong nước biển. Vì vậy, các loại: tôm, cua, ốc, cá… đều có thể nhiễm vi khuẩn.\r\n\r\nĐáng chú ý là vi khuẩn Vibrio parahaemolyticus, một trong những nguyên nhân gây ra những vụ ngộ độc thức ăn ở vùng biển. Vi khuẩn này gây ra hai loại hội chứng lâm sàng là tiêu chảy kiểu tả nhẹ và tiêu chảy phân có nhiều máu kèm theo đau bụng và sốt nhẹ.', 2, 'Hải sản', '2019-04-17'),
(10, 'Chích máu bán 300 triệu/lít ', 'Máu sam có giá trị rất lớn trong lĩnh vực y tế...', 'Máu sam có giá trị rất lớn trong lĩnh vực y tế với những công dụng tuyệt vời. Máu của loài vật này có giá lên tới 60.000 USD cho 1 gallon (tương đương 3,8 lít).\r\n', 2, 'Hải sản', '2019-06-24'),
(11, 'Hải sản nhập ngoại tiền triệu ', 'Nhiều loại hải sản nhập ngoại như tôm hùm Canada,', 'Nhiều loại hải sản nhập ngoại như tôm hùm Canada, cua Alaska... có giá lên tới vài triệu đồng. Tuy nhiên, nhiều người vẫn sẵn sàng bỏ tiền để thưởng thức.', 2, 'Hải sản', '2019-06-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`f_ID`, `f_Username`, `f_Password`, `f_Name`, `f_Email`, `f_DOB`, `f_Permission`) VALUES
(1, 'viet', '$2b$10$MdN0Yw24lm1HagX6aLQJpuRan8Q26j/pVzGEm.SKEzlIhWgBhTT.6', 'quocviet', 'kuniviet@gmail.com', '2019-07-02', 0),
(2, 'viet', '$2b$10$8OkBKxrfIfvm2oYOJj.6EeWgY9282jDPIbUlHTuwP6i.YmSZW8k6K', 'quocviet', 'kuniviet@gmail.com', '2019-07-02', 0),
(3, 'vu', '$2b$10$EvQ3WcvpMKEF0XsSBZ1aXu0avq5XFvwcCai8szfe7bq9FYwx6KgQW', 'ca vu', 'kuniviet@gmail.com', '1998-06-10', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
