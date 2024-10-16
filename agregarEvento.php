<?php
session_start();
if(!isset($_SESSION["id"])){
    header("Location: iniciarSesion.php");
}
$id = $_SESSION["id"];
require("logica/Proveedor.php");
$proveedor = new Proveedor($id);
$proveedor -> consultar();
?>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<?php include("encabezado.php"); ?>

    <div class="container mt-5">
        <h2>Agregar Nuevo Evento</h2>
        <form action="agregar.php" method="POST">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Evento</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="mb-3">
                <label for="aforo" class="form-label">Aforo</label>
                <input type="number" class="form-control" id="aforo" name="aforo" required>
            </div>
            <div class="mb-3">
                <label for="ciudad" class="form-label">Ciudad</label>
                <input type="text" class="form-control" id="ciudad" name="ciudad" required>
            </div>
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección</label>
                <input type="text" class="form-control" id="direccion" name="direccion" required>
            </div>
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha</label>
                <input type="date" class="form-control" id="fecha" name="fecha" required>
            </div>
            <div class="mb-3">
                <label for="hora" class="form-label">Hora</label>
                <input type="time" class="form-control" id="hora" name="hora" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="number" class="form-control" id="precio" name="precio" step="0.01" required>
            </div>
            <div class="mb-3">
            <label for="categoria">Categoría:</label>
    <select id="categoria" name="idCategoria" required>
        <?php
        require_once('logica/Categoria.php');
        $categoria = new Categoria();
        $categorias = $categoria->consultarTodos();
        foreach($categorias as $categoriaActual){
            echo "<option value='".$categoriaActual->getIdCategoria()."'>".$categoriaActual->getNombre()."</option>";   
        }

        ?>
    </select>
            </div>
            <button type="submit" class="btn btn-primary">Agregar Evento</button>
        </form>
    </div>
</body>
</html>



