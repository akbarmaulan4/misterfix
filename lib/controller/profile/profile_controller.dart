
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/model/profile/profile_model.dart';
import 'package:misterfix/model/profile/keahlian/model_item_keahlian.dart';
import 'package:misterfix/model/unit/category/category_model.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:misterfix/widget/common/field_mask.dart';

class ProfileController extends GetxController{

  Rx<ProfileModel> dataProfile = ProfileModel().obs;
  Rx<File> fileImage = File('').obs;
  RxString strBirtDate = ''.obs;
  RxList<CategoryModel> dataCategory = <CategoryModel>[].obs;
  RxList<CategoryModel> selectedKeahlian = <CategoryModel>[].obs;

  RxString strGender = ''.obs;

  TextEditingController edtName = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtPhone = TextEditingController(); //MaskedTextController(mask: '000 0000 00000');
  TextEditingController edtKeahlian = TextEditingController();
  TextEditingController edtAbout = TextEditingController();

  // List<CategoryModel> _selectedKeahlian = [];
  // List<CategoryModel> get selectedKeahlian => _selectedKeahlian;

  initEditProfile(){
    edtName.text = dataProfile.value.name;
    edtEmail.text = dataProfile.value.email;
    edtPhone.text = dataProfile.value.telpon;
    edtAbout.text = dataProfile.value.provider.detail;
    strBirtDate.value = dataProfile.value.provider.date_of_birth;
    strGender.value = dataProfile.value.jenis_kelamin;

    if(dataCategory.value.isNotEmpty){
      for(ModelItemKeahlian? model in dataProfile.value.expertize){
        var dataCat = dataCategory.value.where((element) => element.name == model!.name).first;
        if(dataCat != null){
          addKeahlian(dataCat);
        }
        // CategoryModel
      }
    }
    // dataKeahlian.value = dataProfile.value.expertize;

    // var category = (dataProfile.value.expertize as List).map((e) => e == null ? null : CategoryModel.fromJson(e as Map<String, dynamic>)).toList();
    // if(dataProfile.value.expertize.length > 0){
    //   var data = dataProfile.value.expertize[0];
    //   // var sdasa = jsonDecode(data);
    //   // CategoryModel dadsa = CategoryModel.fromJson(jsonDecode(data));
    //   // edtKeahlian.text = dataProfile.value.expertize[0];
    // }
  }


  addKeahlian(CategoryModel val){
    if(!selectedKeahlian.value.contains(val)){
      selectedKeahlian.value.add(val);
    }
    selectedKeahlian.refresh();
  }

  removeKeahlian(CategoryModel val){
    if(selectedKeahlian.value.length > 0){
      selectedKeahlian.value.remove(val);
    }
    selectedKeahlian.refresh();
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

  updateProfile(BuildContext context){
    DialogConstant.loading(context, 'Mohon tunggu...');
    var post = new Map<String, String>();
    post['name'] = edtName.text;
    post['email'] = edtEmail.text;
    post['telpon'] = edtPhone.text.removeAllWhitespace;
    post['jenis_kelamin'] = strGender.value;
    // List<String> keahlian = [];
    String strKeahlian = '';

    for(int i=0; i<selectedKeahlian.value.length; i++){
      if(strKeahlian == ''){
        strKeahlian = selectedKeahlian.value[i].id.toString();
      }else{
        strKeahlian = '${strKeahlian},${selectedKeahlian.value[i].id.toString()}';
      }
    }
    // var dataKeahlian = {'expertize':keahlian};
    post['expertize'] = strKeahlian;
    post['detail'] = edtAbout.text;
    post['experience'] = '';
    post['qualification'] = '';
    post['date_of_birth'] = strBirtDate.value;
    String file = fileImage.value.path;
    NewAPI.updateProfile('/profile', post, file, (result, error) {
      Get.back();
      if(error != null){

      }
      if(result != null){
        DialogConstant.messageInfo(
            context: context,
            title: 'Informasi',
            message: 'Success update profile',
            onClose: ()=>Navigator.of(context).pop()
        );
      }
    });
  }

  getCategoryService(){
    NewAPI.getCategoryService((result, error) {
      if(error != null){

      }
      if(result != null){
        var category = (result['data'] as List).map((e) => e == null ? null : CategoryModel.fromJson(e as Map<String, dynamic>)).toList();
        if(category != null){
          dataCategory.value = category as List<CategoryModel>;
        }
      }
    });
  }
}