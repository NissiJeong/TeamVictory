

package team.sports.matching.service;

public class MessageDTO {
	private String no;
	private String id;
	private String title;
	private String content;
	private java.sql.Date sendDate;
	private java.sql.Date openDate;
	
	//프로그램 효율성을 위한 속성 추가]
	//이름 저장
	private String name;
	
	
	public String execute() {
		
		return "success";		
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(java.sql.Date sendDate) {
		this.sendDate = sendDate;
	}

	public java.sql.Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(java.sql.Date openDate) {
		this.openDate = openDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	

}