import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisWeekWeatherCard extends StatelessWidget {
  final String day;
  final String imageURL;
  final String weatherState;
  final int maximumTemperature;
  final int minimumTemperature;
  final Color backgroundColor;
  final Color contentColor;

  const ThisWeekWeatherCard({
    required this.day,
    required this.imageURL,
    required this.weatherState,
    required this.maximumTemperature,
    required this.minimumTemperature,
    required this.backgroundColor,
    required this.contentColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: TextStyle(
              color: contentColor,
            ),
          ),
          Image.network(
            imageURL,
            height: MediaQuery.of(context).size.width / 4.5,
          ),
          Text(
            weatherState,
            style: GoogleFonts.spaceGrotesk(
              textStyle:TextStyle(
                color: Color(0xff7f7f7f),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$maximumTemperature° ',
                style: GoogleFonts.spaceGrotesk(
                  textStyle:TextStyle(
                    color: contentColor,
                  ),
                ),
              ),
              Text(
                '$minimumTemperature°',
                style: GoogleFonts.spaceGrotesk(
                  textStyle:TextStyle(
                    color: Color(0xff7f7f7f),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}