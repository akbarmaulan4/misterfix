import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misterfix/model/notif/item_notif_model.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ItemNotifikasiWidget extends StatelessWidget {
  ItemNotifModel? data;
  String? status;
  Color? colorStatus;
  Function? onCLick;
  ItemNotifikasiWidget({this.data, this.status, this.colorStatus, this.onCLick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onCLick!(),
      child: Container(
        decoration: ConstantStyle.boxShadowButtonBorder(
            color: Colors.white,
            radius: 8,
            spreadRadius: 0,
            blurRadius: 5,
            colorShadow: Colors.grey.shade400,
            offset: Offset(1, 3)
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: ConstantStyle.boxCircle(),
              child: ClipOval(
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(),
                  imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/FBS_logo_1.jpg/600px-FBS_logo_1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextMeta(data != null ? data!.user_name:'', size: 12, weight: FontWeight.w500, color: Colors.black87,),
                      Expanded(child: Container(
                        alignment: Alignment.centerRight,
                        child: TextMeta(status ?? '', size: 12, color: colorStatus ?? Utils.colorFromHex(ColorCode.bluePrimary),),
                      ))
                    ],
                  ),
                  getDetailUnit(data!.category)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  getDetailUnit(String category){
    switch(category){
      case 'Electrician':
        return getElectical();
      case 'Air Conditioning':
        return getACDetai();
      default: return dummyDetail();
    }
  }

  dummyDetail(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          TextMeta('Service AC | 3/4 PK | R 22', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.bluePrimary),),
          SizedBox(height: 3),
          TextMeta('Jl. Raya Pemecutan no 12 C Denpasar', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
          SizedBox(height: 3),
          TextMeta('Kamis, 29 Nov 2021 | 10:00 WIB', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
        ],
      ),
    );
  }

  getACDetai(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          TextMeta('Service AC | 3/4 PK | ${data!.type}', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.bluePrimary),),
          SizedBox(height: 3),
          TextMeta('${data!.location}', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
          SizedBox(height: 3),
          TextMeta('${data!.pemasangan}', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
        ],
      ),
    );
  }

  getElectical(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          TextMeta('Kelistrikan', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.bluePrimary),),
          SizedBox(height: 3),
          TextMeta('${data!.location}', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
          SizedBox(height: 3),
          TextMeta('${data!.pemasangan}', size: 12, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
        ],
      ),
    );
  }
}
