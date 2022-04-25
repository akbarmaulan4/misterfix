import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misterfix/controller/auth/auth_controller.dart';
import 'package:misterfix/screen/auth/forget_password_screen.dart';
import 'package:misterfix/screen/auth/register_screen.dart';
import 'package:misterfix/screen/main/home/home_screen.dart';
import 'package:misterfix/screen/main/main_screen.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/utils/local_data.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController controller = AuthController();
  FocusNode _focusEmail = FocusNode();
  FocusNode _focusPass = FocusNode();

  onEmailFocus(val){
    controller.changeFocusEmail(val);
  }
  onPassFocus(val){
    controller.changeFocusPass(val);
  }

  GoogleSignIn _googleSignIn = GoogleSignIn();
  signInGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    if(googleSignInAuthentication != null){
      var email = googleSignInAccount.email;
      var name = googleSignInAccount.displayName;
      Get.off(()=>MainScreen());
    }
    return googleSignInAuthentication != null ? 'sukses':'';
  }
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleSignOut();
    setRemeber();
    _focusPass.addListener(() {onPassFocus(_focusPass.hasFocus);});
    _focusEmail.addListener(() {onEmailFocus(_focusEmail.hasFocus);});
  }

  setRemeber() async {
    var remeber = await LocalData.getRemember();
    controller.isRemember(remeber);
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>SingleChildScrollView(
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
                          TextMeta('Sign to continue', size: 22, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                          SizedBox(height: size.height * 0.05),
                          textFieldLogin(
                              label: 'Email',
                              ctr: controller.edtEmail,
                              inputType: TextInputType.emailAddress,
                              focusNode: _focusEmail,
                              suffixIcon: Icon(Icons.mail_outline_rounded, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                              messageApi: controller.msgErrorEmail.value,
                              onChanged: (val)=>controller.isEnableLogin()
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
                                  controller.isEnableLogin();
                                }else{
                                  controller.isPassTyping(false);
                                }
                              }
                          ),
                          SizedBox(height: size.height * 0.02),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 25, left: 23),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: ()=>controller.isRemember(!controller.rememberMe.value),
                              child: Icon(
                                  controller.rememberMe.value ? Icons.radio_button_on : Icons.radio_button_off,
                                  color: controller.rememberMe.value ? Utils.colorFromHex(ColorCode.bluePrimary):Utils.colorFromHex(ColorCode.greyPrimary)
                              )
                          ),
                          SizedBox(width: 8),
                          Expanded(child: TextMeta('Remember me', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),)),
                          InkWell(
                            onTap: ()=>Get.to(ForgetPasswordScreen()),
                            child: TextMeta('Forget Password?', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.bluePrimary),)
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    InkWell(
                      // onTap: ()=>Get.off(()=>MainScreen()),
                      onTap: (){
                        if(controller.enableLogin.value){
                          controller.postLogin(context, (){
                            Get.off(()=>MainScreen());
                          });;
                        }
                      },
                      child: Container(
                        decoration: ConstantStyle.boxButton(radius: 25, color: controller.enableLogin.value ? Utils.colorFromHex(ColorCode.bluePrimary):Colors.grey.shade300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        width: size.width * 0.45,
                        child: Center(
                          child: TextMeta('Login', size: 16, weight: FontWeight.w500, color: controller.enableLogin.value ? Colors.white:Utils.colorFromHex(ColorCode.greyPrimary)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    TextMeta('or login with', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                    SizedBox(height: size.height * 0.02),
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
                        InkWell(
                          onTap: ()=>signInGoogle(),
                          child: SvgPicture.asset(
                              ImageConstant.ic_google_login,
                              semanticsLabel: 'logo',
                              height: 26,
                              width: 26
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextMeta('Belum Punya akun? ', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.greyPrimary),),
                  InkWell(
                      onTap: ()=>Get.to(()=>RegisterScreen())!.then((value) => FocusScope.of(context).requestFocus(new FocusNode())),
                      child: TextMeta('Daftar', size: 14, weight: FontWeight.w400, color: Utils.colorFromHex(ColorCode.bluePrimary))
                  ),
                ],
              ),
              SizedBox(height: 20)
            ],
          ),
        )),
      ),
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
