-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2025 a las 18:55:34
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
-- Base de datos: `eboleta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `idBoleta` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
(1, 'Conciertos'),
(2, 'Teatro'),
(3, 'Deportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `correo`, `telefono`, `direccion`, `clave`) VALUES
(1, 'Juan Pérez', 'juan.perez@gmail.com', 321654987, 'Carrera 10 #45-78', '56e044c0ec3f8ce92fdab721f26aea0a'),
(2, 'Ana Gómez', 'ana.gomez@gmail.com', 987321654, 'Calle 22 #33-44', 'a93b0d88486eb6677b3934e389bc7c81'),
(3, ' el diablo', 'contacto2@proveedor1.com', 123, 'qwe', '202cb962ac59075b964b07152d234b70'),
(8, 'Juan David', 'juan@gmail.com', 123, 'Calle 67a', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `aforo` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `Tipo_evento_idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `nombre`, `aforo`, `ciudad`, `direccion`, `fecha`, `hora`, `descripcion`, `precio`, `imagen`, `Proveedor_idProveedor`, `Tipo_evento_idCategoria`) VALUES
(1, 'Concierto Rock', 500, 'Medellín', 'Cale siempre viva', '2024-02-12', '00:00:00', 'Breve descripción', 500000, '1738047042.jpeg', 1, 1),
(2, 'Obra de Teatro', 300, 'Medellín', 'Teatro ABC', '2024-12-05', '20:00:00', 'Una obra de teatro clásica.', 50000, '1738048006.jpg', 2, 2),
(21, ' el diablo', 333, 'bofogog', '1231', '2020-12-12', '12:02:00', 'kl ', 123123, '1738154604.jpeg', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `total` float NOT NULL,
  `subtotal` float NOT NULL,
  `iva` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_boleta`
--

CREATE TABLE `factura_boleta` (
  `Boleta_idBoleta` int(11) NOT NULL,
  `Factura_idFactura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombre`, `correo`, `telefono`, `direccion`, `clave`) VALUES
(1, 'Proveedor 1', 'contacto@proveedor1.com', 123456789, 'Calle 123', 'eb52fc9a4b3a81a2000a9e774d5aa515'),
(2, 'Proveedor 2', 'contacto@proveedor2.com', 987654321, 'Avenida 456', 'b984fe77863037ddeb9be2ad7dfb246e');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`idBoleta`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `Proveedor_idProveedor` (`Proveedor_idProveedor`),
  ADD KEY `Tipo_evento_idCategoria` (`Tipo_evento_idCategoria`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`);

--
-- Indices de la tabla `factura_boleta`
--
ALTER TABLE `factura_boleta`
  ADD PRIMARY KEY (`Boleta_idBoleta`,`Factura_idFactura`),
  ADD KEY `Factura_idFactura` (`Factura_idFactura`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `idBoleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `boleta_ibfk_2` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`Tipo_evento_idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`);

--
-- Filtros para la tabla `factura_boleta`
--
ALTER TABLE `factura_boleta`
  ADD CONSTRAINT `factura_boleta_ibfk_1` FOREIGN KEY (`Boleta_idBoleta`) REFERENCES `boleta` (`idBoleta`),
  ADD CONSTRAINT `factura_boleta_ibfk_2` FOREIGN KEY (`Factura_idFactura`) REFERENCES `factura` (`idFactura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
