const ENCODING = "eJVC2XHsGkMlocNixoRGg8uajgatlRCy1dIXeadtEd2307rzXgpKE2eFO16atA6obabrsCrC7hrlG9faUIiMig%3D%3D";
const DECODING = "eJVC2XHsGkMlocNixoRGg8uajgatlRCy1dIXeadtEd2307rzXgpKE2eFO16atA6obabrsCrC7hrlG9faUIiMig==";

const REFRESH = document.getElementById('img-button'); // 새로고침 버튼
const LOC = document.getElementById('location').children[1]; // 현재 위치
const currentTime = document.getElementById('currentTime').children[0]; // 현재 시각
const middleText = document.getElementById('middleText'); // 현재 온도
const secondMiddle = document.getElementById('secondMiddle'); // 최저/최고 온도
const thirdMiddle = document.getElementById('thirdMiddle'); // 날씨 상태
const sunrise = document.getElementsByClassName('footer-time')[0]; // 일출
const sunset = document.getElementsByClassName('footer-time')[1]; // 일몰
const humidity = document.getElementsByClassName('footer-time')[2] // 습도
const wind = document.getElementsByClassName('footer-time')[3] // 바람
const convButton = document.getElementsByClassName('degreeButtons')[1].style.backgroundColor; // 전환 버튼

var lat, lon, obj;

function infoUpdate() {

    let add = apiSource + "lat=" + lat + "&lon=" + lon + apiKey;

    console.log('infoUpdate-lat : '+lat);
    console.log('infoUpdate-lon : '+lon);

    navigator.geolocation.watchPosition(function(position) {
        
        lat = position.coords.latitude.toFixed(4);
        lon = position.coords.longitude.toFixed(4);
        console.log('geolocation-lat : ' + lat);
        console.log('geolocation-lon : ' + lon);
        infoUpdate(); // 여기 위치하면 refresh가 미작동, 오류발생은 X
    });

    fetch(add).then(function(response) {
        return response.json();
    }).then(function(json) {
        console.log('fetch then : '+json)
        obj = json;
    })

    if (lat !== undefined) {
        loc.innerHTML = obj.name + ', ' +obj.sys.country;
        currentTime.innerHTML = setTime();

        if (convButton === 'white') {
            middleText.innerHTML = (obj.main.temp - 273.15).toFixed(0) + '°C';
            secondMiddle.innerHTML = (obj.main.temp_max - 273.15) + '°C / ' + (obj.main.temp_min - 273.15) + '°C';
        } else if (convButton === 'rgb(231, 231, 231)') {
            middleText.innerHTML = (((obj.main.temp - 273.15) * (9/5)) + 32).toFixed(0) + '°F';
            secondMiddle.innerHTML = (((obj.main.temp_max - 273.15) * (9 / 5)) + 32).toFixed(0)  + '°F / ' + (((obj.main.temp_min - 273.15) * (9 / 5)) + 32).toFixed(0) + '°F';
        }

        //middleText.innerHTML = (obj.main.temp - 273.15).toFixed(0) + '°C';
        //secondMiddle.innerHTML = (obj.main.temp_max - 273.15) + '°C / ' + (obj.main.temp_min - 273.15) + '°C';
        thirdMiddle.innerHTML = obj.weather[0].main;
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

    var buttons = document.getElementsByClassName("degreeButtons");
    
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

refresh.onclick = infoUpdate;
convertButton();

infoUpdate();

setInterval(function() {infoUpdate();}, 5000);