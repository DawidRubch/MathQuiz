import 'package:flutter/material.dart';
import 'package:mathquiz/utils/mediaquery.dart';

//My ranking container and also coins amount container

class CoinsMyRankingClass extends StatelessWidget {
  final String topText;
  final String bottomText;
  final List<Color> gradientArrays;
  CoinsMyRankingClass({this.topText, this.bottomText, this.gradientArrays});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
//Name of the container

          Positioned(
              left: displayWidth(context) * 0.05,
              top: displayHeight(context) * 0.01,
              child: Opacity(
                  opacity: 0.48,
                  child: Text(
                    '$topText',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: displayWidth(context) * 0.05),
                  ))),

//Text in the right bottom

          Positioned(
              right: displayWidth(context) * 0.05,
              bottom: displayHeight(context) * 0.02,
              child: Text('$bottomText',
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.06,
                      color: Colors.white)))
        ],
      ),
      height: displayHeight(context) * 0.13,

//Styling

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(displayWidth(context) * 0.03),
          gradient: LinearGradient(colors: gradientArrays)),
    );
  }
}
