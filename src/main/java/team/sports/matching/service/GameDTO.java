package team.sports.matching.service;

public class GameDTO {
	private String gamedate;
	private String time;
	private String stadium;
	private String teamname;
	private String teamrating;
	private String teaminfo;
	private String teamlogo;
	
	public String getTeamlogo() {
		return teamlogo;
	}
	public void setTeamlogo(String teamlogo) {
		this.teamlogo = teamlogo;
	}
	public String getGamedate() {
		return gamedate;
	}
	public void setGamedate(String gamedate) {
		this.gamedate = gamedate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getTeamrating() {
		return teamrating;
	}
	public void setTeamrating(String teamrating) {
		this.teamrating = teamrating;
	}
	public String getTeaminfo() {
		return teaminfo;
	}
	public void setTeaminfo(String teaminfo) {
		this.teaminfo = teaminfo;
	}
	
	
}
