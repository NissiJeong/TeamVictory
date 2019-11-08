package team.sports.matching.service;

import java.sql.Date;

public class BasketballDTO {

	
	String title;
	String id;
	String area;
	String position;
	Date regidate;
	String readyCount;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getReadyCount() {
		return readyCount;
	}
	public void setReadyCount(String readyCount) {
		this.readyCount = readyCount;
	}
	
	
	
}
