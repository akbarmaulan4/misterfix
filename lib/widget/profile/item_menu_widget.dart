import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/widget/font/text_meta.dart';


class ItemMenuWidget extends StatelessWidget {
  String? label;
  String? imgAsset;
  Function? onClick;
  ItemMenuWidget({this.label, this.imgAsset, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick!(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            SvgPicture.asset(
              imgAsset ?? ImageConstant.ic_profile_menu,
              semanticsLabel: 'logo', height: 22, width: 22,),
            SizedBox(width: 20),
            TextMeta(label ?? '', size: 14, color: Colors.black87, weight: FontWeight.w700,),
            Expanded(child: Container(
              alignment: Alignment.centerRight,
              child: Icon(Icons.chevron_right_rounded, size: 27,),
            ))
          ],
        ),
      ),
    );
  }
}
