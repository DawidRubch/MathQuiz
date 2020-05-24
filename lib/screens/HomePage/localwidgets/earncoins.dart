import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mathquiz/utils/mediaquery.dart';

//Containers inside the earncoins container
class EarnCoinsContainers extends StatelessWidget {
  final Color color;
  final String text;
  final String icon;
  EarnCoinsContainers({this.color, this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
//Container styling

      margin: EdgeInsets.only(left: displayWidth(context) * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(displayWidth(context) * 0.02),
        color: color,
      ),
      width: displayWidth(context) * 0.22,
      height: displayHeight(context) * 0.12,
      child: Stack(
        children: <Widget>[
//Container icon

          Positioned(
              width: displayWidth(context) * 0.1,
              height: displayHeight(context) * 0.05,
              left: displayWidth(context) * 0.06,
              top: displayHeight(context) * 0.01,
              child: SvgPicture.asset(
                '$icon',
                color: Colors.white,
              )),

//Container name

          Positioned(
            bottom: displayHeight(context) * 0.01,
            left: displayWidth(context) * 0.05,
            right: displayWidth(context) * 0.05,
            child: Text(
              '$text',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: displayWidth(context) * 0.035),
            ),
          )
        ],
      ),
    );
  }
}

class EarnCoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(displayWidth(context) * 0.03),
              color: Color(0xffE5E2E2)),
          child: Stack(
            children: <Widget>[
//Name of the entire container

              Positioned(
                  top: displayHeight(context) * 0.025,
                  left: displayWidth(context) * 0.06,
                  child: Opacity(
                    opacity: 0.28,
                    child: Text(
                      'Earn Coins',
                      style: TextStyle(fontSize: displayWidth(context) * 0.06),
                    ),
                  )),

//Row of earn coins containers

              Positioned(
                  left: displayWidth(context) * 0.015,
                  bottom: displayHeight(context) * 0.025,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
//Rate us container

                      EarnCoinsContainers(
                        text: 'Rate\nUs',
                        icon: 'asset/icons/SVG/star-empty.svg',
                        color: Color(0xffEB3D3D),
                      ),

//Watch a video container

                      EarnCoinsContainers(
                        text: 'Watch a video',
                        icon: 'asset/icons/SVG/film.svg',
                        color: Color(0xff1FC4D1),
                      ),

//Invite a friend container

                      EarnCoinsContainers(
                        text: 'Invite a friend',
                        icon: 'asset/icons/SVG/envelop.svg',
                        color: Color(0xff62CBAB),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
