package com.Hugos.ConectionDB;

import java.awt.event.*;


public class ConeccionUsers {
    

}
    
    
/**
 private Connection conexion=null;
    private Statement stmt;
    private ResultSet rs;
    private String BD="",Usuario="root",Contrasena="",URL="jdbc:mysql://localhost:",Puerto="3306";
    private int filas=0;
    
    public ConeccionUsers(String bd,String usuario,String contra,String puerto) {
        this.BD=bd;
        this.Usuario=usuario;
        this.Contrasena=contra;
        this.Puerto=puerto;
        this.URL=URL+this.Puerto+"/"+this.BD;
        
    }
    
   
    public Connection Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            this.conexion=DriverManager.getConnection(this.URL,this.Usuario,this.Contrasena);
        }
        catch(Exception ex){
            JOptionPane.showMessageDialog(null,"Error Al Establecer La Conexión Con Base De Datos","Error En Conexión",JOptionPane.ERROR_MESSAGE);
        }
        return this.conexion;
    }

    private void Desconectar(boolean op){
        try{
        if(op){
            this.conexion.close();
            this.rs.close();
            this.stmt.close();
            this.filas=0;
        }
        else{
            this.conexion.close();
            this.stmt.close();
            this.filas=0;
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public void Operacion(String Consulta,String Tema){
        try{
            this.conexion = Conexion();
            if(this.conexion!=null){
                this.stmt = this.conexion.createStatement();
                filas=this.stmt.executeUpdate(Consulta);
                if(filas!=0){
                    JOptionPane.showMessageDialog(null,Tema+" Ejecutada Con Exito",Tema,JOptionPane.INFORMATION_MESSAGE);
                }
                else{
                    JOptionPane.showMessageDialog(null,Tema+" Ejecutada Sin Exito",Tema,JOptionPane.ERROR_MESSAGE);
                }
            }
            else{
                JOptionPane.showMessageDialog(null,"Conexión Con Base De Datos Es Inutilizable","Error En Conexión",JOptionPane.ERROR_MESSAGE);
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            this.Desconectar(false);
        }
    }

    public ResultSet Consulta(String Consulta, String Tema){
        try{
            this.conexion=Conexion();
            if(this.conexion!=null){
                this.stmt=this.conexion.createStatement();
                this.rs=this.stmt.executeQuery(Consulta);
            }
            else{
                JOptionPane.showMessageDialog(null,"Conexión Con Base De Datos Es Inutilizable","Error En Conexion",JOptionPane.ERROR_MESSAGE);
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        //this.Desconectar(false);
        return rs;
    }

    public ResultSet Consulta(String Consulta){
        try{
            this.conexion=Conexion();
            if(this.conexion!=null){
                this.stmt=this.conexion.createStatement();
                this.rs=this.stmt.executeQuery(Consulta);
            }
            else{
                System.out.println("Conexion inutilizable");
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        //this.Desconectar(false);
        return rs;
    }

    public Connection GetConexion(){
        return this.conexion;
    }
 
 * /

