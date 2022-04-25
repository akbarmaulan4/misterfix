import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/profile/profile_controller.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/model/profile/profile_model.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

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
      body: Obx(()=>Container(
        child: Column(
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
                      itemInfo(label: 'Username', value: controller.dataProfile.value.name),
                      itemInfo(label: 'Email Address', value:  controller.dataProfile.value.email),
                      itemInfo(label: 'Phone', value: controller.dataProfile.value.telpon),
                      itemInfo(label: 'Gender', value: controller.dataProfile.value.jenis_kelamin == 'L' ? "Laki-laki":'Perempuan'),
                      itemInfo(label: 'Date of Birth', value: '10/12/1988'),
                      itemInfo(label: 'About Me', value: ''),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }

  itemInfo({String? label, String? value}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMeta(label ?? '', size: 14, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.greyPrimary)),
          SizedBox(height: 7),
          TextMeta(value ?? '', size: 16, weight: FontWeight.w500, color: Colors.black87, maxLines: 200,),
          Divider(color: Utils.colorFromHex(ColorCode.greyPrimary))
        ],
      ),
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
