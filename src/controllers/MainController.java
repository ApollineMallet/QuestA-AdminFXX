package controllers;

import application.Main;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.ProgressBar;

public class MainController {

	private Main mainApp;

	@FXML
	private ProgressBar pbTasks;

	public MainController() {
	}

	public Main getMainApp() {
		return mainApp;
	}

	public void setMainApp(Main mainApp) {
		this.mainApp = mainApp;
	}

	public void closeApp() {
		Platform.exit();
	}

	public void handleDelete() {
		this.mainApp.handleDelete();
	}

	public ProgressBar getPbTasks() {
		return pbTasks;
	}
}
