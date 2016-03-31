package qcm.utils.saves;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

public class DelayedTask implements Delayed {
	private long startTime;
	private SaveOperation operation;

	public DelayedTask(SaveOperation operation, long delay) {
		this.operation = operation;
		this.startTime = System.currentTimeMillis() + delay;
	}

	@Override
	public long getDelay(TimeUnit unit) {
		long diff = startTime - System.currentTimeMillis();
		return unit.convert(diff, TimeUnit.MILLISECONDS);
	}

	@Override
	public int compareTo(Delayed o) {
		if (this.startTime < ((DelayedTask) o).startTime) {
			return -1;
		}
		if (this.startTime > ((DelayedTask) o).startTime) {
			return 1;
		}
		return 0;
	}

	public Object call() throws Exception {
		return operation.call();
	}

	@Override
	public String toString() {
		return "Task [startTime=" + startTime + ", operation=" + operation + "]";
	}

	public SaveOperation getOperation() {
		return operation;
	}

	public Class<?> getClazz() {
		return operation.getClazz();
	}

}
