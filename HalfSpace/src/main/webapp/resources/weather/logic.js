const API_SOURCE = "https://api.openweathermap.org/data/2.5/weather?";
const API_KEY = "&appid=5d0d3ea800ea71bd1d4fad5c78379542";

const refresh = document.getElementById('img-button'); // 새로고침 버튼
const loc = document.getElementById('location').children[1]; // 현재 위치
const currentTime = document.getElementById('currentTime').children[0]; // 현재 시각
let middleText = document.getElementById('middleText'); // 현재 온도
const secondMiddle = document.getElementById('secondMiddle'); // 최저/최고 온도
const thirdMiddle = document.getElementById('thirdMiddle'); // 날씨 상태
const sunrise = document.getElementsByClassName('footer-time')[0]; // 일출
const sunset = document.getElementsByClassName('footer-time')[1]; // 일몰
const humidity = document.getElementsByClassName('footer-time')[2] // 습도
const wind = document.getElementsByClassName('footer-time')[3] // 바람
let convButton1 = document.getElementsByClassName('degreeButtons')[0].value; // 전환 버튼 1
let convButton2 = document.getElementsByClassName('degreeButtons')[1].value; // 전환 버튼 2

let lat, lon, obj;

let weatherMap = {"Sunrise" : "해뜸", "Sunset" : "일몰", "Clouds" : "구름낌" };


function locationUpdate() {

    function location() {
		navigator.geolocation.getCurrentPosition(
			function(position) {
				lat = position.coords.latitude;
				lon = position.coords.longitude;
			}
		)
	} // 현재 위도, 경도 확인 코드
	
	location(); // 위도, 경도 확인
	
	let add = API_SOURCE + "lat=" + lat + "&lon=" + lon + API_KEY;

    fetch(add).then(function(response) {
        return response.json();
    }).then(function(json) {
        obj = json;
    }) // add에 저장된 위도, 경도로 JSON을 받아와 obj에 저장하는 코드
    
    console.log(obj);

    if (lat !== undefined) {
		
		if (obj.sys.country === "KR") {
			loc.innerHTML = obj.name + ', 한국';
		} else {
			loc.innerHTML = obj.name + ' , ' + obj.sys.country;
		} // 받아오는 정보에서 국가가 한국일 경우 한글화
		
        currentTime.innerHTML = setTime();

		if (convButton1 === "false") {
			middleText.innerHTML = (obj.main.temp - 273.15).toFixed(0) + '°C';
            secondMiddle.innerHTML = (obj.main.temp_max - 273.15).toFixed(0) + '°C / ' + (obj.main.temp_min - 273.15).toFixed(0) + '°C';
		} else if (convButton1 === "true") {
			middleText.innerHTML = (((obj.main.temp - 273.15) * (9/5)) + 32).toFixed(0) + '°F';
            secondMiddle.innerHTML = (((obj.main.temp_max - 273.15) * (9 / 5)) + 32).toFixed(0)  + '°F / ' + (((obj.main.temp_min - 273.15) * (9 / 5)) + 32).toFixed(0) + '°F';
		} // 받아오는 온도 섭씨 / 화씨 구현
        
        if (obj.weather[0].main === "Thunderstorm") {
			thirdMiddle.innerHTML = "천둥";
		} else if (obj.weather[0].main === "Drizzle") {
			thirdMiddle.innerHTML = "가랑비";
		} else if (obj.weather[0].main === "Rain") {
			thirdMiddle.innerHTML = "비";
		} else if (obj.weather[0].main === "Snow") {
			thirdMiddle.innerHTML = "눈";
		} else if (obj.weather[0].main === "Atmosphere") {
			thirdMiddle.innerHTML = "흐림";
		} else if (obj.weather[0].main === "Clear") {
			thirdMiddle.innerHTML = "맑음";
		} else if (obj.weather[0].main === "Mist") {
			thirdMiddle.innerHTML = "안개";
		} // 받아오는 컨디션 정보 한글화
		
		thirdMiddle.innerHTML = weatherMap['Sunset'];
		
        sunrise.innerHTML = timeStamp(obj.sys.sunrise);
        sunset.innerHTML = timeStamp(obj.sys.sunset);
        humidity.innerHTML = obj.main.humidity + '%';
        wind.innerHTML = obj.wind.speed + 'm/s';

        let imgURL = "http://openweathermap.org/img/wn/" + obj.weather[0].icon + "@2x.png";
        document.getElementById('bigSymbol').src = imgURL;
    };

}

function timeStamp(a) {

    let date = new Date(a * 1000);
    let hours = date.getHours();
    let minutes = '' + date.getMinutes();

    if (hours < 12) {
        return hours + ':' + minutes + ' AM';
    } else {
        return (hours - 12) + ':' + minutes + ' PM';
    };

}

function setTime() {

    let d = new Date();
    let a = d.getFullYear() + '년 ' + (d.getMonth() + 1) + '월 ' + d.getDate() + '일';
    let b = '';
    let c = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];

    if (d.getMinutes() < 10) {
        b = '0' + d.getMinutes();
    } else {
        b = d.getMinutes();
    }

    if (d.getHours() < 12) {
        return a + ' ' + c[d.getDay()] + ' 오전 ' + d.getHours() + ':' + b;
    } else {
        return a + ' ' + c[d.getDay()] + ' 오후 ' + (d.getHours() - 12) + ':' + b;
    }

}

function convertButton() {

    let buttons = document.getElementsByClassName("degreeButtons");
    
    buttons[0].onclick = function() {   
        buttons[0].style.backgroundColor = "white"
        buttons[1].style.backgroundColor = "#e7e7e7"
        convButton1 = "true"
        convButton2 = "false"
        middleText.innerHTML = (((obj.main.temp - 273.15) * (9/5)) + 32).toFixed(0) + '°F';
        secondMiddle.innerHTML = (((obj.main.temp_max - 273.15) * (9 / 5)) + 32).toFixed(0)  + '°F / ' + (((obj.main.temp_min - 273.15) * (9 / 5)) + 32).toFixed(0) + '°F';
    };

    buttons[1].onclick = function() {           
        buttons[0].style.backgroundColor = "#e7e7e7"
        buttons[1].style.backgroundColor = "white"
        convButton1 = "false";
        convButton2 = "true";
        middleText.innerHTML = (obj.main.temp - 273.15).toFixed(0) + '°C';
        secondMiddle.innerHTML = (obj.main.temp_max - 273.15).toFixed(0) + '°C / ' + (obj.main.temp_min - 273.15).toFixed(0) + '°C';
    };
    
}

refresh.onclick = locationUpdate; // 새로고침 버튼

locationUpdate();
convertButton();

setInterval(function() {locationUpdate();}, 5000); // 5초마다 현재 정보 갱신