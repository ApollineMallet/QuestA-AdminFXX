package src.qcm.utils.saves;

import java.util.Arrays;
import java.util.concurrent.Callable;

public abstract class SaveOperation implements Callable<Object> {
	private Object[] datas;
	private SaveOperationTypes type;

	public SaveOperation(SaveOperationTypes type, Object... datas) {
		super();
		this.datas = datas;
	}

	public Object[] getDatas() {
		return datas;
	}

	public void setDatas(Object[] datas) {
		this.datas = datas;
	}

	@Override
	public String toString() {
		return type + " [datas=" + Arrays.toString(datas) + "]";
	}

	public SaveOperationTypes getType() {
		return type;
	}

	public void setType(SaveOperationTypes type) {
		this.type = type;
	}
}