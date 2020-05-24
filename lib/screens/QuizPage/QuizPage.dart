import 'package:flutter/material.dart';
import 'package:mathquiz/utils/mediaquery.dart';
import 'package:mathquiz/widgets/ProfilePicture.dart';
import 'localwidgets/dots.dart';
import 'dart:convert';
import 'localwidgets/anwsers.dart';

//Returns a quiz page when asset is loaded

class GetJson extends StatelessWidget {
  final String assettoload = "asset/json/questions.json";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return QuizPage(mydata);
        }
      },
    );
  }
}

//Quiz page
class QuizPage extends StatelessWidget {
  String anwsers(int questionIndex, int anwserIndex) {
    return '${data[0]['question$questionIndex']['anwser$anwserIndex']}';
  }

  final List data;

  QuizPage(this.data);
  @override
  Widget build(BuildContext context) {
    return QuizPageUI(
      data: data,
    );
  }
}

//Quiz Page user interface
class QuizPageUI extends StatefulWidget {
  final List data;

  final String anwser;

  QuizPageUI({this.data, this.anwser});

  @override
  _QuizPageUIState createState() => _QuizPageUIState();
}

class _QuizPageUIState extends State<QuizPageUI> {
  List colors = [
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2)
  ];
  int points = 0;
  int questionNumber = 1;
  int anwserIndex = 0;
  List leftDotColors = [
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
  ];
  List rightDotColors = [
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
    Color(0xffE5E2E2),
  ];

  String anwsers(int questionIndex, int anwserNumber) {
    return '${widget.data[0]['question$questionIndex']['anwser$anwserNumber']}';
  }

  int anwserNumber = 1;
  void onTap() {
    setState(() {
      if (anwsers(questionNumber, anwserNumber) ==
          widget.data[0]['question$questionNumber']['correctAnwser']) {
        colors[anwserNumber] = leftDotColors[anwserIndex] = Colors.green;
        points++;
      } else {
        colors[anwserNumber] = leftDotColors[anwserIndex] = Colors.red;
      }
      questionNumber++;
      anwserIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
//Text on top of the screen

          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: displayHeight(context) * 0.035),
            child: Text(
              'Quiz',
              style: TextStyle(fontSize: displayHeight(context) * 0.04),
            ),
          ),

//Arrow on the top left of the screen

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: displayHeight(context) * 0.04,
                left: displayWidth(context) * 0.025),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: displayWidth(context) * 0.075,
              ),
            ),
          ),

//Left side profile picture

          Positioned(
            top: displayHeight(context) * 0.095,
            left: displayWidth(context) * 0.025,
            child: ProfilePicture(
              asset: 'asset/images/losowiLudzie/1.jpg',
            ),
          ),

//Right side profile picture

          Positioned(
            top: displayHeight(context) * 0.095,
            right: displayWidth(context) * 0.025,
            child: ProfilePicture(
              asset: 'asset/images/losowiLudzie/3.jpg',
            ),
          ),

//Left profile username

          Positioned(
              left: displayWidth(context) * 0.21,
              top: displayHeight(context) * 0.12,
              child: Opacity(
                opacity: 0.61,
                child: Text(
                  'Thomas Edison',
                  style: TextStyle(fontSize: displayWidth(context) * 0.038),
                ),
              )),

//Right profile username

          Positioned(
              right: displayWidth(context) * 0.21,
              top: displayHeight(context) * 0.12,
              child: Opacity(
                opacity: 0.61,
                child: Text(
                  'AngelinaJolie',
                  style: TextStyle(fontSize: displayWidth(context) * 0.038),
                ),
              )),

//Left side dots

          Positioned(
              left: displayWidth(context) * 0.21,
              top: displayHeight(context) * 0.14,
              child: Dots(leftDotColors)),

//Right side dots

          Positioned(
              right: displayWidth(context) * 0.21,
              top: displayHeight(context) * 0.14,
              child: Dots(rightDotColors)),

//Question container

          Positioned(
              top: displayHeight(context) * 0.25,
              bottom: displayHeight(context) * 0.5,
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.05,
              child: Stack(children: <Widget>[
                Container(
//Styling

                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(displayWidth(context) * 0.05),
                      color: Color(0xffE5E2E2)),
                ),

//Question count

                Positioned(
                    left: displayWidth(context) * 0.05,
                    top: displayHeight(context) * 0.02,
                    child: Opacity(
                      opacity: 0.30,
                      child: Text(
                        'Question$questionNumber',
                        style:
                            TextStyle(fontSize: displayWidth(context) * 0.05),
                      ),
                    )),

//Question text

                Positioned(
                    left: displayWidth(context) * 0.05,
                    top: displayHeight(context) * 0.1,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${widget.data[0]['question$questionNumber']['questionText']}',
                        softWrap: true,
                        style:
                            TextStyle(fontSize: displayWidth(context) * 0.09),
                        textAlign: TextAlign.left,
                      ),
                    )),
              ])),

//First anwser container

          Answer(
            top: displayHeight(context) * 0.53,
            text: anwsers(questionNumber, 1),
            data: widget.data,
            onTap: onTap,
            color: colors[0],
          ),

//Second anwser container

          Answer(
            top: displayHeight(context) * 0.62,
            text: anwsers(questionNumber, 2),
            data: widget.data,
            onTap: onTap,
            color: colors[1],
          ),

//Third anwser container

          Answer(
            top: displayHeight(context) * 0.71,
            text: anwsers(questionNumber, 3),
            data: widget.data,
            onTap: onTap,
            color: colors[2],
          ),

//Fourth anwser container

          Answer(
            top: displayHeight(context) * 0.80,
            text: anwsers(questionNumber, 4),
            data: widget.data,
            onTap: onTap,
            color: colors[3],
          )
        ],
      ),
    );
  }
}
