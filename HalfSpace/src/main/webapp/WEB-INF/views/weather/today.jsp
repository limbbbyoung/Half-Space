<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/weather/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div style="height: 3vh;"></div>
    <div id='header'>
        <div id='refresh'>
            <button id="img-button" type="submit">
                <img class="img-button" src="../resources/images/refresh.png">
            </button>
            <div id="convertDegree">
                <button class="degreeButtons" value="false">℉</button>				
                <button class="degreeButtons selected" value="true">℃</button>
            </div>
        </div>
        <div id="location">
            <img src="../resources/images/mapMarker.png">
            <p></p>
        </div>
        <div id="currentTime">
            <p></p>
        </div>      
    </div>
    <div id='middle'>
        <div style="height:1.5vh;"></div>
            <div id='firstMiddle'>
                <div style="height:1.5vh;"></div>
                <div id="middleSym">
                	<img id="bigSymbol">
                </div>
                <div id="middleText"></div>
            </div>
            <div style="height:1vh"></div>
            <div id='secondMiddle'></div>
            <div style="height:1vh"></div>
            <div id='thirdMiddle'></div>
        </div>
    <div id='footer'>
        <div class='footer-row first'>
            <div class='footer-col'>
                <div class='footer-col-left'>
                    <img src="../resources/images/sunrise.png">
                    <p class='footer-info'></p>
                </div>
                <p class='footer-time'></p>
            </div> 
            <div class='footer-col'>
                <div class='footer-col-left'>
                    <img src="../resources/images/sunset.png">
                    <p class='footer-info'></p>
                </div>
                <p class='footer-time'></p>
            </div> 
        </div>
        <div class='footer-row'>
            <div class='footer-col'>
                <div class='footer-col-left'>
                    <img src="../resources/images/humidity.png">
                    <p class='footer-info'></p>
                </div>
                <p class='footer-time'></p>
            </div> 
            <div class='footer-col'>
                <div class='footer-col-left'>
                    <img src="../resources/images/wind.jpg">
                    <p class='footer-info'></p>
                </div>
                <p class='footer-time'></p>
            </div> 
    	</div>
    </div>
    <script src="/resources/weather/logic.js"></script>
</body>
</html>