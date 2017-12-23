package com.Hugos.Model;

import java.io.IOException;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
/*

NO LE MUEVAN A ESTA CLASE, PORQUE EL PROYECTOSE TRONARA (O_O)
*/

///------------- Clase con la cual se llamara el login con el cual se podra accedar a lo demas---------

public class Inicio extends Application {
   
    @Override
    public void start(Stage primaryStage) throws IOException {
         Parent root=FXMLLoader.load(getClass().getResource("/com/Hugos/View/LoginBien.fxml"));
        Scene scene = new Scene(root);
        primaryStage.setTitle("Login");
        primaryStage.setScene(scene);
        primaryStage.show();
                
    }

      public static void main(String[] hugos) {
        launch(hugos);
    }
    
}
