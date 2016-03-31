package qcm.utils.saves;

import java.util.Arrays;
import java.util.concurrent.Callable;

public abstract class SaveOperation implements Callable<Object> {
	private Object[] datas;
	private SaveOperationTypes type;
	private Class<?> clazz;

	public SaveOperation(SaveOperationTypes type, Class<?> clazz, Object... datas) {
		super();
		this.clazz = clazz;
		this.datas = datas;
		this.type = type;
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

	public Class<?> getClazz() {
		return clazz;
	}

	public void setClazz(Class<?> clazz) {
		this.clazz = clazz;
	}
}
