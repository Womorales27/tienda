-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2024 a las 16:23:00
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'CONSULTORÍA', '20231228063534.jpg', 1),
(2, 'REDES', '20231228063654.jpg', 1),
(3, 'SOPORTE', '20231228064047.jpg', 1),
(4, 'SEGURIDAD', '20231228064233.jpg', 1),
(5, 'CORREO', '20231228064334.jpg', 1),
(6, 'VIGILANCIA', '20231228064513.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `host_smtp` varchar(100) NOT NULL,
  `user_smtp` varchar(100) NOT NULL,
  `pass_smtp` varchar(100) NOT NULL,
  `puerto_smtp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `whatsapp`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'SISTEMAS', '74391191', 'admin@gmail.com', '50374391190', 'El salvador', 'smtp.gmail.com', 'admin@gmail.com', '123', 465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ventas` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(8, 'CONSULTORÍA INFORMÁTICA IT', 'Le ayudamos a desarrollar sus ideas. Nuestros consultores en informática le orientarán para que alcance sus metas con la ayuda de la tecnología.', '100.00', 2, 0, '20231228064924.jpg', 1, 1),
(9, 'IMPLEMENTAMOS REDES DE DATOS', 'Instalamos y conectamos redes de datos, configuramos equipos activos, equipos inalámbricos. Implementamos túneles privados de datos para que pueda accesar a su información de manera segura en todo tiempo y lugar.', '100.00', 2, 0, '20231228065021.jpg', 1, 2),
(10, 'SOPORTE TÉCNICO PROFESIONAL', 'Brindamos asistencia técnica especializada . No permita que un problema informático detenga el flujo de su negocio, permítanos ayudarle.', '100.00', 2, 0, '20231228065051.jpg', 1, 3),
(11, 'PROTEJA SU NAVEGACIÓN WEB', 'Despreocupese de los sitios web maliciosos y otras amenazas a las que sus usuarios están expuestos en internet, nuestra tecnología de protección web protegerá sus datos.', '100.00', 2, 0, '20240107074612.jpg', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'ana.info1999@gmail.com', 'admin', 'ADMINISTRADOR', '$2y$10$YJPEpg7HtOh4dkGwyi2HeeZokS6oJcwi4ttaav/pSDecXaXyuFIGi', 'PERÚ', 1, NULL, 0, NULL, 0),
(5, 'info@gmail.com', 'Ana Lopez', NULL, '$2y$10$IU0DrPBACYGug8YsXmKZyONddMoPawVy0XoRqSmW90Tqh7GEHfHD.', NULL, 2, NULL, 0, NULL, 0),
(6, 'yuli@gmail.com', 'Yuli Lopez', NULL, '$2y$10$1Q3quBslnwBhbuQ1QLJlPOfe92s57H94769tfr2G.YYUL.a8BC132', NULL, 2, NULL, 0, NULL, 0),
(7, 'yuliasencios@gmail.com', 'Yuli Asencios', NULL, '$2y$10$m68Aty7PfV8Rr5uak01byOoh6tZJucKn7W8Vx4UuLPRZGNhzMmqcu', NULL, 2, NULL, 0, NULL, 0),
(8, 'yampier19es@gmail.com', 'oscar', NULL, '$2y$10$DznN1c/FoYXtE4.5FzCWNuoOdj88splT9B66GJLvw5jTaSH3CueEi', NULL, 2, NULL, 0, NULL, 0),
(9, 'admin@gmail.com', 'admin', 'administrador', '$2y$10$Z8WnNz7WxT3ypf2O3Lr4HOLVPKRY6q0pFz5Z8w7DtGUCCZa.jgkhy', 'El salvador', 1, NULL, 0, NULL, 1),
(10, 'virgo13alexa@gmail.com', 'Andrea', NULL, '$2y$10$nslhkvepnIn3.X6wn32Yy.lm9IEUTQRqQGbseDrE/YFdJrH/QjZJ2', NULL, 2, NULL, 0, NULL, 0),
(11, 'admin2@gmail.com', 'Prueba', NULL, '$2y$10$Z8WnNz7WxT3ypf2O3Lr4HOLVPKRY6q0pFz5Z8w7DtGUCCZa.jgkhy', NULL, 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) NOT NULL DEFAULT 1,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
