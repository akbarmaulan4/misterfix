import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/profile/profile_controller.dart';
import 'package:misterfix/screen/main/profile/setting_section/bahasa_screen.dart';
import 'package:misterfix/screen/main/profile/setting_section/edit_profile_screen.dart';
import 'package:misterfix/screen/main/profile/setting_section/reset_password_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/setting/item_setting_switch_widget.dart';
import 'package:misterfix/widget/setting/item_setting_widget.dart';
import 'package:misterfix/model/profile/profile_model.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('My Profile', size: 16, weight: FontWeight.w500),
      ),
      body: Obx(()=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(controller.dataProfile.value),
          Expanded(child: Container(
            color: Utils.colorFromHex(ColorCode.bluePrimary),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: ConstantStyle.boxRadiusOnly(
                  topRight: 10,topLeft: 10,
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TextMeta('GENERAL', size: 16, weight: FontWeight.w900, color: Colors.black87),
                    SizedBox(height: 20),
                    ItemSettingWidget(label: 'Edit Profile', onClick: ()=>Get.to(()=>EditProfileScreen())),
                    ItemSettingWidget(label: 'Change Password', onClick: ()=>Get.to(()=>ResetPasswordScreen())),
                    ItemSettingWidget(label: 'Change Language', onClick: ()=>Get.to(()=>BahasaScreen())),

                    SizedBox(height: 40),
                    TextMeta('NOTIFICATIONS', size: 16, weight: FontWeight.w900, color: Colors.black87),
                    SizedBox(height: 20),
                    ItemSettingSwitchWidget(label: 'New Order'),
                    ItemSettingSwitchWidget(label: 'Notificatin Chat')
                  ],
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }

  header(ProfileModel data){
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.20,
      color: Utils.colorFromHex(ColorCode.bluePrimary),
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            height: 133,
            width: 133,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1)
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(),
                imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/FBS_logo_1.jpg/600px-FBS_logo_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TextMeta('Hi ${data.name},', size: 22, weight: FontWeight.w400,),
                SizedBox(height: 10),
                TextMeta('Bagaimana kabar hari ini', size: 14),
                SizedBox(height: 5),
                RatingBarIndicator(
                  rating: 5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  unratedColor: Colors.amber.withAlpha(50),
                  direction: Axis.horizontal,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
