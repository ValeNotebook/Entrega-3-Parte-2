-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2022 a las 03:48:44
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_jardin`
--
CREATE DATABASE IF NOT EXISTS `api_jardin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `api_jardin`;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`cod_curso`, `nombre_curso`, `grado`, `descripcion`, `deleted_at`) VALUES
('ASD55', 'Kinder', 2, 'Kinder Caracol', NULL),
('BA555', 'Pre-Kinder', 1, 'Curso Mariposa', NULL),
('CBD55', 'Arcoiris', 1, 'Cuarto Arcoiris Primer Pre-Kinder', NULL),
('CDF48', 'Cursito', 1, 'Soy Un Cursito', NULL);

--
-- Volcado de datos para la tabla `educadoras`
--

INSERT INTO `educadoras` (`rut_educadora`, `nombre_tia`, `apellido`, `curso`, `deleted_at`) VALUES
('19702940-4', 'Camila', 'Gonzalez', NULL, NULL),
('26880274-6', 'Rocio', 'Escalon', NULL, NULL),
('33474020-k', 'Lucila', 'Robles', NULL, NULL);

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`cod_evento`, `nino`, `tia`, `descripcion`, `deleted_at`) VALUES
(1, '19702940-4', '19702940-4', 'Salida Temprano', NULL);

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(23, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(24, '2022_06_15_065457_create_cursos_table', 1),
(25, '2022_06_16_160859_create_educadoras_table', 1),
(26, '2022_06_16_161533_create_niños_table', 1),
(27, '2022_06_16_161628_create_eventos_table', 1);

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`rut_nino`, `nombre_nino`, `apellido`, `genero`, `curso`, `deleted_at`) VALUES
('18368135-4', 'Constanza', 'Lagunas', 'F', 'ASD55', NULL),
('19702940-4', 'Fernanda', 'Vera', 'F', 'CBD55', NULL),
('19702940-5', 'Arturo', 'Mariscal', 'H', NULL, NULL),
('19702940-8', 'Aurora', 'Castillo', 'F', 'CBD55', NULL),
('20745882-1', 'Constanza', 'Lagunas', 'F', NULL, NULL),
('20833673-8', 'luisa', 'Madrigal', 'f', NULL, NULL),
('33935315-8', 'Camilo', 'Carrillo', 'f', NULL, NULL),
('49578430-4', 'Ramiro', 'Ramirez', 'M', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
