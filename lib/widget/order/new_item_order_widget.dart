import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:misterfix/model/order/order_item_model.dart';
import 'package:misterfix/model/profile/profile_model.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class NewItemOrderWidget extends StatelessWidget {
  OrderItemModel? data;
  ProfileModel? dataProfile;
  Color? colorStatus;
  Function? onClick;
  NewItemOrderWidget({this.data, this.dataProfile, this.colorStatus, this.onClick});

  @override
  Widget build(BuildContext context) {
    String nama = '';
    String alamat = '';
    String note = '';
    String tanggal = '';
    String link_avatar = '';
    String status = '';
    if (data != null) {
      note = data!.service_category!.name! +
          ' | ' +
          data!.customer_note!;
      alamat = data!.booking!.location_id.toString();
      tanggal = data!.booking!.date_service!;
      status = data!.booking!.status!;
    } else {
      note = 'Service AC | 3/4 PK | R 22';
      alamat = 'Jl. Raya Pemecutan no 12 C Denpasar';
      tanggal = 'Kamis, 29 Nov 2021 | 10:00 WIB';
    }
    if (dataProfile != null) {
      link_avatar = dataProfile!.avatar;
      nama = dataProfile!.name;
    } else {
      link_avatar =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/FBS_logo_1.jpg/600px-FBS_logo_1.jpg';
      nama = 'febi';
    }
    return InkWell(
      onTap: () => onClick!(),
      child: Container(
        decoration: ConstantStyle.boxShadowButtonBorder(
            color: Colors.white,
            radius: 8,
            spreadRadius: 0,
            blurRadius: 5,
            colorShadow: Colors.grey.shade400,
            offset: Offset(1, 3)),
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
                child: link_avatar != null
                    ? CachedNetworkImage(
                  placeholder: (context, url) => Center(),
                  imageUrl: link_avatar,
                  fit: BoxFit.cover,
                )
                    : Center(),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextMeta(
                            nama,
                            size: 12,
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: TextMeta(
                                  status ?? '',
                                  size: 12,
                                  color: colorStatus ??
                                      Utils.colorFromHex(ColorCode.bluePrimary),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 8),
                      TextMeta(
                        note,
                        size: 12,
                        weight: FontWeight.w400,
                        color: Utils.colorFromHex(ColorCode.bluePrimary),
                      ),
                      SizedBox(height: 3),
                      TextMeta(
                        alamat,
                        size: 12,
                        weight: FontWeight.w400,
                        color: Utils.colorFromHex(ColorCode.greyPrimary),
                      ),
                      SizedBox(height: 3),
                      TextMeta(
                        tanggal,
                        size: 12,
                        weight: FontWeight.w400,
                        color: Utils.colorFromHex(ColorCode.greyPrimary),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
