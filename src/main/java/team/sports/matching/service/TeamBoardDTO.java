package team.sports.matching.service;

public class TeamBoardDTO {
	
	private String name;//이름
	private String base_mainhand;//야구주손
	private String teamName;//팀명
	private String so;//삼진
	private String rbi;//타점
	private String sb;//도루
	private String hr;//홈런
	private String category;//팀종목
	private String teamloc;//팀지역
	private String manager_id;//팀장아이디
	private String teamRating;//팀레이팅
	private java.sql.Date regidate;//팀 창단일
	private String teamcount;//팀원수
	
	//게터
	public String getName() {
		return name;
	}
	public String getBase_mainhand() {
		return base_mainhand;
	}
	public String getTeamName() {
		return teamName;
	}
	public String getSo() {
		return so;
	}
	public String getRbi() {
		return rbi;
	}
	public String getSb() {
		return sb;
	}
	public String getHr() {
		return hr;
	}
	public String getCategory() {
		return category;
	}
	public String getTeamloc() {
		return teamloc;
	}
	public String getManager_id() {
		return manager_id;
	}
	public String getTeamRating() {
		return teamRating;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public String getTeamcount() {
		return teamcount;
	}	
}