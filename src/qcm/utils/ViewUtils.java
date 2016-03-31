package qcm.utils;

import java.io.IOException;
import java.util.function.Function;

import application.Main;
import controllers.ModalController;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.Window;

public class ViewUtils {

	public static <T extends ModalController> boolean showDialog(String fxmlFile, Window owner, Function<T, String> initControllerFunc) {
		try {
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(Main.class.getResource(fxmlFile));
			AnchorPane page = (AnchorPane) loader.load();

			// Create the dialog Stage.
			Stage dialogStage = new Stage();
			dialogStage.initModality(Modality.WINDOW_MODAL);
			dialogStage.setResizable(false);
			dialogStage.initOwner(owner);
			Scene scene = new Scene(page);
			dialogStage.setScene(scene);

			T controller = loader.getController();
			controller.setDialogStage(dialogStage);
			dialogStage.setTitle(initControllerFunc.apply(controller));

			dialogStage.showAndWait();

			return controller.isOkClicked();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

}
