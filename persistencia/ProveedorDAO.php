<?php

class ProveedorDAO{
    private $idPersona;
    private $nombre;
    private $correo;
    private $telefono;
    private $direccion;
    private $clave;


    public function __construct($idPersona=NULL, $nombre=NULL, $correo=NULL, $telefono=NULL, $direccion=NULL, $clave=NULL)
    {
        $this -> idPersona = $idPersona;
        $this -> nombre = $nombre;
        $this -> correo = $correo;
        $this -> telefono = $telefono;
        $this -> direccion = $direccion;
        $this -> clave = $clave;
    }
    
    public function autenticar(){
        return "select idProveedor
                from Proveedor 
                where correo = '" . $this -> correo . "' and clave = '" . $this -> clave . "'";
    }
    
    public function consultar(){
        return "select nombre, correo
                from Proveedor
                where idProveedor = '" . $this -> idPersona . "'";
    }
}

?>