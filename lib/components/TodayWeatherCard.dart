import 'package:flutter/material.dart';

class TodayWeatherCard extends StatelessWidget {
  final String today;
  final String time;
  final String imageID;
  final String weatherState;
  final int temperature;
  final Color backgroundColor;
  final Color contentColor;

  const TodayWeatherCard({
    required this.today,
    required this.time,
    required this.imageID,
    required this.weatherState,
    required this.temperature,
    required this.backgroundColor,
    required this.contentColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '$today, ',
                style: TextStyle(
                  color: contentColor,
                  fontSize: 12.0,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Color(0xff7f7f7f),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Image.network(
              imageID,
              width: 60.0,
              height: 60.0,
            ),
          ),
          Text(
            weatherState,
            style: TextStyle(
              color: Color(0xff7f7f7f),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              '$temperature°',
              style: TextStyle(
                color: contentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}