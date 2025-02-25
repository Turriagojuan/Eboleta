<?php
require_once(__DIR__ . "/../persistencia/Conexion.php");
require_once(__DIR__ . "/Persona.php");
require_once(__DIR__ . "/../persistencia/ProveedorDAO.php");
require_once(__DIR__ . "/Categoria.php");


// La clase Proveedor extiende la clase Persona y representa a un proveedor con la capacidad de gestionar eventos.
class Proveedor extends Persona {
    private $eventos;

    // Constructor de la clase Proveedor que inicializa los atributos heredados y los específicos del proveedor.

    public function __construct($idPersona = 0, $nombre = "", $correo = "", $telefono = 0, $direccion = "", $clave = "", $eventos = null) {
        parent::__construct($idPersona, $nombre, $correo, $telefono, $direccion, $clave);
        $this->eventos = $eventos;
    }

    // Retorna la lista de eventos asociados al proveedor
    public function getEventos() {
        return $this->eventos;
    }

    // Asigna la lista de eventos asociados al proveedor

    public function setEventos($eventos) {
        $this->eventos = $eventos;
    }

    // Autentica al proveedor verificando sus credenciales en la base de datos
 
    public function autenticar() {
        $conexion = new Conexion();
        $conexion->abrirConexion();
        $proveedorDAO = new ProveedorDAO(null, null, $this->correo, null, null, $this->clave);
        $conexion->ejecutarConsulta($proveedorDAO->autenticar());
        if ($conexion->numeroFilas() == 0) {
            $conexion->cerrarConexion();
            return false;
        } else {
            $registro = $conexion->siguienteRegistro();
            $this->idPersona = $registro[0];
            $conexion->cerrarConexion();
            return true;
        }
    }

    // Consulta y carga los datos del proveedor en función de su idPersona
    public function consultar() {
        $conexion = new Conexion();
        $conexion->abrirConexion();
        $proveedorDAO = new ProveedorDAO($this->idPersona);
        $conexion->ejecutarConsulta($proveedorDAO->consultar());
        $registro = $conexion->siguienteRegistro();
        $this->nombre = $registro[0];
        $this->correo = $registro[1];
        $conexion->cerrarConexion();
    }

    // Agrega un nuevo evento asociado al proveedor en la base de datos

    public function agregarEvento($nombre, $aforo, $ciudad, $direccion, $fecha, $hora, $descripcion, $precio, $idCategoria) {
        $conexion = new Conexion();
        $conexion->abrirConexion();
        $proveedorDAO = new ProveedorDAO($this->idPersona);
        $consulta = $proveedorDAO->agregarEvento($nombre, $aforo, $ciudad, $direccion, $fecha, $hora, $descripcion, $precio, $idCategoria);
        $conexion->ejecutarConsulta($consulta);
        $conexion->cerrarConexion();
    }
}
