package src.models;

import java.util.ArrayList;
import java.util.List;


/**
* Classe Question
*/
public class Question {
	private int id;
	private int idUtilisateur;
	private String libelle;
	private boolean type;
	private List<Question_questionnaire> question_questionnaires;
	private List<Reponse> reponses;
	private Utilisateur utilisateur;

	public Question() {
		super();
		utilisateur=new Utilisateur();reponses=new ArrayList<>();question_questionnaires=new ArrayList<>();
	}
	/**
	 * return the value of id
	 * @return id
	 */
	public int getId(){
		return this.id;
	}
	/**
	 * return the value of idUtilisateur
	 * @return idUtilisateur
	 */
	public int getIdUtilisateur(){
		return this.idUtilisateur;
	}
	/**
	 * return the value of libelle
	 * @return libelle
	 */
	public String getLibelle(){
		return this.libelle;
	}
	/**
	 * return the value of type
	 * @return type
	 */
	public boolean isType(){
		return this.type;
	}
	/**
	 * return the value of question_questionnaires
	 * @return question_questionnaires
	 */
	public List<Question_questionnaire> getQuestion_questionnaires(){
		return this.question_questionnaires;
	}
	/**
	 * return the value of reponses
	 * @return reponses
	 */
	public List<Reponse> getReponses(){
		return this.reponses;
	}
	/**
	 * return the value of utilisateur
	 * @return utilisateur
	 */
	public Utilisateur getUtilisateur(){
		return this.utilisateur;
	}

	/**
	 * set the value of id
	 * @param aId
	 */
	public void setId(int aId){
		this.id=aId;
	}
	/**
	 * set the value of idUtilisateur
	 * @param aIdUtilisateur
	 */
	public void setIdUtilisateur(int aIdUtilisateur){
		this.idUtilisateur=aIdUtilisateur;
	}
	/**
	 * set the value of libelle
	 * @param aLibelle
	 */
	public void setLibelle(String aLibelle){
		this.libelle=aLibelle;
	}
	/**
	 * set the value of type
	 * @param aType
	 */
	public void setType(boolean aType){
		this.type=aType;
	}
	/**
	 * set the value of question_questionnaires
	 * @param aQuestion_questionnaires
	 */
	public void setQuestion_questionnaires(List<Question_questionnaire> aQuestion_questionnaires){
		this.question_questionnaires=aQuestion_questionnaires;
	}
	/**
	 * set the value of reponses
	 * @param aReponses
	 */
	public void setReponses(List<Reponse> aReponses){
		this.reponses=aReponses;
	}
	/**
	 * set the value of utilisateur
	 * @param aUtilisateur
	 */
	public void setUtilisateur(Utilisateur aUtilisateur){
		this.utilisateur=aUtilisateur;
	}
	@Override
	public String toString() {
		return " [libelle] = " + libelle+" [idUtilisateur] = " + idUtilisateur+" [id] = " + id+" [type] = " + type;
	}
}