import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:boomerang/components/ThisWeekWeather.dart';
import 'package:boomerang/components/TodayHighlight.dart';
import 'package:boomerang/components/CurrentWeather.dart';
import 'package:boomerang/components/TodayWeather.dart';
import 'package:boomerang/models/TodayWeatherInfo.dart';
import 'package:boomerang/models/ThisWeekWeatherInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Color background = Color(0xffF6F6F8);
  Color box = Colors.white;
  Color content = Colors.black;
  String city = 'Busan';
  String country = 'KR';
  Map<String, dynamic> currentWeather = {};
  List<TodayWeatherInfo> todayWeatherList = [];
  List<ThisWeekWeatherInfo> thisWeekWeatherList = [];
  String timeSlot = 'day';
  bool isLoading = true;
  double longitude = 129.07556;
  double latitude = 35.17944;

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if(!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if(checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if(checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    if(checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    return '위치 권한이 허가되었습니다.';
  }

  getLocationData() async {
    final snapshot = await checkPermission();

    if(snapshot == '위치 권한이 허가되었습니다.') {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        longitude = position.longitude;
        latitude = position.latitude;
      });
    }
  }

  Future<void> getWeatherData() async {
    await getLocationData();
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?appid=e54511f5a23448d4f40361c0da9bfd3e&exclude=minutely&units=metric&lon=$longitude&lat=$latitude'));
    if(response.statusCode == 200) {
      var parseData = jsonDecode(response.body);
      DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(parseData['current']['dt'] * 1000).add(Duration(hours: 9));
      DateTime sunup = DateTime.fromMillisecondsSinceEpoch(parseData['current']['sunrise'] * 1000).add(Duration(hours: 9));
      DateTime sundown = DateTime.fromMillisecondsSinceEpoch(parseData['current']['sunset'] * 1000).add(Duration(hours: 9));
      String day = DateFormat('EEEE').format(currentDate);
      setState(() {
        if(parseData['current']['weather'][0]['icon'].endsWith('n')) {
          background = Color(0xff232B39);
          box = Color(0xff19202D);
          content = Colors.white;
          timeSlot = 'night';
        }

        if(day.compareTo('Sunday') == 0) currentWeather['dayWeek'] = '일요일';
        else if(day.compareTo('Monday') == 0) currentWeather['dayWeek'] = '월요일';
        else if(day.compareTo('Tuesday') == 0) currentWeather['dayWeek'] = '화요일';
        else if(day.compareTo('Wednesday') == 0) currentWeather['dayWeek'] = '수요일';
        else if(day.compareTo('Thursday') == 0) currentWeather['dayWeek'] = '목요일';
        else if(day.compareTo('Friday') == 0) currentWeather['dayWeek'] = '금요일';
        else currentWeather['dayWeek'] = '토요일';

        String minute = currentDate.minute.toString();

        if(currentDate.minute < 10) {
          minute = '0${currentDate.minute}';
        }

        if(currentDate.hour > 12) currentWeather['time'] = '오후 ${currentDate.hour - 12}:$minute';
        else if(currentDate.hour == 0) currentWeather['time'] = '오전 12:$minute';
        else currentWeather['time'] = '오전 ${currentDate.hour}:$minute';

        minute = sunup.minute.toString();

        if(sunup.minute < 10) {
          minute = '0${sunup.minute}';
        }

        if(sunup.hour > 12) currentWeather['sunup'] = '오후 ${sunup.hour - 12}:$minute';
        else if(sunup.hour == 0) currentWeather['sunup'] = '오전 12:$minute';
        else currentWeather['sunup'] = '오전 ${sunup.hour}:$minute';

        if(sundown.hour > 12) currentWeather['sundown'] = '오후 ${sundown.hour - 12}:${sundown.minute}';
        else if(sundown.hour == 0) currentWeather['sundown'] = '오전 12:${sundown.minute}';
        else currentWeather['sundown'] = '오전 ${sundown.hour}:${sundown.minute}';

        currentWeather['temperature'] = parseData['current']['temp'].round();
        currentWeather['windChillTemperature'] = parseData['current']['feels_like'].round();
        currentWeather['pressure'] = parseData['current']['pressure'];
        currentWeather['humidity'] = parseData['current']['humidity'];
        currentWeather['uvRays'] = parseData['current']['uvi'].toDouble();
        currentWeather['cloud'] = parseData['current']['clouds'];
        currentWeather['windSpeed'] = double.parse(parseData['current']['wind_speed'].toStringAsFixed(1));
        currentWeather['imageID'] = parseData['current']['weather'][0]['icon'];
        currentWeather['weatherState'] = parseData['current']['weather'][0]['description'];
        city = parseData['timezone'].split('/')[1];

        for(int i = 0; i < 24; i++) {
          DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(parseData['hourly'][i]['dt'] * 1000).add(Duration(hours: 9));
          String today = DateFormat('EEEE').format(dateTime);
          String time = '';

          if(today.compareTo('Sunday') == 0) today = '일요일';
          else if(today.compareTo('Monday') == 0) today = '월요일';
          else if(today.compareTo('Tuesday') == 0) today = '화요일';
          else if(today.compareTo('Wednesday') == 0) today = '수요일';
          else if(today.compareTo('Thursday') == 0) today = '목요일';
          else if(today.compareTo('Friday') == 0) today = '금요일';
          else today = '토요일';

          if(dateTime.hour > 12) time = '오후 ${dateTime.hour - 12}:00';
          else if(dateTime.hour == 0) time = '오전 12:00';
          else time = '오전 ${dateTime.hour}:00';

          todayWeatherList.add(TodayWeatherInfo(
            today: today,
            time: time,
            imageID: parseData['hourly'][i]['weather'][0]['icon'],
            weatherState: parseData['hourly'][i]['weather'][0]['description'],
            temperature: parseData['hourly'][i]['temp'].round(),
          ));
        }

        for(int i = 0; i < 8; i++) {
          DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(parseData['daily'][i]['dt'] * 1000).add(Duration(hours: 9));
          String today = DateFormat('EEEE').format(dateTime);

          if(today.compareTo('Sunday') == 0) today = '일요일';
          else if(today.compareTo('Monday') == 0) today = '월요일';
          else if(today.compareTo('Tuesday') == 0) today = '화요일';
          else if(today.compareTo('Wednesday') == 0) today = '수요일';
          else if(today.compareTo('Thursday') == 0) today = '목요일';
          else if(today.compareTo('Friday') == 0) today = '금요일';
          else today = '토요일';

          thisWeekWeatherList.add(ThisWeekWeatherInfo(
            day: today,
            imageURL: parseData['daily'][i]['weather'][0]['icon'],
            weatherState: parseData['daily'][i]['weather'][0]['description'],
            maximumTemperature: parseData['daily'][i]['temp']['max'].round(),
            minimumTemperature: parseData['daily'][i]['temp']['min'].round(),
          ));
        }

        isLoading = false;
      });
    }
  }

  Widget loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Row(
          children: [
            SizedBox(height: 15),
          ],
        ),
        Text(
          '날씨 데이터를 불러오는 중이에요...',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Color(0xffcccccc),
              fontSize: 13.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: isLoading ?
        loading()
            :
        Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                  CurrentWeather(
                    temperature: currentWeather['temperature'],
                    windChillTemperature: currentWeather['windChillTemperature'],
                    weatherState: currentWeather['weatherState'],
                    dayWeek: currentWeather['dayWeek'],
                    time: currentWeather['time'],
                    area: city,
                    country: country,
                    backgroundColor: box,
                    barColor: background,
                    contentColor: content,
                    imageID: currentWeather['imageID'],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TodayWeather(
                    backgroundColor: box,
                    contentColor: content,
                    todayWeatherList: todayWeatherList,
                  ),
                  TodayHighlight(
                    humidity: currentWeather['humidity'],
                    windSpeed: currentWeather['windSpeed'],
                    sunup: currentWeather['sunup'],
                    sundown: currentWeather['sundown'],
                    cloud: currentWeather['cloud'],
                    uvRays: currentWeather['uvRays'],
                    atmosphericPressure: currentWeather['pressure'],
                    backgroundColor: box,
                    contentColor: content,
                    timeSlot: timeSlot,
                  ),
                  ThisWeekWeather(
                    backgroundColor: box,
                    contentColor: content,
                    thisWeekWeatherList: thisWeekWeatherList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}