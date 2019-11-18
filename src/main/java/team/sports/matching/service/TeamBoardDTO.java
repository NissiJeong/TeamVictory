package team.sports.matching.service;

public class TeamBoardDTO {
	
	private String name;//이름
	private String base_mainhand;//야구주손
	private String teamname;//팀명
	private String so;//삼진
	private String rbi;//타점
	private String sb;//도루
	private String hr;//홈런
	private String w;//승
	private String l;//패
	private String blsv;//블론세이브
	private String ci;//교체이닝
	private String co;//교체타수
	private String sv;//세이브
	private String hol;//홀드
	private String tbf;//상대타자수
	private String ip;//이닝
	private String h;//피안타
	private String bb;//볼넷
	private String hbp;//사구
	private String r;//실점
	private String sc;//득점
	private String er;//자책점
	private String pa;//타석
	private String ab;//타수(?)
	private String category;//팀종목
	private String teamloc;//팀지역
	private String manager_id;//팀장아이디
	private String teaminfo;//팀소개
	private String teamrating;//팀레이팅
	private java.sql.Date regidate;//팀 창단일
	private String teamcount;//팀원수
	private java.sql.Date gamedate;//경기일정
	private String stadium;//경기장
	private String awayteam;//away팀
	private String homescore;//팀점수
	private String awayscore;//away팀점수
	private String re;//승패
	private String ot;//경기결과 상대팀이름
	private String teamlogo;//팀로고
	private String profile;//개인사진
	
	//게터 세터
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBase_mainhand() {
		return base_mainhand;
	}
	public void setBase_mainhand(String base_mainhand) {
		this.base_mainhand = base_mainhand;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getSo() {
		return so;
	}
	public void setSo(String so) {
		this.so = so;
	}
	public String getRbi() {
		return rbi;
	}
	public void setRbi(String rbi) {
		this.rbi = rbi;
	}
	public String getSb() {
		return sb;
	}
	public void setSb(String sb) {
		this.sb = sb;
	}
	public String getHr() {
		return hr;
	}
	public void setHr(String hr) {
		this.hr = hr;
	}
	public String getW() {
		return w;
	}
	public void setW(String w) {
		this.w = w;
	}
	public String getL() {
		return l;
	}
	public void setL(String l) {
		this.l = l;
	}
	public String getBlsv() {
		return blsv;
	}
	public void setBlsv(String blsv) {
		this.blsv = blsv;
	}
	public String getCi() {
		return ci;
	}
	public void setCi(String ci) {
		this.ci = ci;
	}
	public String getCo() {
		return co;
	}
	public void setCo(String co) {
		this.co = co;
	}
	public String getSv() {
		return sv;
	}
	public void setSv(String sv) {
		this.sv = sv;
	}
	public String getHol() {
		return hol;
	}
	public void setHol(String hol) {
		this.hol = hol;
	}
	public String getTbf() {
		return tbf;
	}
	public void setTbf(String tbf) {
		this.tbf = tbf;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getH() {
		return h;
	}
	public void setH(String h) {
		this.h = h;
	}
	public String getBb() {
		return bb;
	}
	public void setBb(String bb) {
		this.bb = bb;
	}
	public String getHbp() {
		return hbp;
	}
	public void setHbp(String hbp) {
		this.hbp = hbp;
	}
	public String getR() {
		return r;
	}
	public void setR(String r) {
		this.r = r;
	}
	public String getSc() {
		return sc;
	}
	public void setSc(String sc) {
		this.sc = sc;
	}
	public String getEr() {
		return er;
	}
	public void setEr(String er) {
		this.er = er;
	}
	public String getPa() {
		return pa;
	}
	public void setPa(String pa) {
		this.pa = pa;
	}
	public String getAb() {
		return ab;
	}
	public void setAb(String ab) {
		this.ab = ab;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTeamloc() {
		return teamloc;
	}
	public void setTeamloc(String teamloc) {
		this.teamloc = teamloc;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getTeaminfo() {
		return teaminfo;
	}
	public void setTeaminfo(String teaminfo) {
		this.teaminfo = teaminfo;
	}
	public String getTeamrating() {
		return teamrating;
	}
	public void setTeamrating(String teamrating) {
		this.teamrating = teamrating;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public String getTeamcount() {
		return teamcount;
	}
	public void setTeamcount(String teamcount) {
		this.teamcount = teamcount;
	}
	public java.sql.Date getGamedate() {
		return gamedate;
	}
	public void setGamedate(java.sql.Date gamedate) {
		this.gamedate = gamedate;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getAwayteam() {
		return awayteam;
	}
	public void setAwayteam(String awayteam) {
		this.awayteam = awayteam;
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
	public String getRe() {
		return re;
	}
	public void setRe(String re) {
		this.re = re;
	}
	public String getOt() {
		return ot;
	}
	public void setOt(String ot) {
		this.ot = ot;
	}
	public String getTeamlogo() {
		return teamlogo;
	}
	public void setTeamlogo(String teamlogo) {
		this.teamlogo = teamlogo;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}