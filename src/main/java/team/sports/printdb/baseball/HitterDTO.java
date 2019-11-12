package team.sports.printdb.baseball;

import java.util.Date;

public class HitterDTO {
	
	int pa, ab, h, b2, b3, hr, r, rbi, sb, cs, bb, hbp, so, gdp, e, horder, pos, rank;
	
	int sumpa, sumab, sumh, sumb2, sumb3, sumhr, sumr, sumrbi, sumsb, sumcs, sumbb, sumhbp, sumso, sumgdp;
	
	String stadium;
	
	Date gameDate;
	int time;
	
	double avg, totalAvg;

	
	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
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

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
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

	public int getSumpa() {
		return sumpa;
	}

	public void setSumpa(int sumpa) {
		this.sumpa = sumpa;
	}

	public int getSumab() {
		return sumab;
	}

	public void setSumab(int sumab) {
		this.sumab = sumab;
	}

	public int getSumh() {
		return sumh;
	}

	public void setSumh(int sumh) {
		this.sumh = sumh;
	}

	public int getSumb2() {
		return sumb2;
	}

	public void setSumb2(int sumb2) {
		this.sumb2 = sumb2;
	}

	public int getSumb3() {
		return sumb3;
	}

	public void setSumb3(int sumb3) {
		this.sumb3 = sumb3;
	}

	public int getSumhr() {
		return sumhr;
	}

	public void setSumhr(int sumhr) {
		this.sumhr = sumhr;
	}

	public int getSumr() {
		return sumr;
	}

	public void setSumr(int sumr) {
		this.sumr = sumr;
	}

	public int getSumrbi() {
		return sumrbi;
	}

	public void setSumrbi(int sumrbi) {
		this.sumrbi = sumrbi;
	}

	public int getSumsb() {
		return sumsb;
	}

	public void setSumsb(int sumsb) {
		this.sumsb = sumsb;
	}

	public int getSumcs() {
		return sumcs;
	}

	public void setSumcs(int sumcs) {
		this.sumcs = sumcs;
	}

	public int getSumbb() {
		return sumbb;
	}

	public void setSumbb(int sumbb) {
		this.sumbb = sumbb;
	}

	public int getSumhbp() {
		return sumhbp;
	}

	public void setSumhbp(int sumhbp) {
		this.sumhbp = sumhbp;
	}

	public int getSumso() {
		return sumso;
	}

	public void setSumso(int sumso) {
		this.sumso = sumso;
	}

	public int getSumgdp() {
		return sumgdp;
	}

	public void setSumgdp(int sumgdp) {
		this.sumgdp = sumgdp;
	}

	public int getPos() {
		return pos;
	}

	public void setPos(int pos) {
		this.pos = pos;
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

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public double getTotalAvg() {
		return totalAvg;
	}

	public void setTotalAvg(double totalAvg) {
		this.totalAvg = totalAvg;
	}

	
	@Override
	public String toString() {
		return "HitterDTO [pa=" + pa + ", ab=" + ab + ", h=" + h + ", b2=" + b2 + ", b3=" + b3 + ", hr=" + hr + ", r=" + r + ", rbi=" + rbi + ", sb=" + sb + ", cs=" + cs + ", bb=" + bb + ", hbp=" + hbp + ", so=" + so + ", gdp=" + gdp
				+ ", e=" + e + ", horder=" + horder + ", sumpa=" + sumpa + ", sumab=" + sumab + ", sumh=" + sumh + ", sumb2=" + sumb2 + ", sumb3=" + sumb3 + ", sumhr=" + sumhr + ", sumr=" + sumr + ", sumrbi=" + sumrbi + ", sumsb=" + sumsb
				+ ", sumcs=" + sumcs + ", sumbb=" + sumbb + ", sumhbp=" + sumhbp + ", sumso=" + sumso + ", sumgdp=" + sumgdp + ", pos=" + pos + ", stadium=" + stadium + ", gameDate=" + gameDate + ", time=" + time + ", avg=" + avg
				+ ", totalAvg=" + totalAvg + "]";
	}
	
	
	
}






