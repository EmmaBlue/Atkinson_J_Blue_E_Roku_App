-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 16, 2019 at 12:19 AM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arating`
--

CREATE TABLE `tbl_arating` (
  `arating_id` smallint(5) UNSIGNED NOT NULL,
  `arating_name` varchar(125) NOT NULL,
  `arating_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_arating`
--

INSERT INTO `tbl_arating` (`arating_id`, `arating_name`, `arating_desc`) VALUES
(1, 'G', 'G – General Audiences\r\nAll ages admitted. Nothing that would offend parents for viewing by children. '),
(2, 'PG', 'PG – Parental Guidance Suggested\r\nSome material may not be suitable for children. Parents urged to give  	&ldquo;parental guidance&rdquo;. '),
(3, 'PG-13', 'PG-13 – Parents Strongly Cautioned\r\nSome material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.'),
(4, 'R', 'R – Restricted\r\nUnder 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them. '),
(5, 'NC-17', 'NC-17 – Adults Only\r\nNo One 17 and Under Admitted. Clearly adult. Children are not admitted. ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audio`
--

CREATE TABLE `tbl_audio` (
  `audio_id` mediumint(9) NOT NULL,
  `era_id` smallint(6) NOT NULL,
  `audio_title` varchar(125) DEFAULT NULL,
  `audio_cover` varchar(75) DEFAULT 'temp_cover.jpg',
  `audio_src` varchar(40) DEFAULT NULL,
  `audio_rating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_audio`
--

INSERT INTO `tbl_audio` (`audio_id`, `era_id`, `audio_title`, `audio_cover`, `audio_src`, `audio_rating`) VALUES
(1, 1, 'Jerry Lee Lewis - Great Balls of Fire', 'fire.jpg', 'fire.mp3', 'PG'),
(2, 1, 'Little Richard - Long Tall Sally', 'sally.jpg', 'sally.mp3', 'G'),
(3, 1, 'Johnny Cash - I Walk The Line', 'walk.jpg', 'walk.mp3', 'G'),
(4, 1, 'Elvis Presley - Blue Suede Shoes', 'shoes.jpg', 'shoes.mp3', 'G'),
(5, 2, 'Chubby Checker - The Twist', 'twist.jpg', 'twist.mp3', 'G'),
(6, 2, 'Marvin Gaye - I Heard It Through The Grapevine', 'grapevine.jpg', 'grapevine.mp3', 'G'),
(7, 2, 'The Beatles - I Want To Hold Your Hand', 'hand.jpg', 'hand.mp3', 'PG'),
(8, 2, 'The Beach Boys - Good Vibrations', 'vibrations.jpg', 'vibrations.mp3', 'PG'),
(9, 3, 'The Jackson 5 - I Will Be There', 'there.jpg', 'there.mp3', 'G'),
(10, 3, 'Sugarloaf Green - Eyed Lady', 'eyed.jpg', 'eyed.mp3', 'PG'),
(11, 3, 'The Beatles - Let It Be', 'let.jpg', 'let.mp3', 'G'),
(12, 3, 'The Guess Who - American Woman', 'american.jpg', 'american.mp3', 'PG'),
(13, 4, 'Queen - Another One Bites the Dust', 'dust.jpg', 'dust.mp3', 'PG'),
(14, 4, 'Barbra Streisand - Woman in Love', 'woman.jpg', 'woman.mp3', 'G'),
(15, 4, 'Men at Work - Down Under', 'under.jpg', 'under.mp3', 'G'),
(16, 4, 'Talking Heads - Once in a Lifetime', 'lifetime.jpg', 'lifetime.mp3', 'G'),
(17, 5, 'Vanilla Ice - Ice Ice Baby', 'ice.jpg', 'ice.mp3', 'G'),
(18, 5, 'M.C. Hammer - U Cant Touch This', 'touch.jpg', 'touch.mp3', 'PG'),
(19, 5, 'Madonna - Vogue', 'vogue.jpg', 'vogue.mp3', 'PG'),
(20, 5, 'Whitney Houston - Im Your Baby Tonight', 'tonight.jpg', 'tonight.mp3', 'PG');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audio_arating`
--

CREATE TABLE `tbl_audio_arating` (
  `audio_arating_id` smallint(6) NOT NULL,
  `audio_id` smallint(6) NOT NULL,
  `arating_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_audio_arating`
--

INSERT INTO `tbl_audio_arating` (`audio_arating_id`, `audio_id`, `arating_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2),
(8, 8, 2),
(9, 9, 1),
(10, 10, 2),
(11, 11, 1),
(12, 12, 2),
(13, 13, 2),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 2),
(18, 18, 1),
(19, 19, 2),
(20, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audio_era`
--

CREATE TABLE `tbl_audio_era` (
  `audio_era_id` smallint(6) NOT NULL,
  `audio_id` smallint(6) NOT NULL,
  `era_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_audio_era`
--

INSERT INTO `tbl_audio_era` (`audio_era_id`, `audio_id`, `era_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(13, 13, 4),
(14, 14, 4),
(15, 15, 4),
(16, 16, 4),
(17, 17, 5),
(18, 18, 5),
(19, 19, 5),
(20, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `comments_id` mediumint(8) UNSIGNED NOT NULL,
  `comments_auth` varchar(125) DEFAULT NULL,
  `comments_copy` text NOT NULL,
  `comments_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments_movie` int(11) NOT NULL,
  `comments_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_comments`
--

INSERT INTO `tbl_comments` (`comments_id`, `comments_auth`, `comments_copy`, `comments_date`, `comments_movie`, `comments_rating`) VALUES
(1, NULL, 'Loved it. Chris Pratt is my hero! I LOVE YOU STAR LORD!!', '2018-03-26 19:08:41', 1, 5),
(2, NULL, 'Not quite as good as the first Guardians, but still WAY better that any DC movie... ', '2018-03-26 19:09:57', 1, 4),
(3, NULL, 'It sucked.', '2018-04-01 14:54:32', 1, 1),
(4, NULL, 'It was amazing. I really liked this way better than any DC movie that\'s ever been made, EVER.\n\nCuz DC movies are garbage.', '2018-04-01 14:55:29', 1, 3),
(5, NULL, 'I thought Logan was great.THIS is the way you do comic book dystopia.', '2018-04-01 14:56:55', 3, 4),
(6, NULL, 'Way too violent. I thought Hugh Jackman would at least do a song and dance, but was VERY disappointed.', '2018-04-01 14:57:35', 3, 1),
(7, NULL, 'OMG i can\'t get enough Deadpool.. what a great movie', '2018-04-01 15:11:30', 7, 5),
(8, NULL, 'I really liked this. Prof X made me sad tho. What a way to go...', '2018-04-01 15:51:58', 3, 4),
(9, NULL, 'afsdfsdfa', '2018-04-02 20:59:20', 3, 3),
(10, NULL, 'the most amazingest movie ever to amaze!', '2018-04-07 23:24:41', 1, 3),
(11, NULL, 'best movie ever', '2018-04-07 23:25:17', 1, 5),
(12, NULL, 'undefined', '2018-04-08 17:58:27', 9, 5),
(13, NULL, 'undefined', '2018-04-08 18:01:58', 9, 1),
(14, NULL, 'undefined', '2018-04-08 18:05:54', 1, 4),
(15, NULL, 'undefined', '2018-04-08 18:07:54', 1, 5),
(16, NULL, 'Deadpool smashed quite a few boundaries', '2018-04-08 18:08:45', 7, 5),
(17, NULL, 'last test to see if this works', '2018-04-08 18:09:23', 7, 3),
(18, NULL, 'this looked interesting and then was a bit of a letdown', '2018-04-08 19:03:13', 4, 3),
(19, NULL, 'i like pigs so I didn\'t really like this movie.', '2018-04-08 19:10:07', 4, 1),
(20, NULL, 'pigs are delicious so i think this movie was fantastic. and made me hungry.', '2018-04-08 19:13:06', 4, 3),
(21, NULL, 'i like pork so hooray for super pigs.', '2018-04-08 19:23:53', 4, 3),
(22, NULL, 'I DON\'T like pork so super pigs = boooo!', '2018-04-08 19:25:19', 4, 0),
(23, NULL, 'I ALSO don\'t like super pigs.', '2018-04-08 19:27:19', 4, 1),
(24, NULL, 'I hate super pigs. AND this movie.', '2018-04-08 19:30:01', 4, 0),
(25, NULL, 'I hate super pigs. AND this movie.', '2018-04-08 19:30:32', 4, 1),
(26, NULL, 'I kind of like it. but mostly hated it.', '2018-04-08 19:32:31', 4, 1),
(27, NULL, 'fantabolous', '2018-04-09 15:18:16', 1, 4),
(28, NULL, 'asdfa', '2018-04-27 14:28:12', 5, 3),
(29, NULL, 'afasd', '2018-04-27 15:30:23', 5, 0),
(30, NULL, 'asdfasd', '2018-04-27 16:18:01', 3, 0),
(31, NULL, 'ddddd', '2018-04-27 16:18:11', 3, 0),
(32, NULL, 'vzxvc', '2018-04-27 16:27:32', 5, 0),
(33, NULL, 'dfasdf', '2018-04-27 16:38:46', 2, 0),
(34, NULL, 'sfasdf', '2018-04-27 16:38:49', 2, 0),
(35, NULL, 'aasd', '2018-04-27 16:45:21', 9, 0),
(36, '', 'sadfadsfasdfasdf', '2018-04-27 16:51:40', 5, 3),
(37, NULL, 'adfasdf', '2018-04-27 16:56:50', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_era`
--

CREATE TABLE `tbl_era` (
  `era_id` smallint(6) NOT NULL,
  `era_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_era`
--

INSERT INTO `tbl_era` (`era_id`, `era_name`) VALUES
(1, '1950'),
(2, '1960'),
(3, '1970'),
(4, '1980'),
(5, '1990');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

CREATE TABLE `tbl_genre` (
  `genre_id` tinyint(3) UNSIGNED NOT NULL,
  `genre_name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Crime'),
(5, 'Drama'),
(6, 'Historical'),
(7, 'Horror'),
(8, 'Musical'),
(9, 'Science Fiction'),
(10, 'War'),
(11, 'Western'),
(12, 'Animation'),
(13, 'Family'),
(14, 'Fantasy'),
(15, 'Romance'),
(16, 'Sport');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` mediumint(8) UNSIGNED NOT NULL,
  `era_id` smallint(6) NOT NULL,
  `movies_cover` varchar(75) NOT NULL DEFAULT 'cover_default.jpg',
  `movies_title` varchar(125) NOT NULL,
  `movies_trailer` varchar(75) NOT NULL DEFAULT 'trailer_default.jpg',
  `movies_rating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `era_id`, `movies_cover`, `movies_title`, `movies_trailer`, `movies_rating`) VALUES
(1, 1, 'bridge.jpg', 'The Bridge On The River Kwain', 'bridge.mp4', 'PG-13'),
(2, 1, 'vertigo.jpg', 'Vertigo', 'vertigo.mp4', 'G'),
(3, 1, 'rear.jpg', 'Rear Window', 'rear.mp4', 'PG'),
(4, 1, 'sunset.jpg', 'Sunset Blvd', 'sunset.mp4', 'PG'),
(5, 2, 'lavventura.jpg', 'L\'Avventura', 'lavventura.mp4', 'PG-13'),
(6, 2, 'psycho.jpg', 'Psycho', 'psycho.mp4', 'R'),
(7, 2, 'spartacus.jpg', 'Spartacus', 'spartacus.mp4', 'PG'),
(8, 2, 'swiss.jpg', 'Swiss Family Robinson', 'swiss.mp4', 'G'),
(9, 3, 'jaws.jpg', 'Jaws', 'jaws.mp4', 'PG-13'),
(10, 3, 'godfather.jpg', 'The Godfather', 'godfather.mp4', 'PG-13'),
(11, 3, 'frankenstein.jpg', 'Young Frankenstein', 'frankenstein.mp4', 'PG'),
(12, 3, 'rocky.jpg', 'Rocky', 'rocky.mp4', 'PG'),
(13, 4, 'raging.jpg', 'Raging Bull', 'raging.mp4', 'R'),
(14, 4, 'airplane.jpg', 'Airplane!', 'airplane.mp4', 'PG'),
(15, 4, 'caddyshack.jpg', 'Caddyshack', 'caddyshack.mp4', 'PG'),
(16, 4, 'fog.jpg', 'The Fog', 'fog.mp4', 'PG'),
(17, 5, 'alone.jpg', 'Home Alone', 'alone.mp4', 'G'),
(18, 5, 'edward.jpg', 'Edward Scissorhands', 'edward.mp4', 'PG'),
(19, 5, 'turtles.jpg', 'Teenage Mutant Ninja Turtles', 'turtles.mp4', 'PG'),
(20, 5, 'awakenings.jpg', 'Awakenings', 'awakenings.mp4', 'PG');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_arating`
--

CREATE TABLE `tbl_mov_arating` (
  `mov_arating_id` smallint(6) NOT NULL,
  `movie_id` smallint(6) NOT NULL,
  `arating_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_arating`
--

INSERT INTO `tbl_mov_arating` (`mov_arating_id`, `movie_id`, `arating_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 4),
(7, 7, 2),
(8, 8, 1),
(9, 9, 4),
(10, 10, 4),
(11, 11, 4),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 1),
(16, 16, 2),
(17, 17, 2),
(18, 18, 2),
(19, 19, 3),
(20, 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_era`
--

CREATE TABLE `tbl_mov_era` (
  `mov_era_id` smallint(6) NOT NULL,
  `movies_id` smallint(6) NOT NULL,
  `era_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_era`
--

INSERT INTO `tbl_mov_era` (`mov_era_id`, `movies_id`, `era_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(13, 13, 4),
(14, 14, 4),
(15, 15, 4),
(16, 16, 4),
(17, 17, 5),
(18, 18, 5),
(19, 19, 5),
(20, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_genre`
--

CREATE TABLE `tbl_mov_genre` (
  `mov_genre_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_genre`
--

INSERT INTO `tbl_mov_genre` (`mov_genre_id`, `movies_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 9),
(4, 2, 1),
(5, 2, 5),
(6, 2, 6),
(7, 2, 10),
(8, 3, 1),
(9, 3, 5),
(10, 3, 9),
(11, 4, 1),
(12, 4, 2),
(13, 4, 5),
(14, 4, 9),
(15, 5, 8),
(16, 5, 13),
(17, 5, 14),
(18, 6, 5),
(19, 6, 6),
(20, 6, 10),
(21, 7, 1),
(22, 7, 2),
(23, 7, 3),
(24, 7, 15),
(25, 8, 5),
(26, 8, 9),
(27, 9, 3),
(28, 9, 5),
(29, 9, 16),
(30, 10, 14),
(31, 10, 2),
(32, 10, 3),
(33, 10, 8),
(34, 10, 13),
(35, 11, 2),
(36, 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tv`
--

CREATE TABLE `tbl_tv` (
  `tv_id` smallint(6) UNSIGNED NOT NULL,
  `era_id` tinyint(11) NOT NULL,
  `tv_cover` varchar(75) NOT NULL DEFAULT 'cover_default.jpg',
  `tv_title` varchar(125) NOT NULL,
  `tv_src` varchar(75) NOT NULL DEFAULT 'trailer_default.jpg',
  `tv_rating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tv`
--

INSERT INTO `tbl_tv` (`tv_id`, `era_id`, `tv_cover`, `tv_title`, `tv_src`, `tv_rating`) VALUES
(1, 1, 'lucy.jpg', 'I Love Lucy', 'lucy.mp4', 'PG-13'),
(2, 1, 'father.jpg', 'Father Knows Best', 'father.mp4', 'PG-13'),
(3, 1, 'superman.jpg', 'Adventures of Superman', 'superman.mp4', 'G'),
(4, 1, 'joan.jpg', 'I Married Joan', 'joan.mp4', 'PG-13'),
(5, 2, 'addams.jpg', 'The Addams Family', 'addams.mp4', 'PG'),
(6, 2, 'flintstones.jpg', 'The Flintstones', 'flintstones.mp4', 'PG'),
(7, 2, 'andy.jpg', 'The Andy Griffith Show', 'andy.mp4', 'G'),
(8, 2, 'route.jpg', 'Route 66', 'route.mp4', 'G'),
(9, 3, 'moore.jpg', 'The Mary Tyler Moore Show', 'moore.mp4', 'PG'),
(10, 3, 'odd.jpg', 'The Odd Couple', 'odd.mp4', 'G'),
(11, 3, 'partridge.jpg', 'The Partridge Family', 'partridge.mp4', 'PG'),
(12, 3, 'wilson.jpg', 'The Flip Wilson Show', 'wilson.mp4', 'PG-13'),
(13, 4, 'magnum.jpg', 'Magnum, P.I.', 'magnum.mp4', 'G'),
(14, 4, 'comfort.jpg', 'Too Close for Comfort', 'comfort.mp4', 'G'),
(15, 4, 'buddies.jpg', 'Bosom Buddies', 'buddies.mp4', 'G'),
(16, 4, 'living.jpg', 'Its a Living', 'living.mp4', 'PG'),
(17, 5, 'fresh.jpg', 'The Fresh Prince of Bel-Air', 'fresh.mp4', 'PG'),
(18, 5, 'wings.jpg', 'Wings', 'wings.mp4', 'PG-13'),
(19, 5, 'northern.jpg', 'Northern Exposure', 'northern.mp4', 'G'),
(20, 5, 'bell.jpg', 'Saved by the Bell', 'bell.mp4', 'PG-13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tv_arating`
--

CREATE TABLE `tbl_tv_arating` (
  `tv_arating_id` smallint(6) NOT NULL,
  `tv_id` smallint(6) NOT NULL,
  `arating_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tv_arating`
--

INSERT INTO `tbl_tv_arating` (`tv_arating_id`, `tv_id`, `arating_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 2),
(10, 10, 3),
(11, 11, 1),
(12, 12, 3),
(13, 13, 2),
(14, 14, 2),
(15, 15, 1),
(16, 16, 1),
(17, 17, 2),
(18, 18, 1),
(19, 19, 2),
(20, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tv_era`
--

CREATE TABLE `tbl_tv_era` (
  `tv_era_id` smallint(6) NOT NULL,
  `tv_id` smallint(6) NOT NULL,
  `era_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tv_era`
--

INSERT INTO `tbl_tv_era` (`tv_era_id`, `tv_id`, `era_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(13, 13, 4),
(14, 14, 4),
(15, 15, 4),
(16, 16, 4),
(17, 17, 5),
(18, 18, 5),
(19, 19, 5),
(20, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `user_fname` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ip` varchar(50) NOT NULL DEFAULT 'no',
  `user_admin` tinyint(4) DEFAULT NULL,
  `user_access` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fname`, `user_name`, `user_pass`, `user_email`, `user_date`, `user_ip`, `user_admin`, `user_access`) VALUES
(1, 'trevor', 'user1', 'password', 't@t.com', '2019-02-01 19:07:35', '::1', 1, 5),
(2, 'kate', 'user2', 'password', 't@t.com', '2019-02-01 20:11:28', '::1', 1, 5),
(3, 'mad', 'user3', 'password', 't@t.com', '2019-02-01 20:12:40', '::1', 0, 3),
(4, 'emma', 'user4', 'password', 't@t.com', '2019-02-01 20:12:40', '::1', 0, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_arating`
--
ALTER TABLE `tbl_arating`
  ADD PRIMARY KEY (`arating_id`);

--
-- Indexes for table `tbl_audio`
--
ALTER TABLE `tbl_audio`
  ADD PRIMARY KEY (`audio_id`);

--
-- Indexes for table `tbl_audio_arating`
--
ALTER TABLE `tbl_audio_arating`
  ADD PRIMARY KEY (`audio_arating_id`);

--
-- Indexes for table `tbl_audio_era`
--
ALTER TABLE `tbl_audio_era`
  ADD PRIMARY KEY (`audio_era_id`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`comments_id`);

--
-- Indexes for table `tbl_era`
--
ALTER TABLE `tbl_era`
  ADD PRIMARY KEY (`era_id`);

--
-- Indexes for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indexes for table `tbl_mov_arating`
--
ALTER TABLE `tbl_mov_arating`
  ADD PRIMARY KEY (`mov_arating_id`);

--
-- Indexes for table `tbl_mov_era`
--
ALTER TABLE `tbl_mov_era`
  ADD PRIMARY KEY (`mov_era_id`);

--
-- Indexes for table `tbl_mov_genre`
--
ALTER TABLE `tbl_mov_genre`
  ADD PRIMARY KEY (`mov_genre_id`);

--
-- Indexes for table `tbl_tv`
--
ALTER TABLE `tbl_tv`
  ADD PRIMARY KEY (`tv_id`);

--
-- Indexes for table `tbl_tv_arating`
--
ALTER TABLE `tbl_tv_arating`
  ADD PRIMARY KEY (`tv_arating_id`);

--
-- Indexes for table `tbl_tv_era`
--
ALTER TABLE `tbl_tv_era`
  ADD PRIMARY KEY (`tv_era_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_arating`
--
ALTER TABLE `tbl_arating`
  MODIFY `arating_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_audio`
--
ALTER TABLE `tbl_audio`
  MODIFY `audio_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_audio_arating`
--
ALTER TABLE `tbl_audio_arating`
  MODIFY `audio_arating_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_audio_era`
--
ALTER TABLE `tbl_audio_era`
  MODIFY `audio_era_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `comments_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tbl_era`
--
ALTER TABLE `tbl_era`
  MODIFY `era_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  MODIFY `genre_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_mov_arating`
--
ALTER TABLE `tbl_mov_arating`
  MODIFY `mov_arating_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_mov_era`
--
ALTER TABLE `tbl_mov_era`
  MODIFY `mov_era_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_mov_genre`
--
ALTER TABLE `tbl_mov_genre`
  MODIFY `mov_genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tbl_tv`
--
ALTER TABLE `tbl_tv`
  MODIFY `tv_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_tv_arating`
--
ALTER TABLE `tbl_tv_arating`
  MODIFY `tv_arating_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_tv_era`
--
ALTER TABLE `tbl_tv_era`
  MODIFY `tv_era_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
