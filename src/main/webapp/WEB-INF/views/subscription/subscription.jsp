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
		margin : 50px;
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
		margin-top : 50px; 
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
				<div id="item1" class="item">
					<div class="imgs"><img class="img" src="resources/img/vege.jpeg"></div>
					<div class="name">ä�� �ڽ�</div>
					<div class="content">���� �������� Ű����<br>
					�ǰ��� ä�ҵ���<br>
					���� �ٸ��� �����ص����.</div>
				</div>
			</div>
			<div class="col-3">
				<div id="item2" class="item">
					<div class="imgs"><img class="img" src="resources/img/fruits.jpg"></div>
					<div class="name">���� �ڽ�</div>
					<div class="content">���� ������ ��ö ������<br>
					�پ��ϰ� �����ؼ�<br>
					���������.</div>
				</div>
			</div>
			<div class="col-3">
				<div id="item3" class="item">
					<div class="imgs"><img class="img" src="resources/img/salad.jpg"></div>
					<div class="name">ä�� + ���� �ڽ�</div>
					<div class="content">������ ä�ҿ� �Բ� ������<br>
					ä�� + ���� �ڽ���<br>
					�����ϰ� �����带 ��ܺ�����.</div>
				</div>
			</div>
			<div class="col-3">
				<div id="item4" class="item">
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
				<input id="next" type="button" class="btn" value="���� >">
			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	
	<script>
		$(".item").on("click", function(){
			$(this).css("border", "1px solid #44b27d");
		})
	</script>
</body>
</html>