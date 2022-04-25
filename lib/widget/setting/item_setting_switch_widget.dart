import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ItemSettingSwitchWidget extends StatelessWidget {
  String? label;
  ItemSettingSwitchWidget({this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              TextMeta(label ?? '', size: 14, color: Colors.black87, weight: FontWeight.w700,),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterSwitch(
                    width: 30,
                    height: 15.0,
                    // valueFontSize: 25.0,
                    toggleSize: 13.0,
                    value: true,
                    borderRadius: 30.0,
                    padding: 1.5,
                    activeColor: Utils.colorFromHex(ColorCode.bgPurplePrimary),
                    toggleColor: Colors.white,
                    onToggle: (val) {
                      // setState(() {
                      //   status = val;
                      // });
                    },
                  )
                ],
              ))
            ],
          ),
          Divider(color: Utils.colorFromHex(ColorCode.greyPrimary))
        ],
      ),
    );
  }
}
