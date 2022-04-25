import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/controller/auth/auth_controller.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  AuthController controller = AuthController();
  FocusNode _focusName = FocusNode();
  FocusNode _focusEmail = FocusNode();
  FocusNode _focusPhone = FocusNode();
  FocusNode _focusPass = FocusNode();
  FocusNode _focusConfPass = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusName.addListener(() {onNameFocus(_focusEmail.hasFocus);});
    _focusEmail.addListener(() {onEmailFocus(_focusEmail.hasFocus);});
    _focusPhone.addListener(() {onPhoneFocus(_focusPhone.hasFocus);});
    _focusPass.addListener(() {onPassFocus(_focusPass.hasFocus);});
    _focusConfPass.addListener(() {onConfPassFocus(_focusConfPass.hasFocus);});
  }

  onNameFocus(val){
    controller.changeFocusName(val);
  }
  onEmailFocus(val){
    controller.changeFocusEmail(val);
  }
  onPhoneFocus(val){
    controller.changeFocusPhone(val);
  }
  onPassFocus(val){
    controller.changeFocusPass(val);
  }
  onConfPassFocus(val){
    controller.changeFocusConfPass(val);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(()=>SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  header(),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        TextMeta('Register to continue', size: 22, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                        SizedBox(height: size.height * 0.05),
                        textFieldLogin(
                            label: 'Name',
                            ctr: controller.edtName,
                            focusNode: _focusName,
                            suffixIcon: Icon(Icons.person, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                            messageApi: controller.msgErrorName.value,
                            onChanged: (val)=>controller.isEnableRegister()
                        ),
                        SizedBox(height: size.height * 0.03),
                        textFieldLogin(
                            label: 'Email',
                            ctr: controller.edtEmail,
                            inputType: TextInputType.emailAddress,
                            focusNode: _focusEmail,
                            suffixIcon: Icon(Icons.mail_outline_rounded, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                            messageApi: controller.msgErrorEmail.value,
                            onChanged: (val)=>controller.isEnableRegister()
                        ),
                        SizedBox(height: size.height * 0.03),
                        textFieldLogin(
                            label: 'Mobile Phone',
                            ctr: controller.edtPhone,
                            inputType: TextInputType.phone,
                            focusNode: _focusPhone,
                            suffixIcon: Icon(Icons.phone_android_rounded, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                            messageApi: controller.msgErrorPhone.value,
                            onChanged: (val)=>controller.isEnableRegister()
                        ),
                        SizedBox(height: size.height * 0.03),
                        textFieldLogin(
                            label: 'Password',
                            ctr: controller.edtPassword,
                            focusNode: _focusPass,
                            obscure: controller.showPass.value ? false:true,
                            suffixIcon: Icon((!controller.focusPass.value && !controller.showPass.value) ? Icons.lock : controller.showPass.value ? CupertinoIcons.eye:CupertinoIcons.eye_slash, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                            onCLickSuffix: ()=>controller.showPassword(!controller.showPass.value),
                            messageApi: controller.msgErrorPass.value,
                            onChanged: (val){
                              if(val.length > 0){
                                controller.isPassTyping(true);
                                controller.isEnableRegister();
                              }else{
                                controller.isPassTyping(false);
                              }
                            }
                        ),
                        SizedBox(height: size.height * 0.03),
                        textFieldLogin(
                            label: 'Confirm Password',
                            ctr: controller.edtConfirmPassword,
                            focusNode: _focusConfPass,
                            obscure: controller.showConfPass.value ? false:true,
                            suffixIcon: Icon((!controller.focusConfPass.value && !controller.showConfPass.value) ? Icons.lock : controller.showConfPass.value ? CupertinoIcons.eye:CupertinoIcons.eye_slash, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                            onCLickSuffix: ()=>controller.showConfPassword(!controller.showConfPass.value),
                            messageApi: controller.msgErrorConfPass.value,
                            onChanged: (val){
                              if(val.length > 0){
                                controller.isConfPassTyping(true);
                                controller.isEnableRegister();
                              }else{
                                controller.isConfPassTyping(false);
                              }
                            }
                        ),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if(controller.enableRegister.value){
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.postRegister(context, (){
                          DialogConstant.messageInfo(
                              context: context,
                              title: 'Informasi',
                              message: 'Register Berhasil',
                              onClose: ()=>Navigator.of(context).pop()
                          );
                        });
                      }
                    },
                    child: Container(
                      decoration: ConstantStyle.boxButton(radius: 25, color: controller.enableRegister.value ? Utils.colorFromHex(ColorCode.bluePrimary):Colors.grey.shade300),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      width: size.width * 0.45,
                      child: Center(
                        child: TextMeta('Register', size: 16, weight: FontWeight.w500, color: controller.enableRegister.value ? Colors.white:Utils.colorFromHex(ColorCode.greyPrimary)),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  TextMeta('or login with', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageConstant.ic_fb_login,
                        semanticsLabel: 'logo',
                        height: 26,
                        width: 26,
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset(
                          ImageConstant.ic_google_login,
                          semanticsLabel: 'logo',
                          height: 26,
                          width: 26
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextMeta('Sudah Punya akun? ', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                InkWell(
                    onTap: ()=>Navigator.of(context).pop(),
                    child: TextMeta('Login', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.bluePrimary),)
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      )),
    );
  }

  Widget textFieldLogin({
    String? label,
    TextEditingController? ctr,
    TextInputType? inputType,
    Function? onChanged,
    FocusNode? focusNode,
    String? messageApi,
    Widget? suffixIcon,
    Function? onCLickSuffix,
    bool? obscure = true,
    bool focused = false,
  }) {
    return TextFormField(
      maxLines: inputType == TextInputType.multiline ? 4 : 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // inputFormatters: [
      //   if (label == "Nomor KTP" || label == "Nomor KTP Pasangan" || label == "Nomor KTP Penjamin")
      //     CreditCardFormatter(),
      //   if(label.contains('NPWP'))
      //     controller.npwpFormat,
      //   if(label == 'RT' || label == 'RW')
      //     LengthLimitingTextInputFormatter(3),
      //   if(label == 'Kode Pos')
      //     LengthLimitingTextInputFormatter(6)
      // ],
      validator: (v) {
        if(label == 'Email'){
          if (v!.isEmpty) return 'Email tidak boleh kosong!';
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = new RegExp(pattern);
          controller.formatEmailValid.value = regex.hasMatch(v);
          if (!regex.hasMatch(v)) return 'Email tidak valid!';
          return null;
        }
        if(label == 'Password' && v!.length < 8){
          return 'Password tidak boleh kurang dari 8 karakter';
        }
        if(label == 'Confirm Password' && v!.length < 8){
          return 'Password tidak boleh kurang dari 8 karakter';
        }
        if(messageApi != '') return messageApi;
      },
      controller: ctr,
      onChanged: (v)=> onChanged!(v),
      focusNode: focusNode,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: label == "Catatan Data Diri" || label == "Catatan Domisili" ? EdgeInsets.symmetric(horizontal: 15, vertical: 15) : EdgeInsets.symmetric(horizontal: 15),
        errorText: messageApi == '' ? null : messageApi,
        errorStyle: TextStyle(color: Colors.red),
        labelText: label,
        suffixIcon: InkWell(
          onTap: ()=>onCLickSuffix!(),
          child: suffixIcon,
        ),
        labelStyle: TextStyle(fontSize: 14, color: focused ? Utils.colorFromHex(ColorCode.bluePrimary) : Utils.colorFromHex(ColorCode.greyPrimary),),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.greyPrimary), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      obscureText: label!.contains('Password') ? obscure! : false,
    );
  }

  header(){
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.20,
      decoration: ConstantStyle.boxRadiusOnly(
          color: Colors.lightBlueAccent,
          bottomLeft: 50,
          bottomRight: 50
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.05),
          TextMeta('Welcome to', size: 14, weight: FontWeight.w400,),
          SizedBox(height: 10),
          Container(
            height: 24,
            child: SvgPicture.asset(
              ImageConstant.logoMrFixWhite2,
              semanticsLabel: 'logo',
            ),
          )
        ],
      ),
    );
  }
}
