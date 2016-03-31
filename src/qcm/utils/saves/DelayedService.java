package qcm.utils.saves;

import javafx.concurrent.Service;
import javafx.concurrent.Task;

public class DelayedService extends Service<Object> {
	private TaskQueue taskQueue;
	private int opCount;

	public DelayedService(TaskQueue taskQueue) {
		super();
		this.taskQueue = taskQueue;
		opCount = 0;
	}

	@Override
	protected Task<Object> createTask() {
		// int max = taskQueue.getTasks().size();
		return new Task<Object>() {

			@Override
			protected Object call() throws Exception {
				while (true) {
					try {
						DelayedTask task = taskQueue.getTasks().take();
						try {
							Object result = task.call();
							taskQueue.setChanged(task.getOperation().getType(), task.getClazz(), result);
							// System.out.printf("[%s] - Take object = %s%n", Thread.currentThread().getName(), task);
							updateProgress(opCount - taskQueue.getTasks().size(), opCount);
						} catch (Exception ex) {
							ex.printStackTrace();
							// TODO alert Exception when saving
						}
						Thread.sleep(300);

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			};
		};
	}

	public void setOpCount(int opCount) {
		this.opCount = opCount;
	}

}
