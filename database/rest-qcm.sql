-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 29 Mars 2016 à 13:03
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `rest-qcm`
--
CREATE DATABASE IF NOT EXISTS `rest-qcm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `rest-qcm`;

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
`id` int(11) NOT NULL,
  `libelle` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`id`, `libelle`) VALUES
(4, 'Programmation'),
(5, 'Reseau');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
`id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`id`, `libelle`, `code`) VALUES
(3, 'sio.slam', 'slam'),
(4, 'sio.sisr', 'sisr'),
(5, 'Communication', 'COM');

-- --------------------------------------------------------

--
-- Structure de la table `groupe_questionnaire`
--

CREATE TABLE IF NOT EXISTS `groupe_questionnaire` (
  `idGroupe` int(11) NOT NULL,
  `idQuestionnaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groupe_questionnaire`
--

INSERT INTO `groupe_questionnaire` (`idGroupe`, `idQuestionnaire`) VALUES
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
`id` int(11) NOT NULL,
  `libelle` text NOT NULL,
  `idQuestionnaire` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `libelle`, `idQuestionnaire`) VALUES
(1, 'a quoi sert ngDblclick ?', 3),
(2, 'a quoi sert ngCloak ?', 3),
(3, 'Qu’est-ce qu’est Phalcon ?', 4),
(4, 'Quelle est le langage de Phalcon ?', 4);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE IF NOT EXISTS `questionnaire` (
`id` int(11) NOT NULL,
  `libelle` text NOT NULL,
  `idDomaine` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `libelle`, `idDomaine`, `date`) VALUES
(3, 'angularJS', 4, '2015-03-12'),
(4, 'Phalcon', 4, '2015-03-12');

-- --------------------------------------------------------

--
-- Structure de la table `rang`
--

