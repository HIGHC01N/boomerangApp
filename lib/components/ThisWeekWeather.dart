import 'package:boomerang/models/ThisWeekWeatherInfo.dart';
import 'package:flutter/material.dart';
import 'package:boomerang/components/ThisWeekWeatherCard.dart';

class ThisWeekWeather extends StatelessWidget {
  final Color backgroundColor;
  final Color contentColor;
  final List<ThisWeekWeatherInfo> thisWeekWeatherList;

  const ThisWeekWeather({
    required this.backgroundColor,
    required this.contentColor,
    required this.thisWeekWeatherList,
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
              '이번주 날씨',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: contentColor,
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[0].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[0].imageURL}.png',
                weatherState: thisWeekWeatherList[0].weatherState,
                maximumTemperature: thisWeekWeatherList[0].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[0].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[1].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[1].imageURL}.png',
                weatherState: thisWeekWeatherList[1].weatherState,
                maximumTemperature: thisWeekWeatherList[1].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[1].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[2].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[2].imageURL}.png',
                weatherState: thisWeekWeatherList[2].weatherState,
                maximumTemperature: thisWeekWeatherList[2].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[2].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[3].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[3].imageURL}.png',
                weatherState: thisWeekWeatherList[3].weatherState,
                maximumTemperature: thisWeekWeatherList[3].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[3].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[4].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[4].imageURL}.png',
                weatherState: thisWeekWeatherList[4].weatherState,
                maximumTemperature: thisWeekWeatherList[4].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[4].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[5].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[5].imageURL}.png',
                weatherState: thisWeekWeatherList[5].weatherState,
                maximumTemperature: thisWeekWeatherList[5].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[5].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[6].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[6].imageURL}.png',
                weatherState: thisWeekWeatherList[6].weatherState,
                maximumTemperature: thisWeekWeatherList[6].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[6].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
              ThisWeekWeatherCard(
                day: thisWeekWeatherList[7].day,
                imageURL: 'https://bssmboomerang.vercel.app/weather_icons/${thisWeekWeatherList[7].imageURL}.png',
                weatherState: thisWeekWeatherList[7].weatherState,
                maximumTemperature: thisWeekWeatherList[7].maximumTemperature,
                minimumTemperature: thisWeekWeatherList[7].minimumTemperature,
                backgroundColor: backgroundColor,
                contentColor: contentColor,
              ),
            ],
          ),
          // Wrap(
          //   children: [
          //     Expanded(
          //       child: ListView.builder(
          //         itemCount: 8,
          //         itemBuilder: (context, index) {
          //           return ThisWeekWeatherCard(
          //             day: '수요일',
          //             imageURL: 'https://bssmboomerang.vercel.app/weather_icons/04d.png',
          //             weatherState: 'light rain',
          //             maximumTemperature: 20,
          //             minimumTemperature: 12,
          //             backgroundColor: backgroundColor,
          //             contentColor: contentColor,
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}