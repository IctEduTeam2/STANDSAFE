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
                    <img class="member-photo" src="resources/images/team/team1.jpg" alt="팀원 1 사진">
                    <h2 style="margin-bottom: 20px;">권연준</h2>
                    <p>안녕하세요! 저는 팀원 1입니다. 개발 분야에 관심이 많으며 항상 새로운 기술을 배우고 적용하는 것을 즐깁니다.</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team2.jpg" alt="팀원 2 사진">
                    <h2 style="margin-bottom: 20px;">김지수</h2>
                    <p>여러분 안녕하세요! 저는 팀원 2입니다. 디자인과 예술에 관심이 많아서 항상 창조적인 아이디어를 통해 문제를 해결하려 노력합니다.</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team3.jpg" alt="팀원 3 사진">
                    <h2 style="margin-bottom: 20px;">김혜인</h2>
                    <p>여러분 안녕하세요! 반갑습니다! 저는 팀원 3이라고 합니다. 데이터 분석에 빠져서 데이터 속에서 패턴을 찾는 것을 좋아하며 복잡한 문제를 해결하는 것을 좋아합니다.</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team4.jpg" alt="팀원 4 사진">
                    <h2 style="margin-bottom: 20px;">이지혜</h2>
                    <p>여러분 안녕하세요! 저는 팀원 4입니다. 저는 팀원 4입니다. 커뮤니케이션을 중요시하며 팀원들과의 원활한 협력으로 프로젝트를 성공적으로 이끌어가려 노력합니다.</p>
                </div>
                <div class="team-member">
                    <img class="member-photo" src="resources/images/team/team5.jpg" alt="팀원 5 사진">
                    <h2 style="margin-bottom: 20px;">강성진</h2>
                    <p>여러분 안녕하세요! 저는 팀원 5라고 합니다. 프로그래밍을 사랑하며 효율적인 코드 작성을 위해 끊임없이 연구하고 개선하는 것을 추구합니다.</p>
                </div>
            </div>
        </section>
        <jsp:include page="Semantic/quickmenu.jsp"></jsp:include>
        <script src="resources/js/quick.js"></script>
        <jsp:include page="Semantic/footer.jsp"></jsp:include>
    </div>
</body>
</html>
