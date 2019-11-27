package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import team.sports.printdb.baseball.HitterDTO;
import team.sports.printdb.baseball.PitcherDTO;

@Repository("teamboard")
public class TeamBoardDAO {
   // 데이터소스 주입
   @Resource(name="template")
   private SqlSessionTemplate template;
   
   //선수목록
   public List<TeamBoardDTO> selectList(Map map) {
      return template.selectList("TeamBoardList", map);
   }
   
   //팀원 구하기
   public List<Map> memberSelect(){
      return template.selectList("memberSelect"); 
   }
   
   //최다득점 TOP3
   public List<TeamBoardDTO> bestrbiPlayer(Map map) { 
      return template.selectList("BestrbiPlayer", map); 
   }
   
   //최다삼진 TOP3
   public List<TeamBoardDTO> bestsoPlayer(Map map) { 
      return template.selectList("BestsoPlayer", map); 
   }
   
   //최다홈런 TOP3
   public List<TeamBoardDTO> besthrPlayer(Map map) { 
      return template.selectList("BesthrPlayer", map); 
   }

   //최다도루 TOP3
   public List<TeamBoardDTO> bestsbPlayer(Map map) { 
      return template.selectList("BestsbPlayer", map); 
   }
   
   //팀목록
   public List<Map> teamselectList(Map map) { 
      return template.selectList("TeamSearchList", map); 
   }
   
   //팀목록
   public List<TeamBoardDTO> teamNameSearch(Map map) { 
      return template.selectList("TeamNameSearch", map); 
   }
   
   //경기일정
   public List<TeamBoardDTO> gameSchedule(Map map){
      return template.selectList("GameSchedule", map);
   }
   
   //팀소개
   public List<TeamBoardDTO> teamInfo(Map map) {
      return template.selectList("TeamSelf", map);
   }

   //투수랭킹
   public List<PitcherDTO> pitcherRank(Map map) {
      return template.selectList("PitcherRank", map);
   }
   //타자랭킹
   public List<HitterDTO> hitterRank(Map map) {
      return template.selectList("HitterRank", map);
   }

   //팀기네스 - 최다득점
   public List<TeamBoardDTO> teamGuinnessScore(Map map) {
      return template.selectList("TeamGuinnessScore",map);
   }

   public List<TeamBoardDTO> teamGuinnessHomeRun(Map map) {
      return template.selectList("TeamGuinnessHomRun",map);
   }

   public List<TeamBoardDTO> teamGuinnessHit(Map map) {
      return template.selectList("TeamGuinnessHit",map);
   }

   public List<TeamBoardDTO> teamGuinnessStrikeOut(Map map) {
      return template.selectList("TeamGuinnessStrikeOut",map);
   }

   
   //팀 선택시
   //선수목록
   public List<TeamBoardDTO> selectListSelect(Map map) {
      return template.selectList("TeamBoardListSelect", map);
   }

   //최다득점 목록
   public List<TeamBoardDTO> bestrbiPlayerSelect(Map map) {
      return template.selectList("BestrbiPlayerSelect", map);
   }

   //최다삼진 목록
   public List<TeamBoardDTO> bestsoPlayerSelect(Map map) {
      return template.selectList("BestsoPlayerSelect", map);
   }

   //최다홈런 목록
   public List<TeamBoardDTO> besthrPlayerSelect(Map map) {
      return template.selectList("BesthrPlayerSelect", map);
   }

   //최다도루 목록
   public List<TeamBoardDTO> bestsbPlayerSelect(Map map) {
      return template.selectList("BestsbPlayerSelect", map);
   }

   //경기일정
   public List<TeamBoardDTO> gameScheduleSelect(Map map) {
      return template.selectList("GameScheduleSelect", map);
   }
   
   //팀소개
   public List<TeamBoardDTO> teamInfoSelect(Map map) {
      return template.selectList("TeamSelfSelect", map);
   }

   //투수랭킹
   public List<Map> pitcherRankSelect(Map map) {
      return template.selectList("PitcherRankSelect", map);
   }

   //타자랭킹
   public List<Map> hitterRankSelect(Map map) {
      return template.selectList("HitterRankSelect", map);
   }

   //팀기네스-최다득점
   public List<TeamBoardDTO> teamGuinnessScoreSelect(Map map) {
      return template.selectList("TeamGuinnessScoreSelect",map);
   }

   //팀기네스-최다홈런
   public List<TeamBoardDTO> teamGuinnessHomeRunSelect(Map map) {
      return template.selectList("TeamGuinnessHomRunSelect",map);
   }

   //팀기네스-최다안타
   public List<TeamBoardDTO> teamGuinnessHitSelect(Map map) {
      return template.selectList("TeamGuinnessHitSelect",map);
   }

   //팀기네스-최다삼진
   public List<TeamBoardDTO> teamGuinnessStrikeOutSelect(Map map) {
      return template.selectList("TeamGuinnessStrikeOutSelect",map);
   }

   public List<Map> getTeamManagement(Map map) {
      return template.selectList("getTeamManagement", map);
   }

   public int TeamManagementChange(Map map) {
      return template.update("TeamManagementChange",map);
   }

   public int insertTeamMember(Map map) {
      return template.insert("TeammemberInsert", map);
   }

   public List<Map> myinfo(Map map) {
      return template.selectList("MyInfo", map);
   }

   public int selectTeamWaiting(Map map) {
      return template.selectOne("SignUpList", map);
   }

   public List<Map> selectSignup(Map map) {
      return template.selectList("SignUpMember", map);
   }

   public int updateTeammember(Map map) {
      return template.update("signupteammember", map);
   }

   public int updateRegiStatus(Map map) {
      // TODO Auto-generated method stub
      return template.update("updateRegiStatus",map);
   }

   //최다세이브
   public List<TeamBoardDTO> teamGuinnessSave(Map map) {
      return template.selectList("TeamGuinnessSave",map);
   }

	/*
	 * //최다투구수 public List<TeamBoardDTO> teamGuinnessPitch(Map map) { return
	 * template.selectList("TeamGuinnessPitch",map); }
	 */
   
   public List<TeamBoardDTO> teamGuinnessSaveSelect(Map map) {
      return template.selectList("TeamGuinnessSaveSelect",map);
   }

	/*
	 * public List<TeamBoardDTO> teamGuinnessPitchSelect(Map map) { return
	 * template.selectList("TeamGuinnessPitchSelect",map); }
	 */
}