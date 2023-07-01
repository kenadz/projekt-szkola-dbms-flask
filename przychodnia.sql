SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `lekarze` (
  `id_lekarza` int(11) NOT NULL,
  `imie_lek` varchar(100) NOT NULL,
  `nazwisko_lek` varchar(100) NOT NULL,
  `specjalizacja` varchar(100) NOT NULL,
  `telefon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `lekarze` (`id_lekarza`, `imie_lek`, `nazwisko_lek`, `specjalizacja`, `telefon`, `email`) VALUES
(1, 'Janina', 'Kowalska', 'Pediatria', '123-456-789', 'jkowalska@pediatria.pl'),
(2, 'Adam', 'Nowak', 'Chirurgia', '987-654-321', 'anowak@chirurgia.pl'),
(3, 'Anna', 'Wiśniewska', 'Urologia', '555-444-333', 'awisniewska@urologia.pl'),
(4, 'Jan', 'Kowalewski', 'Ginekologia', '111-222-333', 'jkowalewski@ginekologia.pl'),
(5, 'Katarzyna', 'Kaczmarek', 'Okulistyka', '999-888-777', 'kkaczmarek@okulistyka.pl'),
(6, 'Michał', 'Zieliński', 'Dermatologia', '444-555-666', 'mzielinski@dermatologia.pl'),
(7, 'Ewa', 'Kozłowska', 'Kardiologia', '222-333-444', 'ekozlowska@kardiologia.pl'),
(8, 'Marek', 'Kowalczyk', 'Psychiatria', '777-888-999', 'mkowalczyk@psychiatria.pl'),
(9, 'Magdalena', 'Woźniak', 'Neurochirurgia', '333-444-555', 'mwozniak@neurochirurgia.pl'),
(10, 'Jakub', 'Adamczyk', 'Pediatria', '777-666-555', 'jadamczyk@pediatria.pl'),
(11, 'Agnieszka', 'Zając', 'Chirurgia', '444-555-666', 'azajac@chirurgia.pl'),
(12, 'Tomasz', 'Lewandowski', 'Urologia', '111-222-333', 'tlewandowski@urologia.pl'),
(13, 'Monika', 'Kowalczyk', 'Ginekologia', '888-777-666', 'mkowalczyk@ginekologia.pl'),
(14, 'Marcin', 'Szymański', 'Okulistyka', '555-444-333', 'mszymanski@okulistyka.pl'),
(15, 'Joanna', 'Nowakowska', 'Dermatologia', '222-333-444', 'jnowakowska@dermatologia.pl'),
(16, 'Adam', 'Kowalski', 'Kardiologia', '999-888-777', 'akowalski@kardiologia.pl'),
(17, 'Małgorzata', 'Jankowska', 'Neurochirurgia', '444-555-666', 'mjankowska@neurochirurgia.pl'),
(18, 'Michał', 'Kaczmarek', 'Pediatria', '777-888-999', 'mkaczmarek@pediatria.pl'),
(19, 'Marta', 'Kowalska', 'Chirurgia', '555-444-333', 'mkowalska@chirurgia.pl'),
(25, 'Anna', 'Kowalska', 'Chirurgia', '123-456-789', 'annakowalska@asd.pl'),
(27, 'Anna', 'Borek', 'Pediatria', '222-444-333', 'aborek@pediatria.pl'),
(28, 'Adam', 'Nowak', 'Urologia', '123-456-789', 'anowak@urologia.pl');

CREATE TABLE `pacjenci` (
  `id_pacjenta` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `adres` varchar(100) NOT NULL,
  `telefon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pacjenci` (`id_pacjenta`, `imie`, `nazwisko`, `data_urodzenia`, `adres`, `telefon`, `email`) VALUES
(1, 'Amber', 'Babber', '1989-07-15', '89 Gateway Road', '567-535-2541', 'ababber0@wiley.com'),
(2, 'Linet', 'Stedmond', '1976-06-15', '755 Buhler Plaza', '719-224-3866', 'lstedmond1@google.com.au'),
(3, 'Angeline', 'Dengel', '1964-06-09', '2800 Montana Avenue', '303-898-2839', 'adengel2@hp.com'),
(4, 'Natty', 'Currier', '1961-06-16', '97 Kipling Circle', '923-961-4280', 'ncurrier3@webs.com'),
(5, 'Elisabetta', 'Perett', '1987-07-10', '02868 Pleasure Trail', '185-847-5604', 'eperett4@meetup.com'),
(6, 'Nona', 'Barton', '1980-11-23', '2768 Bunker Hill Crossing', '704-754-6184', 'nbarton5@vk.com'),
(7, 'Gearard', 'Bridgett', '1983-09-04', '371 Elmside Road', '359-919-1737', 'gbridgett6@wikipedia.org'),
(8, 'Josey', 'Wraighte', '1984-11-28', '159 Pepper Wood Hill', '288-545-8690', 'jwraighte7@free.fr'),
(9, 'Cindelyn', 'Sandey', '1964-06-06', '497 Del Mar Alley', '101-752-6832', 'csandey8@cam.ac.uk'),
(10, 'Dolores', 'Von Salzberg', '1965-07-17', '6881 Lighthouse Bay Parkway', '797-357-1489', 'dvonsalzberg9@nydailynews.com'),
(11, 'Susette', 'Soares', '1964-01-30', '0 Green Ridge Junction', '339-526-9204', 'ssoaresa@friendfeed.com'),
(12, 'Virgil', 'Christou', '1960-07-19', '42652 Meadow Vale Alley', '728-308-5374', 'vchristoub@tripadvisor.com'),
(13, 'Gwenny', 'O\'Reilly', '1997-08-13', '5 Kipling Center', '377-903-8750', 'goreillyc@youtube.com'),
(14, 'Millie', 'Letrange', '1976-06-03', '1 Monterey Court', '788-387-8253', 'mletranged@prlog.org'),
(15, 'Venita', 'Toffel', '1964-12-31', '92854 Pearson Crossing', '784-917-9224', 'vtoffele@abc.net.au'),
(16, 'Sybille', 'Knowlden', '1992-04-13', '08 Iowa Pass', '566-194-5776', 'sknowldenf@walmart.com'),
(17, 'Channa', 'Valsler', '1994-12-17', '30 Vahlen Lane', '617-636-9491', 'cvalslerg@usgs.gov'),
(18, 'Nat', 'Greenley', '1986-06-20', '4 Loftsgordon Lane', '829-626-3395', 'ngreenleyh@google.cn'),
(19, 'Shirlee', 'Gibben', '1985-04-13', '6689 Dryden Street', '275-443-7913', 'sgibbeni@google.com.hk'),
(20, 'Deanne', 'Dwine', '1999-08-14', '5 Reinke Hill', '460-393-0881', 'ddwinej@netlog.com'),
(21, 'Arch', 'Koeppke', '1997-08-13', '616 Bonner Road', '234-856-1629', 'akoeppkek@miitbeian.gov.cn'),
(22, 'Jen', 'Fozard', '1972-04-24', '59202 Farmco Street', '710-442-0584', 'jfozardl@wordpress.org'),
(23, 'Ronica', 'Lestor', '1965-12-18', '831 Pankratz Way', '846-911-2614', 'rlestorm@opera.com'),
(24, 'Mirabella', 'Walding', '1986-06-21', '003 Sutherland Alley', '831-639-6614', 'mwaldingn@hexun.com'),
(25, 'Katalin', 'Tremellan', '1964-06-19', '8 Mitchell Pass', '727-261-7891', 'ktremellano@cnn.com'),
(26, 'Dee dee', 'Machon', '1966-03-16', '2 Logan Street', '971-274-5585', 'dmachonp@theguardian.com'),
(27, 'Kristina', 'Gale', '1965-05-12', '568 Jenifer Lane', '193-555-1882', 'kgaleq@sitemeter.com'),
(28, 'Tove', 'Good', '1972-08-20', '69689 Morningstar Avenue', '635-599-2251', 'tgoodr@typepad.com'),
(29, 'Ely', 'Lomis', '1989-09-01', '4 Columbus Place', '580-452-1337', 'elomiss@opensource.org'),
(30, 'Gav', 'Yitzovicz', '1966-09-15', '7 Prairie Rose Hill', '132-581-8817', 'gyitzoviczt@pinterest.com'),
(31, 'Carine', 'Symms', '1985-08-19', '740 Independence Alley', '780-155-4301', 'csymmsu@cnn.com'),
(32, 'Arni', 'Standidge', '1975-04-02', '67 Carpenter Lane', '792-147-4287', 'astandidgev@fda.gov'),
(33, 'Boot', 'Antoniewicz', '1965-12-16', '342 Onsgard Lane', '568-552-0857', 'bantoniewiczw@google.nl'),
(34, 'Liana', 'Careswell', '1975-01-04', '07898 Crest Line Court', '212-241-4161', 'lcareswellx@loc.gov'),
(35, 'Aleen', 'Giroldo', '1965-08-21', '98928 Knutson Pass', '997-777-3361', 'agiroldoy@sciencedaily.com'),
(36, 'Holt', 'Ruffli', '1962-08-24', '9175 Grim Terrace', '468-361-4349', 'hruffliz@newsvine.com'),
(37, 'Chantalle', 'Carverhill', '1998-10-15', '685 Anhalt Terrace', '704-496-4205', 'ccarverhill10@woothemes.com'),
(38, 'Renard', 'Simo', '1986-10-22', '760 Scofield Way', '986-488-3063', 'rsimo11@about.com'),
(39, 'Gordan', 'Jersch', '1986-08-08', '08297 Dorton Avenue', '446-218-6415', 'gjersch12@vistaprint.com'),
(40, 'Basilius', 'Blincoe', '1967-06-15', '1 Shelley Way', '214-876-6836', 'bblincoe13@illinois.edu'),
(41, 'Pete', 'Dumsday', '1978-11-13', '5309 Debra Park', '779-110-8457', 'pdumsday14@sina.com.cn'),
(42, 'Carlie', 'Cavilla', '1966-12-19', '9407 Lakeland Point', '217-275-4597', 'ccavilla15@seesaa.net'),
(43, 'Norma', 'Capron', '1995-01-12', '307 Loeprich Parkway', '414-968-3717', 'ncapron16@nasa.gov'),
(44, 'Granger', 'Hallgath', '1982-12-17', '83533 Judy Place', '405-929-9265', 'ghallgath17@shinystat.com'),
(45, 'Marsh', 'McNeilley', '1986-11-17', '3222 Main Point', '489-797-6400', 'mmcneilley18@omniture.com'),
(46, 'Ignacius', 'Houndsom', '1962-01-28', '6 Chinook Center', '319-389-1945', 'ihoundsom19@cnbc.com'),
(47, 'Delinda', 'Labden', '1971-05-07', '0 Lotheville Lane', '107-184-9199', 'dlabden1a@last.fm'),
(48, 'Brit', 'Greaser', '1996-12-12', '77 Loftsgordon Junction', '243-402-6407', 'bgreaser1b@hibu.com'),
(49, 'Iormina', 'Mouget', '1981-01-30', '42 Lakewood Street', '466-387-7744', 'imouget1c@mac.com'),
(50, 'Eduino', 'Pyke', '1968-11-05', '1 Thompson Hill', '828-165-4361', 'epyke1d@cornell.edu'),
(51, 'Willow', 'Pischoff', '1972-01-27', '88 Vernon Pass', '426-146-6165', 'wpischoff1e@cnbc.com'),
(52, 'Arlen', 'Bevis', '1983-05-28', '2223 Golden Leaf Avenue', '989-728-8087', 'abevis1f@irs.gov'),
(53, 'Keelia', 'Pirolini', '1989-03-16', '76171 Clyde Gallagher Street', '763-532-0483', 'kpirolini1g@studiopress.com'),
(54, 'Irene', 'O\'Fielly', '1960-01-28', '75922 Onsgard Place', '261-873-1459', 'iofielly1h@sun.com'),
(55, 'Dael', 'Podbury', '1984-09-14', '9340 Fair Oaks Alley', '962-158-5500', 'dpodbury1i@ibm.com'),
(56, 'Konstantin', 'Agronski', '1992-07-09', '687 Hagan Court', '123-377-2867', 'kagronski1j@cbc.ca'),
(57, 'Latrina', 'Bangley', '1980-05-27', '41 Debs Center', '249-354-0796', 'lbangley1k@wikispaces.com'),
(58, 'Jedidiah', 'Luebbert', '1970-02-03', '6162 Melby Way', '527-722-9128', 'jluebbert1l@hibu.com'),
(59, 'Dimitry', 'Renison', '1975-10-16', '5 Village Trail', '294-555-5921', 'drenison1m@mysql.com'),
(60, 'Tova', 'Dye', '1999-01-12', '339 Clove Street', '174-460-9886', 'tdye1n@macromedia.com'),
(61, 'Harv', 'Wombwell', '1985-10-31', '0128 Warbler Point', '199-750-3418', 'hwombwell1o@woothemes.com'),
(62, 'Euphemia', 'Cowen', '1960-12-19', '5369 Erie Point', '882-508-1803', 'ecowen1p@marriott.com'),
(63, 'Whitaker', 'Corp', '1985-11-26', '05041 Grasskamp Junction', '350-357-6816', 'wcorp1q@meetup.com'),
(64, 'Sauveur', 'Assiratti', '1968-07-08', '61 Derek Avenue', '328-695-9446', 'sassiratti1r@blogs.com'),
(65, 'Penelope', 'Dawney', '1966-10-13', '73 Holmberg Pass', '812-385-9159', 'pdawney1s@umich.edu'),
(66, 'Rodolphe', 'Savins', '1991-09-23', '4958 Crowley Way', '188-946-9074', 'rsavins1t@businesswire.com'),
(67, 'Adria', 'Kerbey', '1962-09-16', '2 Kropf Parkway', '121-328-9747', 'akerbey1u@lulu.com'),
(68, 'Giraldo', 'Gathercoal', '1980-08-31', '09 Portage Point', '872-681-1313', 'ggathercoal1v@hugedomains.com'),
(69, 'Abagail', 'Jenson', '1983-05-27', '39 Duke Parkway', '243-571-6611', 'ajenson1w@123-reg.co.uk'),
(70, 'Luther', 'Booty', '1972-06-05', '34809 Utah Lane', '861-223-8248', 'lbooty1x@aol.com'),
(71, 'Darn', 'Kuschek', '1975-10-24', '2 Glacier Hill Crossing', '752-205-8478', 'dkuschek1y@slashdot.org'),
(72, 'Lavina', 'MacGauhy', '1972-12-31', '445 Sachs Crossing', '794-132-7760', 'lmacgauhy1z@dot.gov'),
(73, 'Drew', 'Greggs', '1993-01-29', '30 Scofield Drive', '103-397-6262', 'dgreggs20@google.cn'),
(74, 'Mirilla', 'Logg', '1987-12-25', '211 Rutledge Hill', '820-270-9829', 'mlogg21@w3.org'),
(75, 'Leona', 'Redsull', '1961-12-24', '3 Old Gate Drive', '292-481-0036', 'lredsull22@i2i.jp'),
(76, 'Rodd', 'Elphee', '1971-02-03', '22 Barby Point', '464-363-3050', 'relphee23@ning.com'),
(77, 'Frank', 'Underhill', '1988-12-31', '5 Sachs Road', '894-132-4292', 'funderhill24@booking.com'),
(78, 'Germaine', 'Albrecht', '1977-01-11', '6 Butternut Crossing', '908-198-6577', 'galbrecht25@google.it'),
(79, 'Loren', 'Piris', '1976-08-20', '22 Grayhawk Street', '875-171-9873', 'lpiris26@ed.gov'),
(80, 'Brice', 'Stiddard', '1995-06-24', '629 Green Center', '115-691-3913', 'bstiddard27@netlog.com'),
(81, 'Nero', 'Bostock', '1978-11-02', '2 Moulton Court', '598-549-4625', 'nbostock28@mayoclinic.com'),
(82, 'Bobbie', 'Camin', '1996-11-24', '08 Monica Drive', '148-134-5579', 'bcamin29@yahoo.com'),
(83, 'Wendie', 'McIlheran', '1965-07-29', '620 Express Drive', '404-761-2015', 'wmcilheran2a@independent.co.uk'),
(84, 'Yance', 'Ashcroft', '1970-02-02', '67 Vermont Pass', '722-282-2626', 'yashcroft2b@java.com'),
(85, 'Clarita', 'Forre', '1967-02-21', '125 Upham Center', '265-842-3668', 'cforre2c@topsy.com'),
(86, 'Willi', 'Dowtry', '1969-07-17', '8358 Hanover Center', '700-401-8060', 'wdowtry2d@icq.com'),
(87, 'Jacob', 'Aicheson', '1974-08-03', '8 Utah Road', '501-477-5965', 'jaicheson2e@studiopress.com'),
(88, 'Josey', 'Lassell', '1999-12-16', '0 Petterle Circle', '948-197-1145', 'jlassell2f@blogspot.com'),
(89, 'Eran', 'Penton', '1976-06-09', '0 Harper Parkway', '382-281-0087', 'epenton2g@geocities.jp'),
(90, 'Zeke', 'Bratton', '1984-11-28', '88294 Sundown Pass', '154-612-9948', 'zbratton2h@last.fm'),
(91, 'Symon', 'Akester', '1970-03-19', '7 Waubesa Center', '951-210-6555', 'sakester2i@bandcamp.com'),
(92, 'Brandice', 'MacCroary', '1974-04-12', '236 Heath Street', '603-172-7340', 'bmaccroary2j@spotify.com'),
(93, 'Hermann', 'Westmorland', '1975-09-11', '39 Lindbergh Plaza', '997-124-0655', 'hwestmorland2k@yale.edu'),
(94, 'Kenon', 'Dressel', '1975-11-09', '545 Karstens Parkway', '468-471-9223', 'kdressel2l@networksolutions.com'),
(95, 'Sonni', 'Allaker', '1993-11-24', '2 Green Ridge Place', '619-238-3416', 'sallaker2m@yandex.ru'),
(96, 'Ford', 'Mountstephen', '1974-05-24', '4 Clarendon Alley', '664-537-3850', 'fmountstephen2n@exblog.jp'),
(97, 'Ram', 'Yukhnev', '1995-06-24', '5 Butterfield Center', '947-810-0838', 'ryukhnev2o@storify.com'),
(98, 'Camel', 'Cunnane', '1966-08-09', '433 Homewood Point', '981-556-1461', 'ccunnane2p@aol.com'),
(99, 'Maddy', 'MacLaig', '1995-10-17', '210 Golden Leaf Point', '255-784-3731', 'mmaclaig2q@chronoengine.com'),
(100, 'Bay', 'Ledekker', '1970-05-06', '50 Vermont Pass', '790-951-1322', 'bledekker2r@lycos.com'),
(103, 'Anna', 'Nowak', '1997-04-17', 'Długa 12', '567-535-254', 'anowak@gmail.com');

CREATE TABLE `recepty` (
  `id_recepty` int(11) NOT NULL,
  `id_pacjenta` int(11) NOT NULL,
  `id_lekarza` int(11) NOT NULL,
  `data_wystawienia` date NOT NULL,
  `data_waznosci` date NOT NULL,
  `leki` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `recepty` (`id_recepty`, `id_pacjenta`, `id_lekarza`, `data_wystawienia`, `data_waznosci`, `leki`) VALUES
(1, 1, 1, '2023-04-20', '2024-06-07', 'paracetamol'),
(2, 2, 2, '2023-04-20', '2024-05-20', 'ibuprofen'),
(3, 3, 3, '2023-04-20', '2024-04-20', 'amoxicillin'),
(4, 4, 4, '2023-04-20', '2024-04-20', 'aspirin'),
(5, 5, 5, '2023-04-20', '2024-04-20', 'paracetamol, ibuprofen'),
(6, 6, 6, '2023-04-20', '2024-04-20', 'paracetamol, amoxicillin'),
(7, 7, 7, '2023-04-20', '2024-04-20', 'aspirin, ibuprofen'),
(8, 8, 8, '2023-04-20', '2024-04-20', 'amoxicillin, aspirin'),
(9, 9, 9, '2023-04-20', '2024-04-20', 'paracetamol, aspirin'),
(10, 10, 10, '2023-04-20', '2024-04-20', 'amoxicillin, ibuprofen'),
(11, 11, 11, '2023-04-20', '2024-04-20', 'paracetamol, ibuprofen, aspirin'),
(12, 12, 12, '2023-04-20', '2024-04-20', 'amoxicillin, aspirin, ibuprofen'),
(13, 13, 13, '2023-04-20', '2024-04-20', 'paracetamol, aspirin, ibuprofen'),
(14, 14, 14, '2023-04-20', '2024-04-20', 'amoxicillin, ibuprofen, aspirin'),
(15, 15, 15, '2023-04-20', '2024-04-20', 'paracetamol, amoxicillin, aspirin'),
(16, 16, 16, '2023-04-20', '2024-04-20', 'paracetamol, amoxicillin, ibuprofen'),
(17, 17, 17, '2023-04-20', '2024-04-20', 'aspirin, ibuprofen, amoxicillin'),
(18, 18, 18, '2023-04-20', '2024-04-20', 'paracetamol, aspirin, amoxicillin'),
(19, 19, 19, '2023-04-20', '2024-04-20', 'paracetamol, aspirin, ibuprofen, amoxicillin'),
(20, 20, 20, '2023-04-20', '2024-04-20', 'paracetamol, ibuprofen, amoxicillin'),
(27, 56, 10, '2023-04-13', '2023-04-26', 'paracetamol'),
(30, 0, 0, '0000-00-00', '0000-00-00', ''),
(34, 56, 10, '2023-04-11', '2023-04-26', 'amoxicillin');

CREATE TABLE `wizyty` (
  `id_wizyty` int(11) NOT NULL,
  `id_pacjenta` int(11) NOT NULL,
  `id_lekarza` int(11) NOT NULL,
  `data_wizyty` date NOT NULL,
  `godzina_wizyty` time NOT NULL,
  `notatka` varchar(100) DEFAULT NULL,
  `czy_sie_odbyla` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `wizyty` (`id_wizyty`, `id_pacjenta`, `id_lekarza`, `data_wizyty`, `godzina_wizyty`, `notatka`, `czy_sie_odbyla`) VALUES
(1, 1, 1, '2023-04-22', '14:30:00', 'Dziecko z objawami przeziębienia.', 0),
(2, 2, 3, '2023-04-23', '10:00:00', 'Planowane zabiegi chirurgiczne.', 1),
(3, 3, 5, '2023-04-25', '13:45:00', 'Badania kontrolne.', 0),
(4, 4, 8, '2023-04-26', '09:15:00', 'Badania prenatalne.', 0),
(5, 5, 10, '2023-04-27', '11:30:00', 'Badanie wzroku i przepisanie nowych okularów.', 0),
(6, 6, 12, '2023-05-05', '15:00:00', 'Badanie pieprzyków i znamion.', 0),
(7, 0, 14, '2023-04-28', '11:11:00', 'Badanie EKG i monitorowanie pracy serca.', 1),
(27, 0, 10, '2023-04-28', '15:15:00', 'dasdasdasdasd', 1);


ALTER TABLE `lekarze`
  ADD PRIMARY KEY (`id_lekarza`);

ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`id_pacjenta`);

ALTER TABLE `recepty`
  ADD PRIMARY KEY (`id_recepty`);

ALTER TABLE `wizyty`
  ADD PRIMARY KEY (`id_wizyty`);


ALTER TABLE `lekarze`
  MODIFY `id_lekarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

ALTER TABLE `pacjenci`
  MODIFY `id_pacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

ALTER TABLE `recepty`
  MODIFY `id_recepty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

ALTER TABLE `wizyty`
  MODIFY `id_wizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
