import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ItemOrderWidget extends StatelessWidget {
  String? status;
  Color? colorStatus;
  Function? onCLick;
  Map? data_history;
  Map? data_profile;
  ItemOrderWidget(
      {this.status,
      this.colorStatus,
      this.onCLick,
      this.data_history,
      this.data_profile});
  @override
  Widget build(BuildContext context) {
    String nama = '';
    String alamat = '';
    String note = '';
    String tanggal = '';
    String link_avatar = '';
    if (data_history != null) {
      note = data_history!['service_category']['name'] +
          ' | ' +
          data_history!['customer_note'];
      alamat = data_history!['booking']['location_id'].toString();
      tanggal = data_history!['booking']['date_service'];
      status = data_history!['booking']['status'];
    } else {
      note = 'Service AC | 3/4 PK | R 22';
      alamat = 'Jl. Raya Pemecutan no 12 C Denpasar';
      tanggal = 'Kamis, 29 Nov 2021 | 10:00 WIB';
    }
    if (data_profile != null) {
      link_avatar = data_profile!['avatar'];
      nama = data_profile!['name'];
    } else {
      link_avatar =
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/FBS_logo_1.jpg/600px-FBS_logo_1.jpg';
      nama = 'febi';
    }
    return InkWell(
      onTap: () => onCLick!(),
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
