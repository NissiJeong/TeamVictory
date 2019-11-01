package team.sports.matching.service;

import java.util.Date;

public class TeamDTO {
	
	
	private String teamName;
	private String category;
	private String teamLoc;
	private String teamRating;
	private String manager_id;
	private String teamInfo;
	private Date regiDate;
	private String teamLogo;
	
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
	public String getTeamInfo() {
		return teamInfo;
	}
	public void setTeamInfo(String teamInfo) {
		this.teamInfo = teamInfo;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	public String getTeamLogo() {
		return teamLogo;
	}
	public void setTeamLogo(String teamLogo) {
		this.teamLogo = teamLogo;
	}	
	
}
