<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
	.outer {
		width : 800px;
		margin : auto;
	}
	.wrap {
		width : 780px;
		margin : 100px auto;
	}
	
	.notice_title {
		border-bottom : 1px solid #282A35;
	}
	
	.notice_content {
		padding : 0px 20px;
	}
	
	.notice_content .content {
		margin-bottom : 30px;
	}
	
	.input_area {
	    border: solid 1px #dadada;
	    padding : 10px 10px 14px 10px;
	    background : white;
	}
	
	.input_area input {
		width : 700px;
		height : 30px;
		border: 0px;
	}
	
	.input_area input:focus {
		outline:none;
	}

	.textarea {
		resize:none;
		border: solid 1px #dadada;
	}
	
	.textarea:focus {
		outline:none;
	}

	.title_span {
		background-color : #282A35; 
	}
	
	.notice_area button {
		width : 100px;
		height : 35px;
		border : 0px;
		color:white;
		background:#282A35;
		margin : 5px;
		cursor : pointer;
	}
	
	.btn_area {
		text-align:center;
		border-top : 1px solid #282A35;
		padding : 30px;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/admin-menubar.jsp" />

	<div class="outer">
		<div class="wrap">
			<div class="notice_area">
				<div class="notice_title">
					<h1>공지사항 작성</h1>
				</div>
				<div class="notice_content">
					<form action="${ pageContext.servletContext.contextPath }/notice/insert" method="post">
						<div class="content">
							<h4>
								<span class="title_span">&nbsp;</span> 제목
							</h4>
							<span class="input_area"> <input type="text" name="title"
								required>
							</span>

							<h4>
								<span class="title_span">&nbsp;</span> 내용
							</h4>
							<textarea class="textarea" rows="20" cols="100" name="body"
								required></textarea>
						</div>
						<div class="btn_area">
							<button type="button"
								onclick="location.href='${ pageContext.servletContext.contextPath }/notice/list'">목록</button>
							<button type="submit" id=regist>등록</button>
						</div>
							<script>
							function regist() {
										NoticeDTO 
								}
							</script>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
