package team.sports.matching.service;

public class BasketballDTO {

	String no;
	String title;
	String area;
	String position;
	java.sql.Date regidate;
	String remainuser;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public String getRemainuser() {
		return remainuser;
	}
	public void setRemainuser(String remainuser) {
		this.remainuser = remainuser;
	}
	
	
	
}
