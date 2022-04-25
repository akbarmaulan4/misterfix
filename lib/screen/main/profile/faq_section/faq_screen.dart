import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/setting/item_setting_widget.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('Pilih Bahasa', size: 16, weight: FontWeight.w500),
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
                ItemSettingWidget(label: 'Pertanyaan 1'),
                ItemSettingWidget(label: 'Pertanyaan 2'),
                ItemSettingWidget(label: 'Pertanyaan 3'),
                ItemSettingWidget(label: 'Pertanyaan 4'),
                ItemSettingWidget(label: 'Pertanyaan 5'),
                ItemSettingWidget(label: 'Pertanyaan 6'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
