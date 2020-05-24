import 'package:flutter/material.dart';
import 'localwidgets/coinsEarned.dart';
import 'localwidgets/earncoins.dart';
import 'localwidgets/myprofile.dart';
import 'package:mathquiz/utils/mediaquery.dart';

//Home page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
//Name of the app

        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: displayHeight(context) * 0.10),
          child: Text(
            'MathQuiz',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: displayWidth(context) * 0.10),
          ),
        ),

//Amount of coins

        Positioned(
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.48,
          top: displayHeight(context) * 0.20,
          child: InkWell(
            onTap: () {},
            child: CoinsMyRankingClass(
                topText: 'Coins Amount',
                bottomText: '1200',
                gradientArrays: [Color(0xff822626), Color(0xFFF55858)]),
          ),
        ),

//Ranking across all users

        Positioned(
          child: InkWell(
            child: CoinsMyRankingClass(
              topText: 'My Ranking',
              bottomText: '#188',
              gradientArrays: [Color(0xff1E4D5B), Color(0xff3C99B6)],
            ),
            onTap: () {},
          ),
          top: displayHeight(context) * 0.35,
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.48,
        ),

//Start Playing button

        Positioned(
          bottom: displayHeight(context) * 0.06,
          left: displayWidth(context) * 0.20,
          right: displayWidth(context) * 0.20,
          height: displayHeight(context) * 0.08,
          child: FloatingActionButton.extended(
              backgroundColor: Color(0xff668BEC),
              onPressed: () {
                Navigator.of(context).pushNamed('/startplaying');
              },
              label: Text(
                'Start Playing',
                style: TextStyle(fontSize: displayWidth(context) * 0.05),
              )),
        ),

//My profile container

        Positioned(
            top: displayHeight(context) * 0.20,
            left: displayWidth(context) * 0.58,
            right: displayWidth(context) * 0.05,
            bottom: displayHeight(context) * 0.52,
            child: InkWell(
              child: MyProfile(),
              onTap: () {},
            )),

//EarnCoins container

        Positioned(
            left: displayWidth(context) * 0.05,
            right: displayWidth(context) * 0.05,
            bottom: displayHeight(context) * 0.21,
            top: displayHeight(context) * 0.51,
            child: EarnCoins())
      ],
    ));
  }
}
