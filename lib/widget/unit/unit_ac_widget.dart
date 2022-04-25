import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/controller/unit/unit_controller.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/unit/field_unit_widget.dart';
import 'package:misterfix/widget/unit/unit_tab_widget.dart';

class UnitACWidget extends StatefulWidget {
  @override
  _UnitACWidgetState createState() => _UnitACWidgetState();
}

class _UnitACWidgetState extends State<UnitACWidget> {

  UnitController controller = UnitController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextMeta('Lokasi Unit', size: 12, weight: FontWeight.w400, color: Colors.black87),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'Nama Gedung',
                controller: controller.edtGedung,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'Gedung');
                    controller.edtGedung.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'Gedung');
                    controller.edtGedung.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'Lantai',
                controller: controller.edtLantai,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'Lantai');
                    controller.edtLantai.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'Lantai');
                    controller.edtLantai.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'Nama Bangunan',
                controller: controller.edtNamaBangunan,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'Bangunan');
                    controller.edtNamaBangunan.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'Bangunan');
                    controller.edtNamaBangunan.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
            SizedBox(height: 25),
            TextMeta('Informasi Unit', size: 12, weight: FontWeight.w400, color: Colors.black87),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'Tipe AC',
                controller: controller.edtTipeAC,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'Tipe AC');
                    controller.edtTipeAC.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'Tipe AC');
                    controller.edtTipeAC.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'Merk',
                controller: controller.edtMerkAC,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'Merk');
                    controller.edtMerkAC.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'Merk');
                    controller.edtMerkAC.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'PK',
                controller: controller.edtPK,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'PK');
                    controller.edtPK.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'PK');
                    controller.edtPK.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
            SizedBox(height: 10),
            FieldUnitWidget(
                type: 'building',
                label: 'Freon Tipe',
                controller: controller.edtFreonTIpe,
                data: controller.dataGedung.value,
                onSuggestionSelected: (val){
                  if(val == null){
                    showCreateBuilding(context, 'Freon Tipe');
                    controller.edtFreonTIpe.text = '';
                  }else if(val.id == 1988){
                    showCreateBuilding(context, 'Freon Tipe');
                    controller.edtFreonTIpe.text = '';
                  }else{
                    // controller.getLokasiByCustomer(context, val.id);
                    // controller.setPersonalUser(val);
                  }
                }
            ),
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
      ),
    );
  }

  showCreateBuilding(BuildContext context, String label){
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  // alignment: WrapAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        TextMeta('Tambah ${label}', size: 16, weight: FontWeight.w600, color: Colors.black87),
                        SizedBox(height: 15),
                        TextField(
                          // focusNode: _focusEmail,
                          controller: controller.edtGedung,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'Nama ${label}',
                              labelText: 'Nama ${label}',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                          ),
                          // onChanged: (val)=> controller.isEnableLogin(),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            UnitTabWidget(
                                label: 'Simpan',
                                color: Utils.colorFromHex(ColorCode.bgBluePrimary),
                                textColor: Utils.colorFromHex(ColorCode.bluePrimary),
                                onClick: (){
                                  Get.back();
                                }
                            ),
                            SizedBox(width: 10),
                            UnitTabWidget(label: 'Batal', color: Colors.grey.shade300, textColor: Colors.black87, onClick: (){
                              controller.clearTextfield();
                              Get.back();
                            })
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
