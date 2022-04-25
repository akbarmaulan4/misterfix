import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class OrderDetailItem extends StatefulWidget {
  @override
  _OrderDetailItemState createState() => _OrderDetailItemState();
}

class _OrderDetailItemState extends State<OrderDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bgBluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Utils.colorFromHex(ColorCode.darkBlue)),
        title: new TextMeta('Order Details', size: 16, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.darkBlue),),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: new TextMeta('#ID MF0001', size: 14, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.darkBlue),)
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customerInfo(),
              SizedBox(height: 30),
              itemOrderList(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  customerInfo(){
    return Container(
      decoration: ConstantStyle.boxShadowButtonBorder(
          color: Colors.white,
          radius: 8,
          spreadRadius: 0,
          blurRadius: 5,
          colorShadow: Colors.grey.shade400,
          offset: Offset(1, 3)
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          itemCustomerInfo(label: 'Nama PIC', value: 'Bastian Besi'),
          itemCustomerInfo(label: 'No HP', value: '+62 09876543'),
          itemCustomerInfo(label: 'Alamat', value: 'Jl Raya Kedonganan No 30 Tuban Badung Bali'),
          itemCustomerInfo(label: 'Tanggal Service', value: '29 Dec 2021'),
        ],
      ),
    );
  }

  itemCustomerInfo({String? label, String? value}){
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: TextMeta(label ?? '', color: Colors.black87, size: 14, weight: FontWeight.w500,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: TextMeta(':', color: Colors.black87, size: 14,),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: TextMeta('$value', color: Colors.black87, size: 14, maxLines: 3, textAlign: TextAlign.justify, weight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  itemOrderList(){
    return Container(
      decoration: ConstantStyle.boxShadowButtonBorder(
          color: Colors.white,
          radius: 8,
          spreadRadius: 0,
          blurRadius: 5,
          colorShadow: Colors.grey.shade400,
          offset: Offset(1, 3)
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextMeta('Order 1 | Air Conditioner', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,),
              Expanded(child: Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_drop_down_sharp),
              ))
            ],
          ),
          SizedBox(height: 10),
          TextMeta('AC Split wall Samsung 2/4 PK R|22', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,),
          SizedBox(height: 5),
          TextMeta('Gedung 1, Lantai 1, Ruang 1', color: Utils.colorFromHex(ColorCode.greyPrimary), size: 14, weight: FontWeight.w400,),
          SizedBox(height: 20),
          TextMeta('Customer Note :', color: Colors.black87, size: 14, weight: FontWeight.w500,),
          SizedBox(height: 5),
          TextMeta('A Rembes, dan tidak dingin', color: Utils.colorFromHex(ColorCode.greyPrimary), size: 14, weight: FontWeight.w400,),
          SizedBox(height: 5),
          Divider(color: Utils.colorFromHex(ColorCode.greyPrimary)),
          SizedBox(height: 20),
          TextMeta('Kondisi Awal', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,),
          SizedBox(height: 20),
          TextField(
            // focusNode: _focusEmail,
            // controller: controller.edtEmail,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'Tegangan / V',
                labelText: 'Tegangan / V',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            // controller: controller.edtEmail,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'Arus / A',
                labelText: 'Arus / A',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            // controller: controller.edtEmail,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'Tekanan / Psi',
                labelText: 'Tekanan / Psi',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            // controller: controller.edtEmail,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: 'Kondisi Unit',
                labelText: 'Kondisi Unit',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 10),
          TextField(
            // focusNode: _focusEmail,
            // controller: controller.edtEmail,
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

                contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
            ),
            // onChanged: (val)=> controller.isEnableLogin(),
          ),
          SizedBox(height: 25),
          TextMeta('Service / Spare Part', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  // focusNode: _focusEmail,
                  // controller: controller.edtEmail,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                      fillColor: Colors.white,
                      hintText: 'Pilih Service',
                      labelText: 'Pilih Service',
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Utils.colorFromHex(ColorCode.greyPrimary)
                      ),
                      suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                      contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
                  ),
                  // onChanged: (val)=> controller.isEnableLogin(),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  child: TextField(
                    // focusNode: _focusEmail,
                    // controller: controller.edtEmail,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                        fillColor: Colors.white,
                        hintText: 'Jumlah',
                        labelText: 'Jumlah',
                        labelStyle: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Utils.colorFromHex(ColorCode.greyPrimary)
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                        contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
                    ),
                    // onChanged: (val)=> controller.isEnableLogin(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.ideographic,
            children: [
              Container(
                child: Icon(Icons.close, color: Utils.colorFromHex(ColorCode.errorPrimary), size: 18,)
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      child: TextMeta('#2', color: Utils.colorFromHex(ColorCode.greyPrimary), size: 14, weight: FontWeight.w500,)
                  )
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                      child: TextMeta('Cleaning AC 0.5 - 1 PK | 1 Unit', color: Utils.colorFromHex(ColorCode.greyPrimary), size: 14, weight: FontWeight.w500, maxLines: 3,)
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextMeta('RP 75.000', color: Utils.colorFromHex(ColorCode.greyPrimary), size: 14, weight: FontWeight.w500,),
                  )
              )
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Utils.colorFromHex(ColorCode.greyPrimary)),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TextMeta('Total Cost', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500, maxLines: 3,),
              Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextMeta('RP 75.000', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,),
                  )
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: ConstantStyle.boxButton(radius: 25, color: Utils.colorFromHex(ColorCode.bgBluePrimary)),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Center(child: TextMeta('Save', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,)),
              ),
              Container(
                decoration: ConstantStyle.boxButton(radius: 25, color: Colors.grey.shade300),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Center(
                  child: TextMeta('Cancel', color: Utils.colorFromHex(ColorCode.bluePrimary), size: 14, weight: FontWeight.w500,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
