<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- css -->
    <link href="${ pageContext.servletContext.contextPath }/resources/css/member.css" rel="stylesheet" type="text/css">
    <!-- bootstrap -->

    <!-- Roboto -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <!-- noto sans KR-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">

    <title>Planty๐ฟ ํ์๊ฐ์</title>
</head>

<body>
 	<!-- header -->
    <header class="menu1">
        <div class="back">
            <div class="nav-bar">
                <div class="navbar-left">
    
                    <div class="dropdown">
                        <a href="../page/ABOUT US.html" class="dropbtn">ABOUT US</a>
                    </div>
    
                    <div class="dropdown">
                        <button class="dropbtn">SHOP</button>
                        <div class="dropdown-content">
                            <a href="#">ALL</a>
                            <a href="#">FUNCTION</a>
                            <a href="#">PLACE</a>
                            <a href="#">FOR ANIMALS</a>
                        </div>
                    </div>
    
                    <div class="dropdown">
                        <button class="dropbtn">CUSTOMER</button>
                        <div class="dropdown-content">
                            <a href="#">NOTICE</a>
                            <a href="../page/FAQ.html">FAQ</a>
                        </div>
                    </div>
    
                </div>
                <div class="navbar-center">
                    <a href="../page/ABOUT US.html"><img class="image" src="${ pageContext.servletContext.contextPath }/resources/image/planty_logo.png"></a>
                </div>
    
                <div class="navbar-right">
                    <ul>
                        <li><a href="${ pageContext.servletContext.contextPath }/user/regist"> <img class="icon" onClick="mypage_check();"
                                    src="${ pageContext.servletContext.contextPath }/resources/image/my.png"></a></li>
                        <li><a href="${ pageContext.servletContext.contextPath }/user/regist"> <img class="icon" onClick="mypage_check();"
                                    src="${ pageContext.servletContext.contextPath }/resources/image/cart.png"></a></li>
                    </ul>
                    
    
                </div>
            </div>
        </div>
    </header>
    
    <!-- content -->
    <div class="title-ar">
        ํ์ ๊ฐ์
    </div>
    <div class="join-form2 wrapper">
        <form class="mem-type-form" method="get" action="">
            <span id="mem-type">ํ์์?ํ</span>
            <label class="mem-slct"><input type="checkbox" name="member-type" value="1" checked
                    onclick='checkOnlyOne(this); movePage("${ pageContext.servletContext.contextPath }/user/regist2");'>์ผ๋ฐ ํ์</label>
            <label class="mem-slct"><input type="checkbox" name="member-type" value="2"
                    onclick='checkOnlyOne(this); movePage("JOIN-2partner.html");'>์ฌ์์ ํ์</label>
        </form>
        <div class="kakao-login">
            <h3 class="sub-tt">๊ฐํธ ํ์ ๊ฐ์</h3>
            <p>์นด์นด์ค๋ก 1์ด๋ง์ ํ์๊ฐ์ํ์ธ์.</p>
            <a class="btn-kakao" onclick="kakaoLogin('da1224c223577e5a09c518b3d79e51c8')">์นด์นด์ค 1์ด ํ์๊ฐ์</a>
        </div>

        <!-- ์นด์นด์ค ์คํฌ๋ฆฝํธ -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script>
        Kakao.init('da1224c223577e5a09c518b3d79e51c8'); //๋ฐ๊ธ๋ฐ์ ํค ์ค javascriptํค๋ฅผ ์ฌ์ฉํด์ค๋ค.
        console.log(Kakao.isInitialized()); // sdk์ด๊ธฐํ์ฌ๋ถํ๋จ
        //์นด์นด์ค๋ก๊ทธ์ธ
        function kakaoLogin() {
            Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
                })
            },
            fail: function (error) {
                console.log(error)
            },
            })
        }
        //์นด์นด์ค๋ก๊ทธ์์  
        function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
            }
        }  
        </script>
        <div class="form-join">
            <form id="join-form2" action="${ pageContext.servletContext.contextPath }/user/regist2" method="post">


                <div class="form-name">์์ด๋</div>
                <span class="input_area"><input type="text" maxlength="20" name="id" required
                        placeholder="์๋ฌธ,์ซ์ ์กฐํฉ 20์ ์ด๋ด"></span>
                <button class="join-btn join-btn-style" id="idCheck" type="button">์ค๋ณตํ์ธ</button>

                <div class="form-name">๋น๋ฐ๋ฒํธ</div>
                <span class="input_area"><input type="password" maxlength="30" name="pwd" required id="pwd"
                        placeholder="์๋ฌธ ๋์๋ฌธ์/์ซ์/ํน์๋ฌธ์ ์ค 2๊ฐ์ง ์ด์ ์กฐํฉ, 8์~30์" onchange="check_pw()"></span>

                <div class="form-name">๋น๋ฐ๋ฒํธ ํ์ธ</div>
                <span class="input_area"><input type="password" maxlength="30" name="pwd2" id="pwd2" onchange="check_pw()" required></span>&nbsp;<span id="check"></span>
                <label id="pwdResult"></label>

                <div class="form-name">์ด๋ฆ</div>
                <span class="input_area"><input type="text" maxlength="10" name="name" required></span>

                <div class="form-name">์ฐ๋ฝ์ฒ</div>
                <span class="input_area"><input type="tel" maxlength="13" name="phone"
                        placeholder="์) 010-1234-5678" required></span>

                <div class="form-name">์ด๋ฉ์ผ</div>
                <span class="input_area"><input type="email" name="email" placeholder="์) planty@naver.com" required></span>

                <div class="form-name">์ฐํธ๋ฒํธ</div>
                <span class="input_area"><input type="text" id="member_post" name="zipcode" class="postcodify_postcode5" readonly></span>
                <button class="join-btn join-btn-style" id="postcodify_search_button" type="button" onclick="findAddr();">๊ฒ์</button>
                <div class="form-name">๋๋ก๋ช์ฃผ์</div>
                <span class="input_area"><input type="text" id="member_addr" name="address" class="postcodify_address" readonly></span>
                <div class="form-name">์์ธ์ฃผ์</div>
                <span class="input_area"><input type="text" name="addrDetail" class="postcodify_details" required></span>
                <input type="hidden" value="${ textYn }" name="textYn">
                <div class="btnArea">
                    <button class="join-btn-style" id="joinBtn" type="button">๊ฐ์ํ๊ธฐ</button>
                </div>
            </form>


        </div>

    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    
                    console.log(data);
                    
                    // ํ์์์ ๊ฒ์๊ฒฐ๊ณผ ํญ๋ชฉ์ ํด๋ฆญํ์๋ ์คํํ? ์ฝ๋๋ฅผ ์์ฑํ๋ ๋ถ๋ถ.
                    // ๋๋ก๋ช ์ฃผ์์ ๋ธ์ถ ๊ท์น์ ๋ฐ๋ผ ์ฃผ์๋ฅผ ํ์ํ๋ค.
                    // ๋ด๋?ค์ค๋ ๋ณ์๊ฐ ๊ฐ์ด ์๋ ๊ฒฝ์ฐ์ ๊ณต๋ฐฑ('')๊ฐ์ ๊ฐ์ง๋ฏ๋ก, ์ด๋ฅผ ์ฐธ๊ณ?ํ์ฌ ๋ถ๊ธฐ ํ๋ค.
                    var roadAddr = data.roadAddress; // ๋๋ก๋ช ์ฃผ์ ๋ณ์
                    var jibunAddr = data.jibunAddress; // ์ง๋ฒ ์ฃผ์ ๋ณ์
                    // ์ฐํธ๋ฒํธ์ ์ฃผ์ ์?๋ณด๋ฅผ ํด๋น ํ๋์ ๋ฃ๋๋ค.
                    document.getElementById('member_post').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("member_addr").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("member_addr").value = jibunAddr;
                    }
                }
            }).open();
        }
    </script>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    
    <script>
        function checkOnlyOne(element) {

            const checkboxes = document.getElementsByName("member-type");
            checkboxes.forEach((cb) => {
                cb.checked = false;
            });

            element.checked = true;
        }

        function movePage(page) {
            window.document.location.href = page;
            return;
        }
        
        //id ์ค๋ณต ํ์ธ
        $("#idCheck").click(function(){
			// ์์ด๋ ์ค๋ณต ์ false, ์์ด๋ ์ฌ์ฉ ๊ฐ๋ฅ ์ true --> ์?ํจ์ฑ ๊ฒ์ฌ๋ฅผ ์ํ ๋ณ์
			let isUsable = false;
			const id = $("[name=id]");
				
			if(!id || id.val().length < 4){
				alert("์์ด๋๋ ์ต์ 4์๋ฆฌ ์ด์์ด์ด์ผ ํฉ๋๋ค.");
				id.focus();
			}else {
				// 4์๋ฆฌ ์ด์์ userId ๊ฐ์ ์๋?ฅํ์ ๊ฒฝ์ฐ $.ajax() ํต์? 
				$.ajax({
					url : "${ pageContext.servletContext.contextPath }/user/idCheck",
					type : "post",
					data : { id : id.val() },
					success : function(result) {
						console.log(result);
						if (result == "fail") {
							alert("์ฌ์ฉํ? ์ ์๋ ์์ด๋์๋๋ค.");
							id.focus();
						} else {
							//alert("์ฌ์ฉ ๊ฐ๋ฅํ ์์ด๋์๋๋ค.");
							if (confirm("์ฌ์ฉ ๊ฐ๋ฅํ ์์ด๋์๋๋ค. ์ฌ์ฉํ์๊ฒ?์ต๋๊น?")) {
								id.attr('readonly', true); // ๋ ์ด์ id ์๋?ฅ ๊ณต๊ฐ์ ๋ฐ๊ฟ ์ ์๋๋ก
								isUsable = true; // ์ฌ์ฉ ๊ฐ๋ฅํ ์์ด๋๋ผ๋ flag ๊ฐ
							} else {
								// confirm ์ฐฝ์์ ์ทจ์๋ฅผ ๋๋ฅผ ๊ฒฝ์ฐ (์ฒ์, ๋๋ ๋ฐ๋ณตํด์)
								id.attr('readonly', false); // ๋ค์ id inputํ๊ทธ ์์? ๊ฐ๋ฅํ๋๋ก
								isUsable = false; // ์ฌ์ฉ ๋ถ๊ฐ๋ฅํ ์์ด๋ flag
								id.focus();
							}
						}
						// ์์ด๋ ์ค๋ณต ์ฒดํฌ ํ ์ค๋ณต์ด ์๋๋ฉฐ ์ฌ์ฉํ๊ฒ?๋ค๊ณ? ์?ํํ ๊ฒฝ์ฐ
						if (isUsable) {
							$("#joinBtn").attr("type", "submit");
						} else {
							$("#joinBtn").attr("type", "button");
						}
					},
					error : function(e) {
						console.log(e);
					}
				});
			}
		});
        
        function mypage() {
            let signIn = ""
            if (signIn == "") {
                alert("ํด๋น ํ์ด์ง๋ ๋ก๊ทธ์ธ ํ ์ฌ์ฉํ์ค ์ ์์ต๋๋ค.");
                location.href = "LOG IN.html";
            } else {
                location.href = "mypage.html";
            }
        }

        function cart() {
            let signIn = ""
            if (signIn == "") {
                alert("ํด๋น ํ์ด์ง๋ ๋ก๊ทธ์ธ ํ ์ฌ์ฉํ์ค ์ ์์ต๋๋ค.");
                location.href = "LOG IN.html";
            } else {
                location.href = "cart.html";
            }
        }
        
        <!-- password ์ฒดํฌ -->
        function check_pw(){
        	 
            var pwd = document.getElementById('pwd').value;
            var check_SC = 0;
 
            if(pwd.length < 8 || pwd.length>30){
                window.alert('๋น๋ฐ๋ฒํธ๋ 8๊ธ์ ์ด์, 30๊ธ์ ์ดํ๋ง ์ด์ฉ ๊ฐ๋ฅํฉ๋๋ค.');
                document.getElementById('pwd').value='';
            }
            
            if(document.getElementById('pwd').value !='' && document.getElementById('pwd2').value!=''){
                if(document.getElementById('pwd').value==document.getElementById('pwd2').value){
                    document.getElementById('check').innerHTML='๋น๋ฐ๋ฒํธ๊ฐ ์ผ์นํฉ๋๋ค.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='๋น๋ฐ๋ฒํธ๊ฐ ์ผ์นํ์ง ์์ต๋๋ค.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
        
    </script>


    <!-- footer -->
    <footer>
        <p>
            <span>์ํธ: PLANTY | ๋ํ: ๊นํ๋ | ๊ฐ์ธ์?๋ณด๊ด๋ฆฌ์ฑ์์: ๊นํ๋ | ์?ํ: 070-1234-5678 | ์ด๋ฉ์ผ: planty00@naver.com</span><br />
            <span>์ฃผ์: ์์ธํน๋ณ์ ํ๋๊ตฌ ์๋ฌผ๋ 159-2 | ์ฌ์์๋ฑ๋ก๋ฒํธ: 151-15-15151 | ํต์?ํ๋งค: 2022-์์ธ๊ฐ๋จ-0000 | ํธ์คํ์?๊ณต์: (์ฃผ)์๋ฌผ์ต</span><br />
        </p>
        <nav>
            <a href='../page/policy.html'>์ด์ฉ์ฝ๊ด</a> |
            <a href='../page/policy.html'>๊ฐ์ธ์?๋ณด์ฒ๋ฆฌ๋ฐฉ์นจ</a>
        </nav>
    </footer>
</body>

</html>