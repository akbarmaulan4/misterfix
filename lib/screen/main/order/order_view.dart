import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/screen/main/order/order_detail_list.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/order/item_order_widget.dart';

class OrderView extends StatefulWidget {
  String? label;
  int? pos;
  OrderView({
    this.pos,
    this.label
});

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {

  getStatus(int pos){
    switch(pos){
      case 0:
        return 'Incoming';
      case 1:
        return 'Doing';
      case 2:
        return 'Done';
      case 3:
        return 'Cancel';
    }
  }

  getColorStatus(int pos){
    switch(pos){
      case 0:
        return Utils.colorFromHex(ColorCode.orangePrimary);
      case 1:
        return Utils.colorFromHex(ColorCode.bluePrimary);
      case 2:
        return Utils.colorFromHex(ColorCode.bluePrimary);
      case 3:
        return Utils.colorFromHex(ColorCode.errorPrimary);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextMeta(widget.label ?? '', size: 12, weight: FontWeight.w500, color: Colors.black87),
            SizedBox(height: 15),
            Column(
              children: [
                ItemOrderWidget(status: getStatus(widget.pos ?? 0), colorStatus: getColorStatus(widget.pos ?? 0), onCLick: ()=>Get.to(()=>OrderDetailList()),),
                ItemOrderWidget(status: getStatus(widget.pos ?? 0), colorStatus: getColorStatus(widget.pos ?? 0)),
                ItemOrderWidget(status: getStatus(widget.pos ?? 0), colorStatus: getColorStatus(widget.pos ?? 0)),
                ItemOrderWidget(status: getStatus(widget.pos ?? 0), colorStatus: getColorStatus(widget.pos ?? 0)),
                ItemOrderWidget(status: getStatus(widget.pos ?? 0), colorStatus: getColorStatus(widget.pos ?? 0)),
                ItemOrderWidget(status: getStatus(widget.pos ?? 0), colorStatus: getColorStatus(widget.pos ?? 0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
