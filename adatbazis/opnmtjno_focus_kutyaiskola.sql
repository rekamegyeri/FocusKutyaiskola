-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2025. Már 03. 12:16
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
(19, '.?', 35),
(20, 'Pipi', 36);

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
(27, 18, 'nagyon jó', 5, '2025-03-03 12:03:01'),
(28, 34, 'szuper', 5, '2025-03-03 12:04:05'),
(29, 0, 'Nagyon jó kutyaiskola, mindenkinek ajánlom!\r\nMás tanfolyamra is fogok jelentkezni', 5, '2025-03-03 12:10:02'),
(30, 31, 'Nagyon jó hely,csak ajánlani tudom.', 5, '2025-03-03 12:14:55');

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
(67, '2025-02-28 14:43:32', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18),
(68, '2025-02-28 16:47:57', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 32),
(69, '2025-03-03 12:02:48', '195.199.251.129', 'd60c39c3', 18),
(70, '2025-03-03 12:03:22', '195.199.251.129', 'd60c39c3', 0),
(71, '2025-03-03 12:03:49', '195.199.251.129', 'd60c39c3', 34),
(72, '2025-03-03 12:06:20', '195.199.251.129', 'edc4873a', 0),
(73, '2025-03-03 12:06:43', '195.199.251.129', 'edc4873a', 0),
(74, '2025-03-03 12:10:33', '195.199.251.129', 'edc4873a', 36),
(75, '2025-03-03 12:13:27', '195.199.251.129', '8dc3c187', 0),
(76, '2025-03-03 12:13:40', '195.199.251.129', '8dc3c187', 31);

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
(69, '2025-02-28 14:52:27', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/?p=adatlapom'),
(70, '2025-02-28 15:09:42', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/'),
(71, '2025-02-28 15:10:11', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 18, '/?p=kilepes'),
(72, '2025-02-28 15:10:11', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/'),
(79, '2025-02-28 15:20:17', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/?p=arlista'),
(83, '2025-02-28 16:47:41', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 0, '/?p=login'),
(85, '2025-02-28 16:48:00', '2001:4c4e:10e4:c900:b84d:a52:da31:65c6', '0463f240', 32, '/?p=adatlapom'),
(111, '2025-03-03 12:02:42', '195.199.251.129', 'd60c39c3', 0, '/?p=login'),
(112, '2025-03-03 12:02:50', '195.199.251.129', 'd60c39c3', 18, '/'),
(113, '2025-03-03 12:03:02', '195.199.251.129', 'd60c39c3', 18, '/'),
(114, '2025-03-03 12:03:04', '195.199.251.129', 'd60c39c3', 18, '/?p=kilepes'),
(115, '2025-03-03 12:03:04', '195.199.251.129', 'd60c39c3', 0, '/'),
(116, '2025-03-03 12:03:06', '195.199.251.129', 'd60c39c3', 0, '/?p=login'),
(117, '2025-03-03 12:03:25', '195.199.251.129', 'd60c39c3', 0, '/'),
(118, '2025-03-03 12:03:27', '195.199.251.129', 'd60c39c3', 0, '/?p=login'),
(119, '2025-03-03 12:03:52', '195.199.251.129', 'd60c39c3', 34, '/'),
(120, '2025-03-03 12:04:06', '195.199.251.129', 'd60c39c3', 34, '/'),
(121, '2025-03-03 12:04:08', '195.199.251.129', 'd60c39c3', 34, '/?p=kilepes'),
(129, '2025-03-03 12:06:54', '195.199.251.129', 'edc4873a', 0, '/?p=login'),
(130, '2025-03-03 12:07:33', '195.199.251.129', 'edc4873a', 0, '/'),
(131, '2025-03-03 12:08:43', '195.199.251.129', 'edc4873a', 0, '/'),
(132, '2025-03-03 12:10:04', '195.199.251.129', 'edc4873a', 0, '/'),
(133, '2025-03-03 12:10:12', '195.199.251.129', 'edc4873a', 0, '/?p=login'),
(134, '2025-03-03 12:10:37', '195.199.251.129', 'edc4873a', 36, '/'),
(135, '2025-03-03 12:13:05', '195.199.251.129', '8dc3c187', 0, '/?p=login'),
(136, '2025-03-03 12:13:14', '195.199.251.129', '8dc3c187', 0, '/?p=login'),
(137, '2025-03-03 12:13:31', '195.199.251.129', '8dc3c187', 0, '/'),
(138, '2025-03-03 12:13:33', '195.199.251.129', '8dc3c187', 0, '/?p=login'),
(139, '2025-03-03 12:13:42', '195.199.251.129', '8dc3c187', 31, '/'),
(140, '2025-03-03 12:14:18', '195.199.251.129', '8dc3c187', 31, '/'),
(141, '2025-03-03 12:14:57', '195.199.251.129', '8dc3c187', 31, '/');

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
(37, 'Réka', 'Roxy', 222, 'reka.megyeri@gmail.com', '2025-03-03 11:58:15'),
(38, 'Noémi', 'Benő', 112, 'novaknoemi5@gmail.com', '2025-03-03 11:59:12'),
(39, 'Penki', 'Pipi', 332, 'jankopenki@gmail.com', '2025-03-03 12:08:41'),
(40, 'Tóth Krisztina', 'Tütü', 112, 'tothkriszti0124@gmail.com', '2025-03-03 12:14:16');

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
(31, 'tothkriszti0124@gmail.com', 'Kriszti0124', '7a8d804ae17e1a1e5913559b5b74d564', '2025-02-28 11:53:32', '', '', '', '', '', ''),
(32, 'focusdog1@gmail.com', 'focus', 'd5d5776ac96bb8d7e1874c215b25d361', '2025-02-28 12:45:12', '', '', '', '', '', ''),
(34, 'novaknoemi5@gmail.com', 'Noemi', 'e0e3106a0ebfc188455a4c9c58b18f1f', '2025-02-28 14:01:47', '', '', '', '', '', ''),
(36, 'jankopenki@gmail.com', 'penki', 'bce56fe0f2b1aaacd854a20c6a12289c', '2025-03-03 12:07:32', '', '', '', '', '', '');

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
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `ertekeles`
--
ALTER TABLE `ertekeles`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `login`
--
ALTER TABLE `login`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT a táblához `naplo`
--
ALTER TABLE `naplo`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT a táblához `oktatok`
--
ALTER TABLE `oktatok`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=726;

--
-- AUTO_INCREMENT a táblához `resztvevo`
--
ALTER TABLE `resztvevo`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `tanfolyamok`
--
ALTER TABLE `tanfolyamok`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25715;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
