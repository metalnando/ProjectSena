-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-07-2016 a las 23:50:08
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `base_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `pk_cit_id` int(11) NOT NULL AUTO_INCREMENT,
  `cit_medio_solicitud` varchar(50) DEFAULT NULL,
  `cit_fecha_solicitud` date DEFAULT NULL,
  `cit_hora` datetime DEFAULT NULL,
  `cit_fecha` date DEFAULT NULL,
  `cit_consultorio` int(11) DEFAULT NULL,
  `fk_pac_cedula` int(11) NOT NULL,
  `fk_med_cedula` int(11) NOT NULL,
  PRIMARY KEY (`pk_cit_id`),
  KEY `fk_pac_cedula` (`fk_pac_cedula`),
  KEY `fk_med_cedula` (`fk_med_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE IF NOT EXISTS `historia_clinica` (
  `pk_his_id` int(11) NOT NULL AUTO_INCREMENT,
  `his_observaciones` varchar(100) DEFAULT NULL,
  `fk_pac_cedula` int(11) NOT NULL,
  PRIMARY KEY (`pk_his_id`),
  KEY `fk_pac_cedula` (`fk_pac_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicina`
--

CREATE TABLE IF NOT EXISTS `medicina` (
  `pk_medi_id` int(11) NOT NULL AUTO_INCREMENT,
  `medi_nombre` varchar(50) DEFAULT NULL,
  `medi_estado` varchar(10) DEFAULT NULL,
  `medi_observacion` varchar(100) DEFAULT NULL,
  `fk_cit_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_medi_id`),
  KEY `fk_cit_id` (`fk_cit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE IF NOT EXISTS `medicos` (
  `pk_med_cedula` int(11) NOT NULL AUTO_INCREMENT,
  `med_nombre` varchar(30) DEFAULT NULL,
  `med_apelido` varchar(30) DEFAULT NULL,
  `med_telefono` varchar(10) DEFAULT NULL,
  `med_direccion` varchar(30) DEFAULT NULL,
  `med_correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_med_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `pk_pac_cedula` int(11) NOT NULL AUTO_INCREMENT,
  `pac_nombre` varchar(30) NOT NULL,
  `pac_apellido` varchar(30) NOT NULL,
  `pac_direccion` varchar(30) DEFAULT NULL,
  `pac_telefono` varchar(10) DEFAULT NULL,
  `pac_correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_pac_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `pk_per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_tipo` varchar(50) DEFAULT NULL,
  `per_descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pk_per_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`pk_per_id`, `per_tipo`, `per_descripcion`) VALUES
(1, 'Administrador', 'Administrador del sistema'),
(2, 'Usuario', 'Usuario Del sistema'),
(3, 'Secretaria', 'Sercretaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `pk_rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_descripcion` varchar(100) DEFAULT NULL,
  `fk_per_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_rol_id`),
  KEY `fk_per_id` (`fk_per_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`pk_rol_id`, `rol_descripcion`, `fk_per_id`) VALUES
(1, 'Admiistrador', 1),
(3, 'Secretaria', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE IF NOT EXISTS `secretaria` (
  `pk_sec_cedula` int(11) NOT NULL AUTO_INCREMENT,
  `sec_nombre` varchar(30) NOT NULL,
  `sec_apellido` varchar(30) NOT NULL,
  `sec_direccion` varchar(30) DEFAULT NULL,
  `sec_telefono` varchar(10) DEFAULT NULL,
  `sec_correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_sec_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `pk_usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(30) NOT NULL,
  `usu_apellido` varchar(30) NOT NULL,
  `usu_correo` varchar(30) DEFAULT NULL,
  `usu_username` varchar(30) DEFAULT NULL,
  `usu_pw` varchar(30) DEFAULT NULL,
  `fk_rol_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_usu_id`),
  KEY `fk_rol_id` (`fk_rol_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`pk_usu_id`, `usu_nombre`, `usu_apellido`, `usu_correo`, `usu_username`, `usu_pw`, `fk_rol_id`) VALUES
(1, 'Hernando', 'Moreno', 'hmoreno1987@hotmail.com', 'admin', 'admin', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`fk_pac_cedula`) REFERENCES `paciente` (`pk_pac_cedula`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`fk_med_cedula`) REFERENCES `medicos` (`pk_med_cedula`);

--
-- Filtros para la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD CONSTRAINT `historia_clinica_ibfk_1` FOREIGN KEY (`fk_pac_cedula`) REFERENCES `paciente` (`pk_pac_cedula`);

--
-- Filtros para la tabla `medicina`
--
ALTER TABLE `medicina`
  ADD CONSTRAINT `medicina_ibfk_1` FOREIGN KEY (`fk_cit_id`) REFERENCES `cita` (`pk_cit_id`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`fk_per_id`) REFERENCES `permisos` (`pk_per_id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`fk_rol_id`) REFERENCES `roles` (`pk_rol_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
