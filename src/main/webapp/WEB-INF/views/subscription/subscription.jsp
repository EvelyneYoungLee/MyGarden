<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>���� ����</title>
<style>
	#bcolor{
		width : 100%;
		height : 175px;
		background-color : #deca92;		
	}
	#title{
		text-align: center;
		margin : 100px 0px 100px 0px;
	}
	#title div:first-child{
		font-size : 27px;
		font-weight : bold;
		margin-bottom : 10px;
	}
	#title div:last-child{
		font-size : 16px;
	}
	.item{
		border : 1px solid #d1d1d1;
		text-align: center;	
	}
	.item:hover{
		cursor : pointer;
	}
	#item4 .img{
		width : 120px;
		height : 120px;
		margin-top : 15px;
	}
	.imgs{
		margin-top : 50px;
		height : 150px;
	}
	.img{
		width : 150px;
		height : 150px;
		border-radius: 100%;
		margin : auto;
	}
	.name{
		margin-top : 50px;
		margin-bottom : 30px;
		font-size : 18px;
		font-weight : bold;
	}
	.content{
		margin-bottom : 80px;
		font-size : 15px;
	}
	#btnBorder{
		margin-top : 100px;
		margin-bottom : 100px;
	}
	#next{
		width : 250px;
		height : 60px;
		background-color: #44b27d;
		color : white;
		border-top-left-radius : 20px;
		border-top-right-radius : 20px;
		border-bottom-left-radius : 20px;
		border-bottom-right-radius : 20px;
		font-weight: bold;
		font-size : 20px;
	}
	#next:hover{
		background-color: #b4d9b5;
	}
	#nextBtn{
		text-align: center;
		margin : auto;
	}
	#closeBtn{
		padding-right : 10px;
	}
	#modalTitle{
		text-align : center;
		margin-top : 40px;
		margin-bottom : 10px;
	}
	.mTitle{
		font-weight : bold;
		font-size : 24px;
	}
	.foryou{
		font-size : 14px;
	}
	.subscribe{
		height : 120px;
	}
	.periodSub{
		padding-left : 90px;
		margin-top : 20px;
		margin-bottom : 5px;
		font-size : 18px;
		font-weight : bold;
	}
	.period{
		border : 1px solid black;
		width : 130px;
		height : 70px;
		float : left;
		margin-left : 30px;
		margin-right : 30px;
		text-align : center;
		line-height : 70px;
		font-size : 18px;
		cursor : pointer;
	}
	#period2{
		margin-left : 90px;
	}
	#modalBtn{
		height : 80px;
		text-align : center;
	}
	#submitBtn{
		background-color: #44b27d;
		color : white;
		font-size : 15px;
		margin-top : 30px;
	}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="bcolor"></div>
	<div id="wrapper" class="container">
		<div id="title" class="row">
			<div class="col-12">Select Your Box</div>
			<hr>
			<div class="col-12">���� ������ �ڽ��� ������ �ּ���!</div>
		</div>
		<div id="items" class="row">
			<div class="col-3">
				<div class="item">
					<input id="vegetableBox" type="hidden" value="vegetable">
					<div class="imgs"><img class="img" src="resources/img/vege.jpeg"></div>
					<div class="name">ä�� �ڽ�</div>
					<div class="content">���� �������� Ű����<br>
					�ǰ��� ä�ҵ���<br>
					���� �ٸ��� �����ص����.</div>
				</div>
			</div>
			<div class="col-3">
				<div class="item">
					<input id="fruitBox" type="hidden" value="fruit">
					<div class="imgs"><img class="img" src="resources/img/fruits.jpg"></div>
					<div class="name">���� �ڽ�</div>
					<div class="content">���� ������ ��ö ������<br>
					�پ��ϰ� �����ؼ�<br>
					���������.</div>
				</div>
			</div>
			<div class="col-3">
				<div class="item">
					<input id="mixedBox" type="hidden" value="mixed">
					<div class="imgs"><img class="img" src="resources/img/salad.jpg"></div>
					<div class="name">ä�� + ���� �ڽ�</div>
					<div class="content">������ ä�ҿ� �Բ� ������<br>
					ä�� + ���� �ڽ���<br>
					�����ϰ� �����带 ��ܺ�����.</div>
				</div>
			</div>
			<div class="col-3">
				<div class="item">
					<input id="customBox" type="hidden" value="custom">
					<div class="imgs"><img class="img" src="resources/img/question.png"></div>
					<div class="name">������ �ڽ�</div>
					<div class="content">���� ���� �ڽ��� <br>
					���ϴ� ǰ������ �����ϰ� �ʹٸ�<br>
					������ �ڽ��� ����� ������.</div>
				</div>
			</div>
		</div>
		<div id="btnBorder" class="row">
			<div id="nextBtn" class="col-12">
				<input id="next" type="button" class="btn" value="���� >" data-toggle="modal" data-target="#exampleModalCenter">
			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div id="closeBtn">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div id="modalTitle">
			      <div class="modal-title mTitle" id="exampleModalCenterTitle">���� �ֱ� ����</div>
			      <div class="foryou">�ֱ⿡ ���� �˸��� ������ ������ �����!</div>
		      </div>
		      <div class="modal-body p-0">
		        <div id="weekly" class="subscribe">
		        	<div class="periodSub">�ְ�����</div>
		        	<div id="period2" class="period">
		        		����
		        	</div>
		        	<div class="period">
		        		����
		        	</div>
		        </div>
		        <div id="monthly" class="subscribe">
		        	<div class="periodSub">��������</div>
		        	<div id="period2" class="period">
		        		�� �޿� �ѹ�
		        	</div>
		        </div>
		      </div>
		      <div id="modalBtn">
		   		<button id="submitBtn" class="btn" type="button">��ٱ���</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<script>
		$(".item").on("click", function(){
			var item = $(this);
			$(".item").css("border", "1px solid #d1d1d1");
			item.css("border", "1px solid #44b27d");
			
			$("#next").on("click", function(){
// 				location.href = "subscription2?select=" + item.children("input").val();
			})
		})
	</script>
</body>
</html>