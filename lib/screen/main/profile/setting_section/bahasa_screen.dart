import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/setting/item_setting_radio_widget.dart';

class BahasaScreen extends StatelessWidget {
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
                SizedBox(height: 20),
                ItemSettingRadioWidget(label: 'Indonesia(ID)'),
                ItemSettingRadioWidget(label: 'English (EN)'),
                ItemSettingRadioWidget(label: 'Basa Jawa'),
                ItemSettingRadioWidget(label: '日本語'),
                ItemSettingRadioWidget(label: 'Français (France)'),
                ItemSettingRadioWidget(label: 'Español'),
                ItemSettingRadioWidget(label: 'Português (Brasil)'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
