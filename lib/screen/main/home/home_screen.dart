import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/home/home_controller.dart';
import 'package:misterfix/controller/profile/profile_controller.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/order/item_order_widget.dart';
import 'package:misterfix/widget/order/new_item_order_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = HomeController();
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getHistoryUnitHome();
    profileController.getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(()=>Container(
        child: Stack(
          children: [
            Container(
              color: Utils.colorFromHex(ColorCode.bgSurface),
              height: double.infinity,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    SizedBox(height: 140),
                    Expanded(child: Container(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextMeta('Order Status', size: 18, weight: FontWeight.w600, color: Colors.black87,),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  box(label: 'Incoming', textColor: Utils.colorFromHex(ColorCode.darkOrange)),
                                  box(label: 'On Going', textColor: Utils.colorFromHex(ColorCode.bluePrimary)),
                                  box(label: 'Cancel', textColor: Utils.colorFromHex(ColorCode.orangePrimary)),
                                  box(label: 'Done', textColor: Utils.colorFromHex(ColorCode.darkBlue)),

                                ],
                              ),
                              SizedBox(height: 25),
                              TextMeta('Order History', size: 18, weight: FontWeight.w600, color: Colors.black87,),
                              SizedBox(height: 15),
                              Column(
                                children: controller.dataHistory.value.map((data) => NewItemOrderWidget(
                                    data: data,
                                    dataProfile: profileController.dataProfile.value,
                                    onClick: (){},
                                    colorStatus: Utils.colorFromHex(ColorCode.orangePrimary))
                                ).toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))

                  ],
                ),
              ),
            ),
            banner()
          ],
        ),
      )),
    );
  }

  box({String? label, Color? textColor}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          Container(
            decoration: ConstantStyle.boxShadowButtonBorder(
                color: Colors.white,
                radius: 8,
                spreadRadius: 0,
                blurRadius: 5,
                colorShadow: Colors.grey.shade400,
                offset: Offset(1, 3)
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            child: Center(
              child: TextMeta('13', size: 18, weight: FontWeight.w600, color: Colors.black87,),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: ConstantStyle.boxButton(radius: 15, color: Colors.white),
            child: TextMeta(label ?? '', size: 12, weight: FontWeight.w600, color: textColor ?? Colors.black87,),
          )

        ],
      ),
    );
  }

  header(){
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Utils.colorFromHex(ColorCode.bluePrimary),
      padding: EdgeInsets.only(left: 15, right: 15, top: 50),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 63,
                width: 63,
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
                          TextMeta('Hi Brother,', size: 22, weight: FontWeight.w400,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterSwitch(
                                      width: 40,
                                      height: 20.0,
                                      // valueFontSize: 25.0,
                                      toggleSize: 14.0,
                                      value: true,
                                      borderRadius: 30.0,
                                      padding: 3.0,
                                      activeColor: Colors.white,
                                      toggleColor: Utils.colorFromHex(ColorCode.bluePrimary),
                                      onToggle: (val) {
                                        // setState(() {
                                        //   status = val;
                                        // });
                                      },
                                    )
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 5, right: 13),
                                    child: TextMeta('On', size: 12, weight: FontWeight.w400,)
                                ),
                              ],
                            ),
                          )
                        ]
                    ),
                    // SizedBox(height: 10),
                    TextMeta('Bagaimana kabar hari ini', size: 14),
                    SizedBox(height: 5),
                    // RatingBar(
                    //   itemCount: 5,
                    //   initialRating: 3,
                    //   allowHalfRating: true,
                    //   direction: Axis.horizontal,
                    //   ratingWidget: RatingWidget(
                    //     half: SvgPicture.asset(
                    //       ImageConstant.star_half,
                    //       semanticsLabel: 'logo'),
                    //     empty: SvgPicture.asset(
                    //         ImageConstant.star_empty,
                    //         semanticsLabel: 'logo'),
                    //     full: SvgPicture.asset(
                    //         ImageConstant.star_full,
                    //         semanticsLabel: 'logo')
                    //     ),
                    //   onRatingUpdate: (val){}
                    // ),
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
          )
        ],
      ),
    );
  }

  banner(){
    return Container(
      decoration: ConstantStyle.boxShadowButtonBorder(
        color: Colors.white,
        radius: 15,
        spreadRadius: 0,
        blurRadius: 13,
        colorShadow: Colors.grey.shade400,
        offset: Offset(1, 3)
      ),
      height: 180,
      width: double.infinity,
      margin: EdgeInsets.only(top: 200, left: 25, right: 25),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              TextMeta('My Wallet Balance', size: 14, color: Colors.black87,),
              Expanded(child: Container(
                alignment: Alignment.centerRight,
                child: TextMeta('IDR 1.000.000 ', size: 14, color: Utils.colorFromHex(ColorCode.bluePrimary),),
              ))
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        ImageConstant.build,
                        semanticsLabel: 'logo'),
                    SizedBox(height: 10),
                    TextMeta('Total Work', size: 12, color: Colors.black87,),
                    SizedBox(height: 5),
                    TextMeta('862', size: 14, color: Utils.colorFromHex(ColorCode.bluePrimary), weight: FontWeight.w500,),
                    SizedBox(height: 5),
                    TextMeta('Times', size: 10, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        ImageConstant.monetization_on,
                        semanticsLabel: 'logo'),
                    SizedBox(height: 10),
                    TextMeta('Total Income', size: 12, color: Colors.black87,),
                    SizedBox(height: 5),
                    TextMeta('1.000.000', size: 14, color: Utils.colorFromHex(ColorCode.bluePrimary), weight: FontWeight.w500,),
                    SizedBox(height: 5),
                    TextMeta('Rupiah', size: 10, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        ImageConstant.assessment,
                        semanticsLabel: 'logo'),
                    SizedBox(height: 10),
                    TextMeta('Total Withdraw', size: 12, color: Colors.black87,),
                    SizedBox(height: 5),
                    TextMeta('9.000.000', size: 14, color: Utils.colorFromHex(ColorCode.bluePrimary), weight: FontWeight.w500,),
                    SizedBox(height: 5),
                    TextMeta('Rupiah', size: 10, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
