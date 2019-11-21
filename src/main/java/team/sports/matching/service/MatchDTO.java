package team.sports.matching.service;

import java.util.Date;

public class MatchDTO {
	private int matchingno;
	private String teamname;
	private String enemyteam;
	private String stadium;
	private String reqdate;
	private String time;
	private String matchstatus;
	private String teamloc;
	private String teamlogo;
	private String teamrating;
	
	public int getMatchingno() {
		return matchingno;
	}
	public void setMatchingno(int matchingno) {
		this.matchingno = matchingno;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getEnemyteam() {
		return enemyteam;
	}
	public void setEnemyteam(String enemyteam) {
		this.enemyteam = enemyteam;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getReqdate() {
		return reqdate;
	}
	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMatchstatus() {
		return matchstatus;
	}
	public void setMatchstatus(String matchstatus) {
		this.matchstatus = matchstatus;
	}
	public String getTeamloc() {
		return teamloc;
	}
	public void setTeamloc(String teamloc) {
		this.teamloc = teamloc;
	}
	public String getTeamlogo() {
		return teamlogo;
	}
	public void setTeamlogo(String teamlogo) {
		this.teamlogo = teamlogo;
	}
	public String getTeamrating() {
		return teamrating;
	}
	public void setTeamrating(String teamrating) {
		this.teamrating = teamrating;
	}
}
