
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/model/auth/user_model.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:misterfix/utils/local_data.dart';

class AuthController extends GetxController{

  Rx<UserModel> dataUser = UserModel().obs;
  RxBool focusName = false.obs;
  RxBool focusEmail = false.obs;
  RxBool focusPhone = false.obs;
  RxBool focusPass = false.obs;
  RxBool focusConfPass = false.obs;
  RxBool focusOldPass = false.obs;
  RxBool passTyping = false.obs;
  RxBool confPassTyping = false.obs;
  RxBool oldPassTyping = false.obs;
  RxBool showPass = false.obs;
  RxBool showConfPass = false.obs;
  RxBool showOldPass = false.obs;
  RxBool formatEmailValid = false.obs;

  RxBool rememberMe = false.obs;
  RxBool enableLogin = false.obs;
  RxBool enableRegister = false.obs;
  RxBool enableForget = false.obs;
  RxBool enableReset = false.obs;

  RxString msgErrorName = ''.obs;
  RxString msgErrorEmail = ''.obs;
  RxString msgErrorPhone = ''.obs;
  RxString msgErrorPass = ''.obs;
  RxString msgErrorConfPass = ''.obs;
  RxString msgErrorOldPass = ''.obs;

  TextEditingController edtName = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtEmailForget = TextEditingController();
  TextEditingController edtPassword = TextEditingController();
  TextEditingController edtConfirmPassword = TextEditingController();
  TextEditingController edtOldPassword = TextEditingController();
  TextEditingController edtPhone = TextEditingController();

  changeFocusName(bool val){
    focusName.value = val;
  }
  changeFocusEmail(bool val){
    focusEmail.value = val;
  }
  changeFocusPhone(bool val){
    focusPhone.value = val;
  }
  changeFocusPass(bool val){
    focusPass.value = val;
  }
  changeFocusConfPass(bool val){
    focusConfPass.value = val;
  }
  changeFocusOldPass(bool val){
    focusOldPass.value = val;
  }
  isPassTyping(bool val){
    passTyping.value = val;
  }
  isConfPassTyping(bool val){
    confPassTyping.value = val;
  }
  isOldPassTyping(bool val){
    oldPassTyping.value = val;
  }
  showPassword(bool val){
    showPass.value = val;
  }
  showConfPassword(bool val){
    showConfPass.value = val;
  }
  showOldPassword(bool val){
    showOldPass.value = val;
  }
  isRemember(bool val){
    LocalData.saveRemember(val);
    rememberMe.value = val;
  }

  isEnableForget(){
    if(edtOldPassword.text.length > 0 &&
        edtPassword.text.length > 0){
      enableForget.value = true;
    }else{
      enableForget.value = false;
    }
    if(edtPassword.text.isNotEmpty && edtPassword.text.length < 8){
      enableForget.value = false;
    }else if(edtOldPassword.text.isNotEmpty && edtOldPassword.text.length < 8){
      enableForget.value = false;
    }
  }

  isEnableReset(){
    if(edtOldPassword.text.length > 0 &&
        edtPassword.text.length > 0){
      enableReset.value = true;
    }else{
      enableReset.value = false;
    }
    if(edtPassword.text.isNotEmpty && edtPassword.text.length < 8){
      enableReset.value = false;
    }else if(edtOldPassword.text.isNotEmpty && edtOldPassword.text.length < 8){
      enableReset.value = false;
    }
  }

  isEnableLogin(){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    formatEmailValid.value = regex.hasMatch(edtEmail.text);
    if(edtEmail.text.length > 0 &&
        edtPassword.text.length > 0 &&
        formatEmailValid.value){
      enableLogin.value = true;
    }else if(regex.hasMatch(edtEmail.text)){
      enableLogin.value = false;
    }else if(edtPassword.text.isNotEmpty && edtPassword.text.length < 8){
      enableLogin.value = false;
    }else{
      enableLogin.value = false;
    }
  }

