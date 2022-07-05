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
    <div id = 'header'>
        <div id = 'refresh'>
            <button id="img-button" type="submit">
                <img class="img-button" src="icons\refresh.png">
            </button>
            <div id="convertDegree">
                <button class = "degreeButtons">℉</button>				
                <button class = "degreeButtons selected">℃</button>
            </div>
        </div>
        <div id = "location">
            <img src="icons\mapMarker.png">
            <p>남양주시</p>
        </div>  
        <div id = "currentTime">
            <p>8월 17일 토요일 오전 12:38</p>
        </div>      
    </div>
    <div id = 'middle'>
        <div style = "height : 1.5vh;"></div>
            <div id = 'firstMiddle'>
                <div style = "height : 1.5vh;"></div>
                <div id = "middleSym" >
                        <img id = "bigSymbol" src="icons\moon.png">
                </div>
                <div id = "middleText">25℃</div>
            </div>
            <div style = "height : 1vh"></div>
            <div id = 'secondMiddle'>
                29℃ / 22℃            
            </div>
            <div style = "height : 1vh"></div>
            <div id = 'thirdMiddle'>
                Fog
            </div>
        </div>
    <div id = 'footer'>
        <div class = 'footer-row first'>
                <div class = 'footer-col'>
                    <div class = 'footer-col-left'>
                        <img src = "icons\sunrise.png">
                        <p class = 'footer-info'>Sunrise</p>
                    </div>
                    <p class = 'footer-time'>6:02 AM</p>
                </div> 
                <div class = 'footer-col'>
                    <div class = 'footer-col-left'>
                        <img src = "icons\sunset.png">
                        <p class = 'footer-info'>Sunset</p>
                    </div>
                    <p class = 'footer-time'>7:05 PM</p>
                </div> 
        </div>
        <div class = 'footer-row'>
            <div class = 'footer-col'>
                <div class = 'footer-col-left'>
                    <img src = "icons\humidity.png">
                    <p class = 'footer-info'>Humidity</p>
                </div>
                <p class = 'footer-time'>73%</p>
            </div> 
            <div class = 'footer-col'>
                <div class = 'footer-col-left'>
                    <img src = "icons\wind.jpg">
                    <p class = 'footer-info'>Wind</p>
                </div>
                <p class = 'footer-time'>6m/s</p>
            </div> 
    </div>
    </div>
    <script src="/resources/weather/logic.js"></script>
</body>
</html>