CREATE TABLE IF NOT EXISTS `rang` (
`id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rang`
--

INSERT INTO `rang` (`id`, `libelle`) VALUES
(1, 'admin'),
(2, 'utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `realisation`
--

CREATE TABLE IF NOT EXISTS `realisation` (
`id` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idQuestionnaire` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `realisation`
--

INSERT INTO `realisation` (`id`, `idUtilisateur`, `idQuestionnaire`, `score`, `date`) VALUES
(1, 3, 3, 1, '2015-03-12'),
(2, 4, 4, 1, '2015-03-12'),
(3, 5, 3, 2, '2015-03-12'),
(4, 6, 4, 0, '2015-03-12');

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
`id` int(11) NOT NULL,
  `libelle` text NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `good` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reponse`
--

INSERT INTO `reponse` (`id`, `libelle`, `idQuestion`, `good`) VALUES
(1, 'double click', 1, 1),
(2, 'click gauche', 1, 0),
(3, 'click droit', 1, 0),
(4, 'click milieu', 1, 0),
(5, 'Masquer les  {{ }} lors du chargement', 2, 1),
(6, 'Masquer les  {{ }} partout', 2, 0),
(7, 'Masquer les  [[ ]] lors du chargement', 2, 0),
(8, 'Masquer les  [[ ]] partout', 2, 0),
(9, 'Phalcon est un framework', 3, 1),
(10, 'Phalcon est un module', 3, 0),
(11, 'Phalcon est une librairie', 3, 0),
(12, 'Phalcon est une ressource java', 3, 0),
(13, 'PHP', 4, 1),
(14, 'JAVA', 4, 0),
(15, 'C++', 4, 0),
(16, 'python', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_utilisateur`
--

CREATE TABLE IF NOT EXISTS `reponse_utilisateur` (
  `idReponse` int(11) NOT NULL,
  `idRealisation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reponse_utilisateur`
--

INSERT INTO `reponse_utilisateur` (`idReponse`, `idRealisation`) VALUES
(1, 1),
(7, 1),
(9, 2),
(14, 2),
(1, 3),
(5, 3),
(12, 4),
(16, 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
`id` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `mail` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `idRang` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `mail`, `password`, `nom`, `prenom`, `idRang`) VALUES
(3, 'jcouture', 'jcouture', '123456', 'Couture', 'Julien', 1),
(4, 'gtostain', 'gtostain', '123456', 'Tostain', 'Guillaume', 1),
(5, 'tportois', 'tportois', '123456', 'Portois', 'Théo', 1),
(6, 'utilisateur', 'utilisateur', '123456', 'BAUDOUIN', 'Eléonore', 2),
(7, 'jcheron', 'jean-christophe.heron@ac-caen.fr', '11nTgPwwTDGCo', 'HERON', 'Jean-Christophe', 2),
(8, 'myaddressmail', 'myaddressmail@gmail.com', '19SXSHaOnQl/c', 'HERON', 'Jean-Christophe', 2),
(9, 'a', 'e', 'd', 'HAMONT', 'Benoit', 1),
(10, 'aa', 'ff', 'dd', 'CAMBADELIS', 'Jean-Christophe', 1),
(11, 'jcheron', 'jcheron@gmail.com', '0000', 'HARON', 'Jean-Christophe Emmanuel Pascal', 1),
(15, 'Aimee', 'neque.non.quam@posuereenimnisl.org', '1656100391099', 'Carver', 'Isabelle', 2),
(16, 'Carlos', 'eu.turpis@afeugiat.edu', '1684112555899', 'Sandoval', 'Maisie', 1),
(17, 'Allegra', 'nisi@risusa.net', '1638101611999', 'Blair', 'Calvin', 1),
(18, 'Kelsie', 'dapibus@egestasa.edu', '1622112750699', 'Potter', 'Mohammad', 1),
(19, 'Kennedy', 'magna.Nam@utcursusluctus.org', '1680062052799', 'Harrell', 'Jocelyn', 1),
(20, 'Ian', 'Vivamus.nibh.dolor@tempus.net', '1685042002799', 'Ortega', 'Kendall', 2),
(21, 'Jerry', 'ullamcorper.velit.in@nulla.edu', '1657113015999', 'Skinner', 'Colt', 2),
(22, 'Hayes', 'euismod@urnasuscipit.net', '1608091087299', 'Vega', 'Hillary', 2),
(23, 'Risa', 'erat.in@velfaucibusid.edu', '1607011807899', 'Beach', 'Macon', 1),
(24, 'Malcolm', 'eu.erat@magnaSuspendisse.com', '1689062576599', 'Snider', 'Armand', 2),
(25, 'Olympia', 'consectetuer.rhoncus@porttitortellus.co.uk', '1673022980499', 'Pace', 'Aristotle', 1),
(26, 'Audrey', 'cubilia.Curae@ategestas.net', '1668052296799', 'Crane', 'Juliet', 1),
(27, 'Leigh', 'imperdiet.ornare.In@Nuncullamcorper.org', '1617110694799', 'Ballard', 'Garrett', 2),
(28, 'Adele', 'amet.lorem@amet.co.uk', '1697101155499', 'Roberson', 'Tashya', 1),
(29, 'Martin', 'sed.hendrerit@pretium.ca', '1688110803499', 'Howell', 'Claudia', 2),
(30, 'Amethyst', 'nibh.Aliquam@liberoet.co.uk', '1644040989199', 'Hopkins', 'Leilani', 2),
(31, 'MacKensie', 'Praesent.eu@magna.net', '1610112697899', 'Sawyer', 'Mara', 1),
(32, 'Carl', 'erat.volutpat@sollicitudin.ca', '1694100218599', 'Castro', 'Oliver', 2),
(33, 'Karen', 'dolor@temporlorem.edu', '1697112603799', 'Mckinney', 'Hamish', 2),
(34, 'Devin', 'sit.amet@lorem.com', '1650081329399', 'Wall', 'Florence', 1),
(35, 'Hedwig', 'arcu@cursus.co.uk', '1687052436099', 'Browning', 'Howard', 1),
(36, 'Bruno', 'augue.eu.tellus@non.co.uk', '1602041600599', 'Langley', 'Xander', 2),
(37, 'Alisa', 'ligula@dictum.ca', '1610121908599', 'Mccall', 'Mary', 1),
(38, 'Barrett', 'lacus@metusVivamuseuismod.com', '1632011792799', 'Barnett', 'India', 1),
(39, 'Dakota', 'elit.Curabitur@fermentum.co.uk', '1670082289999', 'Valencia', 'Kaye', 2),
(40, 'Rachel', 'interdum.feugiat.Sed@pede.net', '1611122989699', 'Burks', 'Veronica', 1),
(41, 'Sigourney', 'metus@DonecegestasDuis.ca', '1697061896599', 'Mcgee', 'Keely', 1),
(42, 'Acton', 'quam.quis.diam@Integer.edu', '1612122460799', 'Lawson', 'Skyler', 1),
(43, 'Wendy', 'sollicitudin.orci@maurisIntegersem.ca', '1621051373999', 'Zamora', 'Keelie', 2),
(44, 'Kirby', 'dapibus.rutrum.justo@bibendumfermentummetus.ca', '1644072166399', 'Goodman', 'Yoshi', 1),
(45, 'Jaden', 'dui.quis@nuncQuisqueornare.ca', '1650081837699', 'Townsend', 'Gail', 2),
(46, 'Alana', 'sit.amet.metus@Curabiturdictum.edu', '1636041593599', 'Suarez', 'Neville', 1),
(47, 'MacKensie', 'pede@vulputatemauris.org', '1672062766899', 'Snider', 'Brenna', 1),
(48, 'Raja', 'natoque.penatibus.et@quisdiam.edu', '1609032394899', 'West', 'Ima', 1),
(49, 'Felicia', 'lorem.vitae@Donecfeugiatmetus.edu', '1609121617499', 'Newman', 'Raymond', 2),
(50, 'Daryl', 'Nulla.eget@semper.edu', '1691012729199', 'Rosario', 'Channing', 1),
(51, 'Rosalyn', 'Duis.at@facilisiSed.ca', '1694122377999', 'Vinson', 'Margaret', 2),
(52, 'Cherokee', 'molestie.dapibus@elit.org', '1643100939599', 'James', 'Elaine', 2),
(53, 'Zephr', 'ornare.Fusce@egetlaoreetposuere.ca', '1625061845299', 'Hoover', 'Vivien', 2),
(54, 'Phyllis', 'fringilla.ornare.placerat@consequat.net', '1609121437999', 'Simmons', 'Tamekah', 2),
(55, 'Halee', 'sagittis@posuerevulputate.ca', '1622101321099', 'Collins', 'Libby', 2),
(56, 'Daria', 'tincidunt@molestiein.co.uk', '1673071044399', 'French', 'Burke', 1),
(57, 'Elliott', 'quam.Curabitur@turpisIncondimentum.ca', '1671010155699', 'Hays', 'Nelle', 2),
(58, 'Signe', 'congue.In.scelerisque@quamvelsapien.net', '1697121651999', 'Taylor', 'Brenda', 2),
(59, 'Raya', 'tempus@Crasegetnisi.org', '1693042535899', 'Meyer', 'Brenna', 2),
(60, 'Camden', 'eros.non.enim@cursusdiam.com', '1604051844799', 'Sawyer', 'Boris', 2),
(61, 'William', 'erat.volutpat.Nulla@famesac.com', '1614112754099', 'Sears', 'Quon', 1),
(62, 'Rama', 'aliquet.molestie.tellus@semsemper.edu', '1639120592199', 'Merrill', 'Cassidy', 2),
(63, 'Michelle', 'fringilla@consequat.ca', '1650073052899', 'Boone', 'Walter', 1),
(64, 'Henry', 'ultrices@nunc.net', '1616070259899', 'Marsh', 'Claire', 2),
(65, 'Stephanie', 'ac.sem.ut@atiaculis.net', '1697090495999', 'Cline', 'Martina', 2),
(66, 'Madeson', 'quam.quis.diam@lobortisultricesVivamus.net', '1663112115899', 'Herrera', 'Kessie', 2),
(67, 'Yoshio', 'eu@Crasconvallisconvallis.co.uk', '1625031079499', 'Gonzalez', 'Boris', 1),
(68, 'Shelly', 'metus.urna@fringillaeuismod.net', '1664061301999', 'Robertson', 'Todd', 2),
(69, 'Tate', 'diam@apurus.org', '1697070695399', 'Ratliff', 'Keefe', 1),
(70, 'Lars', 'elit@metusurna.edu', '1631101639699', 'Shields', 'Farrah', 2),
(71, 'Chastity', 'tellus.id@nunc.edu', '1610042452599', 'Frost', 'Linda', 1),
(72, 'William', 'at@amalesuada.com', '1660092875699', 'Soto', 'Ifeoma', 2),
(73, 'Karina', 'dictum@Donec.edu', '1694112428799', 'Woodward', 'Elaine', 1),
(74, 'Jaime', 'ac.libero@elementumpurusaccumsan.net', '1691021927099', 'Leach', 'Patricia', 2),
(75, 'Hyacinth', 'sodales@pharetra.org', '1601070643599', 'Ochoa', 'Natalie', 2),
(76, 'Gil', 'elit.Etiam@faucibuslectusa.ca', '1697071864999', 'George', 'Kai', 2),
(77, 'Elton', 'Proin@lorem.co.uk', '1605121124299', 'Combs', 'Channing', 2),
(78, 'Cassandra', 'nunc.risus.varius@arcu.net', '1604042975499', 'Rocha', 'Ima', 2),
(79, 'Jescie', 'et.magnis@auctor.ca', '1696051330199', 'Leblanc', 'Leah', 2),
(80, 'Oscar', 'in.lobortis.tellus@turpisegestasFusce.com', '1635042698899', 'Glass', 'Elizabeth', 2),
(81, 'Wyoming', 'in@facilisis.ca', '1642031108399', 'Rush', 'Quon', 1),
(82, 'Mariko', 'Nunc.ac.sem@parturientmontes.org', '1686123022099', 'Livingston', 'Illiana', 1),
(83, 'Dante', 'pretium.neque.Morbi@faucibuslectusa.co.uk', '1639042581799', 'Sexton', 'Ann', 2),
(84, 'Ebony', 'Phasellus.in.felis@neque.edu', '1610121362499', 'Phelps', 'Alika', 2),
(85, 'Macon', 'dolor.Fusce.feugiat@elitelitfermentum.ca', '1697080847699', 'Scott', 'Xantha', 1),
(86, 'Lucas', 'enim.Suspendisse@parturient.org', '1628121437499', 'Payne', 'Quynn', 1),
(87, 'Ignatius', 'vehicula.aliquet.libero@orciin.net', '1698102454399', 'Bonner', 'Yuli', 1),
(88, 'Jenna', 'lobortis.quis.pede@vitaealiquet.ca', '1607090957099', 'Hampton', 'Patrick', 1),
(89, 'Irene', 'lobortis.mauris.Suspendisse@Namconsequat.org', '1633092385799', 'Welch', 'Mollie', 2),
(90, 'Dylan', 'Integer@aliquet.co.uk', '1606082255799', 'Solis', 'Plato', 2),
(91, 'Beverly', 'nec.quam.Curabitur@sed.ca', '1633061798399', 'Sheppard', 'Keaton', 1),
(92, 'Daquan', 'diam.lorem@In.co.uk', '1651112398799', 'Paul', 'Lisandra', 2),
(93, 'Karly', 'Sed@Pellentesque.ca', '1691011602999', 'Clark', 'Kaitlin', 1),
(94, 'Guy', 'Lorem@urnajusto.com', '1619011076099', 'Jacobson', 'Lee', 2),
(95, 'Murphy', 'sed.orci.lobortis@ami.co.uk', '1677031667699', 'Schmidt', 'Dai', 2),
(96, 'Cairo', 'dapibus@lacinia.org', '1622112481199', 'Church', 'Cara', 2),
(97, 'Farrah', 'dolor@luctusvulputatenisi.org', '1616092861099', 'Baxter', 'Ginger', 1),
(98, 'Britanni', 'magna.Phasellus@arcuiaculis.co.uk', '1622091537999', 'Monroe', 'Zoe', 1),
(99, 'Chaim', 'aliquet.vel@pedeCumsociis.edu', '1674010129699', 'Joyner', 'Mechelle', 1),
(100, 'Hoyt', 'justo@Suspendisse.ca', '1645090822999', 'Olsen', 'Camilla', 2),
(101, 'Brody', 'mauris.sapien@mattisIntegereu.ca', '1645121803999', 'Kerr', 'Erich', 1),
(102, 'Bell', 'ipsum@convallisest.net', '1632102062299', 'Myers', 'May', 2),
(103, 'Sonia', 'et.ultrices.posuere@nisia.co.uk', '1693062538799', 'Singleton', 'Yasir', 1),
(104, 'April', 'aliquet@et.org', '1624082824399', 'Zimmerman', 'Xaviera', 2),
(105, 'Lewis', 'gravida@Quisqueporttitoreros.co.uk', '1695062293599', 'Santana', 'Harlan', 1),
(106, 'Connor', 'Etiam.bibendum@ornarelectus.net', '1660010745899', 'Maldonado', 'Mikayla', 1),
(107, 'Olga', 'velit.Pellentesque@interdumfeugiatSed.com', '1684022804599', 'Wall', 'Upton', 1),
(108, 'Quinn', 'semper.et@luctusipsum.ca', '1680120730799', 'Ochoa', 'April', 1),
(109, 'Fletcher', 'nec.cursus.a@acipsum.net', '1620090573099', 'Pitts', 'Cathleen', 2),
(110, 'Kim', 'nec.orci@pedemalesuadavel.com', '1679112251199', 'Mcdowell', 'Palmer', 1),
(111, 'Joan', 'risus.Nunc@Praesentinterdumligula.net', '1661051574799', 'Gould', 'Lara', 2),
(112, 'Hanna', 'lorem.eu@parturient.ca', '1633011646099', 'Olson', 'Kasper', 2),
(113, 'Bradley', 'Vivamus.euismod.urna@et.com', '1673022438999', 'Medina', 'Tanner', 1),
(114, 'Ignacia', 'sit.amet.risus@mus.org', '1697100385299', 'Underwood', 'Angela', 2),
(115, 'Neve', 'erat.Vivamus.nisi@ridiculusmusProin.edu', '1676060690999', 'Aguirre', 'Raymond', 1),
(116, 'Cherokee', 'nisl.sem.consequat@metus.co.uk', '1687121871299', 'Holmes', 'Emily', 1),
(117, 'Bethany', 'sapien@Phasellusfermentumconvallis.edu', '1636031408799', 'Gallagher', 'Neve', 1),
(118, 'Pearl', 'cubilia@natoquepenatibuset.com', '1686073058799', 'Cabrera', 'Neil', 2),
(119, 'Gretchen', 'semper.tellus.id@auctorMauris.org', '1636011134999', 'Nixon', 'Selma', 2),
(120, 'Kathleen', 'vulputate.dui.nec@duiinsodales.org', '1626031465099', 'Neal', 'Lacey', 2),
(121, 'Venus', 'magna.a.neque@sit.org', '1624041737599', 'Orr', 'Louis', 2),
(122, 'Madonna', 'in.lobortis@dui.net', '1610060449499', 'Dickerson', 'Denise', 1),
(123, 'Troy', 'tellus.sem@atfringillapurus.co.uk', '1630092628899', 'Mcmahon', 'Indira', 2),
(124, 'Barry', 'at.libero@consequatnecmollis.ca', '1692050395999', 'English', 'Quinn', 2),
(125, 'Imelda', 'vehicula.et.rutrum@rhoncusidmollis.org', '1618042778999', 'Jacobs', 'Orli', 1),
(126, 'Fitzgerald', 'eu.ligula.Aenean@Nullafacilisis.ca', '1627082940799', 'Lewis', 'Britanney', 2),
(127, 'Lionel', 'ac.mattis.velit@luctus.edu', '1680072137199', 'Forbes', 'MacKenzie', 1),
(128, 'Blaze', 'nunc.sit.amet@euismodestarcu.edu', '1648030105299', 'Dennis', 'Sebastian', 2),
(129, 'Amery', 'lacus@sapiengravida.net', '1698120220999', 'Paul', 'Tallulah', 1),
(130, 'Bradley', 'orci.lacus@velitdui.com', '1658041164899', 'Dorsey', 'Beau', 1),
(131, 'Prescott', 'at.pede@ametornare.net', '1689113079999', 'Norris', 'Andrew', 1),
(132, 'Ezra', 'eros@pharetranibhAliquam.net', '1693101557399', 'Copeland', 'Ruby', 2),
(133, 'Jena', 'mauris.Suspendisse@Suspendisseseddolor.net', '1672060385299', 'Reeves', 'Ria', 2),
(134, 'Jeanette', 'semper@liberoProinmi.com', '1690070417299', 'Carr', 'Victor', 1),
(135, 'Kalia', 'ipsum.nunc.id@malesuadaaugue.net', '1672082277199', 'Hoffman', 'Ora', 1),
(136, 'Larissa', 'diam.lorem.auctor@Sed.ca', '1678010769399', 'Downs', 'Raja', 1),
(137, 'Kylynn', 'enim.Sed.nulla@antebibendumullamcorper.co.uk', '1682031970199', 'Dillon', 'Leslie', 1),
(138, 'Holly', 'ac.tellus.Suspendisse@purus.com', '1683031070899', 'Price', 'Kamal', 1),
(139, 'September', 'Suspendisse@orcitinciduntadipiscing.com', '1668020401299', 'Ashley', 'Aileen', 1),
(140, 'Roanna', 'euismod.est@sed.edu', '1656011133599', 'Curtis', 'Madeline', 1),
(141, 'Xandra', 'quis.accumsan.convallis@Phasellusdapibus.org', '1690101652999', 'Church', 'Hilda', 1),
(142, 'Conan', 'fringilla@eueuismod.com', '1603080575799', 'Moon', 'Sybill', 1),
(143, 'Tamara', 'velit.egestas@egestaslaciniaSed.org', '1683061108299', 'Arnold', 'Howard', 2),
(144, 'Warren', 'mi.tempor@maurisrhoncus.co.uk', '1693061025499', 'Carson', 'Seth', 2),
(145, 'Merritt', 'nunc.ac.mattis@Cum.org', '1636123051099', 'Luna', 'Vladimir', 1),
(146, 'Jael', 'adipiscing.elit.Aliquam@nuncIn.com', '1617091418199', 'Jackson', 'Melinda', 2),
(147, 'Nichole', 'Cras.pellentesque.Sed@Proin.co.uk', '1655022975299', 'Brady', 'Reece', 2),
(148, 'Rylee', 'arcu.Aliquam.ultrices@massanon.ca', '1679051291499', 'Gomez', 'Ray', 1),
(149, 'Blossom', 'augue.eu@NulladignissimMaecenas.net', '1642103021899', 'Paul', 'Tucker', 2),
(150, 'Ivan', 'lectus.sit.amet@justofaucibus.edu', '1684100101499', 'Larson', 'Kelsey', 2),
(151, 'Xandra', 'ultricies@Pellentesqueut.com', '1696101569799', 'Hayes', 'Petra', 1),
(152, 'Kuame', 'Curabitur.sed@molestietellus.co.uk', '1662032462599', 'Serrano', 'Chadwick', 1),
(153, 'Rudyard', 'Nunc.lectus.pede@molestiepharetranibh.co.uk', '1637012783799', 'Kidd', 'MacKenzie', 1),
(154, 'Xantha', 'cursus.Integer.mollis@Curabitur.co.uk', '1682040788299', 'Hyde', 'Ian', 1),
(155, 'Emery', 'tempor.arcu@vitaepurusgravida.net', '1639101221699', 'Boyd', 'Jerry', 2),
(156, 'Basia', 'Ut.nec.urna@imperdietnecleo.com', '1651121026299', 'Todd', 'Alexandra', 1),
(157, 'Scarlett', 'luctus.et.ultrices@malesuadaaugueut.edu', '1693050489699', 'Mcintyre', 'Walter', 2),
(158, 'Maggy', 'urna.Ut.tincidunt@consectetueradipiscing.org', '1668110144999', 'Barrera', 'Charde', 1),
(159, 'Regan', 'urna.et@Proinultrices.edu', '1661042156899', 'Franks', 'Luke', 2),
(160, 'Leonard', 'libero@eget.co.uk', '1669072421699', 'Ramirez', 'Rhiannon', 1),
(161, 'Joan', 'risus.Duis@Cumsociis.ca', '1685072540299', 'Booth', 'Gavin', 2),
(162, 'Carson', 'Donec.egestas@eget.edu', '1621113013199', 'Briggs', 'Whilemina', 1),
(163, 'Carly', 'In.ornare@vitaeodio.com', '1602090499899', 'Davidson', 'Paul', 1),
(164, 'McKenzie', 'tristique.senectus.et@Curabitur.ca', '1681021135999', 'Cobb', 'Keegan', 2),
(165, 'Grace', 'libero.Integer@vestibulum.net', '1619062883599', 'Day', 'Beau', 1),
(166, 'Aileen', 'iaculis.aliquet.diam@scelerisque.co.uk', '1667062409999', 'Flowers', 'Ishmael', 2),
(167, 'Vincent', 'augue.ac.ipsum@purusNullam.net', '1628082730399', 'Holland', 'Rashad', 1),
(168, 'Gay', 'urna@SuspendissesagittisNullam.edu', '1605041665999', 'Martinez', 'Nayda', 2),
(169, 'Lael', 'massa.Integer.vitae@fringillapurus.edu', '1623012948799', 'Hodge', 'Zane', 2),
(170, 'Lila', 'ultrices.posuere.cubilia@non.co.uk', '1640030133299', 'Monroe', 'Sybill', 1),
(171, 'Fitzgerald', 'sem@necdiam.org', '1687050120399', 'Guerra', 'Briar', 2),
(172, 'Abigail', 'luctus@elit.net', '1668110186799', 'Myers', 'Reece', 1),
(173, 'Harding', 'magnis@ullamcorpernislarcu.net', '1656012327799', 'Flowers', 'Sean', 1),
(174, 'Zenaida', 'fames@risusDuis.edu', '1610111551099', 'Nicholson', 'Galena', 1),
(175, 'Olympia', 'est@netuset.org', '1671041382599', 'Warner', 'Brian', 1),
(176, 'Zachary', 'in@NullaaliquetProin.co.uk', '1606031148899', 'Fulton', 'Hall', 1),
(177, 'Kyla', 'cursus.luctus@placeratCras.org', '1640052818799', 'Mayer', 'Sheila', 2),
(178, 'Perry', 'erat.volutpat.Nulla@consectetuercursus.edu', '1623030674299', 'Gardner', 'Nero', 2),
(179, 'Josiah', 'ipsum.Suspendisse.non@ipsumnunc.ca', '1671012041499', 'Parks', 'Rhonda', 1),
(180, 'Edan', 'nulla.Integer@eratVivamusnisi.com', '1605031561199', 'Rosa', 'Gil', 1),
(181, 'Nero', 'ut.mi.Duis@nequevenenatislacus.com', '1610042842199', 'Carson', 'Gisela', 2),
(182, 'Chiquita', 'hendrerit@etultricesposuere.ca', '1689112841199', 'Case', 'Dustin', 2),
(183, 'Nathaniel', 'Sed@Integersem.ca', '1612012411299', 'Lawson', 'Conan', 2),
(184, 'Dora', 'orci@Sed.ca', '1658113041799', 'Greene', 'Tanner', 1),
(185, 'Nevada', 'scelerisque.scelerisque@sociisnatoque.co.uk', '1666061348899', 'Douglas', 'Beau', 2),
(186, 'Rigel', 'Integer.eu.lacus@eratnonummyultricies.net', '1633091203099', 'Alvarado', 'Samson', 2),
(187, 'Robert', 'ac.metus.vitae@nislQuisque.com', '1652120474299', 'Macdonald', 'Preston', 1),
(188, 'Yetta', 'vel@ipsum.ca', '1675112557499', 'Horne', 'Tanek', 2),
(189, 'Jessica', 'tellus@uteratSed.org', '1648011904399', 'Walters', 'Ima', 2),
(190, 'Fallon', 'lobortis.tellus.justo@lobortismauris.net', '1680110644899', 'Randolph', 'Alisa', 2),
(191, 'Xerxes', 'Fusce@ornare.edu', '1613091291699', 'Kennedy', 'Unity', 1),
(192, 'Scarlet', 'non.lobortis@mollis.net', '1664041801099', 'Britt', 'Chase', 2),
(193, 'Kelsie', 'purus@nullaanteiaculis.org', '1685111019799', 'Levy', 'Odessa', 1),
(194, 'Sybill', 'molestie.tellus@adipiscing.ca', '1689042534899', 'Wyatt', 'Anastasia', 2),
(195, 'Denise', 'non.dui.nec@vitae.com', '1670011841899', 'Lowe', 'Graiden', 1),
(196, 'Ahmed', 'vel.nisl@ullamcorpereu.com', '1647021672899', 'Bradshaw', 'Mary', 1),
(197, 'Malachi', 'ornare.lectus@ametultricies.edu', '1679072430099', 'Schwartz', 'Adria', 1),
(198, 'Zorita', 'aliquam@quam.co.uk', '1652111816899', 'Mcguire', 'Tyrone', 2),
(199, 'Kalia', 'a@eget.edu', '1654052143599', 'Cline', 'Chase', 2),
(200, 'Shannon', 'aliquet@euduiCum.net', '1661102262399', 'Graves', 'Isadora', 2),
(201, 'Daquan', 'volutpat.Nulla.dignissim@dictumProin.com', '1696022275199', 'Collier', 'Geoffrey', 1),
(202, 'Levi', 'Nam.consequat.dolor@ligulaAenean.com', '1678020216799', 'Combs', 'Carly', 1),
(203, 'Jamal', 'iaculis@sed.org', '1627122835899', 'Stuart', 'Mufutau', 1),
(204, 'Lisandra', 'ullamcorper.magna.Sed@dignissimMaecenas.edu', '1623012115099', 'Odom', 'Hamilton', 1),
(205, 'Brenda', 'dis.parturient@mollisInteger.com', '1683092637299', 'Hewitt', 'Lani', 1),
(206, 'Micah', 'In.at.pede@pharetra.net', '1694040551799', 'Langley', 'Farrah', 2),
(207, 'Raven', 'sit@rhoncusDonec.net', '1628121149999', 'Black', 'Wynter', 1),
(208, 'Claire', 'neque.sed.dictum@liberomauris.co.uk', '1633042345899', 'Morrison', 'Carolyn', 1),
(209, 'Jin', 'vitae@lectusrutrum.org', '1699060772699', 'Underwood', 'Brittany', 1),
(210, 'Cheyenne', 'interdum@parturientmontes.org', '1616100819699', 'Valencia', 'Mikayla', 2),
(211, 'Grady', 'euismod.et.commodo@sapien.net', '1663010371999', 'Bryant', 'Raymond', 2),
(212, 'Josiah', 'non.egestas@urnaVivamusmolestie.edu', '1663120189199', 'Mullins', 'Joy', 2),
(213, 'Emi', 'imperdiet.non.vestibulum@magna.edu', '1697091540899', 'Pate', 'Kelsey', 2),
(214, 'Nerea', 'lacus.Quisque.purus@enimEtiam.co.uk', '1626092830699', 'Compton', 'Sylvia', 2),
(215, 'Ezekiel', 'velit@Duis.net', '1640121893199', 'Nelson', 'Gloria', 1),
(216, 'Denton', 'augue.porttitor@massalobortisultrices.net', '1694050399999', 'Cardenas', 'Daryl', 2),
(217, 'Gemma', 'pharetra@sedsapienNunc.co.uk', '1696121329499', 'Gilbert', 'Amelia', 1),
(218, 'Sarah', 'dolor.Fusce.feugiat@molestieorci.net', '1664031655199', 'Rose', 'Brett', 2),
(219, 'Oprah', 'justo@lacusNullatincidunt.org', '1610111851799', 'Marshall', 'Jennifer', 1),
(220, 'Calista', 'et@convallisante.edu', '1638012627999', 'Rodgers', 'Penelope', 1),
(221, 'Lee', 'lorem.ipsum@ametorci.ca', '1695031741699', 'Livingston', 'Yael', 1),
(222, 'Idola', 'Nunc.lectus.pede@Curabitur.com', '1642100540499', 'Owen', 'Blossom', 1),
(223, 'Hadley', 'ipsum@euodioPhasellus.net', '1612030946999', 'Newton', 'Helen', 2),
(224, 'Baxter', 'consequat.nec.mollis@Inlorem.edu', '1695051247899', 'Terrell', 'Aurora', 2),
(225, 'Yuri', 'eu.placerat.eget@auctorodio.ca', '1692091761199', 'Fields', 'Callum', 1),
(226, 'Jane', 'fermentum.risus.at@liberodui.ca', '1624092079999', 'Scott', 'Vincent', 1),
(227, 'Elijah', 'diam.luctus.lobortis@dolor.edu', '1644010799399', 'Massey', 'Ferris', 1),
(228, 'Nadine', 'metus.In.lorem@erat.com', '1634072990799', 'Boyd', 'Camilla', 1),
(229, 'Griffith', 'Vivamus@necurna.com', '1637102688799', 'Mcneil', 'Amos', 1),
(230, 'Caldwell', 'eu.augue.porttitor@atsemmolestie.co.uk', '1617091951899', 'Reid', 'Roth', 2),
(231, 'Justin', 'pede.ultrices@ipsum.com', '1636020562099', 'Vazquez', 'Timon', 1),
(232, 'Macy', 'In.at.pede@nonfeugiatnec.co.uk', '1648040156399', 'Savage', 'Macey', 2),
(233, 'Gage', 'nulla@Donec.ca', '1665071719499', 'Newman', 'Ciara', 1),
(234, 'Leila', 'risus.a.ultricies@ante.ca', '1609030724799', 'May', 'Hamilton', 2),
(235, 'Arsenio', 'dis.parturient@fringillacursuspurus.edu', '1665051281599', 'Wright', 'Magee', 2),
(236, 'Shay', 'sit.amet@parturientmontes.com', '1613111787099', 'Benson', 'Noelani', 2),
(237, 'Erica', 'amet.diam@urnaVivamus.ca', '1623041403999', 'Giles', 'Wyatt', 1),
(238, 'Emma', 'ultrices.Vivamus.rhoncus@dapibus.ca', '1679062196599', 'Bush', 'Minerva', 2),
(239, 'Amela', 'tortor.dictum.eu@nasceturridiculus.com', '1600041764799', 'Waller', 'Damian', 1),
(240, 'Ima', 'ac.ipsum@dolorsit.edu', '1686112375299', 'Alford', 'Walker', 2),
(241, 'Karly', 'dui@Maurisvestibulumneque.ca', '1621051049199', 'Harrison', 'Fulton', 2),
(242, 'Sawyer', 'eget.lacus.Mauris@commodohendreritDonec.net', '1629092043599', 'Baird', 'Imogene', 1),
(243, 'Quemby', 'vel@ultriciesadipiscingenim.com', '1604032418899', 'Oconnor', 'Rahim', 1),
(244, 'Roanna', 'sodales.at.velit@ac.edu', '1611111984199', 'Bean', 'Aladdin', 2),
(245, 'Lani', 'tempor.erat.neque@Curabitur.ca', '1667050241199', 'Downs', 'Alvin', 1),
(246, 'Stacey', 'Cras.convallis@cursusdiamat.org', '1645011998899', 'Velazquez', 'Hayley', 2),
(247, 'Herrod', 'tellus.imperdiet@asollicitudin.ca', '1624071574899', 'Gilbert', 'Colette', 2),
(248, 'Hall', 'et@sitamet.ca', '1621022956199', 'Lawson', 'Herman', 1),
(249, 'Jerry', 'ultrices@Praesent.co.uk', '1609022494299', 'Brown', 'Adrian', 1),
(250, 'Phyllis', 'Morbi.vehicula@mollis.com', '1660042963399', 'Boyd', 'Marny', 2),
(251, 'Kyle', 'id.ante.Nunc@atnisi.net', '1661070940099', 'Haynes', 'Ryder', 1),
(252, 'Jane', 'at@enim.edu', '1635031719699', 'Merrill', 'Rafael', 2),
(253, 'Raphael', 'metus.vitae.velit@posuere.ca', '1656062920899', 'Porter', 'Raya', 2),
(254, 'Wynne', 'Nunc@amet.edu', '1678071971599', 'Sawyer', 'Sylvester', 1),
(255, 'Thane', 'sed@maurisidsapien.co.uk', '1652092211899', 'Trevino', 'Ila', 1),
(256, 'Merritt', 'ullamcorper@variusNamporttitor.co.uk', '1604090972799', 'Levine', 'Cruz', 2),
(257, 'Keelie', 'porttitor@Phaselluslibero.org', '1648012870799', 'Spencer', 'Finn', 2),
(258, 'Nero', 'elit.Nulla.facilisi@eratvolutpat.edu', '1600032785599', 'Rodriquez', 'Amber', 1),
(259, 'Gregory', 'lacus@amet.com', '1690042670199', 'Beach', 'TaShya', 1),
(260, 'Ivan', 'tortor.dictum@congueIn.co.uk', '1692060629999', 'Castillo', 'Bertha', 2),
(261, 'Orla', 'nec.quam.Curabitur@metusVivamuseuismod.ca', '1693050689799', 'Melendez', 'Tanner', 1),
(262, 'Roth', 'est.arcu.ac@diamvelarcu.com', '1630060146699', 'Hubbard', 'Cecilia', 2),
(263, 'Knox', 'Curabitur.dictum.Phasellus@velarcu.com', '1652030959199', 'Glass', 'Holmes', 2),
(264, 'Odessa', 'lectus@erat.net', '1644081734599', 'Lopez', 'Cadman', 2),
(265, 'Marshall', 'ac@Donecfeugiatmetus.co.uk', '1626042623199', 'Cobb', 'Wyatt', 2),
(266, 'Shaine', 'cursus@eunibhvulputate.org', '1662060280499', 'Prince', 'Wynne', 1),
(267, 'Latifah', 'lacinia@utlacus.com', '1614112862399', 'Shelton', 'Jena', 2),
(268, 'Kennan', 'tristique.pharetra@atarcu.net', '1609011458299', 'Calderon', 'Ursa', 2),
(269, 'Sierra', 'amet@inconsectetueripsum.org', '1622022393599', 'Grimes', 'Alec', 1),
(270, 'Kelly', 'tincidunt@Donec.edu', '1640063041899', 'Chambers', 'Shannon', 2),
(271, 'Demetria', 'feugiat.Lorem.ipsum@dapibusligulaAliquam.edu', '1679021398299', 'Murphy', 'Stacy', 1),
(272, 'Barclay', 'erat@nonquam.org', '1632080713499', 'Edwards', 'Lucian', 2),
(273, 'Fay', 'ligula.Donec@velarcu.ca', '1689080757499', 'Jefferson', 'Zoe', 2),
(274, 'Tatyana', 'nonummy.ac.feugiat@natoquepenatibuset.com', '1612072402599', 'Hays', 'Violet', 2),
(275, 'Scarlet', 'orci.quis.lectus@Craseu.edu', '1645050846799', 'Cobb', 'Chandler', 1),
(276, 'Rylee', 'vestibulum.lorem@Crasegetnisi.co.uk', '1685041004299', 'Garcia', 'Acton', 2),
(277, 'Beverly', 'vitae.risus@ultricessitamet.org', '1699112365699', 'Brooks', 'Libby', 2),
(278, 'Ulla', 'nec@miAliquam.co.uk', '1691011071099', 'Greene', 'Anika', 2),
(279, 'Jaden', 'lectus.pede.ultrices@Vestibulum.edu', '1608071776899', 'Avila', 'Melyssa', 2),
(280, 'Idona', 'ac.nulla.In@semPellentesque.com', '1648091767199', 'Stephens', 'Megan', 1),
(281, 'Unity', 'elit@fermentumrisus.co.uk', '1620112277199', 'Harrison', 'Victor', 1),
(282, 'Hermione', 'egestas.Sed@iaculis.com', '1664121780699', 'Blake', 'Jared', 2),
(283, 'Palmer', 'lorem@vestibulumnequesed.net', '1601010782999', 'Trujillo', 'Hanae', 1),
(284, 'Ulric', 'nec.leo.Morbi@liberoet.com', '1630021742699', 'Mcdaniel', 'Alvin', 1),
(285, 'Carolyn', 'fringilla.purus.mauris@magnaa.net', '1658042557199', 'Rosario', 'Melissa', 1),
(286, 'Brendan', 'Morbi@arcu.com', '1657042561199', 'Kennedy', 'Heather', 1),
(287, 'William', 'lacus.Aliquam@lobortisquispede.co.uk', '1663010127899', 'Ray', 'Risa', 2),
(288, 'Judah', 'vulputate@purusNullamscelerisque.com', '1684032626099', 'Martinez', 'Geraldine', 2),
(289, 'Vivian', 'Proin.vel@eleifend.co.uk', '1630122198899', 'Donaldson', 'Aurelia', 1),
(290, 'Daria', 'nulla.In@magna.co.uk', '1626112233299', 'Lynn', 'Matthew', 1),
(291, 'Joy', 'Maecenas@gravida.net', '1675100679799', 'Barlow', 'Lacy', 2),
(292, 'Naomi', 'et.ipsum.cursus@lorem.org', '1671081653399', 'Hicks', 'Erin', 2),
(293, 'Charissa', 'risus@eunibhvulputate.com', '1628082857999', 'Rollins', 'Ishmael', 2),
(294, 'Anastasia', 'odio.Phasellus@consequat.net', '1646021189299', 'Mendoza', 'Steel', 2),
(295, 'Jescie', 'Aliquam.adipiscing@Crasvulputate.com', '1650080497999', 'Hubbard', 'Mariam', 2),
(296, 'Jael', 'euismod@nibhsitamet.edu', '1636040348599', 'Martin', 'Olivia', 1),
(297, 'Kiona', 'lectus@sem.co.uk', '1636101538499', 'Edwards', 'Jael', 2),
(298, 'Alexandra', 'nibh@fermentum.edu', '1617102800199', 'Bartlett', 'Eric', 2),
(299, 'Stacy', 'Donec.nibh@gravidanunc.edu', '1697062689799', 'Knapp', 'Anthony', 1),
(300, 'Alea', 'ullamcorper.velit@Integervulputaterisus.org', '1675012018599', 'Morrison', 'Brian', 1),
(301, 'Irene', 'congue.turpis@Integervulputate.net', '1629012008999', 'Hess', 'Lenore', 2),
(302, 'Caesar', 'per.inceptos@Integer.com', '1605100831899', 'Dyer', 'Tate', 2),
(303, 'Tashya', 'sapien.imperdiet.ornare@Sedauctor.org', '1642081436799', 'Shaffer', 'Karen', 1),
(304, 'Ria', 'aliquam@Vivamusmolestiedapibus.org', '1673051041999', 'Cole', 'Steel', 1),
(305, 'Kathleen', 'nisi@enimnisl.edu', '1620091281299', 'Landry', 'Sybill', 1),
(306, 'Cyrus', 'pellentesque@sem.edu', '1609071475699', 'Villarreal', 'Sloane', 2),
(307, 'Sybill', 'vitae.risus@sagittisplacerat.net', '1674112530699', 'Rush', 'Farrah', 2),
(308, 'Gretchen', 'ullamcorper.eu@purus.co.uk', '1655080788399', 'Vargas', 'Timothy', 1),
(309, 'Kylee', 'semper@Morbi.com', '1638051606499', 'Murphy', 'Grace', 1),
(310, 'Demetria', 'ornare.lectus@diamdictum.ca', '1664122470699', 'Franks', 'Hope', 1),
(311, 'Yasir', 'imperdiet.erat.nonummy@Maurisvestibulum.org', '1674071172499', 'Hurley', 'Dominic', 1),
(312, 'Ursula', 'odio.semper.cursus@lacusCrasinterdum.co.uk', '1616052205999', 'Church', 'Yael', 2),
(313, 'Basia', 'orci.Ut@elementumat.co.uk', '1614010173899', 'Bird', 'Lisandra', 2),
(314, 'Holmes', 'urna.et.arcu@bibendum.com', '1696032267399', 'Berry', 'Yvette', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_groupe`
--

CREATE TABLE IF NOT EXISTS `utilisateur_groupe` (
  `idUtilisateur` int(11) NOT NULL,
  `idGroupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur_groupe`
--

INSERT INTO `utilisateur_groupe` (`idUtilisateur`, `idGroupe`) VALUES
(3, 3),
(4, 3),
(7, 3),
(5, 4),
(6, 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe_questionnaire`
--
ALTER TABLE `groupe_questionnaire`
 ADD PRIMARY KEY (`idGroupe`,`idQuestionnaire`), ADD KEY `idQuestionnaire` (`idQuestionnaire`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_question_questionnaire1_idx` (`idQuestionnaire`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_questionnaire_domaine1_idx` (`idDomaine`);

--
-- Index pour la table `rang`
--
ALTER TABLE `rang`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `realisation`
--
ALTER TABLE `realisation`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_score_utilisateur1_idx` (`idUtilisateur`), ADD KEY `fk_score_questionnaire1_idx` (`idQuestionnaire`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_idReponseQuestionx` (`idQuestion`);

--
-- Index pour la table `reponse_utilisateur`
--
ALTER TABLE `reponse_utilisateur`
 ADD PRIMARY KEY (`idReponse`,`idRealisation`), ADD KEY `fk_reponse_has_realisation_realisation1_idx` (`idRealisation`), ADD KEY `fk_reponse_has_realisation_reponse1_idx` (`idReponse`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_utilisateur_rang1_idx` (`idRang`);

--
-- Index pour la table `utilisateur_groupe`
--
ALTER TABLE `utilisateur_groupe`
 ADD PRIMARY KEY (`idUtilisateur`,`idGroupe`), ADD KEY `fk_utilisateur_has_groupe_groupe1_idx` (`idGroupe`), ADD KEY `fk_utilisateur_has_groupe_utilisateur1_idx` (`idUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `rang`
--
ALTER TABLE `rang`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `realisation`
--
ALTER TABLE `realisation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=315;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `groupe_questionnaire`
--
ALTER TABLE `groupe_questionnaire`
ADD CONSTRAINT `groupe_questionnaire_ibfk_1` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`id`),
ADD CONSTRAINT `groupe_questionnaire_ibfk_2` FOREIGN KEY (`idQuestionnaire`) REFERENCES `questionnaire` (`id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
ADD CONSTRAINT `fk_question_questionnaire1` FOREIGN KEY (`idQuestionnaire`) REFERENCES `questionnaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
ADD CONSTRAINT `fk_questionnaire_domaine1` FOREIGN KEY (`idDomaine`) REFERENCES `domaine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `realisation`
--
ALTER TABLE `realisation`
ADD CONSTRAINT `fk_score_questionnaire1` FOREIGN KEY (`idQuestionnaire`) REFERENCES `questionnaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_score_utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
ADD CONSTRAINT `fk_reponse_question` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reponse_utilisateur`
--
ALTER TABLE `reponse_utilisateur`
ADD CONSTRAINT `fk_reponse_has_realisation_realisation1` FOREIGN KEY (`idRealisation`) REFERENCES `realisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_reponse_has_realisation_reponse1` FOREIGN KEY (`idReponse`) REFERENCES `reponse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
ADD CONSTRAINT `fk_utilisateur_rang1` FOREIGN KEY (`idRang`) REFERENCES `rang` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur_groupe`
--
ALTER TABLE `utilisateur_groupe`
ADD CONSTRAINT `fk_utilisateur_has_groupe_groupe1` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_utilisateur_has_groupe_utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
