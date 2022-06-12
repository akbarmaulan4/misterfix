import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:misterfix/model/unit/model_success_unit.dart';
import 'package:misterfix/model/unit/model_unit.dart';
import 'package:misterfix/screen/main/main_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/common/button_mrfix_widget.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  ModelSuccesUnit? data;
  QrCodeScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: InkWell(
          onTap: ()=>Get.back(),
          child: Icon(Icons.arrow_back, color: Colors.white )
        ),
        title: new TextMeta('Tambah Informasi Unit', size: 16, weight: FontWeight.w500),
      ),
      body: Container(
        color: Utils.colorFromHex(ColorCode.bluePrimary),
        padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: ConstantStyle.boxRadiusOnly(
              topRight: 10,topLeft: 10,
              color: Colors.white
          ),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                SvgPicture.asset(
                  ImageConstant.ic_check_circle_outline,
                  semanticsLabel: 'logo', height: 40, width: 40,),
                SizedBox(height: 20),
                TextMeta('Unit berhasil ditambahkan !', size: 18, weight: FontWeight.w400, color: Colors.black87),
                SizedBox(height: 20),
                QrImage(
                  data: data!.code,
                  version: QrVersions.auto,
                  size: 180,
                  gapless: false,
                  embeddedImage: AssetImage(ImageConstant.logoMrFixColor),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(35, 35),
                  ),
                ),
                // SizedBox(height: 15),
                TextMeta(data != null ? data!.code:'', size: 14, weight: FontWeight.w400, color: Colors.black87, textAlign: TextAlign.center,),
                SizedBox(height: 40),
                TextMeta(data!.unit, size: 14, weight: FontWeight.w400, color: Colors.black87, textAlign: TextAlign.center),
                SizedBox(height: 10),
                TextMeta(data!.location_unit, size: 14, weight: FontWeight.w400, color: Colors.black87, textAlign: TextAlign.center),
                SizedBox(height: 10),
                TextMeta('Tgl. Pemasangan : ${data!.tgl_pasang}', size: 14, weight: FontWeight.w500, color: Colors.black87, textAlign: TextAlign.center),
                SizedBox(height: 20),
                TextMeta(data!.nama_pelanggan, size: 14, weight: FontWeight.w400, color: Colors.black87, textAlign: TextAlign.center),
                SizedBox(height: 5),
                TextMeta(data!.alamat, size: 14, weight: FontWeight.w400, color: Colors.black87, maxLines: 5, textAlign: TextAlign.center),
                SizedBox(height: 5),
                TextMeta(data!.tlp_pelanggan != null ? data!.tlp_pelanggan : '', size: 14, weight: FontWeight.w400, color: Colors.black87, textAlign: TextAlign.center),
                // SizedBox(height: 10),
                // TextMeta('+62 899876600', size: 14, weight: FontWeight.w400, color: Colors.black87),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonMrFixWidget(
                    label: 'Selesai', 
                    color: Utils.colorFromHex(ColorCode.bluePrimary), 
                    textColor: Colors.white,
                    onClick: ()=>Get.offAll(()=>MainScreen()),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
