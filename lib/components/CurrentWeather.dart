import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeather extends StatelessWidget {
  final int temperature;
  final int windChillTemperature;
  final String weatherState;
  final String dayWeek;
  final String time;
  final String area;
  final String country;
  final Color backgroundColor;
  final Color barColor;
  final Color contentColor;
  final String imageID;

  const CurrentWeather({
    required this.temperature,
    required this.windChillTemperature,
    required this.weatherState,
    required this.dayWeek,
    required this.time,
    required this.area,
    required this.country,
    required this.backgroundColor,
    required this.barColor,
    required this.contentColor,
    required this.imageID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Image.network(
                'https://bssmboomerang.vercel.app/weather_icons/${imageID}.png',
                width: (MediaQuery.of(context).size.width * 70) / 100,
                height: (MediaQuery.of(context).size.width * 70) / 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Text(
                  '$temperature°C',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: contentColor,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Text(
                '체감온도 $windChillTemperature°C',
                style: TextStyle(
                  color: Color(0xff7f7f7f),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud,
                    color: contentColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '$weatherState',
                    style: TextStyle(
                      color: contentColor,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 40.0,
            thickness: 10.0,
            indent: 40.0,
            endIndent: 40.0,
            color: barColor,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$dayWeek, ',
                    style: TextStyle(
                      color: contentColor,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Color(0xff7f7f7f),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: contentColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Text(
                      '$area, $country',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: TextStyle(
                          color: contentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}