package team.sports.printdb.baseball;

import java.util.Date;

public class BaseBall_HitterDTO {
	
	int recordNo;
	int pa, ab, h, b2, b3, hr, rbi, sb, cs, bb, hbp, so, gdp, e, horder;
	String pos, awayTeam, stadium;
	Date gameDate, time;
	
	
	
	public int getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}
	public int getPa() {
		return pa;
	}
	public void setPa(int pa) {
		this.pa = pa;
	}
	public int getAb() {
		return ab;
	}
	public void setAb(int ab) {
		this.ab = ab;
	}
	public int getH() {
		return h;
	}
	public void setH(int h) {
		this.h = h;
	}
	public int getB2() {
		return b2;
	}
	public void setB2(int b2) {
		this.b2 = b2;
	}
	public int getB3() {
		return b3;
	}
	public void setB3(int b3) {
		this.b3 = b3;
	}
	public int getHr() {
		return hr;
	}
	public void setHr(int hr) {
		this.hr = hr;
	}
	public int getRbi() {
		return rbi;
	}
	public void setRbi(int rbi) {
		this.rbi = rbi;
	}
	public int getSb() {
		return sb;
	}
	public void setSb(int sb) {
		this.sb = sb;
	}
	public int getCs() {
		return cs;
	}
	public void setCs(int cs) {
		this.cs = cs;
	}
	public int getBb() {
		return bb;
	}
	public void setBb(int bb) {
		this.bb = bb;
	}
	public int getHbp() {
		return hbp;
	}
	public void setHbp(int hbp) {
		this.hbp = hbp;
	}
	public int getSo() {
		return so;
	}
	public void setSo(int so) {
		this.so = so;
	}
	public int getGdp() {
		return gdp;
	}
	public void setGdp(int gdp) {
		this.gdp = gdp;
	}
	public int getE() {
		return e;
	}
	public void setE(int e) {
		this.e = e;
	}
	public int getHorder() {
		return horder;
	}
	public void setHorder(int horder) {
		this.horder = horder;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	
	@Override
	public String toString() {
		return "BaseBall_PlayerDTO [recordNo=" + recordNo + ", pa=" + pa + ", ab=" + ab + ", h=" + h + ", b2=" + b2 + ", b3=" + b3 + ", hr=" + hr + ", rbi=" + rbi + ", sb=" + sb + ", cs=" + cs + ", bb=" + bb + ", hbp=" + hbp + ", so=" + so
				+ ", gdp=" + gdp + ", e=" + e + ", horder=" + horder + ", pos=" + pos + ", awayTeam=" + awayTeam + ", stadium=" + stadium + ", gameDate=" + gameDate + ", time=" + time + "]";
	}
	
	
	
	
	
	
	
}






