import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayHighlight extends StatelessWidget {
  final int humidity;
  final double windSpeed;
  final String sunup;
  final String sundown;
  final int cloud;
  final double uvRays;
  final int atmosphericPressure;
  final Color backgroundColor;
  final Color contentColor;
  final String timeSlot;

  const TodayHighlight({
    required this.humidity,
    required this.windSpeed,
    required this.sunup,
    required this.sundown,
    required this.cloud,
    required this.uvRays,
    required this.atmosphericPressure,
    required this.backgroundColor,
    required this.contentColor,
    required this.timeSlot,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Text(
              '오늘의 하이라이트',
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
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '습도',
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Image.network(
                      'https://bssmboomerang.vercel.app/weather_icons/humidity.png',
                      height: MediaQuery.of(context).size.width / 4.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$humidity ',
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: contentColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          '%',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: Color(0xff7f7f7f),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '풍속',
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Image.network(
                      'https://bssmboomerang.vercel.app/weather_icons/wind-$timeSlot.png',
                      height: MediaQuery.of(context).size.width / 4.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$windSpeed ',
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: contentColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          'm/s',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: Color(0xff7f7f7f),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://bssmboomerang.vercel.app/weather_icons/sunrise.png',
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.width / 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sunup,
                              style: TextStyle(
                                color: contentColor,
                              ),
                            ),
                            Text(
                              '일출',
                              style: TextStyle(
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://bssmboomerang.vercel.app/weather_icons/sunset.png',
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.width / 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sundown,
                              style: TextStyle(
                                color: contentColor,
                              ),
                            ),
                            Text(
                              '일몰',
                              style: TextStyle(
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '구름',
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Image.network(
                      'https://bssmboomerang.vercel.app/weather_icons/clouds.png',
                      height: MediaQuery.of(context).size.width / 4.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$cloud ',
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: contentColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          '%',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: Color(0xff7f7f7f),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '자외선 지수',
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Image.network(
                      'https://bssmboomerang.vercel.app/weather_icons/uv.png',
                      height: MediaQuery.of(context).size.width / 4.5,
                    ),
                    Text(
                      uvRays == 0.0 ? '0' : '$uvRays',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: TextStyle(
                          color: contentColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '기압',
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Image.network(
                      'https://bssmboomerang.vercel.app/weather_icons/pressure.png',
                      height: MediaQuery.of(context).size.width / 4.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$atmosphericPressure ',
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: contentColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          'hPa',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: Color(0xff7f7f7f),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}