  isEnableRegister(){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    formatEmailValid.value = regex.hasMatch(edtEmail.text);
    if(edtName.text.length > 0 &&
        edtEmail.text.length > 0 &&
        edtPhone.text.length > 0 &&
        edtPassword.text.length > 0 &&
        edtConfirmPassword.text.length > 0 &&
        formatEmailValid.value
    ){
      enableRegister.value = true;
    }else{
      enableRegister.value = false;
    }
    if(edtPassword.text.isNotEmpty && edtPassword.text.length < 8){
      enableRegister.value = false;
    }else if(edtConfirmPassword.text.isNotEmpty && edtConfirmPassword.text.length < 8){
      enableRegister.value = false;
    }else if(edtPassword.text != edtConfirmPassword.text){
      enableRegister.value = false;
    }
  }

  postRegister(BuildContext context, Function onSuccess) async {
    DialogConstant.loading(context, 'Mohon tunggu...');
    NewAPI.postRegister(edtName.text, edtEmail.text, edtPhone.text, edtPassword.text, (result, error) {
      Navigator.of(context).pop();
      if(error != null){
        try{
          DialogConstant.messageAlert(
            context: context,
            title: 'Peringatan',
            message: error['message'],
          );
        }catch(e){
          if(error['message']['name'] != null){
            msgErrorName.value = error['message']['name'][0];
          }else if(error['message']['email'] != null){
            msgErrorEmail.value = error['message']['email'][0];
          }else if(error['message']['telpon'] != null){
            msgErrorPhone.value = error['message']['telpon'][0];
          }else if(error['message']['password'] != null){
            msgErrorPass.value = error['message']['password'][0];
          }
        }
      }
      if(result != null){
        onSuccess();
      }
    });
  }

  postLogin(BuildContext context, Function onSuccess){
    DialogConstant.loading(context, 'Mohon tunggu...');
    NewAPI.postLogin( edtEmail.text, edtPassword.text, (result, error) {
      Navigator.of(context).pop();
      if(error != null){
        try{
          DialogConstant.messageAlert(
            context: context,
            title: 'Peringatan',
            message: error['message'],
          );
        }catch(e){
          if(error['message']['email'] != null){
            msgErrorEmail.value = error['message']['email'][0];
          }else if(error['message']['password'] != null){
            msgErrorPass.value = error['message']['password'][0];
          }
        }

      }
      if(result != null){
        LocalData.saveToken(result['data']['token']);
        UserModel user = UserModel.fromJson(result['data']['user']);
        if(user != null){
          LocalData.saveUser(user);
        }
        onSuccess();
      }
    });
  }

  postChangePassword(BuildContext context, Function onSuccess){
    DialogConstant.loading(context, 'Mohon tunggu...');
    NewAPI.postChangePassword( edtOldPassword.text, edtPassword.text, (result, error) {
      Navigator.of(context).pop();
      if(error != null){
        DialogConstant.messageAlert(
            context: context,
            title: 'Peringatan',
            message: error['message'],
        );
        // if(error['message']['email'] != null){
        //   msgErrorEmail.value = error['message']['email'][0];
        // }else if(error['message']['password'] != null){
        //   msgErrorPass.value = error['message']['password'][0];
        // }
      }
      if(result != null){
        // LocalData.saveToken(result['data']['token']);
        // UserModel user = UserModel.fromJson(result['data']['user']);
        // if(user != null){
        //   LocalData.saveUser(user);
        // }
        onSuccess();
      }
    });
  }

  postForgetPassword(BuildContext context, String email, Function onSuccess, Function onError){
    DialogConstant.loading(context, 'Mohon tunggu...');
    NewAPI.postForgetPasswordEmail(email, (result, error) {
      Get.back();
      if(error != null){
        onError(error['message']);
      }
      if(result != null){
        onSuccess();
      }
    });
  }

  getDataLogin() async {
    UserModel? data = await LocalData.getUser();
    if(data != null){
      dataUser.value = data;
    }
  }
}