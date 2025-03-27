-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2025 a las 22:59:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokemon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE `entrenador` (
  `ID_ENTRENADOR` int(11) NOT NULL,
  `USUARIO` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `POKEDOLLARES` int(11) NOT NULL DEFAULT 1000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`ID_ENTRENADOR`, `USUARIO`, `PASSWORD`, `POKEDOLLARES`) VALUES
(1, 'YULIA', '123456', 1000),
(2, 'ANGELA', '123456', 1000),
(3, 'LARA', '123456', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokedex`
--

CREATE TABLE `pokedex` (
  `NUM_POKEDEX` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `IMG_FRONTAL` varchar(20) NOT NULL,
  `IMG_BACK` varchar(20) NOT NULL,
  `SONIDO` varchar(20) NOT NULL,
  `NIVEL_EVO` int(11) DEFAULT NULL,
  `TIPO_1` varchar(20) NOT NULL,
  `TIPO_2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokedex`
--

INSERT INTO `pokedex` (`NUM_POKEDEX`, `NOMBRE`, `IMG_FRONTAL`, `IMG_BACK`, `SONIDO`, `NIVEL_EVO`, `TIPO_1`, `TIPO_2`) VALUES
(1, 'BULBASAUR', '1.PNG', '1.PNG', '1.wav', 16, 'PLANTA', 'VENENO'),
(2, 'IVYSAUR', '2.PNG', '2.PNG', '2.wav', 32, 'PLANTA', 'VENENO'),
(3, 'VENUSAUR', '3.PNG', '3.PNG', '3.wav', NULL, 'PLANTA', 'VENENO'),
(4, 'CHARMANDER', '4.PNG', '4.PNG', '4.wav', 16, 'FUEGO', NULL),
(5, 'CHARMELEON', '5.PNG', '5.PNG', '5.wav', 36, 'FUEGO', NULL),
(6, 'CHARIZARD', '6.PNG', '6.PNG', '6.wav', NULL, 'FUEGO', 'VOLADOR'),
(7, 'SQUIRTLE', '7.PNG', '7.PNG', '7.wav', 16, 'AGUA', NULL),
(8, 'WARTORFLE', '8.PNG', '8.PNG', '8.wav', 36, 'AGUA', NULL),
(9, 'BLASTOISE', '9.PNG', '9.PNG', '9.wav', NULL, 'AGUA', NULL),
(10, 'CATERPIE', '10.PNG', '10.PNG', '10.wav', 7, 'BICHO', NULL),
(11, 'METAPOD', '11.PNG', '11.PNG', '11.wav', 10, 'BICHO', NULL),
(12, 'BUTTERFREE', '12.PNG', '12.PNG', '12.wav', NULL, 'BICHO', 'VOLADOR'),
(13, 'WEEDLE', '13.PNG', '13.PNG', '13.wav', 7, 'BICHO', 'VENENO'),
(14, 'KAKUNA', '14.PNG', '14.PNG', '14.wav', 10, 'BICHO', 'VENENO'),
(15, 'BEEDRILL', '15.PNG', '15.PNG', '15.wav', NULL, 'BICHO', 'VENENO'),
(16, 'PIDGEY', '16.PNG', '16.PNG', '16.wav', 18, 'NORMAL', 'VOLADOR'),
(17, 'PIDGEOTTO', '17.PNG', '17.PNG', '17.wav', 36, 'NORMAL', 'VOLADOR'),
(18, 'PIDGEOT', '18.PNG', '18.PNG', '18.wav', NULL, 'NORMAL', 'VOLADOR'),
(19, 'RATTATA', '19.PNG', '19.PNG', '19.wav', 20, 'NORMAL', NULL),
(20, 'TARICATE', '20.PNG', '20.PNG', '20.wav', NULL, 'NORMAL', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `ID_POKEMON` int(11) NOT NULL,
  `NUM_POKEDEX` int(11) DEFAULT NULL,
  `ID_ENTRENADOR` int(11) DEFAULT NULL,
  `MOTE` varchar(20) DEFAULT NULL,
  `VITALIDAD` int(11) NOT NULL,
  `ATAQUE` int(11) NOT NULL,
  `ATAQUE_ESPECIAL` int(11) NOT NULL,
  `DEFENSA` int(11) NOT NULL,
  `DEFENSA_ESPECIAL` int(11) NOT NULL,
  `VELOCIDAD` int(11) NOT NULL,
  `NIVEL` int(11) NOT NULL,
  `FERTILIDAD` int(11) NOT NULL CHECK (`FERTILIDAD` between 0 and 5),
  `SEXO` char(1) NOT NULL CHECK (`SEXO` in ('H','M','X')),
  `ESTADO` varchar(20) DEFAULT NULL,
  `EQUIPO` int(11) NOT NULL DEFAULT 3,
  `ID_OBJETO` int(11) DEFAULT NULL
) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`ID_ENTRENADOR`);

--
-- Indices de la tabla `pokedex`
--
ALTER TABLE `pokedex`
  ADD PRIMARY KEY (`NUM_POKEDEX`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`ID_POKEMON`),
  ADD KEY `POKE_POKEDEX_FK` (`NUM_POKEDEX`),
  ADD KEY `POKEMON_ENTRENADOR_FK` (`ID_ENTRENADOR`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `POKEMON_ENTRENADOR_FK` FOREIGN KEY (`ID_ENTRENADOR`) REFERENCES `entrenador` (`ID_ENTRENADOR`),
  ADD CONSTRAINT `POKE_POKEDEX_FK` FOREIGN KEY (`NUM_POKEDEX`) REFERENCES `pokedex` (`NUM_POKEDEX`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
