-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2025. Feb 28. 15:57
-- Kiszolgáló verziója: 10.6.20-MariaDB-cll-lve-log
-- PHP verzió: 8.3.14

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
(11, 'Kolyok', 'A tanfolyam segít a kölyökkutyák és gazdáik harmonikus kapcsolatának kialakításában. Játékos, pozitív módszerekkel tanítjuk az alapengedelmességet (ültetés, behívás, pórázon sétálás) és a szocializációt.'),
(22, 'Felnott', 'Ez a tanfolyam a felnőtt kutyák viselkedésének fejlesztésére és engedelmességi készségeik tökéletesítésére fókuszál. Pozitív módszerekkel segítjük a gazdikat az alapfeladatok (behívás, helyben maradás, pórázkezelés) elsajátításában, miközben javítjuk a kutya figyelmét és együttműködését.'),
(33, 'Idos', 'Ez a tanfolyam az idősebb kutyák fizikai és szellemi aktivitásának fenntartására, valamint viselkedésük finomhangolására szolgál. Kíméletes, pozitív módszerekkel segítjük őket új készségek elsajátításában vagy meglévő szokásaik megerősítésében.'),
(44, 'Agility', 'Az agility tanfolyam során a kutyák és gazdáik egy izgalmas, akadálypályás sportot tanulnak meg, amely fejleszti a kutya fizikai állóképességét, gyorsaságát és figyelmét. A tanfolyam célja, hogy erősítse a gazdi-kutya kapcsolatot, miközben mindkét fél szórakozik és fejlődik.'),
(55, 'Orzo-vedo', 'Az őrző-védő tanfolyam a kutyák természetes védelmező ösztönét fejleszti kontrollált környezetben, megtanítva a megfelelő reakciókat veszélyhelyzetekben.'),
(66, 'Egyeni', 'Az egyéni kutyatanfolyam személyre szabott képzést kínál, amely teljesen a kutya és gazdája igényeire van szabva. Legyen szó viselkedési problémák kezeléséről, speciális készségek fejlesztéséről vagy az alapok elsajátításáról, a tanfolyam rugalmas és hatékony megoldást nyújt, saját tempóban haladva.');

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
(2, 'Rox', 18),
(14, 'pipi', 30),
(15, 'Tütüke', 31),
(16, 'Max', 32),
(18, 'Reka', 34),
(19, '.?', 35);

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
(23, 18, 'dfghjo', 3, '2025-02-28 08:40:33'),
(24, 18, '', 3, '2025-02-28 09:35:56'),
(25, 0, '.', 1, '2025-02-28 14:11:05'),
(26, 18, 'awsertzj', 3, '2025-02-28 14:13:17');

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
(21, '2025-02-18 13:51:59', '::1', 'v7hrmiep', 18),
(22, '2025-02-18 13:52:34', '::1', 'v7hrmiep', 18),
(23, '2025-02-18 14:02:42', '::1', 'v7hrmiep', 18),
(24, '2025-02-18 14:02:59', '::1', 'v7hrmiep', 18),
(25, '2025-02-18 14:04:00', '::1', 'v7hrmiep', 18),
(26, '2025-02-18 14:04:11', '::1', 'v7hrmiep', 18),
(27, '2025-02-18 14:04:34', '::1', 'v7hrmiep', 18),
(28, '2025-02-18 14:05:04', '::1', 'v7hrmiep', 18),
(29, '2025-02-18 14:06:06', '::1', 'v7hrmiep', 18),
(30, '2025-02-18 14:06:23', '::1', 'v7hrmiep', 18),
(31, '2025-02-18 14:06:53', '::1', 'v7hrmiep', 18),
(32, '2025-02-18 14:07:09', '::1', 'v7hrmiep', 18),
(33, '2025-02-18 14:07:52', '::1', 'v7hrmiep', 18),
(34, '2025-02-18 14:10:51', '::1', 'v7hrmiep', 18),
(35, '2025-02-18 14:11:18', '::1', 'v7hrmiep', 18),
(36, '2025-02-19 13:52:45', '::1', '462t0m7o', 24),
(37, '2025-02-19 13:54:16', '::1', '462t0m7o', 24),
(38, '2025-02-21 08:49:54', '2a00:1110:114:4b13:9d25:4082:bbd3:dd02', '3652e6f5', 24),
(39, '2025-02-21 10:12:23', '195.199.251.129', '3da5f45f', 24),
(40, '2025-02-21 10:34:17', '195.199.251.129', '3da5f45f', 24),
(41, '2025-02-25 11:08:09', '37.76.44.200', 'f2249a74', 0),
(42, '2025-02-25 11:15:42', '2001:738:80e:daf3:493a:f296:98de:1060', 'acd4c028', 28),
(43, '2025-02-27 17:00:48', '2a00:1110:133:6114:205e:5610:16f:4ffa', '1a0219c0', 18),
(44, '2025-02-27 17:22:01', '5.187.150.202', '0463f240', 18),
(45, '2025-02-27 17:25:47', '5.187.150.202', '0463f240', 18),
(46, '2025-02-27 17:26:04', '5.187.150.202', '0463f240', 18),
(47, '2025-02-27 19:40:48', '2a00:1110:133:6114:205e:5610:16f:4ffa', 'bc58b4d4', 18),
(48, '2025-02-27 20:07:56', '5.187.150.202', '599c65d8', 29),
(49, '2025-02-28 08:36:18', '195.199.251.129', '0463f240', 18),
(50, '2025-02-28 09:10:57', '195.199.251.129', '0463f240', 18),
(51, '2025-02-28 10:53:08', '195.199.251.129', '0463f240', 0),
(52, '2025-02-28 10:54:25', '195.199.251.129', '0463f240', 12),
(53, '2025-02-28 10:57:25', '195.199.251.129', '0463f240', 18),
(54, '2025-02-28 11:53:52', '130.43.214.104', 'ccf94d98', 31),
(55, '2025-02-28 14:01:59', '2001:4c4e:10e4:c900:9196:b9e6:92f6:9843', 'fdc7287b', 34),
(56, '2025-02-28 14:08:17', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(57, '2025-02-28 14:16:24', '2a0a:f640:1701:7141::1', 'f604b35a', 0),
(58, '2025-02-28 14:16:43', '2a0a:f640:1701:7141::1', 'f604b35a', 0),
(59, '2025-02-28 14:18:04', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(60, '2025-02-28 14:18:23', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(61, '2025-02-28 14:20:37', '2a0a:f640:1701:7141::1', 'f604b35a', 35),
(62, '2025-02-28 14:23:05', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(63, '2025-02-28 14:23:48', '2a0a:f640:1701:7141::1', 'f604b35a', 0),
(64, '2025-02-28 14:24:01', '2a0a:f640:1701:7141::1', 'f604b35a', 35),
(65, '2025-02-28 14:27:50', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(66, '2025-02-28 14:29:26', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(67, '2025-02-28 14:43:32', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18);

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
(1, '0000-00-00 00:00:00', '', '', 0, ''),
(2, '2024-10-21 12:12:59', '::1', 'g6pvko0e', 0, '/reka_m/backend/?p=login'),
(3, '2024-10-21 12:13:17', '::1', 'g6pvko0e', 0, '/reka_m/backend/'),
(4, '2024-10-21 12:13:19', '::1', 'g6pvko0e', 0, '/reka_m/backend/?p=login'),
(5, '2024-10-21 12:13:20', '::1', 'g6pvko0e', 0, '/reka_m/backend/?p=regisztracio'),
(6, '2024-10-21 12:14:01', '::1', 'g6pvko0e', 0, '/reka_m/backend/?p=login'),
(7, '2024-10-21 12:14:10', '::1', 'g6pvko0e', 0, '/reka_m/backend/'),
(8, '2024-10-21 12:18:24', '::1', 'g6pvko0e', 12, '/reka_m/backend/'),
(9, '2024-10-21 12:18:25', '::1', 'g6pvko0e', 0, '/reka_m/backend/'),
(10, '2024-10-21 12:18:58', '::1', 'g6pvko0e', 0, '/reka_m/backend/?p=login'),
(11, '2024-10-21 12:19:13', '::1', 'g6pvko0e', 12, '/reka_m/backend/'),
(12, '2024-10-21 12:23:59', '::1', 'g6pvko0e', 12, '/reka_m/backend/'),
(13, '2024-10-21 12:24:02', '::1', 'g6pvko0e', 0, '/reka_m/backend/'),
(14, '2024-10-21 12:24:14', '::1', 'g6pvko0e', 0, '/reka_m/backend/?p=login'),
(15, '2024-10-21 12:24:28', '::1', 'g6pvko0e', 0, '/reka_m/backend/login_ir.php'),
(16, '2024-10-21 12:24:28', '::1', 'g6pvko0e', 12, '/reka_m/backend/'),
(17, '2024-10-21 12:47:42', '::1', 'ai1kg31d', 0, '/reka_m/backend/'),
(18, '2024-10-21 12:47:45', '::1', 'ai1kg31d', 0, '/reka_m/backend/?p=login'),
(19, '2024-10-21 12:47:54', '::1', 'ai1kg31d', 0, ''),
(20, '2024-10-21 12:47:54', '::1', 'ai1kg31d', 12, '/reka_m/backend/'),
(21, '2024-10-21 13:36:06', '::1', 'ai1kg31d', 12, '/reka_m/backend/?p=adatlapom'),
(22, '2024-10-24 10:07:15', '::1', 'j9ndsln6', 0, '/reka_m/backend/'),
(23, '2024-10-24 10:07:16', '::1', 'j9ndsln6', 0, '/reka_m/backend/?p=login'),
(24, '2024-10-24 10:07:25', '::1', 'j9ndsln6', 12, '/reka_m/backend/'),
(25, '2024-10-24 10:07:27', '::1', 'j9ndsln6', 12, '/reka_m/backend/?p=adatlapom'),
(26, '2024-10-24 10:10:57', '::1', 'j9ndsln6', 0, '/reka_m/backend/'),
(27, '2024-10-24 10:10:59', '::1', 'j9ndsln6', 0, '/reka_m/backend/?p=login'),
(28, '2024-10-24 10:11:08', '::1', 'j9ndsln6', 12, '/reka_m/backend/'),
(29, '2024-10-24 10:12:22', '::1', 'j9ndsln6', 0, '/reka_m/backend/'),
(30, '2024-10-24 10:12:24', '::1', 'j9ndsln6', 0, '/reka_m/backend/?p=login'),
(31, '2024-10-24 10:12:32', '::1', 'j9ndsln6', 12, '/reka_m/backend/'),
(32, '2024-10-24 10:17:56', '::1', 'j9ndsln6', 0, '/reka_m/backend/'),
(33, '2024-10-24 10:17:57', '::1', 'j9ndsln6', 0, '/reka_m/backend/?p=login'),
(34, '2024-10-24 10:18:08', '::1', 'j9ndsln6', 12, '/reka_m/backend/'),
(35, '2024-10-24 10:18:57', '::1', 'j9ndsln6', 0, '/reka_m/backend/'),
(36, '2024-10-24 10:18:58', '::1', 'j9ndsln6', 0, '/reka_m/backend/?p=login'),
(37, '2024-10-24 10:19:05', '::1', 'j9ndsln6', 12, '/reka_m/backend/'),
(38, '2024-11-04 13:52:48', '::1', 'q4ddv2o0', 0, '/reka_m/backend/'),
(39, '2024-11-04 13:52:52', '::1', 'q4ddv2o0', 0, '/reka_m/backend/?p=login'),
(40, '2024-11-04 13:52:58', '::1', 'q4ddv2o0', 12, '/reka_m/backend/'),
(41, '2024-11-04 13:53:00', '::1', 'q4ddv2o0', 12, '/reka_m/backend/?p=adatlapom'),
(42, '2024-11-07 10:15:56', '::1', 'slqccag6', 0, '/reka_m/backend/'),
(43, '2024-11-07 10:16:18', '::1', 'slqccag6', 0, '/reka_m/backend/'),
(44, '2024-11-11 12:02:30', '::1', 'n9liakk1', 0, '/reka_m/backend/'),
(45, '2024-11-11 12:06:32', '::1', 'n9liakk1', 0, '/reka_m/backend/'),
(46, '2024-11-11 12:07:05', '::1', 'n9liakk1', 0, '/reka_m/backend/?p=login'),
(47, '2024-11-11 12:16:02', '::1', 'n9liakk1', 0, '/reka_m/backend/'),
(48, '2024-11-11 13:42:03', '::1', 'n9liakk1', 0, '/reka_m/backend/'),
(49, '2024-11-11 13:42:04', '::1', 'n9liakk1', 0, '/reka_m/backend/?p=login'),
(50, '2024-11-11 13:42:49', '::1', 'n9liakk1', 0, '/reka_m/backend/?p=login'),
(51, '2024-11-11 13:42:56', '::1', 'n9liakk1', 12, '/reka_m/backend/'),
(52, '2024-11-11 13:43:00', '::1', 'n9liakk1', 12, '/reka_m/backend/?p=adatlapom'),
(53, '2024-11-28 11:06:38', '::1', 'fscbgmeh', 0, '/reka_m/backend/'),
(54, '2024-11-28 11:06:51', '::1', 'fscbgmeh', 0, '/reka_m/backend/'),
(55, '2025-01-16 10:27:40', '::1', 'rvnu6nfk', 13, '/reka_m/FOCUS/backend-orai/index.php'),
(56, '2025-01-16 10:27:44', '::1', 'rvnu6nfk', 0, '/reka_m/FOCUS/backend-orai/'),
(57, '2025-02-28 14:43:25', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(58, '2025-02-28 14:43:26', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/?p=login'),
(59, '2025-02-28 14:43:34', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(60, '2025-02-28 14:48:28', '2a02:ab88:140f:6380:6d05:1724:d7d:4bc5', '5f563be6', 0, '/'),
(61, '2025-02-28 14:48:32', '2a02:ab88:140f:6380:6d05:1724:d7d:4bc5', '5f563be6', 0, '/'),
(62, '2025-02-28 14:48:32', '213.163.23.71', '7593cabd', 0, '/'),
(63, '2025-02-28 14:48:33', '2a02:ab88:140f:6380:6d05:1724:d7d:4bc5', '5f563be6', 0, '/'),
(64, '2025-02-28 14:48:46', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(65, '2025-02-28 14:48:56', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(66, '2025-02-28 14:51:38', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(67, '2025-02-28 14:51:49', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(68, '2025-02-28 14:52:04', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(69, '2025-02-28 14:52:27', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/?p=adatlapom'),
(70, '2025-02-28 15:09:42', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(71, '2025-02-28 15:10:11', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/?p=kilepes'),
(72, '2025-02-28 15:10:11', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(73, '2025-02-28 15:20:08', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(74, '2025-02-28 15:20:10', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(75, '2025-02-28 15:20:10', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(76, '2025-02-28 15:20:11', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(77, '2025-02-28 15:20:12', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(78, '2025-02-28 15:20:13', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(79, '2025-02-28 15:20:17', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/?p=arlista'),
(80, '2025-02-28 15:20:42', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(81, '2025-02-28 15:20:48', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/?p=arlista');

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
(110, 'Takács Boldizsár', 'Zara', 'takacsboldizsar@focusdog.hu', '20/111-2222'),
(220, 'Molnár Bernadett', 'Marley', 'molnarbernadett@focusdog.hu', '50/876-5432'),
(330, 'Nagy Ákos', 'Colin', 'nagyakos@focusdog.hu', '30/123-4567'),
(440, 'Tóth Kata', 'Luna', 'tothkata@focusdog.hu', '20/987-6543'),
(550, 'Kovács Tünde', 'Ruby', 'kovacstunde@focusdog.hu', '31/234-5678'),
(660, 'Kiss Erik', 'Max', 'kisserik@focusdog.hu', '70/555-1234');

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
(1, 'Réka', '0', 112, '', '0000-00-00 00:00:00'),
(2, 'Réka', 'Roxy', 113, '', '0000-00-00 00:00:00'),
(3, 'Réka', 'Roxy', 333, '', '0000-00-00 00:00:00'),
(4, 'Réka', 'Roxy', 442, '', '0000-00-00 00:00:00'),
(5, 'Réka', 'Roxy', 442, '', '0000-00-00 00:00:00'),
(6, 'Réka', 'Roxy', 442, '', '0000-00-00 00:00:00'),
(7, 'Réka', 'Roxy', 442, '', '0000-00-00 00:00:00'),
(8, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(9, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(10, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(11, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(13, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(14, 'Réka', 'Roxy', 222, '', '0000-00-00 00:00:00'),
(15, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(16, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(17, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(18, 'Réka', 'Roxy', 112, '', '0000-00-00 00:00:00'),
(19, 'Réka', 'Roxy', 442, '', '0000-00-00 00:00:00'),
(20, 'Réka', 'Roxy', 333, '', '0000-00-00 00:00:00'),
(21, 'Réka', 'Roxy', 333, '', '0000-00-00 00:00:00'),
(22, 'Réka', 'Roxy', 333, '', '0000-00-00 00:00:00'),
(23, 'Réka', 'Roxy', 442, '', '0000-00-00 00:00:00'),
(24, 'Réka', 'Roxy', 332, '', '0000-00-00 00:00:00'),
(25, 'Gipsz Jakabné', 'Brexy', 112, '', '0000-00-00 00:00:00'),
(26, 'Megyeri György ', 'Benő', 112, '', '0000-00-00 00:00:00'),
(27, 'Kazuar', 'Tütüke', 552, '', '0000-00-00 00:00:00'),
(28, 'Reka', 'Rox', 332, '', '0000-00-00 00:00:00'),
(29, 'Tóth Krisztina', 'Tütüke', 552, '', '0000-00-00 00:00:00'),
(30, 'Réka', 'Roxy', 332, '', '0000-00-00 00:00:00'),
(31, '.', '.', 112, '', '0000-00-00 00:00:00'),
(32, 'Réka', 'Roxy', 333, '', '2025-02-28 14:33:51'),
(33, 'Réka', 'Roxy', 223, '', '0000-00-00 00:00:00'),
(34, 'Réka', 'Roxy', 112, '', '2025-02-28 14:37:48'),
(35, 'Réka', 'Roxy', 112, '', '2025-02-28 14:48:55'),
(36, 'valaki', 'Roxy', 112, 'reka.megyeri@gmail.com', '2025-02-28 14:52:03');

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
(442, 'agility', '2025-08-18', '2025-09-22', 440, 44),
(552, 'orzo-vedo', '2025-08-04', '2025-10-27', 550, 55),
(662, 'egyeni', '0000-00-00', '0000-00-00', 660, 66);

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
(18, 'reka.megyeri@gmail.com', 'rekamegyeri5', 'e4b431e794b1df142f56dd732e0798b0', '2025-02-18 13:50:25', '18_250228133921_lpzf5.png', '11zon_cropped.png', '', '', '', ''),
(30, 'jankopenki@gmail.com', 'penki', '0d444b1dfb22211a554a67657c8294a0', '2025-02-28 11:11:51', '', '', '', '', '', ''),
(31, 'tothkriszti0124@gmail.com', 'Kriszti0124', '7a8d804ae17e1a1e5913559b5b74d564', '2025-02-28 11:53:32', '', '', '', '', '', ''),
(32, 'focusdog1@gmail.com', 'focus', 'd5d5776ac96bb8d7e1874c215b25d361', '2025-02-28 12:45:12', '', '', '', '', '', ''),
(34, 'novaknoemi5@gmail.com', 'Noemi', 'e0e3106a0ebfc188455a4c9c58b18f1f', '2025-02-28 14:01:47', '', '', '', '', '', ''),
(35, 'aligatorpisti@gmail.com', '.!', 'c7459660f480ba37448cc26a2f563f30', '2025-02-28 14:19:06', '35_250228132258_gwcn9.jpg', '', '', '', '', '');

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
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `ertekeles`
--
ALTER TABLE `ertekeles`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT a táblához `login`
--
ALTER TABLE `login`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT a táblához `naplo`
--
ALTER TABLE `naplo`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT a táblához `oktatok`
--
ALTER TABLE `oktatok`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=726;

--
-- AUTO_INCREMENT a táblához `resztvevo`
--
ALTER TABLE `resztvevo`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT a táblához `tanfolyamok`
--
ALTER TABLE `tanfolyamok`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25715;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
