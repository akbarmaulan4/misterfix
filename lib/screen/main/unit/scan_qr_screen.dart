import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/unit/unit_controller.dart';
import 'package:misterfix/screen/main/unit/unit_information_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/common/button_mrfix_widget.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;
  UnitController controller = Get.put(UnitController());

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('Tambah Informasi Unit', size: 16, weight: FontWeight.w500),
      ),
      body: Container(
        color: Utils.colorFromHex(ColorCode.bluePrimary),
        padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: ConstantStyle.boxRadiusOnly(
              topRight: 10,topLeft: 10,
              color: Colors.white
          ),
          height: double.infinity,
          child: Column(
            children: [
              Container(height: 50),
              Expanded(
                flex: 3,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: scanArea),
                    onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p)
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    children: [
                      ButtonMrFixWidget(
                        label: 'Scan QR',
                        color: Utils.colorFromHex(ColorCode.bgBluePrimary),
                        textColor: Utils.colorFromHex(ColorCode.bluePrimary),
                        onClick: (){
                        },
                        // onClick: ()=>,
                      ),
                      SizedBox(height: 10),
                      ButtonMrFixWidget(
                        label: 'Daftar Manual',
                        color: Utils.colorFromHex(ColorCode.bluePrimary),
                        textColor: Colors.white,
                        onClick: ()=>Get.off(()=>UnitInformationScreen()),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData != null){
        if(this.controller.successGetApiQR.value == false){
          this.controller.successGetApiQR.value = true;
          this.controller.strQRCode.value = scanData.code!;
          Get.to(()=>UnitInformationScreen())!.then((value){
            this.controller.successGetApiQR.value = false;
          });
          // this.controller.getScanQR(context: context, code: scanData.code!, onSuccess: (){
          //   this.controller.successGetApiQR.value = false;
          //   Get.to(()=>UnitInformationScreen());
          // });
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
