import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/controller/unit/unit_controller.dart';
import 'package:misterfix/model/unit/field/field_model.dart';
import 'package:misterfix/model/unit/field/section_field_model.dart';
import 'package:misterfix/screen/main/unit/qr_code_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/common/button_mrfix_widget.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/unit/new_field_unit_widget.dart';
import 'package:misterfix/widget/unit/unit_ac_widget.dart';
import 'package:misterfix/widget/unit/unit_electrical_widget.dart';
import 'package:misterfix/widget/unit/unit_info_corporate_widget.dart';
import 'package:misterfix/widget/unit/unit_info_personal_widget.dart';
import 'package:misterfix/widget/unit/unit_tab_widget.dart';

class UnitInformationScreen extends StatefulWidget {
  @override
  _UnitInformationScreenState createState() => _UnitInformationScreenState();
}

class _UnitInformationScreenState extends State<UnitInformationScreen> {

  UnitController controller = Get.put(UnitController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCategoryService();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: ConstantStyle.boxRadiusOnly(
              topRight: 10,topLeft: 10,
              color: Colors.white
          ),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Obx(()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    UnitTabWidget(label: 'Personal', color: controller.tabInfo.value == 0 ? Utils.colorFromHex(ColorCode.bgBluePrimary):Colors.grey.shade300,
                        textColor: controller.tabInfo.value == 0 ? Utils.colorFromHex(ColorCode.bluePrimary):Colors.black87, onClick: ()=>controller.changeTabInfo(0)),
                    SizedBox(width: 10),
                    UnitTabWidget(label: 'Perusahaan', color: controller.tabInfo.value == 1 ? Utils.colorFromHex(ColorCode.bgBluePrimary):Colors.grey.shade300,
                        textColor: controller.tabInfo.value == 1 ? Utils.colorFromHex(ColorCode.bluePrimary):Colors.black87, onClick: ()=>controller.changeTabInfo(1))
                  ],
                ),
                SizedBox(height: 20),
                TextMeta('Informasi Pelanggan', size: 16, weight: FontWeight.w400, color: Colors.black87),
                SizedBox(height: 25),
                controller.tabInfo.value == 0 ? UnitInfoPersonalWidget() : UnitInfoCorporateWidget(),
                SizedBox(height: 30),
                TextMeta('Informasi Unit', size: 16, weight: FontWeight.w400, color: Colors.black87),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.dataCategory.asMap().map((index, value) => MapEntry(index, UnitTabWidget(
                      label: value.name,
                      color: controller.tabInfoUnit.value == value.name ? Utils.colorFromHex(ColorCode.bgBluePrimary):Colors.grey.shade300,
                      textColor: controller.tabInfoUnit.value == value.name ? Utils.colorFromHex(ColorCode.bluePrimary):Colors.black87,
                      onClick: (){
                        controller.changeTabInfoUnit(value);
                        controller.getFieldService(value.id.toString());
                      },
                  ))).values.toList(),
                ),
                SizedBox(height: 25),
                controller.dataSection.length > 0 ? Column(
                  children: controller.dataSection.map((element) => loadSection(element)).toList(),
                ):SizedBox(),
                controller.dataSection.length > 0 ? sectionManual():SizedBox(),
                SizedBox(height: 25),
                ButtonMrFixWidget(
                  label: 'Simpan', 
                  color: Utils.colorFromHex(ColorCode.bgBluePrimary), 
                  textColor: Utils.colorFromHex(ColorCode.bluePrimary),
                  onClick: (){
                    if(controller.tabInfo.value == 0 ){
                      controller.createUnit(
                          context: context,
                          onSuccess: (data){
                            Get.to(()=>QrCodeScreen(data: data));
                          }
                      );
                    }else{
                      controller.createUnitCorporate(
                          context: context,
                          onSuccess: (data){
                            Get.to(()=>QrCodeScreen(data: data));
                          }
                      );
                    }

                  },
                  // onClick: ()=>,
                ),
                SizedBox(height: 10),
                ButtonMrFixWidget(
                  label: 'Batal', color: Colors.grey.shade300,
                  onClick: ()=>Get.back(),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget loadSection(SectionFieldModel data){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMeta(data.name, size: 16, weight: FontWeight.w400, color: Colors.black87),
          SizedBox(height: 10),
          Column(
            children: data.values.map((element) => Container(
              margin: EdgeInsets.only(bottom: 10),
              child: NewFieldUnitWidget(
                  label: element.name,
                  data: element.values,
                  onSuggestionSelected: (val){
                    FocusScope.of(context).requestFocus(FocusNode());
                    controller.insertField(val);
                  }
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  sectionManual(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            controller: controller.edtTglPasang,
            // keyboardType: TextInputType.emailAddress,
            readOnly: true,
            onTap: ()=>controller.openDatePicker(context, controller.edtTglPasang),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'Tanggal Pemasangan',
                labelText: 'Tanggal Pemasangan',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                suffixIcon: Icon(Icons.calendar_today, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            controller: controller.edtCatatan,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'Catatan',
                labelText: 'Catatan',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
        ],
      ),
    );
  }

  infoUnitView(String pos){
    switch(pos){
      case 'Air-conditioning':
        return UnitACWidget();
      case 'Electrician':
        return UnitElectricalWidget();
      case 'Plumbing':
        return UnitElectricalWidget();
      default:return SizedBox();
    }
  }
}
