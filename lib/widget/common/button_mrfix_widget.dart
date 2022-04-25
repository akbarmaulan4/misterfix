import 'package:flutter/material.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ButtonMrFixWidget extends StatelessWidget {
  String? label;
  Color? color;
  Color? textColor;
  Function? onClick;
  ButtonMrFixWidget({this.label, this.color, this.textColor, this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick!(),
      child: Container(
        decoration: ConstantStyle.boxButton(radius: 25, color: color ?? Colors.transparent),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
          child: TextMeta(label ?? '', size: 14, weight: FontWeight.w500, color: textColor ?? Colors.black87),
        ),
      ),
    );
  }
}
