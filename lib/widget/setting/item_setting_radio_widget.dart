import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ItemSettingRadioWidget extends StatelessWidget {
  String? label;
  Function? onClick;
  ItemSettingRadioWidget({this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              TextMeta(label ?? '', color: Colors.black87, size: 16, weight: FontWeight.w500,),
              Expanded(child: Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.radio_button_off),
              ))
            ],
          ),
          Divider(color: Utils.colorFromHex(ColorCode.greyPrimary),)
        ],
      ),
    );
  }
}
