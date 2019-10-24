package team.sports.matching.service;

public class BaseTeamDTO {
	
	
	private String teamName;
	private String category;
	private String teamLoc;
	private String teamRating;
	private String manager_id;
	
	
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTeamLoc() {
		return teamLoc;
	}
	public void setTeamLoc(String teamLoc) {
		this.teamLoc = teamLoc;
	}
	public String getTeamRating() {
		return teamRating;
	}
	public void setTeamRating(String teamRating) {
		this.teamRating = teamRating;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}	
}
