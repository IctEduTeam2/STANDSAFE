<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>STANDSAFE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="resources/css/slide.css" />
    <link rel="stylesheet" href="resources/css/basis.css" />
    <style type="text/css">
        .team-member-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .team-member {
            width: 300px;
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            text-align: center;
            transition: transform 0.3s;
        }
        .team-member:hover {
            transform: scale(1.1);
        }
        .member-photo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
        </style>
</head>
<body onload="InitializeStaticMenu();">
    <div id="mydiv">
        <jsp:include page="Semantic/header.jsp"></jsp:include>
        <section id="contents">
            <!-- 여기에 컨텐츠 넣으시면 됩니다. -->
            <h1 style="text-align: center; margin-top: 20px;">팀원 소개</h1>
            <div class="team-member-container">
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team1.png" alt="팀원 1 사진">
                    <h2 style="margin-bottom: 20px;">권연준</h2>
                    <p>안녕하세요! 메인페이지와 쇼핑관련 페이지를 맡은 팀원 권연준입니다.<br>항상 최선을 다했고 완벽하게 만들고자 노력했습니다!!</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team2.png" alt="팀원 2 사진">
                    <h2 style="margin-bottom: 20px;">김지수</h2>
                    <p>안녕하세요. 여러분 고객님이 쉽고 효율적으로 서비스를 이용하도록 팀원들과 지속적인 소통을노력하는 팀원 김지수 입니다!</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team3.png" alt="팀원 3 사진">
                    <h2 style="margin-bottom: 20px;">김혜인</h2>
                    <p>안녕하세요~ 팀장 김혜인입니다. 사이트에서 멤버 관리와 통계/지진을 맡고 있습니다! 잘 부탁드립니다~</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team4.png" alt="팀원 4 사진">
                    <h2 style="margin-bottom: 20px;">이지혜</h2>
                    <p>안녕하세요 여러분! 고객님들을 위해 열심히뛰고 최선을 다하며 프로젝트를 다함께 이끌어갈수있도록 노력하는 팀원 이지혜입니다!</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team5.png" alt="팀원 5 사진">
                    <h2 style="margin-bottom: 20px;">강성진</h2>
                    <p>안녕하세요! 여러분과 함께 혁신적인 서비스를 만들어 나가며, 불가능은 없다는 것을 보여드리겠습니다. 여러분의 아이디어와 피드백을 받아 더 나은 서비스를 구현하는 팀원 강성진입니다.</p>
                </div>
            </div>
        </section>
        <jsp:include page="Semantic/quickmenu.jsp"></jsp:include>
        <script src="resources/js/quick.js"></script>
        <jsp:include page="Semantic/footer.jsp"></jsp:include>
    </div>
</body>
</html>
