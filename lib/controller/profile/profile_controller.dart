
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/model/profile/profile_model.dart';
import 'package:misterfix/widget/common/field_mask.dart';

class ProfileController extends GetxController{

  Rx<ProfileModel> dataProfile = ProfileModel().obs;
  Rx<File> fileImage = File('').obs;
  RxList<String> dataKeahlian = <String>[].obs;
  RxString strBirtDate = ''.obs;

  RxString strGender = ''.obs;

  TextEditingController edtName = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtPhone = MaskedTextController(mask: '000 0000 00000');
  TextEditingController edtKeahlian = TextEditingController();
  TextEditingController edtAbout = TextEditingController();

  initEditProfile(){
    edtName.text = dataProfile.value.name;
    edtEmail.text = dataProfile.value.email;
    edtPhone.text = dataProfile.value.telpon;
    edtAbout.text = dataProfile.value.desc;
    dataKeahlian.value = dataProfile.value.expertize;
    if(dataProfile.value.expertize.length > 0){
      edtKeahlian.text = dataProfile.value.expertize[0];
    }
    // strBirtDate.value = dataProfile.value.
    strGender.value = dataProfile.value.jenis_kelamin;
  }


  addKeahlian(String val){
    List<String> data = [];
    data.addAll(dataKeahlian.value);
    data.add(val);
    dataKeahlian.value = data;
  }

  removeKeahlian(String val){
    List<String> data = dataKeahlian.value;
    data.remove(val);
    dataKeahlian.value = data;
  }

  changeImage(File val){
    fileImage.value = val;
  }

  getProfile(BuildContext context) async {
    // DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.getProfile((result, error) {
      // Get.back();
      if(error != null){
      }
      if(result != null){
        ProfileModel profileModel = ProfileModel.fromJson(result['data']);
        dataProfile.value = profileModel;
      }
    });
  }
}