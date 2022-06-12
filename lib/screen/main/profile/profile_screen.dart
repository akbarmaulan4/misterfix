import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/profile/profile_controller.dart';
import 'package:misterfix/controller/unit/unit_controller.dart';
import 'package:misterfix/model/profile/profile_model.dart';
import 'package:misterfix/screen/main/profile/about_section/about_screen.dart';
import 'package:misterfix/screen/main/profile/faq_section/faq_screen.dart';
import 'package:misterfix/screen/main/profile/history_section/history_saldo_screen.dart';
import 'package:misterfix/screen/main/profile/profile_section/my_profile_screen.dart';
import 'package:misterfix/screen/main/profile/setting_section/setting_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/local_data.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/profile/item_menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  ProfileController controller = Get.put(ProfileController());
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>body(controller.dataProfile.value)),
    );
  }

  header(ProfileModel model){
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      color: Utils.colorFromHex(ColorCode.bluePrimary),
      padding: EdgeInsets.only(left: 15, right: 15, top: 50),
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
                Row(
                  children: [
                    FlutterSwitch(
                      width: 35,
                      height: 15.0,
                      // valueFontSize: 25.0,
                      toggleSize: 13.0,
                      value: true,
                      borderRadius: 30.0,
                      padding: 1.5,
                      activeColor: Colors.white,
                      toggleColor: Utils.colorFromHex(ColorCode.bluePrimary),
                      onToggle: (val) {
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 5, right: 13),
                    child: TextMeta('On', size: 12, weight: FontWeight.w400,)
                ),
                TextMeta('Hi ${model.name},', size: 22, weight: FontWeight.w400,),
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
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  body(ProfileModel model){
    return Container(
      color: Utils.colorFromHex(ColorCode.bgSurface),
      height: double.infinity,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(model),
            Expanded(child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    section1(),
                    SizedBox(height: 25),
                    section2(),
                    SizedBox(height: 25),
                    section3()
                  ],
                ),
              ),
            ))

          ],
        ),
      ),
    );
  }

  section1(){
    return Container(
      decoration: ConstantStyle.boxShadowButtonBorder(
          color: Colors.white,
          radius: 15,
          spreadRadius: 0,
          blurRadius: 13,
          colorShadow: Colors.grey.shade400,
          offset: Offset(1, 3)
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          ItemMenuWidget(label: 'My Profile', imgAsset: ImageConstant.ic_profile_menu, onClick: ()=>Get.to(MyProfileScreen())),
          ItemMenuWidget(label: 'History Saldo', imgAsset: ImageConstant.ic_history_profile_menu, onClick: ()=>Get.to(HistorySaldoScreen())),
          ItemMenuWidget(label: 'Settings', imgAsset: ImageConstant.ic_setting_profile_menu, onClick: ()=>Get.to(()=>SettingScreen()))
        ],
      ),
    );
  }

  section2(){
    return Container(
      decoration: ConstantStyle.boxShadowButtonBorder(
          color: Colors.white,
          radius: 15,
          spreadRadius: 0,
          blurRadius: 13,
          colorShadow: Colors.grey.shade400,
          offset: Offset(1, 3)
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          ItemMenuWidget(label: 'Faq', imgAsset: ImageConstant.ic_faq_profile_menu, onClick: ()=>Get.to(()=>FaqScreen())),
          ItemMenuWidget(label: 'About App', imgAsset: ImageConstant.ic_about_profile_menu, onClick: ()=>Get.to(()=>AboutScreen()))
        ],
      ),
    );
  }

  section3(){
    return Container(
      decoration: ConstantStyle.boxShadowButtonBorder(
          color: Colors.white,
          radius: 15,
          spreadRadius: 0,
          blurRadius: 13,
          colorShadow: Colors.grey.shade400,
          offset: Offset(1, 3)
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          ItemMenuWidget(label: 'Logout', imgAsset: ImageConstant.ic_logout_profile_menu, onClick: (){
            DialogConstant.messageConfirm(
              context: context,
              title: "Peringatan",
              message: 'Apakah anda ingin keluar dari aplikasi?',
              onConfirm: () async {
                var token = await LocalData.getToken();
                var remeber = await LocalData.getRemember();
                LocalData.removeAllPreference();
                LocalData.saveToken(token);
                LocalData.saveRemember(remeber);
                Get.deleteAll();
                SystemNavigator.pop();
              }
            );
          }),
        ],
      ),
    );
  }
}
