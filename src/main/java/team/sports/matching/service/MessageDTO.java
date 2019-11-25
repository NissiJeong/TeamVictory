

package team.sports.matching.service;

public class MessageDTO {
	private String no;
	private String id;
	private String title;
	private String content;
	private java.sql.Date postDate;
	
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


	public java.sql.Date getPostDate() {
		return postDate;
	}


	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	
	
	

}
