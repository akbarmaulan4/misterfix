import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/screen/auth/login_screen.dart';
import 'package:misterfix/screen/main/main_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/local_data.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:misterfix/model/auth/user_model.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 4000), (){
      gotoScreen();
      // Get.off(()=>LoginScreen());
    });
  }

  gotoScreen() async {
    var remember = await LocalData.getRemember();
    UserModel? user = await LocalData.getUser();
    if(remember && user != null){
      Get.off(()=>MainScreen());
    }else{
      Get.off(()=>LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40),
        color: Utils.colorFromHex(ColorCode.bluePrimary),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: size.height * 0.14,
                  width: size.height * 0.14,
                  child: Image.asset(ImageConstant.logoMrFixWhite),
                ),
              ),
              TextMeta('copyright misterfix 2021', size: 11, weight: FontWeight.w500,),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
