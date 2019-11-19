package team.sports.matching.service;

public class BettingDTO {
	
	private java.sql.Date gameDate;
	private String stadium;
	private String time;
	private String teamname;
	private String awayTeam;
	private String gameStatus;
	private String homeScore;
	private String awayScore;
	private String gameDay;
	private String count;  // 해당 경기에 배팅한 인원수
	private String bettingMember;  // 해당경기에 배팅한 인원 명단 
	private String category; // 종목
	private boolean bettingConfirm;


	public boolean isBettingConfirm() {
		return bettingConfirm;
	}
	public void setBettingConfirm(boolean bettingConfirm) {
		this.bettingConfirm = bettingConfirm;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	public String getBettingMember() {
		return bettingMember;
	}
	public void setBettingMember(String bettingMember) {
		this.bettingMember = bettingMember;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public java.sql.Date getGameDate() {
		return gameDate;
	}
	public String getGameDay() {
		return gameDay;
	}
	public void setGameDay(String gameDay) {
		this.gameDay = gameDay;
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
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
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
