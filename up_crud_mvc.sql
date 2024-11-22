-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2024 a las 23:59:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `up_crud_mvc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `ID_AUTHOR` bigint(20) NOT NULL,
  `FULL_NAME` varchar(255) NOT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `DATE_OF_DEATH` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`ID_AUTHOR`, `FULL_NAME`, `DATE_OF_BIRTH`, `DATE_OF_DEATH`) VALUES
(1, 'sefsefsefsf', '0000-00-00', '0000-00-00'),
(2, 'Cristopher_Nolan', '0000-00-00', '0000-00-00'),
(3, 'Brat_Pit', '0000-00-00', '0000-00-00'),
(4, '', '1999-12-24', '2015-04-14'),
(5, 'Elmer Curio', '1979-12-24', '2000-04-14'),
(6, 'Elena Guilvert', '2007-10-25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `ID_BOOK` bigint(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `YEAR_PUBLICATION` year(4) DEFAULT NULL,
  `ID_AUTHOR` bigint(20) DEFAULT NULL,
  `ID_GENRE` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`ID_BOOK`, `TITLE`, `DESCRIPTION`, `YEAR_PUBLICATION`, `ID_AUTHOR`, `ID_GENRE`) VALUES
(11, 'Elmer ', 'Amor y romance', '0000', 2, 2),
(12, 'El mar', 'Los cientificos han descubierto que nunca mas el el mar sera igual', '1985', 3, 5),
(13, 'Dos son Uno', 'Una chica de NewYor penso que el amor no existe por que la han engañado muchas veces piensa que todos los hombres son iguales hasta que llega Marcus un chico que le enseña la veradadera cara del amor', '1985', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `ID_GENRE` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`ID_GENRE`, `NAME`) VALUES
(1, 'terror'),
(2, 'amor'),
(3, 'Aventura'),
(4, 'Comedia'),
(5, 'Ciencia_Ficcion'),
(6, 'Detectivescas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `ID_STOCK` bigint(20) NOT NULL,
  `ID_BOOK` bigint(20) NOT NULL,
  `TOTAL_STOCK` int(11) NOT NULL,
  `NOTES` varchar(255) DEFAULT NULL,
  `LAST_INVENTARY` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`ID_AUTHOR`);

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID_BOOK`),
  ADD KEY `ID_AUTHOR` (`ID_AUTHOR`),
  ADD KEY `ID_GENRE` (`ID_GENRE`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_GENRE`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID_STOCK`),
  ADD KEY `ID_BOOK` (`ID_BOOK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `ID_AUTHOR` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `ID_BOOK` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genre`
--
ALTER TABLE `genre`
  MODIFY `ID_GENRE` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `ID_STOCK` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`ID_AUTHOR`) REFERENCES `author` (`ID_AUTHOR`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`ID_GENRE`) REFERENCES `genre` (`ID_GENRE`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ID_BOOK`) REFERENCES `book` (`ID_BOOK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
