import 'package:flutter/material.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/order/item_order_widget.dart';
import 'package:misterfix/widget/unit/unit_tab_widget.dart';

class NotifikasiScreen extends StatefulWidget {
  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('Notifikasi', size: 16, weight: FontWeight.w500),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: Colors.white)
          )
        ],
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  UnitTabWidget(label: 'Belum dibaca', color: Utils.colorFromHex(ColorCode.bgBluePrimary),
                      textColor: Utils.colorFromHex(ColorCode.darkBlue)),
                  SizedBox(width: 10),
                  UnitTabWidget(label: 'Sudah dibaca', color: Colors.grey.shade300,
                      textColor: Utils.colorFromHex(ColorCode.darkBlue))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextMeta('Belum dibaca', size: 12, weight: FontWeight.w500, color: Colors.black87,),
              ),
              Expanded(child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemOrderWidget(status: '15 Menit', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                      ItemOrderWidget(status: '20 Menit', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                      ItemOrderWidget(status: '2 Jam', colorStatus: Utils.colorFromHex(ColorCode.orangePrimary)),
                      ItemOrderWidget(status: 'Hari ini', colorStatus: Colors.green),
                      ItemOrderWidget(status: 'Minggu ini', colorStatus: Colors.green),
                      ItemOrderWidget(status: 'Bulan ini', colorStatus: Colors.green),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
