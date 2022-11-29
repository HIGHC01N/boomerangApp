import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boomerang/models/FoodInfo.dart';
import 'package:http/http.dart' as http;

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({Key? key}) : super(key: key);

  @override
  State<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  List<FoodInfo> foodInfoList = [];
  List<FoodInfo> originalFoodInfoList = [];
  Map totalFoodInfo = {
    'carbon': 0,
    'calorie': 0,
    'tree': 0,
    'aggregate': 0,
  };
  bool isLoading = true;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    getFoodInfoList();
  }

  Future<void> getFoodInfoList() async {
    http.Response response = await http.get(Uri.parse(
        'https://boomerang-server.herokuapp.com/importHistory/5c:cf:7f:d1:a1:47:'));
    if (response.statusCode == 200) {
      var parseData = jsonDecode(response.body);
      for(int i = 0; i < parseData.length; i++) {
        setState(() {
          foodInfoList.add(FoodInfo(
            objectId: parseData[i]['objectId'],
            calorie: parseData[i]['calorie'] * parseData[i]['amount'],
            carbon: parseData[i]['carbon'] * parseData[i]['amount'],
            imageUrl: parseData[i]['jpg'],
            name: parseData[i]['name'],
            tree: parseData[i]['carbon'] / 6500 * parseData[i]['amount'],
            amount: parseData[i]['amount'],
          ));
          originalFoodInfoList.add(FoodInfo(
            objectId: parseData[i]['objectId'],
            calorie: parseData[i]['calorie'],
            carbon: parseData[i]['carbon'],
            imageUrl: parseData[i]['jpg'],
            name: parseData[i]['name'],
            tree: parseData[i]['carbon'] / 6500,
            amount: parseData[i]['amount'],
          ));
          totalFoodInfo['carbon'] += parseData[i]['carbon'] * parseData[i]['amount'];
          totalFoodInfo['calorie'] += parseData[i]['calorie'] * parseData[i]['amount'];
          totalFoodInfo['tree'] += parseData[i]['carbon'] / 6500 * parseData[i]['amount'];
          totalFoodInfo['aggregate'] += parseData[i]['amount'];
          isEmpty = false;
        });
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget total() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 7.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('총 탄소량'),
                SizedBox(height: 10),
                Text(
                  '${totalFoodInfo['carbon'].toString()}g',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xff979797),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('총 칼로리'),
                SizedBox(height: 10),
                Text(
                  '${totalFoodInfo['calorie'].toString()}kcal',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xff979797),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('나무 합'),
                SizedBox(height: 10),
                Text(
                  '${totalFoodInfo['tree'].toStringAsFixed(2)}그루',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xff979797),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('총합'),
                SizedBox(height: 10),
                Text(
                  '${totalFoodInfo['aggregate'].toString()}개',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xff979797),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('전체삭제'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      foodInfoList.clear();
                      originalFoodInfoList.clear();
                      totalFoodInfo['carbon'] = 0;
                      totalFoodInfo['calorie'] = 0;
                      totalFoodInfo['tree'] = 0.0;
                      totalFoodInfo['aggregate'] = 0;
                      isEmpty = true;
                    });

                    http.post(Uri.parse('https://boomerang-server.herokuapp.com/alldelete'));
                  },
                  child: Text(
                    '삭제',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loading() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 15),
          Text(
            '냉장고가 텅 비어 있어요..',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget empty() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Text(
        '냉장고가 텅 비어 있어요..',
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget foodInfos() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Food(
            imageUrl: foodInfoList[index].imageUrl,
            name: foodInfoList[index].name,
            carbon: foodInfoList[index].carbon.toString(),
            calorie: foodInfoList[index].calorie.toString(),
            tree: foodInfoList[index].tree,
            amount: foodInfoList[index].amount,
            add: () {
              http.post(
                Uri.parse('https://boomerang-server.herokuapp.com/updateAmount'),
                headers: {
                  'content-type': 'application/json',
                },
                body: jsonEncode({
                  'machineId': '5c:cf:7f:d1:a1:47:',
                  'amount': foodInfoList[index].amount,
                  'objectId': foodInfoList[index].objectId,
                }),
              );

              setState(() {
                foodInfoList[index].carbon += originalFoodInfoList[index].carbon;
                foodInfoList[index].calorie += originalFoodInfoList[index].calorie;
                foodInfoList[index].tree = foodInfoList[index].tree + originalFoodInfoList[index].tree;
                foodInfoList[index].amount++;

                totalFoodInfo['carbon'] += originalFoodInfoList[index].carbon;
                totalFoodInfo['calorie'] += originalFoodInfoList[index].calorie;
                totalFoodInfo['tree'] = totalFoodInfo['tree'] + originalFoodInfoList[index].tree;
                totalFoodInfo['aggregate']++;
              });
            },
            minus: () {
              setState(() {
                foodInfoList[index].carbon -= originalFoodInfoList[index].carbon;
                foodInfoList[index].calorie -= originalFoodInfoList[index].calorie;
                foodInfoList[index].tree = foodInfoList[index].tree - originalFoodInfoList[index].tree;
                foodInfoList[index].amount--;

                totalFoodInfo['carbon'] -= originalFoodInfoList[index].carbon;
                totalFoodInfo['calorie'] -= originalFoodInfoList[index].calorie;
                totalFoodInfo['tree'] = totalFoodInfo['tree'] - originalFoodInfoList[index].tree;
                totalFoodInfo['aggregate']--;

                http.post(
                  Uri.parse('https://boomerang-server.herokuapp.com/updateAmount'),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode({
                    'machineId': '5c:cf:7f:d1:a1:47:',
                    'amount': foodInfoList[index].amount,
                    'objectId': foodInfoList[index].objectId,
                  }),
                );

                if(foodInfoList[index].amount == 0) {
                  foodInfoList.removeAt(index);
                  originalFoodInfoList.removeAt(index);
                  if(foodInfoList.isEmpty) isEmpty = true;
                }
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return Bar();
        },
        itemCount: foodInfoList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffd5daf8),
                Color(0xffb1dfff),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Boomerang List',
                      style: TextStyle(
                        color: Color(0xff232f59),
                        fontWeight: FontWeight.w600,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
              FoodInfoTitle(),
              isLoading
                  ?
              loading()
                  :
              isEmpty
                  ?
              empty()
                  :
              foodInfos(),
              total(),
            ],
          ),
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 240, 240),
      height: 2.5,
    );
  }
}

class FoodInfoTitle extends StatelessWidget {
  const FoodInfoTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '제품사진',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '품명',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '탄소량',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '칼로리',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '나무',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '개수',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Food extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String carbon;
  final String calorie;
  final double tree;
  final int amount;
  final VoidCallback add;
  final VoidCallback minus;

  const Food({
    required this.imageUrl,
    required this.name,
    required this.carbon,
    required this.calorie,
    required this.tree,
    required this.amount,
    required this.add,
    required this.minus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(child: Image.network(imageUrl)),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${carbon}g',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xffcccccc),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${calorie}Kcal',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xffcccccc),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset('asset/img/tree.png'),
                Text(tree.toStringAsFixed(2)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: add,
                      child: Container(
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Colors.white,
                        ),
                        color: Colors.black87,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: minus,
                      child: Container(
                        child: Icon(
                          Icons.remove,
                          size: 12,
                          color: Colors.white,
                        ),
                        color: Colors.black87,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  amount.toString(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
