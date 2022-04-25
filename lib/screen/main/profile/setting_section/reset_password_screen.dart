import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('Reset Password', size: 16, weight: FontWeight.w500),
      ),
      body: Column(
        children: [
          Container(
            color: Utils.colorFromHex(ColorCode.bluePrimary),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            width: double.infinity,
            child: Column(
              children: [
                TextMeta('RESET PASSWORD', size: 18, weight: FontWeight.w900),
                SizedBox(height: 10),
                TextMeta('Apakah anda yakin akan mengubah Password !!!', size: 14, weight: FontWeight.w500, textAlign: TextAlign.center,)
              ],
            ),
          ),
          Expanded(child: Container(
            color: Utils.colorFromHex(ColorCode.bluePrimary),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: ConstantStyle.boxRadiusOnly(
                  topRight: 10,topLeft: 10,
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    TextField(
                      // focusNode: _focusEmail,
                      // controller: controller.edtEmail,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          fillColor: Colors.white,
                          hintText: 'Password Lama',
                          labelText: 'Password Lama',
                          labelStyle: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Utils.colorFromHex(ColorCode.bluePrimary)
                          ),
                          suffixIcon: Icon(Icons.lock, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                          contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                      ),
                      // onChanged: (val)=> controller.isEnableLogin(),
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextField(
                      // focusNode: _focusPass,
                      // controller: controller.edtPassword,
                      // obscureText: controller.showPass.value ? false:true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          fillColor: Colors.white,
                          hintText: 'Password Baru',
                          labelText: 'Password Baru',
                          labelStyle: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Utils.colorFromHex(ColorCode.bluePrimary)
                          ),
                          suffixIcon: InkWell(
                              onTap: (){
                                // controller.showPassword(!controller.showPass.value);
                              },
                              child: Icon(Icons.lock, color: Utils.colorFromHex(ColorCode.greyPrimary))
                          ),
                          contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                      ),
                      // onChanged: (val){
                      //   if(val.length > 0){
                      //     controller.isPassTyping(true);
                      //     controller.isEnableLogin();
                      //   }else{
                      //     controller.isPassTyping(false);
                      //   }
                      // },
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextField(
                      // focusNode: _focusPass,
                      // controller: controller.edtPassword,
                      // obscureText: controller.showPass.value ? false:true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          fillColor: Colors.white,
                          hintText: 'Confirm Password Baru',
                          labelText: 'Confirm Password Baru',
                          labelStyle: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Utils.colorFromHex(ColorCode.bluePrimary)
                          ),
                          suffixIcon: InkWell(
                              onTap: (){
                                // controller.showPassword(!controller.showPass.value);
                              },
                              child: Icon(Icons.lock, color: Utils.colorFromHex(ColorCode.greyPrimary))
                          ),
                          // errorText: 'Password tidak sama',
                          contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
                      ),
                      // onChanged: (val){
                      //   if(val.length > 0){
                      //     controller.isPassTyping(true);
                      //     controller.isEnableLogin();
                      //   }else{
                      //     controller.isPassTyping(false);
                      //   }
                      // },
                    ),
                    SizedBox(height: size.height * 0.05),
                    InkWell(
                      // onTap: ()=>Get.off(()=>MainScreen()),
                      child: Container(
                        decoration: ConstantStyle.boxButton(radius: 25, color: Colors.grey.shade300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        child: Center(
                          child: TextMeta('Reset Password', size: 16, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

