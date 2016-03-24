package src.qcm.utils.saves;

import java.util.Arrays;
import java.util.concurrent.Callable;

public abstract class SaveOperation implements Callable<Object> {
	private Object[] datas;

	public SaveOperation(Object... datas) {
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
		return "SaveOperation [datas=" + Arrays.toString(datas) + "]";
	}
}
