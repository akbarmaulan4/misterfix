import 'package:flutter/material.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class UnitTabWidget extends StatelessWidget {
  String? label;
  Color? color;
  Color? textColor;
  Function? onClick;
  UnitTabWidget({this.label, this.color, this.textColor, this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick!(),
      child: Container(
        decoration: ConstantStyle.boxButton(radius: 15, color: color ?? Colors.transparent),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Center(
          child: TextMeta(label ?? '', size: 14, weight: FontWeight.w400, color: textColor ?? Colors.black87),
        ),
      ),
    );
  }
}
