const API_SOURCE = "https://api.openweathermap.org/data/2.5/weather?";
const API_KEY = "&appid=5d0d3ea800ea71bd1d4fad5c78379542";

const refresh = document.getElementById('img-button'); // 새로고침 버튼
const loc = document.getElementById('location').children[1]; // 현재 위치
const currentTime = document.getElementById('currentTime').children[0]; // 현재 시각
const middleText = document.getElementById('middleText'); // 현재 온도
const secondMiddle = document.getElementById('secondMiddle'); // 최저/최고 온도
const thirdMiddle = document.getElementById('thirdMiddle'); // 날씨 상태
const sunrise = document.getElementsByClassName('footer-time')[0]; // 일출
const sunset = document.getElementsByClassName('footer-time')[1]; // 일몰
const humidity = document.getElementsByClassName('footer-time')[2] // 습도
const wind = document.getElementsByClassName('footer-time')[3] // 바람
let convButton = document.getElementsByClassName('degreeButtons')[1].style.backgroundColor; // 전환 버튼

let lat, lon, obj;

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
        loc.innerHTML = obj.name + ' , ' + obj.sys.country;
        currentTime.innerHTML = setTime();

        if (convButton === "white") {
            middleText.innerHTML = (obj.main.temp - 273.15) + '°C';
            secondMiddle.innerHTML = (obj.main.temp_max - 273.15) + '°C / ' + (obj.main.temp_min - 273.15) + '°C';
        } else if (convButton === "#e7e7e7") {
            middleText.innerHTML = (((obj.main.temp - 273.15) * (9/5)) + 32) + '°F';
            secondMiddle.innerHTML = (((obj.main.temp_max - 273.15) * (9 / 5)) + 32)  + '°F / ' + (((obj.main.temp_min - 273.15) * (9 / 5)) + 32) + '°F';
        }
        
        if (obj.weather[0].main === "Thunderstorm") {
			thirdMiddle.innerHTML = "천둥";
		} else if (obj.weather[0].main === "Drizzle") {
			thirdMiddle.innerHTML = "가랑비";
		} else if (obj.weather[0].main === "Rain") {
			thirdMiddle.innerHTML = "비";
		} else if (obj.weather[0].main === "Snow") {
			thirdMiddle.innerHTML = "눈";
		} else if (obj.weather[0].main === "Atmosphere") {
			thirdMiddle.innerHTML = "안개";
		} else if (obj.weather[0].main === "Clear") {
			thirdMiddle.innerHTML = "쾌청";
		} else if (obj.weather[0].main === "Clouds") {
			thirdMiddle.innerHTML = "구름";
		} // 이게 맞나...?
		
		
		
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
    let a = d.getFullYear() + ' ' + (d.getMonth() + 1) + ' ' + d.getDate();
    let b = '';
    let c = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    if (d.getMinutes() < 10) {
        b = '0' + d.getMinutes();
    } else {
        b = d.getMinutes();
    }

    if (d.getHours() < 12) {
        return c[d.getDay()] + ' ' + a + ' ' + d.getHours() + ':' + b + ' AM';
    } else {
        return c[d.getDay()] + ' ' + a + ' ' + (d.getHours() - 12) + ':' + b + ' PM';
    }

}

function convertButton() {

    let buttons = document.getElementsByClassName("degreeButtons");
    
    buttons[0].onclick = function() {   
        buttons[0].style.backgroundColor = "white"
        buttons[1].style.backgroundColor = "#e7e7e7"
        middleText.innerHTML = (((obj.main.temp - 273.15) * (9/5)) + 32).toFixed(0) + '°F';
        secondMiddle.innerHTML = (((obj.main.temp_max - 273.15) * (9 / 5)) + 32).toFixed(0)  + '°F / ' + (((obj.main.temp_min - 273.15) * (9 / 5)) + 32).toFixed(0) + '°F';
    };

    buttons[1].onclick = function() {           
        buttons[0].style.backgroundColor = "#e7e7e7"
        buttons[1].style.backgroundColor = "white"
        middleText.innerHTML = (obj.main.temp - 273.15).toFixed(0) + '°C';
        secondMiddle.innerHTML = (obj.main.temp_max - 273.15) + '°C / ' + (obj.main.temp_min - 273.15) + '°C';
    };
    
}

refresh.onclick = locationUpdate; // 새로고침 버튼

convertButton();
locationUpdate();

setInterval(function() {locationUpdate();}, 5000); // 5초마다 현재 정보 갱신