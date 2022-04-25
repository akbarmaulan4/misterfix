import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/order/item_order_widget.dart';

class HistorySaldoScreen extends StatefulWidget {
  @override
  _HistorySaldoScreenState createState() => _HistorySaldoScreenState();
}

class _HistorySaldoScreenState extends State<HistorySaldoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('History Saldo', size: 16, weight: FontWeight.w500),
      ),
      body: Container(
        child: Stack(
          children: [
            body(),
            banner()
          ],
        ),
      ),

    );
  }

  header(){
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
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
                TextMeta('Hi Brother,', size: 22, weight: FontWeight.w400,),
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

  body(){
    return Container(
      color: Utils.colorFromHex(ColorCode.bgSurface),
      height: double.infinity,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            SizedBox(height: 100),
            Expanded(child: Container(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextMeta('Saldo saat ini', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.darkBlue),),
                          Expanded(child: Container(
                            alignment: Alignment.centerRight,
                            child: TextMeta('IDR 1.000.000', size: 16, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.darkBlue),),
                          ))
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 25),
                      TextMeta('History Saldo', size: 12, weight: FontWeight.w500, color: Colors.black87,),
                      SizedBox(height: 15),
                      Column(
                        children: [
                          ItemOrderWidget(status: 'IDR 500.000', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                          ItemOrderWidget(status: 'IDR 500.000', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                          ItemOrderWidget(status: 'IDR 500.000', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                          ItemOrderWidget(status: 'IDR 500.000', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                          ItemOrderWidget(status: 'IDR 500.000', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                          ItemOrderWidget(status: 'IDR 500.000', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ))

          ],
        ),
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
      height: 150,
      width: double.infinity,
      margin: EdgeInsets.only(top: 185, left: 25, right: 25),
      // padding: EdgeInsets.all(15),
      child: Row(
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
      ),
    );
  }
}
