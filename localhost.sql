-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-05-2025 a las 05:41:49
-- Versión del servidor: 8.0.42-0ubuntu0.24.04.1
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `documentitos`
--
CREATE DATABASE IF NOT EXISTS `documentitos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `documentitos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Bitacora`
--
-- Creación: 17-05-2025 a las 05:13:35
--

CREATE TABLE `Bitacora` (
  `Id_consulta` varchar(8) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `ip-usuario` int NOT NULL,
  `fecha_creacion` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_ingresoalsistema` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Id_documentos` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentosdigitalizados`
--
-- Creación: 17-05-2025 a las 05:14:49
--

CREATE TABLE `documentosdigitalizados` (
  `Id_documentos` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre_usuario` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Id_usuario` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_creacion` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_ingresoalsistema` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--
-- Creación: 17-05-2025 a las 04:00:58
--

CREATE TABLE `Usuario` (
  `Id_usuario` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Ip_usuario` int NOT NULL,
  `Nombre_usuario` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Contraseña` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Área` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Rol` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Bitacora`
--
ALTER TABLE `Bitacora`
  ADD PRIMARY KEY (`Id_consulta`),
  ADD KEY `ip-usuario` (`ip-usuario`,`Id_documentos`),
  ADD KEY `Id_documentos` (`Id_documentos`),
  ADD KEY `fecha_creacion` (`fecha_creacion`),
  ADD KEY `fecha_creacion_2` (`fecha_creacion`),
  ADD KEY `fecha_creacion_3` (`fecha_creacion`),
  ADD KEY `fecha_ingresoalsistema` (`fecha_ingresoalsistema`);

--
-- Indices de la tabla `documentosdigitalizados`
--
ALTER TABLE `documentosdigitalizados`
  ADD PRIMARY KEY (`Id_documentos`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `fecha_creacion` (`fecha_creacion`),
  ADD KEY `fecha_ingresoalsistema` (`fecha_ingresoalsistema`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `Ip_usuario` (`Ip_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Bitacora`
--
ALTER TABLE `Bitacora`
  ADD CONSTRAINT `Bitacora_ibfk_1` FOREIGN KEY (`Id_documentos`) REFERENCES `documentosdigitalizados` (`Id_documentos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Bitacora_ibfk_2` FOREIGN KEY (`ip-usuario`) REFERENCES `Usuario` (`Ip_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Bitacora_ibfk_3` FOREIGN KEY (`fecha_creacion`) REFERENCES `documentosdigitalizados` (`fecha_creacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `documentosdigitalizados`
--
ALTER TABLE `documentosdigitalizados`
  ADD CONSTRAINT `documentosdigitalizados_ibfk_1` FOREIGN KEY (`fecha_ingresoalsistema`) REFERENCES `Bitacora` (`fecha_ingresoalsistema`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `documentosdigitalizados` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
