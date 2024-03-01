-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 27, 2024 alle 23:45
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5bi_backend_quizmaster`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `appartiene`
--

CREATE TABLE `appartiene` (
  `fkRisposta` int(11) NOT NULL,
  `fkDomanda` int(11) NOT NULL,
  `corretta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `appartiene`
--

INSERT INTO `appartiene` (`fkRisposta`, `fkDomanda`, `corretta`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 1, 0),
(22, 1, 0),
(23, 1, 0),
(24, 2, 0),
(25, 2, 0),
(26, 2, 0),
(27, 3, 0),
(28, 3, 0),
(29, 3, 0),
(30, 4, 0),
(31, 4, 0),
(32, 4, 0),
(33, 5, 0),
(34, 5, 0),
(35, 5, 0),
(36, 6, 0),
(37, 6, 0),
(38, 6, 0),
(39, 7, 0),
(40, 7, 0),
(41, 7, 0),
(42, 8, 0),
(43, 8, 0),
(44, 8, 0),
(45, 9, 0),
(46, 9, 0),
(47, 9, 0),
(48, 10, 0),
(49, 10, 0),
(50, 10, 0),
(51, 11, 0),
(52, 11, 0),
(53, 11, 0),
(54, 12, 0),
(55, 12, 0),
(56, 12, 0),
(57, 13, 0),
(58, 13, 0),
(59, 13, 0),
(60, 14, 0),
(61, 14, 0),
(62, 14, 0),
(63, 15, 0),
(64, 15, 0),
(65, 15, 0),
(66, 16, 0),
(67, 16, 0),
(68, 16, 0),
(69, 17, 0),
(70, 17, 0),
(71, 17, 0),
(72, 18, 0),
(73, 18, 0),
(74, 18, 0),
(75, 19, 0),
(76, 19, 0),
(77, 19, 0),
(78, 20, 0),
(79, 20, 0),
(80, 20, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `domanda`
--

CREATE TABLE `domanda` (
  `id` int(11) NOT NULL,
  `testo` varchar(100) DEFAULT NULL,
  `fkQuiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `domanda`
--

INSERT INTO `domanda` (`id`, `testo`, `fkQuiz`) VALUES
(1, 'Chi è l\'autore del famoso romanzo \"Il Conte di Montecristo\"?', 1),
(2, 'In quale anno è stata fondata l\'Organizzazione delle Nazioni Unite (ONU)?', 1),
(3, 'Qual è il simbolo chimico dell\'oro sulla tavola periodica degli elementi?', 1),
(4, 'Qual è la capitale del Giappone?', 1),
(5, 'Chi è stato il primo presidente degli Stati Uniti?', 1),
(6, 'Qual è il fiume più lungo del mondo?', 1),
(7, 'Chi è l\'autore della famosa opera \"Romeo e Giulietta\"?', 1),
(8, 'Qual è il più grande oceano del mondo?', 1),
(9, 'In quale continente si trova il deserto del Sahara?', 1),
(10, 'Qual è il primo elemento della tavola periodica degli elementi?', 1),
(11, 'Qual è la squadra di calcio con il maggior numero di vittorie in Serie A?', 3),
(12, 'Chi è il miglior marcatore di tutti i tempi nella storia della FIFA World Cup?', 3),
(13, 'Quale paese ha vinto più Coppe del Mondo FIFA?', 3),
(14, 'In quale anno si è svolta la prima Coppa del Mondo FIFA?', 3),
(15, 'Chi ha vinto il Pallone d\'Oro nel 2020?', 3),
(16, 'Qual è lo stadio di calcio più grande del mondo?', 3),
(17, 'Chi è il miglior assist-man nella storia della Premier League?', 3),
(18, 'Quale squadra ha vinto più UEFA Champions League?', 3),
(19, 'Qual è il club di calcio più antico d Inghilterra?', 3),
(20, 'Chi ha vinto il titolo di Capocannoniere in Serie A nella stagione 2020-2021?', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `titolo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `quiz`
--

INSERT INTO `quiz` (`id`, `titolo`) VALUES
(1, 'Cultura Generale'),
(3, 'Calcio');

-- --------------------------------------------------------

--
-- Struttura della tabella `risposta`
--

CREATE TABLE `risposta` (
  `id` int(11) NOT NULL,
  `testo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `risposta`
--

INSERT INTO `risposta` (`id`, `testo`) VALUES
(1, 'Alexandre Dumas'),
(2, '1945'),
(3, 'Au'),
(4, 'Tokyo'),
(5, 'George Washington'),
(6, 'Il fiume Amazzoni'),
(7, 'William Shakespeare'),
(8, 'Oceano Pacifico'),
(9, 'Africa'),
(10, 'Idrogeno'),
(11, 'Juventus'),
(12, 'Miroslav Klose'),
(13, 'Brasile'),
(14, '1930'),
(15, 'Robert Lewandowski'),
(16, 'Rungrado May Day'),
(17, 'Ryan Giggs'),
(18, 'Real Madrid'),
(19, 'Sheffield FC'),
(20, 'Cristiano Ronaldo'),
(21, 'Charles Dickens'),
(22, 'Jane Austen'),
(23, 'Fyodor Dostoevsky'),
(24, '1925'),
(25, '1950'),
(26, '1965'),
(27, 'Ag'),
(28, 'Fe'),
(29, 'Cu'),
(30, 'Beijing'),
(31, 'Seoul'),
(32, 'Bangkok'),
(33, 'Thomas Jefferson'),
(34, 'Abraham Lincoln'),
(35, 'John Adams'),
(36, 'Nilo'),
(37, 'Mississippi'),
(38, 'Danubio'),
(39, 'Jane Austen'),
(40, 'Leo Tolstoy'),
(41, 'Charles Dickens'),
(42, 'Oceano Atlantico'),
(43, 'Oceano Indiano'),
(44, 'Oceano Antartico'),
(45, 'Antartide'),
(46, 'Asia'),
(47, 'America del Nord'),
(48, 'Ossigeno'),
(49, 'Azoto'),
(50, 'Carbonio'),
(51, 'AC Milan'),
(52, 'FC Barcelona'),
(53, 'Manchester United'),
(54, 'Diego Maradona'),
(55, 'Pele'),
(56, 'Ronaldo Nazario'),
(57, 'Argentina'),
(58, 'Germany'),
(59, 'Brazil'),
(60, '1990'),
(61, '2002'),
(62, '2018'),
(63, 'Lionel Messi'),
(64, 'Neymar'),
(65, 'Virgil van Dijk'),
(66, 'Camp Nou'),
(67, 'Old Trafford'),
(68, 'Maracanã'),
(69, 'Frank Lampard'),
(70, 'Xavi Hernandez'),
(71, 'Andrea Pirlo'),
(72, 'Bayern Munich'),
(73, 'FC Barcelona'),
(74, 'Liverpool FC'),
(75, 'Nottingham Forest'),
(76, 'Liverpool'),
(77, 'Manchester United'),
(78, 'Lionel Messi'),
(79, 'Ciro Immobile'),
(80, 'Erling Haaland');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `appartiene`
--
ALTER TABLE `appartiene`
  ADD PRIMARY KEY (`fkRisposta`,`fkDomanda`),
  ADD KEY `fkDomanda` (`fkDomanda`);

--
-- Indici per le tabelle `domanda`
--
ALTER TABLE `domanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkQuiz` (`fkQuiz`);

--
-- Indici per le tabelle `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `risposta`
--
ALTER TABLE `risposta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `domanda`
--
ALTER TABLE `domanda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `risposta`
--
ALTER TABLE `risposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `appartiene`
--
ALTER TABLE `appartiene`
  ADD CONSTRAINT `appartiene_ibfk_1` FOREIGN KEY (`fkDomanda`) REFERENCES `domanda` (`id`),
  ADD CONSTRAINT `appartiene_ibfk_2` FOREIGN KEY (`fkRisposta`) REFERENCES `risposta` (`id`);

--
-- Limiti per la tabella `domanda`
--
ALTER TABLE `domanda`
  ADD CONSTRAINT `domanda_ibfk_1` FOREIGN KEY (`fkQuiz`) REFERENCES `quiz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
