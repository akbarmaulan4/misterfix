import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/controller/unit/unit_controller.dart';
import 'package:misterfix/screen/main/maps/map_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/unit/field_unit_widget.dart';
import 'package:misterfix/widget/unit/unit_tab_widget.dart';

class UnitInfoPersonalWidget extends StatefulWidget {
  @override
  _UnitInfoPersonalWidgetState createState() => _UnitInfoPersonalWidgetState();
}

class _UnitInfoPersonalWidgetState extends State<UnitInfoPersonalWidget> {
  List data = [];
  UnitController controller = Get.put(UnitController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getPersonalUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldUnitWidget(
              type: 'customer',
              label: 'Nama Pelanggan',
              controller: controller.edtNamaPelangganView,
              data: controller.dataPelangganPersonal.value,
              onSuggestionSelected: (val){
                if(val.id == 1988){
                  showCreateCustomer(context);
                  controller.edtNamaPelangganView.text = '';
                }else{
                  controller.getLokasiByCustomer(context, val.id, 'personal');
                  controller.setPersonalUser(val);
                }
              }
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            controller: controller.edtNotlpView,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'No. Telepon',
                labelText: 'No. Telepon',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                // suffixIcon: Icon(Icons.mail_outline_rounded, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          FieldUnitWidget(
              type: 'location',
              label: 'Pilih Lokasi',
              data: controller.dataAlamatPelanggan.value,
              controller: controller.edtAlamat,
              onSuggestionSelected: (val){
                if(val == null){
                  showCreateAddress(context);
                  controller.edtAlamat.text = '';
                }else if(val.id == 1989){
                  showCreateAddress(context);
                  controller.edtAlamat.text = '';
                }else{
                  controller.setAlamatUser(val);
                  // controller.getLokasiByCustomer(context, val.id);
                  // controller.setPersonalUser(val.name, val.no_telpon);
                }
              }
          ),
        ],
      ),
    ));
  }

  showCreateCustomer(BuildContext context){
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
                        TextMeta('Tambah Customer', size: 16, weight: FontWeight.w600, color: Colors.black87),
                        SizedBox(height: 15),
                        TextField(
                          // focusNode: _focusEmail,
                          controller: controller.edtNamaPelanggan,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'Nama Pelanggan',
                              labelText: 'Nama Pelanggan',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              // suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                          ),
                          // onChanged: (val)=> controller.isEnableLogin(),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          // focusNode: _focusEmail,
                          controller: controller.edtNotlp,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'No Telepon',
                              labelText: 'No Telepon',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              // suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
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
                                onClick: ()=>controller.createPersonlUser(
                                  context: context,
                                  onSuccess: (val){

                                    Get.back();
                                  }
                                )
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

  showCreateAddress(BuildContext context){
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
                        TextMeta('Tambah Alamat', size: 16, weight: FontWeight.w600, color: Colors.black87),
                        SizedBox(height: 15),
                        TextField(
                          // focusNode: _focusEmail,
                          controller: controller.edtAlamat,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'Alamat',
                              labelText: 'Alamat',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                          ),
                          // onChanged: (val)=> controller.isEnableLogin(),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: ()=>Get.to(()=>MapScreen())!.then((value){
                            if(value != null){
                              controller.edtAlamat.text = value['address'];
                              controller.changeLatLon(value['location'].latitude, value['location'].longitude);
                            }
                          }),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.add_location_alt, color: Utils.colorFromHex(ColorCode.bluePrimary)),
                                SizedBox(width: 10),
                                TextMeta('Pilih lokasi di Map', size: 14, weight: FontWeight.w500, color:Utils.colorFromHex(ColorCode.bluePrimary)),
                              ],
                            ),
                          ),
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
                                  if(controller.personalUser.value.id > 0){
                                    controller.createPersonalLocation(
                                        context: context,
                                        onSuccess: (val){}
                                    );
                                  }
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
