package team.sports.matching.service;

public class TeamDTO {
	
	private String baseTeamNo;
	private String teamName;
	private String teamLoc;
	private String baseRating;
	private String manager_id;
	
	public String getBaseTeamNo() {
		return baseTeamNo;
	}
	public void setBaseTeamNo(String baseTeamNo) {
		this.baseTeamNo = baseTeamNo;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamLoc() {
		return teamLoc;
	}
	public void setTeamLoc(String teaLoc) {
		this.teamLoc = teaLoc;
	}
	public String getBaseRating() {
		return baseRating;
	}
	public void setBaseRating(String baseRating) {
		this.baseRating = baseRating;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	
	
}
