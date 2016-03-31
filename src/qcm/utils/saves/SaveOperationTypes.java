package qcm.utils.saves;

public enum SaveOperationTypes {
	DELETE("Delete"), GET("Get"), UPDATE("Update"), ADD("Add");
	private String name = "";

	private SaveOperationTypes(String name) {
		this.name = name;
	}

	public String toString() {
		return name;
	}
}
