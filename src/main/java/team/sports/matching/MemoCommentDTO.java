package team.sports.matching;

public class MemoCommentDTO {

	private String cno;
	private String lineComment;
	private java.sql.Date cpostDate;
	private String no;
	private String id;
	//프로그램 효율성을 위한 속성 추가]
	private String name;
	
	
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getLineComment() {
		return lineComment;
	}
	public void setLineComment(String lineComment) {
		this.lineComment = lineComment;
	}
	public java.sql.Date getCpostDate() {
		return cpostDate;
	}
	public void setCpostDate(java.sql.Date cpostDate) {
		this.cpostDate = cpostDate;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
