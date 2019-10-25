<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
.w-1 {
	width: 80px;
	border: 1px solid #333333;
}

.w-2 {
	width: 1800px;
	border: 1px solid #333333;
}

.w-3 {
	width: 200px;
	border: 1px solid #333333;
}

.w-4 {
	width: 250px;
	border: 1px solid #333333;
}
</style>
<section>
	<!--content wrap-->
    
                <div class=" " id="Container">
                        <div class="wrap theme_community">
    <!-- 콘텐츠 -->
    <div class="contents">        <div class="hb_wrap">
                                            <div class="navi" style="margin:10px 34px 0 34px;">
    <h2 style="font-size:28px;font-family: 'nanumgothic','nanum','dotum';color:#000;">벼룩시장</h2>
    <!--
	<ul>
		<li>HOME</li>
		<li>볼파크</li>
		<li class="cur">벼룩시장</li>
	</ul>
	-->
</div>
<!--게시판 목록(앨범)-->
<div class="bbs">
            <div class="bbs-tab-area" style="position: relative;">
            <ul style="width:100%">
                                    <li class="on" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=00">전국</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=01">서울</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=02">인천</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=03">대전</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=04">광주</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=05">대구</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=06">부산</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=07">울산</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=08">경기</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=09">강원</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=10">충북</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=11">충남</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=12">전북</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=13">전남</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=14">경북</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=15">경남</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=16">제주</a>
                    </li>
                                    <li class="" style="width:5.55556%">
                        <a href="/community/sales/sales/?board_idx=29&category=17">세종</a>
                    </li>
                            </ul>
        </div>
        <div class="bbs-list-top">
        <div class="bbs-tbtn"><a href="/community/board/write?board_idx=29" class="bbs-wbbtn">글쓰기</a></div>        <form method="get" id="postSearchForm" action="/community/sales/Sales/">
            <input type="hidden" name="board_idx" value="29">
            <input type="hidden" name="category" value="00">
            <div class="bbs-sch">
                <div class="bbs-combo">
                    <dl class="bbs-cb">
                    </dl>
                    <select name='search_method' style="display:none;">
                        <option value='title' >제목</option>
                        <option value='title' >제목</option>
                        <option value='nickname' >작성자</option>
                    </select>
                </div>
                <input type="text" name="search_word" value="" />
                <a href="#" class="bbs-btn-sch postSearchBtn">검색</a>
            </div>
        </form>
    </div>
    <div class="bbs-list-wr">
        <table class="bbs-list" summary="구분 제목별 게시글을 나타낸 표">
            <tbody>
            <!--공지일경우 bbs-noti // 형광펜 div.title 에 색정보 클래스 (yellow,green,blue,pink,orange)-->
                            <tr class="bbs-noti">
                    <td class="num"><img src="//img.gameone.kr/board/ico_em.gif" alt="알림" /></td>
                    <td class="title">
                        <div class="title ">
                            <a href="/community/sales/view?board_idx=29&post_idx=42439&page=1&category=00">[공지] 벼룩시장 운영 정책</a>
                        </div>
                    </td>
                    <td class="writer">
                        <div class="writer">
                            <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
                            SPORTING                                                    </div>
                    </td>
                    <td class="date">2019.04.22</td>
                    <td class="hit">6155</td>
                </tr>
                        </tbody>
        </table>
        <div class="bbs-list-album">
            <div class="bbs-ab-list">
                <ul>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44099&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5db24570d16fa1do05ug6p.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44099&page=1&category=00" class="">윌슨a2k,롤링스HOH 팝니다.(내야,외야)</a>
                                                                        <img src="//img.gameone.kr/board/ico_new.gif" alt="새글" />                                </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 21</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.25</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    이주리                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44097&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img5db245edc1e5e1do062a72.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44097&page=1&category=00" class="">내야글러브 a2k 국내선수모델</a>
                                                                        <img src="//img.gameone.kr/board/ico_new.gif" alt="새글" />                                </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 56</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.24</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    김지수                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44095&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5db243943f1251do05fup2.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44095&page=1&category=00" class="">미즈노프로 내야 처분합니다</a>
                                    <span class="reply">[1]</span>                                    <img src="//img.gameone.kr/board/ico_new.gif" alt="새글" />                                </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 45</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.24</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    김태성                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44086&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5dafaafd89f941dnr37rjt.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44086&page=1&category=00" class="">미즈노글로벌엘리트(경식용-내야)</a>
                                                                        <img src="//img.gameone.kr/board/ico_new.gif" alt="새글" />                                </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 69</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.23</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    조영훈                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44085&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5dafaa08d0e631dnr30ckn.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44085&page=1&category=00" class="">日本高校野球硬式試合球     </a>
                                                                        <img src="//img.gameone.kr/board/ico_new.gif" alt="새글" />                                </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 34</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.23</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    조영훈                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44064&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5dad09bedf1dd1dnlus4e1.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44064&page=1&category=00" class="">[삽니다]자낙스 후지카와모델 구해봅니다</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 85</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.20</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    박문수                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44061&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5dad09791d5bb1dnluq090.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44061&page=1&category=00" class="">배트3점과 가방 정리합니다</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 249</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.20</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    최은진                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/sales/view?board_idx=29&post_idx=44058&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da964671d6741dner0cmg.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/sales/view?board_idx=29&post_idx=44058&page=1&category=00" class="">191018 시상배트 YGDK 나무배트 32인치 우드 강민서의야닥</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 158</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.18</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    강민서                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=44056&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da943c72268b1dnej1gf4.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=44056&page=1&category=00" class="">사회인야구 팀 로고 제작 해드립니다~!</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 232</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.18</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    김대호                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=44052&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da9093690f191dne4nva1.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=44052&page=1&category=00" class="">좌투외야글러브팝니다6만 5회사용</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 139</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.17</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    이만희                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=44051&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da909107a1a01dne4mq3k.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=44051&page=1&category=00" class="">1루미트 좌투  구매 원합니다 </a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 61</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.17</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    은정철                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=44046&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da7e931d1d971dnbudqm3.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=44046&page=1&category=00" class="">야구 외야글러브 (올화이트) 팜</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 193</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.17</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    이덕현                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=44011&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da3d6228076a1dn3votmu.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=44011&page=1&category=00" class="">[무조건10만원]c405플래티늄,다이너스티, 팀마루치,워리어,오하마,엑소,cu31, 고전명기 팝니다. 두자루부터 할인들어갑니다      배송료 없어요 무료요 무...</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 353</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.14</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    양승억                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=44000&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da3c29c0e4821dn3r0ccq.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=44000&page=1&category=00" class="">상태 좋은 외야 글럽 구합니다</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 152</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.12</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    김상윤                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43997&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da0526d163e61dmt43uh3.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43997&page=1&category=00" class="">1루글러브(미트) 팝니다</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 362</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.11</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    안세일                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43995&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img5da05253e1d331dmt435uk.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43995&page=1&category=00" class="">선글라스팝니다</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 265</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.11</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    박기현                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43994&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5da05230bc45f1dmt423k3.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43994&page=1&category=00" class="">야구공 팝니다 사실분연락주세요</a>
                                    <span class="reply">[1]</span>                                                                    </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 312</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.11</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    박기현                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43992&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5d9fd313020b41dms510i0.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43992&page=1&category=00" class="">글러브 수리 합니다(경기 포천시)</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 364</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.11</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    강일                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43990&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5d9fcbe6601a31dms38uvp.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43990&page=1&category=00" class="">드마리니 cf zen -5drop 27on/32in</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 284</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.10</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    노기호                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43988&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5d9f036e001c21dmqiapdg.png" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43988&page=1&category=00" class="">A2K요 모델 구해봅니다</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 204</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.10</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    이경                                                                    </dd>
                            </dl>
                        </li>
                                            <li>
						<span class="img" style="text-align:center; height:102px; width:152px; overflow:hidden;">
							<a href="/community/board/view?board_idx=29&post_idx=43982&page=1&category=00&search_method=&search_word=">
								<img data-original="//file.clubone.kr/community/community/201910/list_img_5d9e2b41dc4b01dmothube.jpg" alt=""  style="width:152px" class="lazy" />
							</a>
						</span>
                            <dl>
                                <dt style="text-align: center; overflow:hidden;height:22px;">
                                    <a href="/community/board/view?board_idx=29&post_idx=43982&page=1&category=00" class="">미즈노 사무라이 일체형 포수 헬멧 마스크</a>
                                                                                                        </dt>
                                <dd style="text-align: center;">
                                    <span class="hit">조회 198</span>
                                    <span class="hfive">0</span>
                                </dd>
                                <dd style="text-align: center;"><span class="date">2019.10.10</span></dd>
                                <dd style="text-align: center;">
                                    <img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지"/>
                                    양승재                                                                    </dd>
                            </dl>
                        </li>
                                    </ul>
            </div>
        </div>
    </div>
    <div class="bbs-pager">
        <ol class="bbs-pg"><!--현재페이지는 클래스로 cur-->
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=1" class="cur">1</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=2" class="">2</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=3" class="">3</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=4" class="">4</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=5" class="">5</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=6" class="">6</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=7" class="">7</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=8" class="">8</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=9" class="">9</a></li>
                            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=10" class="">10</a></li>
                    </ol>
        <ul class="bbs-pbtns"><!--활성화된 버튼이 아닐경우 클래스로 off-->
            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=1" class="first ">처음</a></li>
            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=1" class="prev ">이전</a></li>
            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=11" class="next">다음</a></li>
            <li><a href="/community/board/list?board_idx=29&category=00&search_method=&page=1119" class="last">마지막</a></li>
        </ul>
    </div>
    <div class="bbs-list-bt">
        <div class="bbs-btngr">
            <a href="/community/board/write?board_idx=29" class="bbs-wbbtn">글쓰기</a>
        </div>
    </div>
</section>