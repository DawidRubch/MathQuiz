import 'package:flutter/material.dart';
import 'package:mathquiz/utils/mediaquery.dart';

//Profile picture circle
class ProfilePicture extends StatelessWidget {
  final asset;
  ProfilePicture({this.asset});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.18,
      height: displayHeight(context) * 0.09,
      decoration:

//Styling

          BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(asset))),
    );
  }
}
