import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/controller/unit/unit_controller.dart';
import 'package:misterfix/screen/main/maps/map_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:misterfix/widget/unit/field_unit_widget.dart';
import 'package:misterfix/widget/unit/unit_tab_widget.dart';

class UnitInfoCorporateWidget extends StatefulWidget {
  @override
  _UnitInfoCorporateWidgetState createState() => _UnitInfoCorporateWidgetState();
}

class _UnitInfoCorporateWidgetState extends State<UnitInfoCorporateWidget> {

  UnitController controller = Get.put(UnitController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCorplUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FieldUnitWidget(
              type: 'customer',
              label: 'Nama Perusahaan',
              controller: controller.edtNamaPerusahaan,
              data: controller.dataPerusahaan.value,
              onSuggestionSelected: (val){
                if(val == null){
                  showCreateCorporate(context);
                  controller.edtNamaPerusahaan.text = '';
                }else if(val.id == 1988){
                  showCreateCorporate(context);
                  controller.edtNamaPerusahaan.text = '';
                }else{
                  controller.getLokasiByCustomer(context, val.id, 'corporate');
                  controller.setPersonalCorp(val);
                }
              }
          ),
          SizedBox(height: 10),
          FieldUnitWidget(
              type: 'location',
              label: 'Pilih Lokasi / Cabang',
              data: controller.dataAlamatCorporate.value,
              controller: controller.edtCabang,
              onSuggestionSelected: (val){
                if(val == null){
                  showCreateAddress(context);
                  controller.edtCabang.text = '';
                }else if(val.id == 1989){
                  showCreateAddress(context);
                  controller.edtCabang.text = '';
                }else{
                  controller.setAlamatCorporate(context, val);
                }
              }
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            controller: controller.edtAlamatPerusahaan,
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
                // suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          FieldUnitWidget(
              type: 'pic',
              label: 'PIC',
              data: controller.dataPIC.value,
              controller: controller.edtPIC,
              onSuggestionSelected: (val){
                if(val == null){
                  showCreatePIC(context);
                  controller.edtPIC.text = '';
                }else if(val.id == 1990){
                  showCreatePIC(context);
                  controller.edtPIC.text = '';
                }else{
                  controller.setPICCorporate(val);
                }
              }
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            controller: controller.edtTlpPIC,
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
                // suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
        ],
      ),
    );
  }

  showCreateCorporate(BuildContext context){
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
                        TextMeta('Tambah Perusahaan', size: 16, weight: FontWeight.w600, color: Colors.black87),
                        SizedBox(height: 15),
                        TextField(
                          // focusNode: _focusEmail,
                          controller: controller.edtNamaPerusahaan,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'Nama Perusahaan',
                              labelText: 'Nama Perusahaan',
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
                                onClick: ()=>controller.createCorplUser(
                                    context: context,
                                    name: controller.edtNamaPerusahaan.text,
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
                          controller: controller.edtCabang,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'Nama Cabang',
                              labelText: 'Nama Cabang',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: controller.edtAlamatPerusahaan,
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
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: ()=>Get.to(()=>MapScreen())!.then((value){
                            if(value != null){
                              controller.edtAlamatPerusahaan.text = value['address'];
                              controller.changeLatLonCorp(value['location'].latitude, value['location'].longitude);
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
                                  if(controller.dataCorp.value.id > 0){
                                    controller.createCorporateLocation(
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

  showCreatePIC(BuildContext context){
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
                          controller: controller.edtPIC,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'Nama PIC',
                              labelText: 'Nama PIC',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: controller.edtTlpPIC,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                              fillColor: Colors.white,
                              hintText: 'No Telfon',
                              labelText: 'No Telfon',
                              labelStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Utils.colorFromHex(ColorCode.greyPrimary)
                              ),
                              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
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
                                  if(controller.corpAddress.value.id > 0){
                                    controller.createPICCorp(
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
