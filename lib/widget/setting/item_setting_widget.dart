import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ItemSettingWidget extends StatelessWidget {
  String? label;
  Function? onClick;
  ItemSettingWidget({this.label, this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick!(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                TextMeta(label ?? '', size: 14, color: Colors.black87, weight: FontWeight.w700,),
                Expanded(child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.chevron_right_rounded, size: 27,),
                ))
              ],
            ),
            Divider(color: Utils.colorFromHex(ColorCode.greyPrimary))
          ],
        ),
      ),
    );
  }
}
