package src.models;



/**
* Classe Question_questionnaire
*/
public class Question_questionnaire {
	private int idQuestion;
	private int idQuestionnaire;
	private Question question;
	private Questionnaire questionnaire;

	public Question_questionnaire() {
		super();
		questionnaire=new Questionnaire();question=new Question();
	}
	/**
	 * return the value of idQuestion
	 * @return idQuestion
	 */
	public int getIdQuestion(){
		return this.idQuestion;
	}
	/**
	 * return the value of idQuestionnaire
	 * @return idQuestionnaire
	 */
	public int getIdQuestionnaire(){
		return this.idQuestionnaire;
	}
	/**
	 * return the value of question
	 * @return question
	 */
	public Question getQuestion(){
		return this.question;
	}
	/**
	 * return the value of questionnaire
	 * @return questionnaire
	 */
	public Questionnaire getQuestionnaire(){
		return this.questionnaire;
	}

	/**
	 * set the value of idQuestion
	 * @param aIdQuestion
	 */
	public void setIdQuestion(int aIdQuestion){
		this.idQuestion=aIdQuestion;
	}
	/**
	 * set the value of idQuestionnaire
	 * @param aIdQuestionnaire
	 */
	public void setIdQuestionnaire(int aIdQuestionnaire){
		this.idQuestionnaire=aIdQuestionnaire;
	}
	/**
	 * set the value of question
	 * @param aQuestion
	 */
	public void setQuestion(Question aQuestion){
		this.question=aQuestion;
	}
	/**
	 * set the value of questionnaire
	 * @param aQuestionnaire
	 */
	public void setQuestionnaire(Questionnaire aQuestionnaire){
		this.questionnaire=aQuestionnaire;
	}
	@Override
	public String toString() {
		return " [idQuestion] = " + idQuestion+" [idQuestionnaire] = " + idQuestionnaire;
	}
}