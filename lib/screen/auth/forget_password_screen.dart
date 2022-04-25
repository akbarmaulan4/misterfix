import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/controller/auth/auth_controller.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  AuthController controller = AuthController();
  FocusNode _focusOldPass = FocusNode();
  FocusNode _focusPass = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusPass.addListener(() {
      controller.changeFocusPass(_focusPass.hasFocus);
    });
    _focusOldPass.addListener(() {
      controller.changeFocusOldPass(_focusOldPass.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('Forget Password', size: 16, weight: FontWeight.w500),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: Colors.white)
          )
        ],
      ),
      body: Obx(()=>Container(
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
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              textFieldLogin(
                  label: 'Old Password',
                  ctr: controller.edtOldPassword,
                  focusNode: _focusOldPass,
                  obscure: controller.showOldPass.value ? false:true,
                  suffixIcon: Icon((!controller.focusOldPass.value && !controller.showOldPass.value) ? Icons.lock : controller.showOldPass.value ? CupertinoIcons.eye:CupertinoIcons.eye_slash, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                  onCLickSuffix: ()=>controller.showOldPassword(!controller.showOldPass.value),
                  messageApi: controller.msgErrorOldPass.value,
                  onChanged: (val){
                    if(val.length > 0){
                      controller.isOldPassTyping(true);
                      controller.isEnableForget();
                    }else{
                      controller.isOldPassTyping(false);
                    }
                  }
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
                      controller.isEnableForget();
                    }else{
                      controller.isPassTyping(false);
                    }
                  }
              ),
              SizedBox(height: size.height * 0.05),
              InkWell(
                onTap: (){
                  if(controller.enableForget.value){
                    controller.postChangePassword(context, (){
                      DialogConstant.messageInfo(
                          context: context,
                          title: 'Informasi',
                          message: 'Password anda telah berhasil dirubah, silahkan login',
                          onClose: ()=>Navigator.of(context).pop()
                      );
                    });;
                  }
                },
                child: Container(
                  decoration: ConstantStyle.boxButton(radius: 25, color: controller.enableForget.value ? Utils.colorFromHex(ColorCode.bluePrimary):Colors.grey.shade300),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: size.width * 0.45,
                  child: Center(
                    child: TextMeta('Kirim', size: 16, weight: FontWeight.w500, color: controller.enableForget.value ? Colors.white:Utils.colorFromHex(ColorCode.greyPrimary)),
                  ),
                ),
              ),
            ],
          ),
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
        if(label == 'Old Password' && v!.length < 8){
          return 'Old Password tidak boleh kurang dari 8 karakter';
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
}
