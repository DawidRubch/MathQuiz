import 'package:flutter/material.dart';
import 'package:mathquiz/utils/mediaquery.dart';

//Anwser Container on the quiz page
class AnswerContainer extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;

  AnswerContainer({this.onTap, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
          children: <Widget>[
            Container(
//Styling

              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(displayWidth(context) * 0.05),
                  color: color),

//Text inside a container

              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$text',
                    style: TextStyle(fontSize: displayWidth(context) * 0.06),
                  )),
            ),
          ],
        ),
        onTap: onTap);
  }
}

//Answer logic
class Answer extends StatefulWidget {
  final double top;
  final String text;
  final List data;
  final int questionIndex;
  final Function onTap;
  final Color color;
  

  Answer(
      {Key key,
      this.top,
      this.text,
      this.data,
      this.questionIndex,
      this.onTap,
      this.color,
      })
      : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  var dotColor;

  int points = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: displayHeight(context) * 0.07,
        left: displayWidth(context) * 0.05,
        right: displayWidth(context) * 0.05,
        top: widget.top,
        child: AnswerContainer(
          color: widget.color,
          text: widget.text,
          onTap: widget.onTap,
        ));
  }
}
