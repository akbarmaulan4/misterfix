import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class UnitElectricalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextMeta('Informasi Unit', size: 12, weight: FontWeight.w400, color: Colors.black87),
            SizedBox(height: 10),
            TextField(
              // focusNode: _focusEmail,
              // controller: controller.edtEmail,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                  fillColor: Colors.white,
                  hintText: 'Kategori',
                  labelText: 'Kategori',
                  labelStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Utils.colorFromHex(ColorCode.greyPrimary)
                  ),
                  suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                  contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
              ),
              // onChanged: (val)=> controller.isEnableLogin(),
            ),
            SizedBox(height: 10),
            TextField(
              // focusNode: _focusEmail,
              // controller: controller.edtEmail,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                  fillColor: Colors.white,
                  hintText: 'Varian',
                  labelText: 'Varian',
                  labelStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Utils.colorFromHex(ColorCode.greyPrimary)
                  ),
                  suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                  contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
              ),
              // onChanged: (val)=> controller.isEnableLogin(),
            ),

            SizedBox(height: 10),
            TextField(
              // focusNode: _focusEmail,
              // controller: controller.edtEmail,
              // keyboardType: TextInputType.emailAddress,
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
                  contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
              ),
              // onChanged: (val)=> controller.isEnableLogin(),
            ),
            SizedBox(height: 10),
            TextMeta('catatan bisa ditambahkan perihal, lokasi / kondisi / detail informasi unit', size: 12, weight: FontWeight.w400, color: Colors.black87, maxLines: 5,),
          ],
        ),
      ),
    );
  }
}
