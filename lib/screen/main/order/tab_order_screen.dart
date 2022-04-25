import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/order/order_controller.dart';
import 'package:misterfix/screen/main/order/order_view.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class TabOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderController controller = OrderController();
    return new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Utils.colorFromHex(ColorCode.bgBluePrimary),
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Utils.colorFromHex(ColorCode.darkBlue)),
          title: new TextMeta('Order', size: 22, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.darkBlue),),
          bottom: new TabBar(
            labelColor: Utils.colorFromHex(ColorCode.bluePrimary),
            unselectedLabelColor: Utils.colorFromHex(ColorCode.darkBlue),
            indicator: BoxDecoration(color: Colors.transparent),
            onTap: (val)=>controller.changePosTab(val),
            tabs: <Widget>[
              new Tab(
               child: Align(
                 alignment: Alignment.center,
                 child: Obx(()=>Column(
                   children: [
                     SvgPicture.asset(
                       controller.posTab.value == 0 ? ImageConstant.ic_incoming_active:ImageConstant.ic_incoming_inactive,
                       semanticsLabel: 'incoming',
                     ),
                     SizedBox(height: 5),
                     Text("Incoming"),
                   ],
                 )),
               ),
              ),
              new Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Obx(()=>Column(
                    children: [
                      SvgPicture.asset(
                        controller.posTab.value == 1 ? ImageConstant.ic_doing_active:ImageConstant.ic_doing_inactive,
                        semanticsLabel: 'doing',
                      ),
                      SizedBox(height: 11),
                      Text("Doing"),
                    ],
                  )),
                ),
              ),
              new Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Obx(()=>Column(
                    children: [
                      SvgPicture.asset(
                        controller.posTab.value == 2 ? ImageConstant.ic_done_active:ImageConstant.ic_done_inactive,
                        semanticsLabel: 'done',
                      ),
                      SizedBox(height: 12),
                      Text("Done"),
                    ],
                  )),
                ),
                // text: "Third",
              ),
              new Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Obx(()=>Column(
                    children: [
                      SvgPicture.asset(
                        controller.posTab.value == 3 ? ImageConstant.ic_cancel_active:ImageConstant.ic_cancel_inactive,
                        semanticsLabel: 'cancel',
                      ),
                      SizedBox(height: 5),
                      Text("Cancel"),
                    ],
                  )),
                ),
                // text: "Third",
              ),
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: Utils.colorFromHex(ColorCode.darkBlue))
            )
          ],
        ),
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              new OrderView(pos: 0, label: 'Incoming Order'),
              new OrderView(pos: 1, label: 'Onprogress Order'),
              new OrderView(pos: 2, label: 'Order Finished'),
              new OrderView(pos: 3, label: 'Order Canceled'),
            ],
          ),
        ),
      ),
    );
  }
}
