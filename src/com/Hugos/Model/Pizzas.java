
package com.Hugos.Model;

import java.io.IOException;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class Pizzas extends Application{
    private int id_Pizza;


    @Override
    public void start(Stage primaryStage) throws IOException {
    Parent root=FXMLLoader.load(getClass().getResource("View/HomeCajeroController.fxml"));
        Scene scene=new Scene(root);
        primaryStage.setTitle("Hols");
        primaryStage.setScene(scene);
        primaryStage.show();
    }
    public static void main(String [] hugos){
        launch(hugos);
    }
}
