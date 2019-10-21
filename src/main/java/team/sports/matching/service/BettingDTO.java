package team.sports.matching.service;

public class BettingDTO {
	
	private java.sql.Date gameDate;
	private String stadium;
	private String time;
	private String baseTeamNo;
	private String awayTeam;
	private String gameStatus;
	private String homeScore;
	private String awayScore;
	
	private String homeTeam;
	
	public String getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
	}
	public java.sql.Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(java.sql.Date gameDate) {
		this.gameDate = gameDate;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getBaseTeamNo() {
		return baseTeamNo;
	}
	public void setBaseTeamNo(String baseTeamNo) {
		this.baseTeamNo = baseTeamNo;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}
	public String getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(String gameStatus) {
		this.gameStatus = gameStatus;
	}
	public String getHomeScore() {
		return homeScore;
	}
	public void setHomeScore(String homeScore) {
		this.homeScore = homeScore;
	}
	public String getAwayScore() {
		return awayScore;
	}
	public void setAwayScore(String awayScore) {
		this.awayScore = awayScore;
	}
	
	

}
