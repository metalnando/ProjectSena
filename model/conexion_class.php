<?php

require_once 'constant.php';

class conexion_class {

    //put your code here
    private $conex;

    // funcion para realizar la conexion con la base de datos 
    public function conexion($sql) {

        if (!isset($this->conex)) {

            try {
                $this->conex(mysql_connect(HOST,USER,PASSWORD,DATABASE,PORT)) or die(mysqli_errno());
                
                return $this->conex;
                
            } catch (Exception $ex) {
                return $ex->getMessage();
            }
        }
    }
    
    public function ejecutarQuery($sql){
        
        try{
            $resultado=  mysqli_query($this->conex, $query);
            if(!$resultado){
                echo 'MySql Error: '.  mysqli_errno($this->conex);
                exit;
               }
               return $resultado;
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
        mysqli_close($this->conex);
    }
    
    public function consultarQuery($sql){
        
        try{
            
            
        } catch (Exception $ex) {

        }
    }

}
