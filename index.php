<?php
session_start();

// Cerrar sesión si se recibe el parámetro "cerrarSesion"
if (isset($_GET["cerrarSesion"])) {
    session_destroy();
    header("Location: index.php"); // Redirigir al index después de cerrar sesión
    exit();
}

require("logica/Evento.php");
require("logica/Categoria.php");
require("logica/Cliente.php"); 

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eboleta</title>
</head>

<body>
    <?php include("encabezado.php"); ?>
    
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="#"><img src="img/logo.png" width="50" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav me-auto">
                    <?php 
                        // Consultar y listar todas las categorías de eventos
                        $categoria = new Categoria();
                        $categorias = $categoria->consultarTodos();
                        foreach ($categorias as $categoriaActual) {
                            echo "<li class='nav-item'><a class='nav-link' href='#' role='button'>" . $categoriaActual->getNombre() . "</a></li>";
                        }
                    ?>
                </ul>
                <ul class="navbar-nav">
                    <?php 
                    if (isset($_SESSION['idCliente'])) {
                        // Mostrar nombre del cliente autenticado
                        $cliente = new Cliente($_SESSION['idCliente']);
                        $cliente->consultar(); // Consultar el nombre del cliente desde la base de datos
                        echo "<li class='nav-item'><a class='nav-link' href='#'>Bienvenido, " . $cliente->getNombre() . "</a></li>";
                        echo "<li class='nav-item'><a href='index.php?cerrarSesion=true' class='nav-link'>Cerrar Sesión</a></li>";
                    } else {
                        // Mostrar opción para iniciar sesión si no está autenticado
                        echo "<li class='nav-item'><a href='iniciarSesion.php' class='nav-link'>Iniciar Sesión</a></li>";
                    }
                    ?>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row mb-3">
            <div class="col">
                <div class="card border-primary">
                    <div class="card-header text-bg-info">
                        <h4>Eventos</h4>
                    </div>
                    <div class="card-body">
                        <?php
                        $i = 0;
                        $evento = new Evento();
                        $eventos = $evento->consultarTodos();
                        foreach ($eventos as $eventoActual) {
                            if ($i % 4 == 0) {
                                echo "<div class='row mb-3'>";
                            }
                            echo "<div class='col-lg-3 col-md-4 col-sm-6'>";
                            echo "<div class='card text-bg-light'>";
                            echo "<div class='card-body'>";
                            echo "<div class='text-center'><img src='https://icons.iconarchive.com/icons/icons8/ios7/256/Time-And-Date-Meeting-icon.png' width='70%' /></div>";
                            echo "<a href='detalleEvento.php?idEvento=" . $eventoActual->getIdEvento() . "'>" . $eventoActual->getNombre() . "</a><br>";
                            echo "Ciudad: " . $eventoActual->getCiudad() . "<br>";
                            echo "Fecha: " . $eventoActual->getFecha() . "<br>";
                            echo "Categoría: " . $eventoActual->getCategoria()->getNombre() . "<br>";
                            echo "</div>";
                            echo "</div>";
                            echo "</div>";

                            if ($i % 4 == 3) {
                                echo "</div>";
                            }
                            $i++;
                        }
                        if ($i % 4 != 0) {
                            echo "</div>";
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
