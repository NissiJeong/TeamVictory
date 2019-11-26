<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '득점', '실점'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance'
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      $(function(){
    	  $(window).resize( function(){
    		  drawChart();
    	  });
    		
    
    	  
      });
   
    </script>




  <section class="breadcum-section">  
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
            
              <h3 class="title">View</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">in play</li>
              </ol>
              
            </div>
          </div>
        </div>
      </div> 
    </div>
    
  </section>
 
 <!-- content -->
 <section>
 <div class="container" style="border:blue 1px solid">  
  
 	<div class="row" > 
 		<div class="col-md-12">   
 		
			<div class="d-flex bg-light justify-content-center pt-4 w-100"  style="height:150px">
		  		<div class="p-2 border w-25">A팀</div>
		  		<div class="p-2 border mx-5 align-self-center">VS</div>
		  		<div class="p-2 border w-25">B팀</div>
			</div>
 		
 		</div>  
 	</div>    <!-- row --> 
 		
 		
 		
 		
 		
 		
 		
 		
 		
 		
 		

   <!--  <table class="table table-bordered  table-responsive" style="border:1px orange solid">
     <tbody>
      <tr>
 		<div class="w-100">
 		
		<div class="d-flex bg-light justify-content-center pt-4"  style="height:150px">
		  <div class="p-2 border w-25">A Team</div>
		  <div class="p-2 border mx-5 align-self-center">home VS away</div>
		  <div class="p-2 border w-25">B Team</div>
		</div>
 		</div>  
      </tr>
      
      <tr>
	      <td class="w-50">
	      	
	     
	      </td>
	      
      
      </tr>
    </tbody>
   </table>     
 -->         

 <div class="col-md-12 text-center mt-5 bg-info" 
 style="font-size: 20px; font-weight: bold; height: 50px; line-height: 50px; background-color: dodgerblue !important;">
 최근 10경기 전적 
 </div>

 
<div class="row mt-0">		
<div class="table-responsive col-md-6 ml-0">
  <!--  A팀 테이블 -->
    <table class="table table-bordered" class="A_tableMatchTen" >
    <thead>
    <tr class="text-center">
      <th style="background-color: #000040;color:white;" colspan="4">A팀</th>
    </tr>
         
   	<tr class="text-center">  
   	    
    	<th class="w-25">경기일시</th> 
    	<th class="w-25">상대팀</th>  
    	<th class="w-25">스코어</th>
    	<th class="w-25">결과</th>
   	</tr>
   </thead> 
         
          <tbody> 
          <tr class="text-center"> 
          <td>2019-10-08</td>  
          <td>SK</td>
          <td>3 : 0 </td>
          <td ><span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #6495ED; border-radius:7px; ">승</span></td>
          </tr>
           
          <tr class="text-center"> 
            <th style="background-color: #c6c8ca" colspan="4">10전  3승  3무  4패</th>
          </tr>
           
          </tbody>
          
    </table> 
</div>


<div class="table-responsive col-md-6">
<!--  B팀 테이블 -->
    <table class="table table-bordered" id="B_tableMatchTen">
    <thead > 
	    <tr class="text-center">  
	      <th  style="background-color: #000040;color:white;" colspan="4">B팀</th>
	    </tr>
	   	<tr class="text-center" >
	    	<th class="w-25">경기일시</th> 
	    	<th class="w-25">상대팀</th>  
	    	<th class="w-25">스코어</th>
	    	<th class="w-25">결과</th>
	   	</tr>
   </thead>
          <tbody>
	          <tr class="text-center">  
		          <td>2019-10-08</td> 
		          <td>기아</td>
		          <td>3 : 0 </td> 
		          <td><span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #CD2E57; border-radius:7px; ">패</span></td>
	          </tr>
	          <tr class="text-center"> 
            <th style="background-color: #c6c8ca" colspan="4">10전  6승   4패</th>
          </tr>
          </tbody>
    </table>
</div>


</div>	 <!-- row -->

<div class="row mt-3">
  
  
<div class="col-md-6 h-100" id="chart_div" style="width: 100%; border: 1px solid"></div>

</div>


   
   
   
   

 	
 	

 

 
  
 

  	
  
  
  
  </div>  <!-- 컨테이너  -->
   </section>