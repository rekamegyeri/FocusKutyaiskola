-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2025. Ápr 08. 14:52
-- Kiszolgáló verziója: 10.6.21-MariaDB-cll-lve-log
-- PHP verzió: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `opnmtjno_focus_kutyaiskola`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `arak`
--

CREATE TABLE `arak` (
  `a_id` int(11) NOT NULL,
  `a_ar` int(11) NOT NULL,
  `a_c_id` int(11) NOT NULL,
  `a_datumtol` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `arak`
--

INSERT INTO `arak` (`a_id`, `a_ar`, `a_c_id`, `a_datumtol`) VALUES
(111, 40000, 11, '2025-05-01'),
(221, 35000, 22, '2025-05-01'),
(331, 35000, 33, '2025-05-01'),
(441, 45000, 44, '2025-05-01'),
(551, 50000, 55, '2025-05-01'),
(661, 10000, 66, '2025-05-01');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `curzus`
--

CREATE TABLE `curzus` (
  `c_id` int(11) NOT NULL,
  `c_nev` text NOT NULL,
  `c_leiras` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `curzus`
--

INSERT INTO `curzus` (`c_id`, `c_nev`, `c_leiras`) VALUES
(11, 'Kölyök', 'A tanfolyam játékosan segíti a kölykök nevelését és szocializációját.'),
(22, 'Felnőtt', 'A tanfolyam segíti a felnőtt kutyák engedelmességét és figyelmét pozitív módszerekkel.'),
(33, 'Idős', 'Az idősebb kutyák aktivitását és viselkedését kíméletes módszerekkel fejlesztjük.'),
(44, 'Agility', 'Az agility tanfolyam akadálypályás sporttal erősíti a kutya-gazdi kapcsolatot.'),
(55, 'Őrző-védő', 'Az őrző-védő tanfolyam a kutya védelmező ösztönét fejleszti kontrollált környezetben.'),
(66, 'Egyéni', 'Az egyéni tanfolyam rugalmas, személyre szabott képzést biztosít a kutya és gazdája igényei szerint.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dog`
--

CREATE TABLE `dog` (
  `d_id` int(11) NOT NULL,
  `d_nev` text NOT NULL,
  `d_u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `dog`
--

INSERT INTO `dog` (`d_id`, `d_nev`, `d_u_id`) VALUES
(2, 'Roxy', 18),
(14, 'pipi', 30),
(15, 'Tütüke', 31),
(16, 'Max', 32),
(29, 'Prézli', 45),
(46, 'Benő', 62),
(47, 'uzhikuzg', 63);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ertekeles`
--

CREATE TABLE `ertekeles` (
  `e_id` int(11) NOT NULL,
  `e_u_id` int(11) NOT NULL,
  `e_szoveg` text NOT NULL,
  `e_szam` int(11) NOT NULL,
  `e_datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `ertekeles`
--

INSERT INTO `ertekeles` (`e_id`, `e_u_id`, `e_szoveg`, `e_szam`, `e_datum`) VALUES
(1, 18, 'nagyon jó', 5, '2025-03-03 12:03:01'),
(2, 34, 'szuper', 5, '2025-03-03 12:04:05'),
(3, 31, 'Nagyon jó hely,csak ajánlani tudom.', 5, '2025-03-03 12:14:55'),
(4, 32, 'Szuper kutyaiskola :)', 5, '2025-03-10 13:24:40');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `login`
--

CREATE TABLE `login` (
  `l_id` int(11) NOT NULL,
  `l_datum` datetime NOT NULL,
  `l_ip` varchar(50) NOT NULL,
  `l_session` varchar(8) NOT NULL,
  `l_u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `login`
--

INSERT INTO `login` (`l_id`, `l_datum`, `l_ip`, `l_session`, `l_u_id`) VALUES
(101, '2025-03-26 19:23:07', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 18),
(102, '2025-03-26 19:28:22', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 32),
(104, '2025-03-26 19:39:04', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 18),
(105, '2025-03-26 19:40:27', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 18),
(106, '2025-03-26 19:45:52', '2a00:1110:141:1245:1dcf:c197:d5d3:7cce', '3cc0b482', 32),
(107, '2025-03-26 19:46:16', '2a00:1110:141:1245:1dcf:c197:d5d3:7cce', '3cc0b482', 18),
(108, '2025-03-26 20:04:19', '2a00:1110:141:1245:1dcf:c197:d5d3:7cce', '3cc0b482', 32),
(109, '2025-03-26 20:17:57', '2a00:1110:141:1245:1dcf:c197:d5d3:7cce', '3cc0b482', 18),
(110, '2025-03-26 20:26:59', '2a00:1110:141:1245:1dcf:c197:d5d3:7cce', '3cc0b482', 32),
(112, '2025-03-26 20:31:07', '2a00:1110:141:1245:1dcf:c197:d5d3:7cce', '3cc0b482', 18),
(113, '2025-03-27 08:32:32', '2a00:1110:129:a255:7579:5934:3092:9322', '39452d06', 18),
(119, '2025-03-27 17:42:22', '2a00:1110:122:5712:ad43:2c96:2c05:ca33', '6a4ac5eb', 32),
(159, '2025-04-06 13:09:19', '188.157.171.150', '3cc0b482', 18),
(160, '2025-04-06 20:21:18', '188.157.171.150', '3cc0b482', 18);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `naplo`
--

CREATE TABLE `naplo` (
  `n_id` int(11) NOT NULL,
  `n_datum` datetime NOT NULL,
  `n_ip` varchar(50) NOT NULL,
  `n_session` varchar(8) NOT NULL,
  `n_u_id` int(11) NOT NULL,
  `n_url` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `naplo`
--

INSERT INTO `naplo` (`n_id`, `n_datum`, `n_ip`, `n_session`, `n_u_id`, `n_url`) VALUES
(418, '2025-03-06 14:37:30', '195.199.251.129', '59029f46', 53, '/'),
(419, '2025-03-06 14:37:36', '195.199.251.129', '59029f46', 53, '/?p=arlista'),
(420, '2025-03-06 14:37:44', '195.199.251.129', '59029f46', 53, '/?p=adatlapom'),
(701, '2025-03-13 11:15:42', '195.199.251.129', '595729fa', 0, '/?p=login'),
(702, '2025-03-13 11:15:54', '195.199.251.129', '595729fa', 18, '/'),
(703, '2025-03-13 11:15:55', '195.199.251.129', '595729fa', 18, '/?p=adatlapom'),
(706, '2025-03-13 11:18:41', '195.199.251.129', '595729fa', 18, '/?p=kilepes'),
(906, '2025-03-26 18:28:27', '2a00:1110:141:1245:1119:d378:733b:5ed4', '3cc0b482', 0, '/'),
(981, '2025-03-26 19:28:10', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 0, '/?p=login'),
(985, '2025-03-26 19:28:58', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 32, '/'),
(986, '2025-03-26 19:29:00', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 32, '/?p=adatlapom'),
(988, '2025-03-26 19:29:41', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 32, '/'),
(989, '2025-03-26 19:30:34', '2a00:1110:141:1245:b98a:e078:58b2:1373', '3cc0b482', 32, '/?p=kilepes'),
(1178, '2025-03-27 17:41:15', '2a00:1110:122:5712:ad43:2c96:2c05:ca33', '6a4ac5eb', 0, '/'),
(1179, '2025-03-27 17:41:19', '2a00:1110:122:5712:ad43:2c96:2c05:ca33', '6a4ac5eb', 0, '/?p=login'),
(1180, '2025-03-27 17:41:22', '2a00:1110:122:5712:ad43:2c96:2c05:ca33', '6a4ac5eb', 18, '/?p=adatlapom'),
(1181, '2025-03-27 17:41:27', '2a00:1110:122:5712:ad43:2c96:2c05:ca33', '6a4ac5eb', 18, '/?p=admin'),
(1182, '2025-03-27 17:41:51', '2a00:1110:122:5712:ad43:2c96:2c05:ca33', '6a4ac5eb', 18, '/?p=kilepes'),
(1304, '2025-03-31 13:22:39', '2a00:1110:132:3031:b1e5:7cac:4bb4:e848', '3cc0b482', 0, '/?p=login'),
(1305, '2025-03-31 13:22:48', '2a00:1110:132:3031:b1e5:7cac:4bb4:e848', '3cc0b482', 18, '/?p=adatlapom'),
(1306, '2025-03-31 13:22:52', '2a00:1110:132:3031:b1e5:7cac:4bb4:e848', '3cc0b482', 18, '/?p=admin'),
(1426, '2025-04-05 12:41:37', '188.157.171.150', '3cc0b482', 18, '/'),
(1440, '2025-04-05 13:13:07', '188.157.171.150', '3cc0b482', 18, '/?p=adatlapom'),
(1502, '2025-04-05 17:10:26', '188.157.171.150', '35343513', 0, '/?p=login'),
(1503, '2025-04-05 17:10:30', '2a00:1110:132:4768:8986:a32a:20c9:5f66', 'c387356b', 18, '/?p=adatlapom'),
(1504, '2025-04-05 17:10:33', '2a00:1110:132:4768:8986:a32a:20c9:5f66', 'c387356b', 18, '/?p=admin'),
(1506, '2025-04-05 17:11:18', '188.157.171.150', '35343513', 0, '/?p=login'),
(1507, '2025-04-05 17:11:44', '188.157.171.150', '35343513', 62, '/?p=adatlapom'),
(1509, '2025-04-05 17:12:41', '188.157.171.150', '35343513', 62, '/?p=kilepes'),
(1590, '2025-04-07 15:58:28', '188.157.171.150', '3cc0b482', 0, '/'),
(1591, '2025-04-07 16:05:23', '188.157.171.150', '3cc0b482', 0, '/?p=login'),
(1592, '2025-04-07 16:28:34', '188.157.171.150', '3cc0b482', 0, '/'),
(1593, '2025-04-07 21:30:03', '94.44.99.137', '7f4dc949', 0, '/'),
(1594, '2025-04-08 06:15:57', '52.252.42.146', '0ffedc71', 0, '/'),
(1595, '2025-04-08 08:16:52', '137.184.168.79', '361c8d02', 0, '/'),
(1596, '2025-04-08 08:16:53', '137.184.168.79', 'e5ab5d01', 0, '/'),
(1597, '2025-04-08 13:02:53', '34.210.143.203', '84f5a1a5', 0, '/'),
(1598, '2025-04-08 13:03:00', '44.246.228.172', 'a2c40785', 0, '/'),
(1599, '2025-04-08 13:37:31', '195.199.251.129', '3cc0b482', 0, '/?p=login'),
(1600, '2025-04-08 13:41:56', '195.199.251.129', '3cc0b482', 0, '/'),
(1601, '2025-04-08 14:44:08', '195.199.251.129', '3cc0b482', 0, '/');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `oktatok`
--

CREATE TABLE `oktatok` (
  `o_id` int(11) NOT NULL,
  `o_nev` text NOT NULL,
  `o_kutyanev` text NOT NULL,
  `o_email` varchar(250) NOT NULL,
  `o_telszam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `oktatok`
--

INSERT INTO `oktatok` (`o_id`, `o_nev`, `o_kutyanev`, `o_email`, `o_telszam`) VALUES
(110, 'Takács Boldizsár', 'Zara', 'takacsboldizsar@focusdog.hu', '99/111-2222'),
(220, 'Molnár Bernadett', 'Marley', 'molnarbernadett@focusdog.hu', '99/876-5432'),
(330, 'Nagy Ákos', 'Colin', 'nagyakos@focusdog.hu', '99/123-4567'),
(440, 'Tóth Kata', 'Luna', 'tothkata@focusdog.hu', '99/987-6543'),
(550, 'Kovács Tünde', 'Roxy', 'kovacstunde@focusdog.hu', '99/234-5678'),
(660, 'Kiss Erik', 'Benő', 'kisserik@focusdog.hu', '99/555-1234');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `resztvevo`
--

CREATE TABLE `resztvevo` (
  `r_id` int(11) NOT NULL,
  `r_u_nev` text NOT NULL,
  `r_d_nev` text NOT NULL,
  `r_t_id` int(11) NOT NULL,
  `r_email` varchar(250) NOT NULL,
  `r_datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `resztvevo`
--

INSERT INTO `resztvevo` (`r_id`, `r_u_nev`, `r_d_nev`, `r_t_id`, `r_email`, `r_datum`) VALUES
(37, 'Réka', 'Roxy', 222, 'reka.megyeri@gmail.com', '2025-03-03 11:58:15'),
(38, 'Noémi', 'Benő', 112, 'novaknoemi5@gmail.com', '2025-03-03 11:59:12'),
(39, 'Penki', 'Pipi', 332, 'jankopenki@gmail.com', '2025-03-03 12:08:41'),
(40, 'Tóth Krisztina', 'Tütü', 112, 'tothkriszti0124@gmail.com', '2025-03-03 12:14:16'),
(52, 'Rudi', 'Bumi', 112, 'eizenrudi@gmail.com', '2025-03-11 11:17:52'),
(61, 'NoemiAnna', 'Benő', 223, 'nszechey@gmail.com', '2025-04-05 17:06:57');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanfolyamok`
--

CREATE TABLE `tanfolyamok` (
  `t_id` int(11) NOT NULL,
  `t_nev` text NOT NULL,
  `t_kezddatum` date NOT NULL,
  `t_vegdatum` date NOT NULL,
  `t_o_id` int(11) NOT NULL,
  `t_c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanfolyamok`
--

INSERT INTO `tanfolyamok` (`t_id`, `t_nev`, `t_kezddatum`, `t_vegdatum`, `t_o_id`, `t_c_id`) VALUES
(112, 'kolyok-kezdo', '2025-07-07', '2025-09-01', 110, 11),
(113, 'kolyok-halado', '2025-07-14', '2025-09-08', 110, 11),
(222, 'felnott-kezdo', '2025-07-28', '2025-09-22', 220, 22),
(223, 'felnott-halado', '2025-07-21', '2025-09-15', 220, 22),
(332, 'idos-kezdo', '2025-08-04', '2025-09-15', 330, 33),
(333, 'idos-halado', '2025-08-11', '2025-09-22', 330, 33),
(447, 'agility', '2025-08-18', '2025-09-22', 440, 44),
(558, 'orzo-vedo', '2025-08-04', '2025-10-27', 550, 55),
(669, 'egyeni', '0000-00-00', '0000-00-00', 660, 66);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_email` varchar(250) NOT NULL,
  `u_nick` varchar(100) NOT NULL,
  `u_pwd` varchar(64) NOT NULL,
  `u_datum` datetime NOT NULL,
  `u_profkep_nev` varchar(50) NOT NULL,
  `u_profkep_eredetinev` varchar(250) NOT NULL,
  `u_ip` varchar(50) NOT NULL,
  `u_session` varchar(8) NOT NULL,
  `u_status` varchar(2) NOT NULL,
  `u_comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`u_id`, `u_email`, `u_nick`, `u_pwd`, `u_datum`, `u_profkep_nev`, `u_profkep_eredetinev`, `u_ip`, `u_session`, `u_status`, `u_comment`) VALUES
(18, 'reka.megyeri@gmail.com', 'rekamegyeri', 'eeaef4bbb00793ab92a2dfd6f9d0d364', '2025-02-18 13:50:25', '18_250313101831_ombpv.jpg', '11zon_cropped.png', '', '', '', 'admin'),
(31, 'tothkriszti0124@gmail.com', 'Kriszti0124', '7a8d804ae17e1a1e5913559b5b74d564', '2025-02-28 11:53:32', '', '', '', '', '', ''),
(32, 'focusdog1@gmail.com', 'focus', 'd5d5776ac96bb8d7e1874c215b25d361', '2025-02-28 12:45:12', '32_250310164755_o0kwf.jpg', '', '', '', '', 'admin'),
(34, 'novaknoemi5@gmail.com', 'Noemi', 'e0e3106a0ebfc188455a4c9c58b18f1f', '2025-02-28 14:01:47', '', '', '', '', '', 'admin'),
(36, 'jankopenki@gmail.com', 'penki', 'bce56fe0f2b1aaacd854a20c6a12289c', '2025-03-03 12:07:32', '', '', '', '', '', ''),
(42, 'szaszgergo05@gmail.com', 'Gergo', 'f5b3b9b303f5a0594272f99d191bbf45', '2025-03-05 14:28:47', '42_250305132926_8crvi.jpg', '', '', '', '', ''),
(45, 'reucovdavid@gmail.com', 'ReuDavid', 'd1ba7d6ab6ba065e18b6bcd23e2b5f5e', '2025-03-06 10:33:44', '45_250306093617_ha1cq.jpg', '', '', '', '', ''),
(62, 'nszechey@gmail.com', 'Benő', '0c7c8ca5037d3f1758db2057d646489c', '2025-04-05 17:11:13', '', '', '', '', '', '');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `arak`
--
ALTER TABLE `arak`
  ADD PRIMARY KEY (`a_id`);

--
-- A tábla indexei `curzus`
--
ALTER TABLE `curzus`
  ADD PRIMARY KEY (`c_id`);

--
-- A tábla indexei `dog`
--
ALTER TABLE `dog`
  ADD PRIMARY KEY (`d_id`);

--
-- A tábla indexei `ertekeles`
--
ALTER TABLE `ertekeles`
  ADD PRIMARY KEY (`e_id`);

--
-- A tábla indexei `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`l_id`);

--
-- A tábla indexei `naplo`
--
ALTER TABLE `naplo`
  ADD PRIMARY KEY (`n_id`);

--
-- A tábla indexei `oktatok`
--
ALTER TABLE `oktatok`
  ADD PRIMARY KEY (`o_id`);

--
-- A tábla indexei `resztvevo`
--
ALTER TABLE `resztvevo`
  ADD PRIMARY KEY (`r_id`);

--
-- A tábla indexei `tanfolyamok`
--
ALTER TABLE `tanfolyamok`
  ADD PRIMARY KEY (`t_id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `arak`
--
ALTER TABLE `arak`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=982;

--
-- AUTO_INCREMENT a táblához `curzus`
--
ALTER TABLE `curzus`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT a táblához `dog`
--
ALTER TABLE `dog`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT a táblához `ertekeles`
--
ALTER TABLE `ertekeles`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1298;

--
-- AUTO_INCREMENT a táblához `login`
--
ALTER TABLE `login`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT a táblához `naplo`
--
ALTER TABLE `naplo`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1602;

--
-- AUTO_INCREMENT a táblához `oktatok`
--
ALTER TABLE `oktatok`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=726;

--
-- AUTO_INCREMENT a táblához `resztvevo`
--
ALTER TABLE `resztvevo`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT a táblához `tanfolyamok`
--
ALTER TABLE `tanfolyamok`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25715;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
