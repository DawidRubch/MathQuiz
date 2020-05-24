import 'package:flutter/material.dart';
import 'package:mathquiz/utils/mediaquery.dart';
import 'package:mathquiz/widgets/ProfilePicture.dart';

//My profile container on homepage
class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//Container styling

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(displayWidth(context) * 0.03),
        color: Color(0xffE5E2E2),
      ),
      child: Stack(
        children: <Widget>[
//Text in the top left

          Positioned(
              top: displayHeight(context) * 0.01,
              left: displayWidth(context) * 0.025,
              child: Opacity(
                opacity: 0.3,
                child: Text('MY PROFILE'),
              )),

//Name of the user

          Positioned(
            child: Text(
              'Thomas\nEdison',
              style: TextStyle(fontSize: displayWidth(context) * 0.05),
            ),
            bottom: displayWidth(context) * 0.1,
            left: displayWidth(context) * 0.025,
          ),

//User profile picture

          Positioned(
              left: displayWidth(context) * 0.025,
              top: displayHeight(context) * 0.05,
              child: ProfilePicture(asset: 'asset/images/losowiLudzie/1.jpg')),

//User name with an at sign

          Positioned(
              bottom: displayHeight(context) * 0.01,
              left: displayWidth(context) * 0.025,
              child: Opacity(
                opacity: 0.3,
                child: Text('@ThomasEdison'),
              ))
        ],
      ),
    );
  }
}
