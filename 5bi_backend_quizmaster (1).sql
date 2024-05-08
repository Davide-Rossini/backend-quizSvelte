-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 28, 2024 alle 11:27
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

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
-- Struttura della tabella `punteggio`
--

CREATE TABLE `punteggio` (
  `id` int(11) NOT NULL,
  `fkUtente` varchar(36) DEFAULT NULL,
  `fkQuiz` int(11) DEFAULT NULL,
  `dataConseguimento` datetime DEFAULT NULL,
  `punteggio` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `punteggio`
--

INSERT INTO `punteggio` (`id`, `fkUtente`, `fkQuiz`, `dataConseguimento`, `punteggio`) VALUES
(5, '65bc9d8956237', 3, '2024-02-02 08:50:24', 1.00),
(6, '65bc9d9b19a48', 3, '2024-02-01 08:51:15', 0.20),
(7, '65bc9daa3753f', 1, '2024-02-02 07:50:41', 0.80),
(8, '65bc9d8956237', 1, '2024-01-01 08:51:15', 0.40);

-- --------------------------------------------------------

--
-- Struttura della tabella `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `titolo` varchar(20) DEFAULT NULL,
  `url_icon` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `quiz`
--

INSERT INTO `quiz` (`id`, `titolo`, `url_icon`) VALUES
(1, 'Cultura Generale', 'footballIcon.png'),
(3, 'Calcio', 'generalCultureIcon.png');

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
(58, 'Germania'),
(59, 'Brasile'),
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

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` varchar(36) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `username`, `email`, `hash`) VALUES
('65bc9d8956237', 'steGiro', 'ste@gmail.com', '$2y$10$iUxrLYNamGX3yy234P75vutpiSBOwJCbNfI0neQ7jprmkQedMk9eC'),
('65bc9d92812f8', 'nickBarb', 'barbi@gmail.com', '$2y$10$uYi6NagucHpEv3bp68aCe.GLKbfirAc6Gae66ajsjzezlqATiUKqq'),
('65bc9d9b19a48', 'tambaPHP', 'tamba@gmail.com', '$2y$10$o9faNTeSCxBzVeC0x.hjbeFFPkfN2pi2GhccFMVXA0TEi0VFDSXVW'),
('65bc9daa3753f', 'lory', 'lore@gmail.com', '$2y$10$K6lv32irBqIDDnoWvi.liebnZPlT7x8GS/vBLFT3ZcAkbwQpeOM1G'),
('65bca35e08775', 'pezzeCISCO', 'pezze@gmail.com', '$2y$10$j/wBUW7whX.WN6Ayml8baODSvOdFyfdSSx0I061Rq0NOvDpOX89Km'),
('65dd897f94fcb', 'comiCisco', 'comi@gmail.com', '$2y$10$phxpF8IgBb3RV1krdxrOcuvCM4eAJOd02qbKLQ8dROElCd2L5c2Re'),
('65dda93ea05cc', 'emaxxx', 'emax@gmail.com', '$2y$10$r0bSqXc3M29JdY7F1LVgHuhUpOp8visWzNBOA1UuR9gC9qUqJQHP6'),
('65dda99d2b7fd', 'Xzanna', 'ema.zanetti@gmail.com', '$2y$10$5VMt746DwamwOMLCMs5dfOQwIbUZOqsVjZg9wprOT3ugnvDNbHXZ6'),
('65ddaea4575b7', 'lucCiv69', 'forzaInter@gmail.com', '$2y$10$rLL8iYizTBgnJoKdza2y6e5qqjjhlqmUE.UoH7tu3UWSmjLrVFrAW'),
('65ddb5c26f639', 'tafakevin', 'tafa@gmail.com', '$2y$10$7iJzZewrKzV9qYOubZAQeetnFHIJxxiqFhXImFP6Lqaq8nhQok/P.'),
('65ddb7608dca4', 'johnFORTNITE', 'john@gmail.com', '$2y$10$qATji3CXTofsGw8.w6ftluHnd5xANxatbJxqhvaSwWrnm0xwuutAu'),
('65ddb7e650500', 'loreNAPOLI', 'kvara@gmail.com', '$2y$10$pAokiOflI1OpqwGcxg0.KuVKFseD.lhg.dOmBNTTKYq/wDABxzPEK'),
('65ddb856d588d', 'churchill', 'cr7@gmail.com', '$2y$10$fG1zHe7bqjhzJsuj9euQGOtkPrSt2mPpIdZGRj53kKTKFFTHo6vp2'),
('65ddbb1eaa6a4', 'touri', 'touri@gmail.com', '$2y$10$Gih4vIMZe2T7SN4/uLdobu65AgAS7e0m7MrSur1S3G/DQ/EUy6NTy');

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
-- Indici per le tabelle `punteggio`
--
ALTER TABLE `punteggio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkUtente` (`fkUtente`),
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
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
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
-- AUTO_INCREMENT per la tabella `punteggio`
--
ALTER TABLE `punteggio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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

--
-- Limiti per la tabella `punteggio`
--
ALTER TABLE `punteggio`
  ADD CONSTRAINT `punteggio_ibfk_1` FOREIGN KEY (`fkUtente`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `punteggio_ibfk_2` FOREIGN KEY (`fkQuiz`) REFERENCES `quiz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
