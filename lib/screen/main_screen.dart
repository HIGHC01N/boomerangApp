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
            image: NetworkImage('https://bssmboomerang.vercel.app/img/snow3.gif'), // 배경 이미지
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SizedBox(
                height: 4.0,
              ),
              Content(
                img: 'asset/img/news.png',
                text: '뉴스',
                nextWidget: NewsScreen(),
              ),
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
            ],
          ),
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
        width: MediaQuery.of(context).size.height / 3.5,
        height: MediaQuery.of(context).size.height / 3.5,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              img,
              width: MediaQuery.of(context).size.height / 6.5,
              height: MediaQuery.of(context).size.height / 6.5,
            ),
            Text(
              text,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xff232f59),
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
