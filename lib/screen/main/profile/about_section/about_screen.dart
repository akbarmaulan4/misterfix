import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Utils.colorFromHex(ColorCode.bluePrimary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.14,
              width: size.height * 0.14,
              child: Image.asset(ImageConstant.logoMrFixWhite),
            ),
            SizedBox(height: 30),
            TextMeta('Version 1.0.1', size: 28, weight: FontWeight.w400,),
            SizedBox(height: 5),
            TextMeta('copyright misterfix 2021', size: 11, weight: FontWeight.w400,),
          ],
        ),

      ),
    );
  }
}
