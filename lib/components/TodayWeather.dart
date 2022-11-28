import 'package:flutter/material.dart';
import 'package:boomerang/models/TodayWeatherInfo.dart';
import 'package:boomerang/components/TodayWeatherCard.dart';

class TodayWeather extends StatelessWidget {
  final Color backgroundColor;
  final Color contentColor;
  final List<TodayWeatherInfo> todayWeatherList;

  const TodayWeather({
    required this.backgroundColor,
    required this.contentColor,
    required this.todayWeatherList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Text(
              '오늘의 날씨',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: contentColor,
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TodayWeatherCard(
                  today: todayWeatherList[0].today,
                  time: todayWeatherList[0].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[0].imageID}.png',
                  weatherState: todayWeatherList[0].weatherState,
                  temperature: todayWeatherList[0].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[1].today,
                  time: todayWeatherList[1].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[1].imageID}.png',
                  weatherState: todayWeatherList[1].weatherState,
                  temperature: todayWeatherList[1].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[2].today,
                  time: todayWeatherList[2].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[2].imageID}.png',
                  weatherState: todayWeatherList[2].weatherState,
                  temperature: todayWeatherList[2].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[3].today,
                  time: todayWeatherList[3].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[3].imageID}.png',
                  weatherState: todayWeatherList[3].weatherState,
                  temperature: todayWeatherList[3].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[4].today,
                  time: todayWeatherList[4].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[4].imageID}.png',
                  weatherState: todayWeatherList[4].weatherState,
                  temperature: todayWeatherList[4].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[5].today,
                  time: todayWeatherList[5].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[5].imageID}.png',
                  weatherState: todayWeatherList[5].weatherState,
                  temperature: todayWeatherList[5].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[6].today,
                  time: todayWeatherList[6].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[6].imageID}.png',
                  weatherState: todayWeatherList[6].weatherState,
                  temperature: todayWeatherList[6].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                // Expanded(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       return TodayWeatherCard(
                //         today: todayWeatherList[index].today,
                //         time: todayWeatherList[index].time,
                //         imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[index].imageID}.png',
                //         weatherState: todayWeatherList[index].weatherState,
                //         temperature: todayWeatherList[index].temperature,
                //         backgroundColor: backgroundColor,
                //         contentColor: contentColor,
                //       );
                //     },
                //     itemCount: 7,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}