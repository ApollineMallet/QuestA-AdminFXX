package src.controllers;

import src.application.Main;
import javafx.application.Platform;

public class MainController {
	private Main mainApp;

	public MainController() {
		// TODO Auto-generated constructor stub
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
}
