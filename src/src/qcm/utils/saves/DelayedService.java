package src.qcm.utils.saves;

import javafx.concurrent.Service;
import javafx.concurrent.Task;

public class DelayedService extends Service<Object> {
	private TaskQueue taskQueue;

	public DelayedService(TaskQueue taskQueue) {
		super();
		this.taskQueue = taskQueue;
	}

	@Override
	protected Task<Object> createTask() {
		int max = taskQueue.getTasks().size();
		return new Task<Object>() {

			@Override
			protected Object call() throws Exception {
				while (true) {
					try {
						DelayedTask task = taskQueue.getTasks().take();
						try {
							Object result = task.call();
							taskQueue.setChanged(task.getOperation().getType(), result);
							System.out.printf("[%s] - Take object = %s%n", Thread.currentThread().getName(), task);
							updateProgress(max - taskQueue.getTasks().size(), max);
						} catch (Exception ex) {
							ex.printStackTrace();
							// TODO alert Exception when saving
						}
						Thread.sleep(500);

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			};
		};
	}

}