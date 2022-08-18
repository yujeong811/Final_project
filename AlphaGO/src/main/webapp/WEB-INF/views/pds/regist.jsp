<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<head>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>');
}
</script>
</head>

<title>자료등록</title>

<body>
   <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
    		<div class="row mb-2">
    			<div class="col-sm-6">
	      			<h1>자료실</h1>
	      		</div>



	     	</div>
      	</div>
    </section>

    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h4 style="float:left;">글등록</h4>


					<button type="button" class="btn btn-soft-danger" style="float:right; margin-left:10px;" id="cancelBtn"  onclick="CloseWindow();">취 소</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" style="float:right;" class="btn btn-soft-primary" id="registBtn" onclick="regist_go();">등 록</button>
					</div><!--end card-header  -->
					<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post" action="regist.go" name="registForm">

							<div class="form-group">
								<label for="title">제 목</label>
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="row">
							<div class="col-md-6">
								<label for="writer">작성자</label>
								<input type="text" id="writer" readonly
									name="writer" class="form-control" value="${loginUser.id }">
									</div>
									<div class="col-md-6">
									<label for="writedate">작성일</label>
									<c:set var="now" value="<%=new java.util.Date()%>" />
								<input type="date" id="writedate" readonly
									name="writerdate" class="form-control" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />">
									</div>
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="5"
									placeholder="내용을 작성하세요."></textarea>
							</div>
							<div class="form-group">
								<div class="card card-outline card-success">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;<button class="btn btn-xs btn-soft-primary"
										onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>


<script>
	window.onload=function(){
		summernote_go($('#content'),'<%=request.getContextPath()%>');
	}

</script>

<script>
	var dataNum=0;

function addFile_go(){
// 	alert('add file btn');

	if($('input[name="uploadFile"]').length >= 5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}

	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");

	$('.fileInput').append(div);

	dataNum++;

}

function remove_go(dataNum){
// 	alert(dataNum);
	$('div[data-no="'+dataNum+'"]').remove();
}

function regist_go(){

	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return
		}
	}

	if($("input[name='title']").val()==""){ // form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	 Swal.fire({
	      icon: 'success',
	      title: '자료가 등록되었습니다.'
	      
	    }).then((result) => {
   		// 둘다 비어있으면 비밀번호 변경안함
   			
	$("form[role='form']").submit()
   	  

  		})

}
</script>

















