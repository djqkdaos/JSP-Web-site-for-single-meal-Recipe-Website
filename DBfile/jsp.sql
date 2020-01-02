-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- 생성 시간: 18-01-14 23:32
-- 서버 버전: 10.1.9-MariaDB
-- PHP 버전: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `jsp`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `admin`
--

INSERT INTO `admin` (`ID`, `pass`) VALUES
('jsp', 'jsp');

-- --------------------------------------------------------

--
-- 테이블 구조 `bill`
--

CREATE TABLE `bill` (
  `bill` int(50) NOT NULL,
  `ID` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `memo` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `menu` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `price` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `ingredients` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(30) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `bill`
--

INSERT INTO `bill` (`bill`, `ID`, `name`, `tel`, `address`, `memo`, `menu`, `price`, `ingredients`, `image`) VALUES
(14, 'rudtjr', '김경석', '01050380554', '우리집', '그냥주새요', '떡볶이', '5000', '떡,고추장,파', 'image1.jpg'),
(15, 'rudtjr', '김경석', '01050380554', '우리지', '추가주문', '볶음밥', '5000', '파,밥,햄', 'image2.jpg'),
(16, 'gdool02', '조영천', '01042750698', '양정', '화이또~', '볶음밥', '5000', '파,밥,햄', 'image2.jpg'),
(17, 'gdool02', '김남억', '010-2222-3333', '동의과학대학', '부재시 전화주세요', '햄버거', '5000', '빵,패티,배추', 'image3.jpg'),
(18, 'gdool02', '김남억', '0102846827', '대한민국 어디든지 갑니다.', '빨리 넣어주세요.', '비싼것', '17000', '닭고기!', '13.jpg'),
(19, 'jsp', '조프로', '01099999999', '양정', '없음', '비싼것', '17000', '닭고기!', '13.jpg'),
(20, 'gdool02', '조영천', '01011118888', '동의과학대학', '망가뜨리지마', '비싼것', '17000', '닭고기!', '13.jpg'),
(21, 'rudtjr', 'a', 'a', 'a', 'a', 'ff', 'ff', 'gg', 'nam.jpg'),
(22, 'test', 'test', 'test', 'test', '부재시 경비실에 맡겨주세요', 'aa', 'aa', 'aa', ''),
(23, 'rudtjrkkk', 'ㅁㄴㅇ', 'ㄴㅁㅇ', 'ㅁㄴㅇ', 'ㅁㄴㅇ', 'aa', 'aa', 'aa', '');

-- --------------------------------------------------------

--
-- 테이블 구조 `board`
--

CREATE TABLE `board` (
  `idx` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `writer` varchar(30) CHARACTER SET utf8 NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count` int(11) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `board`
--

INSERT INTO `board` (`idx`, `title`, `writer`, `regdate`, `count`, `content`) VALUES
(33, '안녕하세요', 'rudtjr', '2017-06-22 18:42:31', 2, '안녕하세요 저는 김경석입니다'),
(34, '저는 조영천입니다.', 'gdool02', '2017-06-22 19:06:02', 1, '안녕하세요'),
(35, '안녕하세요', 'gdool02', '2017-06-22 19:06:16', 2, 'ㅇㅋ'),
(38, '이 아이디는 김경석아이디로 쓴글 입니다.', 'rudtjr', '2017-06-22 23:15:49', 6, '테스트입니다'),
(39, '이 아이디는 김경석아이디로 쓴글 입니다.', 'rudtjr', '2017-06-22 23:16:02', 2, '여기의 답변입니다'),
(41, '테스트글입니다', 'rudtjr', '2017-12-07 13:23:23', 4, '테ㅡㅡㅌ'),
(42, '테스트글입니다', 'rudtjr', '2017-06-23 03:32:54', 0, '경석이 아디디의 답변입니다.'),
(43, '안녕하세요', 'rudtjr', '2017-06-23 03:33:13', 0, '2페이지만드는 답변'),
(44, 'tt', 'jsp', '2017-06-23 04:21:58', 8, 'tt'),
(45, 'tt', 'jsp', '2017-12-05 15:27:40', 1, 'fff'),
(52, 'test3ìì íì¤í¸', 'test1', '2017-12-07 13:31:34', 57, 'testìì íì¤í¸'),
(53, 'ㅁㅇㄹㄴㅇㄹ', 'test1', '2017-12-07 13:23:29', 22, 'ㄴㅇㄹㅇㄹㄴㅇㄹ'),
(55, 'ㅁㄴㅇㄴ', 'test1', '2017-12-22 13:01:48', 4, 'ㅁㄴㅇㄴㅇ'),
(56, '수정테스트', 'test1', '2017-12-12 05:27:12', 10, '수정테스트'),
(57, 'ttttt', 'test4', '2017-12-16 06:22:27', 0, 'ttttt');

-- --------------------------------------------------------

--
-- 테이블 구조 `main_board_reply`
--

CREATE TABLE `main_board_reply` (
  `seq` int(11) NOT NULL,
  `main_seq` int(11) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  `name` varchar(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `menu`
--

CREATE TABLE `menu` (
  `menunum` int(50) NOT NULL,
  `menu` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `mprice` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `mingredients` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `mimage` varchar(200) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `menu`
--

INSERT INTO `menu` (`menunum`, `menu`, `mprice`, `mingredients`, `mimage`) VALUES
(11, '떡볶이', '5000', '떡,고추장,파', 'image1.jpg'),
(12, '볶음밥', '5000', '파,밥,햄', 'image2.jpg'),
(13, '햄버거', '3000', '빵,패티,배추', 'image3.jpg'),
(14, '비싼것', '17000', '닭고기!', '13.jpg'),
(15, 'ff', 'ff', 'gg', 'nam.jpg'),
(16, 'a', 'a', 'a', ''),
(17, 'aa', 'aa', 'aa', '');

-- --------------------------------------------------------

--
-- 테이블 구조 `recipe`
--

CREATE TABLE `recipe` (
  `recipe` int(100) NOT NULL,
  `price` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `ingredients` varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  `method` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(30) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `recipe`
--

INSERT INTO `recipe` (`recipe`, `price`, `title`, `ingredients`, `method`, `image`) VALUES
(20, '5000', '떡볶이', '파,떡,고추장', '파를자르고 떡을 넣고 고추장을 넣는다.', 'image1.jpg'),
(21, '5000', '햄버거', '빵,패티,배추', '빵안에 패티와 배추를 넣는다.', 'image3 - copy.jpg'),
(22, '15000', '맛있는 냠냠', '흐흫', '하핳', '14.jpg'),
(23, '5000', '말랑카이 볶음밥', '누런 쌀/ 양파/ 당근/ 호박/ 완두콩/ 참기름/ 카레가루', '누런 쌀로 밥을 짓고 양파와 당근을 송송썰어 잘 익은 완두콩에 참기름 두방을 톡톡', 'image2 - copy.jpg'),
(24, '10000', '전복', '전복', '버터바르고 굽는다', 'image4.jpg'),
(25, '15000', 'hh', 'hh', 'hh', 'nam.jpg');

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `nic` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `telNo` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `eMail` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`name`, `id`, `password`, `nic`, `telNo`, `eMail`, `address`) VALUES
('김경석', 'rudtjr', 'kkk', '경서키', '01028469273', 'rudtjr@naver.com', '부산 양정이다'),
('조영천', 'gdool02', 'dmdrk', '응가방구', '01028468312', 'gdool00@naver.com', '부산 정관'),
('test1', 'test1', 'test1', 'nullddddd', 'nullddddd', 'nulldddd', 'nullddddd'),
('김경석', 'rudtjrkkk', 'rudtjr1126', '김경석', '01050380554', 'rudtjrkkk@naver.com', '양정동'),
('test2', 'test2', 'test2', 'test2', 'test2', 'test2', 'test2'),
('test3', 'test3', 'test3', 'test3', 'test3', 'test3', 'test3'),
('test4', 'test4', 'test4', 'test4', 'test4', 'test4', 'test4');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- 테이블의 인덱스 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill`);

--
-- 테이블의 인덱스 `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `main_board_reply`
--
ALTER TABLE `main_board_reply`
  ADD PRIMARY KEY (`seq`);

--
-- 테이블의 인덱스 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menunum`);

--
-- 테이블의 인덱스 `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `bill`
--
ALTER TABLE `bill`
  MODIFY `bill` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 테이블의 AUTO_INCREMENT `board`
--
ALTER TABLE `board`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- 테이블의 AUTO_INCREMENT `main_board_reply`
--
ALTER TABLE `main_board_reply`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `menunum` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 테이블의 AUTO_INCREMENT `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
