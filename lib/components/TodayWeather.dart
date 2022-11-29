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
                TodayWeatherCard(
                  today: todayWeatherList[7].today,
                  time: todayWeatherList[7].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[7].imageID}.png',
                  weatherState: todayWeatherList[7].weatherState,
                  temperature: todayWeatherList[7].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[8].today,
                  time: todayWeatherList[8].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[8].imageID}.png',
                  weatherState: todayWeatherList[8].weatherState,
                  temperature: todayWeatherList[8].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[9].today,
                  time: todayWeatherList[9].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[9].imageID}.png',
                  weatherState: todayWeatherList[9].weatherState,
                  temperature: todayWeatherList[9].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[10].today,
                  time: todayWeatherList[10].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[10].imageID}.png',
                  weatherState: todayWeatherList[10].weatherState,
                  temperature: todayWeatherList[10].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[11].today,
                  time: todayWeatherList[11].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[11].imageID}.png',
                  weatherState: todayWeatherList[11].weatherState,
                  temperature: todayWeatherList[11].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[12].today,
                  time: todayWeatherList[12].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[12].imageID}.png',
                  weatherState: todayWeatherList[12].weatherState,
                  temperature: todayWeatherList[12].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[13].today,
                  time: todayWeatherList[13].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[13].imageID}.png',
                  weatherState: todayWeatherList[13].weatherState,
                  temperature: todayWeatherList[13].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[14].today,
                  time: todayWeatherList[14].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[14].imageID}.png',
                  weatherState: todayWeatherList[14].weatherState,
                  temperature: todayWeatherList[14].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[15].today,
                  time: todayWeatherList[15].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[15].imageID}.png',
                  weatherState: todayWeatherList[15].weatherState,
                  temperature: todayWeatherList[15].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[16].today,
                  time: todayWeatherList[16].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[16].imageID}.png',
                  weatherState: todayWeatherList[16].weatherState,
                  temperature: todayWeatherList[16].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[17].today,
                  time: todayWeatherList[17].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[17].imageID}.png',
                  weatherState: todayWeatherList[17].weatherState,
                  temperature: todayWeatherList[17].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[18].today,
                  time: todayWeatherList[18].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[18].imageID}.png',
                  weatherState: todayWeatherList[18].weatherState,
                  temperature: todayWeatherList[18].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[19].today,
                  time: todayWeatherList[19].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[19].imageID}.png',
                  weatherState: todayWeatherList[19].weatherState,
                  temperature: todayWeatherList[19].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[20].today,
                  time: todayWeatherList[20].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[20].imageID}.png',
                  weatherState: todayWeatherList[20].weatherState,
                  temperature: todayWeatherList[20].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[21].today,
                  time: todayWeatherList[21].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[21].imageID}.png',
                  weatherState: todayWeatherList[21].weatherState,
                  temperature: todayWeatherList[21].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[22].today,
                  time: todayWeatherList[22].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[22].imageID}.png',
                  weatherState: todayWeatherList[22].weatherState,
                  temperature: todayWeatherList[22].temperature,
                  backgroundColor: backgroundColor,
                  contentColor: contentColor,
                ),
                TodayWeatherCard(
                  today: todayWeatherList[23].today,
                  time: todayWeatherList[23].time,
                  imageID: 'https://bssmboomerang.vercel.app/weather_icons/${todayWeatherList[23].imageID}.png',
                  weatherState: todayWeatherList[23].weatherState,
                  temperature: todayWeatherList[23].temperature,
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