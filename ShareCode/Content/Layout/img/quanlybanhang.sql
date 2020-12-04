-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2020 lúc 07:45 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlybanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblbinhluan`
--

CREATE TABLE `tblbinhluan` (
  `mabl` int(11) NOT NULL,
  `masp_id` int(11) DEFAULT NULL,
  `mand` int(11) DEFAULT NULL,
  `ngaybl` datetime NOT NULL,
  `nd` varchar(2000) CHARACTER SET ujis COLLATE ujis_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblbinhluan`
--

INSERT INTO `tblbinhluan` (`mabl`, `masp_id`, `mand`, `ngaybl`, `nd`) VALUES
(1, 2, 5, '2020-11-25 09:01:03', 'a'),
(2, 2, 5, '2020-11-25 09:02:24', 'a'),
(3, 3, 5, '2020-11-25 09:07:36', 'a'),
(4, 3, 5, '2020-11-25 16:11:57', 'a'),
(5, 2, 5, '2020-11-25 16:20:09', 'hay'),
(6, 2, 5, '2020-11-25 16:24:11', 'hay'),
(7, 2, 5, '2020-11-25 16:26:59', 'a'),
(8, 2, 5, '2020-11-25 16:28:03', 'cc'),
(9, 2, 5, '2020-11-25 16:30:12', 'a'),
(10, 2, 5, '2020-11-25 22:35:46', 'assasa'),
(11, 3, 5, '2020-11-26 09:28:58', 'eeee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcthd`
--

CREATE TABLE `tblcthd` (
  `mahd` int(11) NOT NULL,
  `masp` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblcthd`
--

INSERT INTO `tblcthd` (`mahd`, `masp`, `soluong`, `dongia`) VALUES
(5, 10, 3, 1399),
(6, 6, 1, 1399),
(6, 9, 1, 1399),
(7, 4, 1, 1399),
(7, 7, 1, 1399),
(8, 9, 2, 1399),
(8, 11, 1, 1399),
(9, 3, 4, 1399),
(9, 10, 1, 1399),
(9, 11, 3, 1399),
(10, 4, 1, 1399),
(10, 5, 2, 1399),
(10, 11, 2, 1399),
(11, 3, 1, 1399),
(11, 5, 1, 1399);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbldanhmuc`
--

CREATE TABLE `tbldanhmuc` (
  `madm` int(11) NOT NULL,
  `danhmuc` text DEFAULT NULL,
  `anhdanhmuc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbldanhmuc`
--

INSERT INTO `tbldanhmuc` (`madm`, `danhmuc`, `anhdanhmuc`) VALUES
(3, 'Điện lạnh', 'fa fa-atom'),
(5, 'khác', 'fa fa-atom');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblhoadon`
--

CREATE TABLE `tblhoadon` (
  `mahd` int(11) NOT NULL,
  `tongtien` double DEFAULT NULL,
  `ngayban` date DEFAULT NULL,
  `mand` int(11) DEFAULT NULL,
  `trangthai` tinyint(1) DEFAULT NULL,
  `diachi` text DEFAULT NULL,
  `sdt` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblhoadon`
--

INSERT INTO `tblhoadon` (`mahd`, `tongtien`, `ngayban`, `mand`, `trangthai`, `diachi`, `sdt`) VALUES
(5, 2798, '2020-11-25', 5, 1, 'hahahahah', '12345'),
(6, 4197, '2020-11-25', 5, 1, 'hahahahah', '12345'),
(7, 4197, '2020-11-25', 5, 1, 'karaoke yumi. tới alo. phường hiệp an. bình dươngBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '0924404019'),
(8, 5596, '2020-11-26', 5, 1, 'karaoke yumi. tới alo. phường hiệp an. bình dươngBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '0924404019'),
(9, 12591, '2020-11-26', 5, 4, 'karaoke yumi. tới alo. phường hiệp an. bình dươngBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '0924404019'),
(10, 8394, '2020-11-28', 5, 5, 'karaoke yumi. tới alo. phường hiệp an. bình dươngBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '0924404019'),
(11, 4197, '2020-11-28', 5, 4, 'karaoke yumi. tới alo. phường hiệp an. bình dươngBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '0924404019');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblnguoidung`
--

CREATE TABLE `tblnguoidung` (
  `mand` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `matkhau` varchar(255) DEFAULT NULL,
  `sdt` varchar(14) DEFAULT NULL,
  `diachi` text DEFAULT NULL,
  `ngaydn` date DEFAULT NULL,
  `mapq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblnguoidung`
--

INSERT INTO `tblnguoidung` (`mand`, `email`, `matkhau`, `sdt`, `diachi`, `ngaydn`, `mapq`) VALUES
(5, 'tanthanh141214@gmail.com', 'thanh', '0924404019', 'karaoke yumi. tới alo. phường hiệp an. bình dương\r\nBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '2020-12-03', 1),
(6, 'hatanthanh190299@gmail.com', 'thanh', '0924404019', 'karaoke yumi. tới alo. phường hiệp an. bình dương\r\nBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '2020-12-03', 1),
(7, 'thanh1902@gmail.com', 'thanh', '0924404019', 'karaoke yumi. tới alo. phường hiệp an. bình dương\r\nBình Dương - Thành Phố Thủ Dầu Một - Phường Hiệp An', '2020-12-03', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphanquyen`
--

CREATE TABLE `tblphanquyen` (
  `mapq` int(11) NOT NULL,
  `phanquyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblphanquyen`
--

INSERT INTO `tblphanquyen` (`mapq`, `phanquyen`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblquangcao`
--

CREATE TABLE `tblquangcao` (
  `maqc` int(11) NOT NULL,
  `img` varchar(20000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ngaydang` date DEFAULT NULL,
  `vitri` int(11) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `hoatdong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblquangcao`
--

INSERT INTO `tblquangcao` (`maqc`, `img`, `ngaydang`, `vitri`, `email`, `hoatdong`) VALUES
(2, '0DmHhiIQEptXNCZa0bRe32.jpg', '2020-12-03', 2, 'laptring@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblsanpham`
--

CREATE TABLE `tblsanpham` (
  `masp` int(11) NOT NULL,
  `madinhdanh` varchar(11) DEFAULT NULL,
  `tensp` text DEFAULT NULL,
  `anhminhhoa` text DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `giaban` double DEFAULT NULL,
  `khuyenmai` int(11) DEFAULT NULL,
  `luotxem` int(11) DEFAULT NULL,
  `luotdanhgia` int(11) DEFAULT NULL,
  `tbdanhgia` double DEFAULT NULL,
  `mathuonghieu` int(11) DEFAULT NULL,
  `madm` int(11) DEFAULT NULL,
  `ngaytao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblsanpham`
--

INSERT INTO `tblsanpham` (`masp`, `madinhdanh`, `tensp`, `anhminhhoa`, `mota`, `giaban`, `khuyenmai`, `luotxem`, `luotdanhgia`, `tbdanhgia`, `mathuonghieu`, `madm`, `ngaytao`) VALUES
(2, 'SP010', 'Iphone12', 'p2.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 4454, 10, 5, 2, 5, '2020-10-28'),
(3, 'SP010', 'Iphone12', 'p3.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 61, 10, 5, 3, 5, '2020-10-28'),
(4, 'SP010', 'Iphone12', 'p4.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 262, 10, 5, 3, 5, '2020-10-28'),
(5, 'SP010', 'Iphone12', 'p5.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 259, 10, 5, 2, 5, '2020-10-28'),
(6, 'SP010', 'Iphone12', 'p6.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 1111, 10, 5, 1, 5, '2020-10-28'),
(7, 'SP010', 'Iphone12', 'p7.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 776, 10, 5, 3, 5, '2020-10-28'),
(8, 'SP010', 'Iphone12', 'p8.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 256, 10, 5, 4, 5, '2020-10-28'),
(9, 'SP010', 'Iphone12', 'p9.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 259, 10, 5, 1, 5, '2020-10-28'),
(10, 'SP010', 'Iphone12', 'p10.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 262, 10, 5, 2, 5, '2020-10-28'),
(11, 'SP010', 'Iphone12', 'p11.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 570, 10, 5, 2, 5, '2020-10-28'),
(12, 'SP010', 'Iphone12', 'p12.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 257, 10, 5, 2, 5, '2020-10-28'),
(13, 'SP010', 'Iphone12', 'p5.jpg', '<p>Nh&igrave;n kh&aacute; đẹp nhưng ko c&oacute; m&agrave;u hồng</p>', 1399, 0, 256, 10, 5, 4, 5, '2020-10-28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblthuonghieu`
--

CREATE TABLE `tblthuonghieu` (
  `mathuonghieu` int(11) NOT NULL,
  `thuonghieu` text DEFAULT NULL,
  `anhthuonghieu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblthuonghieu`
--

INSERT INTO `tblthuonghieu` (`mathuonghieu`, `thuonghieu`, `anhthuonghieu`) VALUES
(1, 'Apple', '863px-Apple_logo_black.svg.png'),
(2, 'Samsung', '512px-Samsung_Logo.svg.png'),
(3, 'Oppo', 'OPPO_Logo_wiki.png'),
(4, 'Acer', '20624.png'),
(7, 'huawei', '1605150555.jfif');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbltraloibinhluan`
--

CREATE TABLE `tbltraloibinhluan` (
  `marl` int(11) NOT NULL,
  `ngayrl` datetime DEFAULT NULL,
  `mand` int(11) DEFAULT NULL,
  `mabl` int(11) DEFAULT NULL,
  `nd` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbltraloibinhluan`
--

INSERT INTO `tbltraloibinhluan` (`marl`, `ngayrl`, `mand`, `mabl`, `nd`) VALUES
(1, '2020-11-25 16:45:56', 5, 1, 'a'),
(2, '2020-11-25 16:49:11', 5, 1, 'a'),
(3, '2020-11-25 16:49:53', 5, 1, 'a'),
(4, '2020-11-25 16:50:51', 5, 1, 'hay cc'),
(5, '2020-11-25 16:51:17', 5, 2, '@@'),
(6, '2020-11-25 22:35:49', 5, 10, 'asas'),
(7, '2020-11-26 09:29:02', 5, 11, '@@');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tblbinhluan`
--
ALTER TABLE `tblbinhluan`
  ADD PRIMARY KEY (`mabl`);

--
-- Chỉ mục cho bảng `tblcthd`
--
ALTER TABLE `tblcthd`
  ADD PRIMARY KEY (`mahd`,`masp`),
  ADD KEY `fk_cthd_sp` (`masp`);

--
-- Chỉ mục cho bảng `tbldanhmuc`
--
ALTER TABLE `tbldanhmuc`
  ADD PRIMARY KEY (`madm`);

--
-- Chỉ mục cho bảng `tblhoadon`
--
ALTER TABLE `tblhoadon`
  ADD PRIMARY KEY (`mahd`),
  ADD KEY `fk_hoadon_nguoidung` (`mand`);

--
-- Chỉ mục cho bảng `tblnguoidung`
--
ALTER TABLE `tblnguoidung`
  ADD PRIMARY KEY (`mand`),
  ADD KEY `fk_phanquyen_nguoidung` (`mapq`);

--
-- Chỉ mục cho bảng `tblphanquyen`
--
ALTER TABLE `tblphanquyen`
  ADD PRIMARY KEY (`mapq`);

--
-- Chỉ mục cho bảng `tblquangcao`
--
ALTER TABLE `tblquangcao`
  ADD PRIMARY KEY (`maqc`);

--
-- Chỉ mục cho bảng `tblsanpham`
--
ALTER TABLE `tblsanpham`
  ADD PRIMARY KEY (`masp`),
  ADD KEY `fk_danhmuc_sanpham` (`madm`),
  ADD KEY `fk_thuonghieu_sanpham` (`mathuonghieu`);

--
-- Chỉ mục cho bảng `tblthuonghieu`
--
ALTER TABLE `tblthuonghieu`
  ADD PRIMARY KEY (`mathuonghieu`);

--
-- Chỉ mục cho bảng `tbltraloibinhluan`
--
ALTER TABLE `tbltraloibinhluan`
  ADD PRIMARY KEY (`marl`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tblbinhluan`
--
ALTER TABLE `tblbinhluan`
  MODIFY `mabl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tbldanhmuc`
--
ALTER TABLE `tbldanhmuc`
  MODIFY `madm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tblhoadon`
--
ALTER TABLE `tblhoadon`
  MODIFY `mahd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tblnguoidung`
--
ALTER TABLE `tblnguoidung`
  MODIFY `mand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tblphanquyen`
--
ALTER TABLE `tblphanquyen`
  MODIFY `mapq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblquangcao`
--
ALTER TABLE `tblquangcao`
  MODIFY `maqc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblsanpham`
--
ALTER TABLE `tblsanpham`
  MODIFY `masp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tblthuonghieu`
--
ALTER TABLE `tblthuonghieu`
  MODIFY `mathuonghieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbltraloibinhluan`
--
ALTER TABLE `tbltraloibinhluan`
  MODIFY `marl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tblcthd`
--
ALTER TABLE `tblcthd`
  ADD CONSTRAINT `fk_cthd_hd` FOREIGN KEY (`mahd`) REFERENCES `tblhoadon` (`mahd`),
  ADD CONSTRAINT `fk_cthd_sp` FOREIGN KEY (`masp`) REFERENCES `tblsanpham` (`masp`);

--
-- Các ràng buộc cho bảng `tblhoadon`
--
ALTER TABLE `tblhoadon`
  ADD CONSTRAINT `fk_hoadon_nguoidung` FOREIGN KEY (`mand`) REFERENCES `tblnguoidung` (`mand`);

--
-- Các ràng buộc cho bảng `tblnguoidung`
--
ALTER TABLE `tblnguoidung`
  ADD CONSTRAINT `fk_phanquyen_nguoidung` FOREIGN KEY (`mapq`) REFERENCES `tblphanquyen` (`mapq`);

--
-- Các ràng buộc cho bảng `tblsanpham`
--
ALTER TABLE `tblsanpham`
  ADD CONSTRAINT `fk_danhmuc_sanpham` FOREIGN KEY (`madm`) REFERENCES `tbldanhmuc` (`madm`),
  ADD CONSTRAINT `fk_thuonghieu_sanpham` FOREIGN KEY (`mathuonghieu`) REFERENCES `tblthuonghieu` (`mathuonghieu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
