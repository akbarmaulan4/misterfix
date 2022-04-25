import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/main/main_controller.dart';
import 'package:misterfix/screen/main/home/home_screen.dart';
import 'package:misterfix/screen/main/notifikasi/notifikasi_screen.dart';
import 'package:misterfix/screen/main/order/tab_order_screen.dart';
import 'package:misterfix/screen/main/profile/profile_screen.dart';
import 'package:misterfix/screen/main/unit/unit_information_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainController controller = MainController();


  changeScreen(int pos){
    switch(pos){
      case 0:
        return HomeScreen();
      case 1:
        return TabOrderScreen();
      case 2:
        return NotifikasiScreen();
      case 3:
        return ProfileScreen();
    }
  }

  permission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location
    ].request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
    initOneSignal();
    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
      if (notification != null) {
        final data = notification.payload.additionalData;
      }
    });
  }

  initOneSignal(){
    WidgetsFlutterBinding.ensureInitialized();
    OneSignal.shared.init("1ddf28bb-9741-4fe2-93dd-e29d750d9895",
        iOSSettings: {
          OSiOSSettings.autoPrompt: false,
          OSiOSSettings.inAppLaunchUrl: false
        });
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    setupPlayerId();
  }

  void setupPlayerId() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    var playerId = status.subscriptionStatus.userId;
    if (playerId != null) {

    }
    // var hasPlayerId = await LocalData.getPlayerId();
    // if (!hasPlayerId) {
    //   var status = await OneSignal.shared.getPermissionSubscriptionState();
    //   var playerId = status.subscriptionStatus.userId;
    //   if (playerId != null) {
    //     bloc.postPlayerId(playerId);
    //   } else {
    //     setupPlayerId();
    //   }
    // }

    // await OneSignal.shared.postNotification(OSCreateNotification(
    //     // playerIds: [playerId],
    //     content: "this is a test from OneSignal's Flutter SDK",
    //     heading: "Test Notification",
    //     buttons: [
    //       OSActionButton(text: "test1", id: "id1"),
    //       OSActionButton(text: "test2", id: "id2")
    //     ]
    // ));

//    var myCustomUniqueUserId = "something from my backend server";
//    OneSignal.shared.setExternalUserId(myCustomUniqueUserId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(()=>changeScreen(controller.posMenu.value)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: ()=>Get.to(()=>UnitInformationScreen()),
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: SvgPicture.asset(
            ImageConstant.ic_fab,
            semanticsLabel: 'fab',
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Utils.colorFromHex(ColorCode.bgBluePrimary),
        // shape: CircularNotchedRectangle(),
        // notchMargin: 4,
        // clipBehavior: Clip.antiAlias,
        child: Obx(()=>Container(
          height: size.height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: ()=>controller.changePosMenu(0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        controller.posMenu.value == 0 ? ImageConstant.ic_home_active:ImageConstant.ic_home_inactive,
                        semanticsLabel: 'home',
                      ),
                      SizedBox(height: 7),
                      TextMeta('Home', size: 12, weight: FontWeight.w500, color: Utils.colorFromHex(controller.posMenu.value == 0 ?ColorCode.bluePrimary:ColorCode.darkBlue)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: ()=>controller.changePosMenu(1),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        controller.posMenu.value == 1 ? ImageConstant.ic_order_active:ImageConstant.ic_order_inactive,
                        semanticsLabel: 'order',
                      ),
                      SizedBox(height: 7),
                      TextMeta('Order', size: 12, weight: FontWeight.w500, color: Utils.colorFromHex(controller.posMenu.value == 1 ?ColorCode.bluePrimary:ColorCode.darkBlue)),
                    ],
                  ),
                ),
              )              ,
              SizedBox(width: 25),
              InkWell(
                onTap: ()=>controller.changePosMenu(2),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageConstant.ic_notif_inactive,
                        semanticsLabel: 'home',
                      ),
                      SizedBox(height: 7),
                      TextMeta('Notifikasi', size: 12, weight: FontWeight.w500, color: Utils.colorFromHex(controller.posMenu.value == 2 ?ColorCode.bluePrimary:ColorCode.darkBlue)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: ()=>controller.changePosMenu(3),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        controller.posMenu.value == 3 ? ImageConstant.ic_profile_active:ImageConstant.ic_profile_inactive,
                        semanticsLabel: 'profile',
                      ),
                      SizedBox(height: 7),
                      TextMeta('Profil', size: 12, weight: FontWeight.w500, color: Utils.colorFromHex(controller.posMenu.value == 3 ?ColorCode.bluePrimary:ColorCode.darkBlue)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
