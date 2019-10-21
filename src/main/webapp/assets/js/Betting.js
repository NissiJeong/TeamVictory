
$(function(){
	scoreStyle();
	
		
		//$('#viewTarget').css('display','none');
 $('#viewTarget').hide();
		$('#btnJoin').click(function() {

			if (confirm($('#bettingPoint').val() + " 배팅허쉴?")) {
				alert('배팅완료');
			}
		}); 


		 
 var toggle=false;
    var  content = '';
    
		  $('#aa').click(function(){
			 if(!toggle){
				
			  // $('#viewTarget').css('display','inline');
				 $('#viewTarget').show();
			 }
			 else{
				// $('#viewTarget').css('display','none');
				 $('#viewTarget').hide();
			 }
			 toggle=!toggle;
		 }); 
		  
	});/////////  onload

	function scoreStyle(){ 
		
		
		//console.log(  $('.all-tbody > tr').length);
		//console.log($('.all-tbody tr:gt(0)').length)
		//console.log($('.all-tbody > tr:eq(0) td:eq(2)').text());
		//$('.all-tbody > tr:eq(0) td:eq(0)').css('background-color','red');
			
		/// =====   승리팀 글자색 , 글자크기 변경 
				$('.all-tbody tr').each(function(){
			
				 //홈스코어 
				 var homeScore = $(this).children(':eq(2)').find('#hs').text();
				 //어웨이 스코어
				 var awayScore = $(this).children(':eq(2)').find('#as').text();
				 //console.log($(this).children(':eq(2)').find('#hs').text());
			  
				 if(homeScore > awayScore) {
					 $(this).children(':eq(2)').find('#hs').css({
							//'font-weight' : 'bold',
							color : 'blue'
						});
				 }
				 else if(homeScore < awayScore) {
					 $(this).children(':eq(2)').find('#as').css({
							//'font-weight' : 'bold',
							color : 'red'
						});
				 }
				 
					
				 
			 });  
	}  
		
	
	