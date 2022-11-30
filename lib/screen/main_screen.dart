import 'package:flutter/material.dart';
import 'package:boomerang/screen/fridge_screen.dart';
import 'package:boomerang/screen/news_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boomerang/screen/weather_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffd5daf8),
              Color(0xffb1dfff),
            ],
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://bssmboomerang.vercel.app/img/snow3.gif'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Boomerang',
                      style: GoogleFonts.nanumGothic(
                        textStyle: TextStyle(
                          color: Color(0xff054086),
                          fontSize: 50.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Image.asset(
                      'asset/img/icon.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ],
                ),
                Text(
                  'Choose Your',
                  style: GoogleFonts.nanumGothic(
                    textStyle: TextStyle(
                      color: Color(0xff054086),
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Text(
                  'Using Service',
                  style: GoogleFonts.nanumGothic(
                    textStyle: TextStyle(
                      color: Color(0xff054086),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: const [
                Content(
                  img: 'asset/img/fridge.png',
                  text: '냉장고 현황',
                  nextWidget: FridgeScreen(),
                ),
                Content(
                  img: 'asset/img/weather.png',
                  text: '날씨',
                  nextWidget: WeatherScreen(),
                ),
                Content(
                  img: 'asset/img/news.png',
                  text: '뉴스',
                  nextWidget: NewsScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String img;
  final String text;
  final Widget nextWidget;

  const Content({
    required this.img,
    required this.text,
    required this.nextWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextWidget));
      },
      child: Container(
        width: MediaQuery.of(context).size.height / 5.0,
        height: MediaQuery.of(context).size.height / 5.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              width: MediaQuery.of(context).size.height / 10.5,
              height: MediaQuery.of(context).size.height / 10.5,
            ),
            SizedBox(height: 5.0),
            Text(
              text,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xff232f59),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
