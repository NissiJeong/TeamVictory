package team.sports.matching.service;

public class FinishDTO {
	private String no;
	private String gamedate;
	private String time;
	private String homescore;
	private String awayscore;
	private String hometeam;
	private String homelogo;
	private String awayteam;
	private String awaylogo;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
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
	public String getHomescore() {
		return homescore;
	}
	public void setHomescore(String homescore) {
		this.homescore = homescore;
	}
	public String getAwayscore() {
		return awayscore;
	}
	public void setAwayscore(String awayscore) {
		this.awayscore = awayscore;
	}
	public String getHometeam() {
		return hometeam;
	}
	public void setHometeam(String hometeam) {
		this.hometeam = hometeam;
	}
	public String getHomelogo() {
		return homelogo;
	}
	public void setHomelogo(String homelogo) {
		this.homelogo = homelogo;
	}
	public String getAwayteam() {
		return awayteam;
	}
	public void setAwayteam(String awayteam) {
		this.awayteam = awayteam;
	}
	public String getAwaylogo() {
		return awaylogo;
	}
	public void setAwaylogo(String awaylogo) {
		this.awaylogo = awaylogo;
	}
}
