package src.qcm.utils.saves;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

public class Task implements Delayed {
	private long startTime;
	private SaveOperation operation;

	public Task(SaveOperation operation, long delay) {
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
		if (this.startTime < ((Task) o).startTime) {
			return -1;
		}
		if (this.startTime > ((Task) o).startTime) {
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

}
