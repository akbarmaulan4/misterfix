import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/model/unit/address/address_model.dart';
import 'package:misterfix/model/unit/category/category_model.dart';
import 'package:misterfix/model/unit/field/field_model.dart';
import 'package:misterfix/model/unit/field/item_field_model.dart';
import 'package:misterfix/model/unit/field/section_field_model.dart';
import 'package:misterfix/model/unit/model_unit.dart';
import 'package:misterfix/model/unit/pelanggan/pelanggan_model.dart';
import 'package:misterfix/model/unit/pic/model_pic.dart';
import 'package:misterfix/utils/dialog_constant.dart';
import 'package:intl/intl.dart';

class UnitController extends GetxController{
  RxInt tabInfo = 0.obs; // 0 = Personal, 1 = Perusahaan
  RxString tabInfoUnit = ''.obs;
  //info pelanggan
  // 0 = AC, 1 = Electrical, 2 = Plumbing
  RxList<PelangganModel> dataPelangganPersonal = <PelangganModel>[].obs;
  RxList<AddressModel> dataAlamatPelanggan = <AddressModel>[].obs;
  RxList<AddressModel> dataAlamatCorporate = <AddressModel>[].obs;
  RxList<CategoryModel> dataCategory = <CategoryModel>[].obs;
  RxList<FieldModel> dataFields = <FieldModel>[].obs;
  RxList<SectionFieldModel> dataSection = <SectionFieldModel>[].obs;
  RxList<ModelPIC> dataPIC = <ModelPIC>[].obs;
  // RxList<ItemFieldModel> postFields = <ItemFieldModel>[].obs;

  Rx<PelangganModel> personalUser = PelangganModel().obs;
  Rx<AddressModel> userAddress = AddressModel().obs;
  Rx<AddressModel> corpAddress = AddressModel().obs;

  //unit info
  RxList<PelangganModel> dataGedung = <PelangganModel>[].obs;

  //corporate
  RxList<PelangganModel> dataPerusahaan = <PelangganModel>[].obs;
  Rx<PelangganModel> dataCorp = PelangganModel().obs;
  Rx<ModelPIC> selectedPIC = ModelPIC().obs;


  RxDouble currentLatitude = 0.0.obs;
  RxDouble currentLongitude = 0.0.obs;
  RxDouble currentLatitudeCorp = 0.0.obs;
  RxDouble currentLongitudeCorp = 0.0.obs;

  TextEditingController edtNamaPelanggan = TextEditingController();
  TextEditingController edtNotlp = TextEditingController();
  TextEditingController edtAlamat = TextEditingController();
  TextEditingController edtGedung = TextEditingController();
  TextEditingController edtLantai = TextEditingController();
  TextEditingController edtNamaBangunan = TextEditingController();
  TextEditingController edtTipeAC = TextEditingController();
  TextEditingController edtMerkAC = TextEditingController();
  TextEditingController edtPK = TextEditingController();
  TextEditingController edtFreonTIpe = TextEditingController();
  TextEditingController edtTglPasang = TextEditingController();
  TextEditingController edtCatatan = TextEditingController();

  //corporate
  TextEditingController edtNamaPerusahaan = TextEditingController();
  TextEditingController edtCabang = TextEditingController();
  TextEditingController edtAlamatPerusahaan = TextEditingController();
  TextEditingController edtPIC = TextEditingController();
  TextEditingController edtTlpPIC = TextEditingController();

  //view
  TextEditingController edtNamaPelangganView = TextEditingController();
  TextEditingController edtNotlpView = TextEditingController();
  // TextEditingController edtNotlpView = MaskedTextController(mask: '000 0000 00000');

  changeLatLon(double lat, double lon){
    currentLatitude.value = lat;
    currentLongitude.value = lon;
  }

  changeLatLonCorp(double lat, double lon){
    currentLatitudeCorp.value = lat;
    currentLongitudeCorp.value = lon;
  }

  changeTabInfo(int val){
    tabInfo.value = val;
  }

  CategoryModel _categorySelected = CategoryModel();
  CategoryModel get categorySelectd => _categorySelected;
  changeTabInfoUnit(CategoryModel val){
    _categorySelected = val;
    tabInfoUnit.value = val.name;
  }

  clearTextfield(){
    edtNamaPelanggan.text = '';
    edtNotlp.text = '';
    edtAlamat.text = '';
    edtNamaPerusahaan.text = '';
  }

  setPersonalUser(PelangganModel val){
    personalUser.value = val;
    edtNamaPelangganView.text = val.name;
    edtNotlpView.text = val.no_telpon;
  }

  setAlamatUser(AddressModel val){
    userAddress.value = val;
    edtAlamat.text = val.address;
  }

  setPersonalCorp(PelangganModel val){
    dataCorp.value = val;
    edtNamaPerusahaan.text = val.name;
    // edtNotlpView.text = val.no_telpon;
  }

  setAlamatCorporate(BuildContext context, AddressModel val){
    corpAddress.value = val;
    edtCabang.text = val.name;
    edtAlamatPerusahaan.text = val.address;
    getPICCorp(context, val.id);
  }

  setPICCorporate(ModelPIC val){
    selectedPIC.value = val;
    edtPIC.text = val.name;
  }


  getPersonalUser(BuildContext context) async {
    NewAPI.getPersonalUser((result, error) {
      if(error != null){

      }
      if(result != null) {
        var pelanggan = (result['data'] as List).map((e) => e == null ? null : PelangganModel.fromJson(e as Map<String, dynamic>)).toList();
        if (pelanggan != null) {
          PelangganModel model = PelangganModel();
          model.id = 1988;
          model.name = 'Tambah Customer Baru';
          pelanggan.add(model);
          dataPelangganPersonal.value = pelanggan as List<PelangganModel>;
        }
      }
    });
  }

  createPersonlUser({BuildContext? context, Function? onSuccess}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreatePersonalUser('Personal', edtNamaPelanggan.text, edtNotlp.text, (result, error) {
      Get.back();
      if(error != null){
        // onError!(error);
      }
      if(result != null){
        var errorTrue = result['error'];
        if(!errorTrue){
          var data = result['data'];
          var customer = data['customer'];
          PelangganModel model = PelangganModel();
          model.id = data['id'] ?? 0;
          model.name = customer['name'] ?? '';
          model.no_telpon = customer['telpon'] ?? '';
          setPersonalUser(model);
          onSuccess!(model);
        }
      }
    });
  }

  createPersonalLocation({BuildContext? context, Function? onSuccess}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreatePersonalLocation(personalUser.value.id.toString(), edtAlamat.text, (result, error) {
      Get.back();
      if(error != null){
      }
      if(result != null){
        var data = AddressModel.fromJson(result['data']);
        dataAlamatPelanggan.value.add(data);
        setAlamatUser(data);
        // onSuccess!(data);
      }
    });
  }

  //================= corporate ======================

  getCorplUser(BuildContext context) async {
    // DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.getCorporateUser((result, error) {
      // Get.back();
      if(error != null){
      }
      if(result != null){
        var pelanggan = (result['data'] as List).map((e) => e == null ? null : PelangganModel.fromJson(e as Map<String, dynamic>)).toList();
        if(pelanggan != null){
          PelangganModel model = PelangganModel();
          model.id = 1988;
          model.name = 'Tambah Customer Baru';
          pelanggan.add(model);
          dataPerusahaan.value = pelanggan as List<PelangganModel>;
        }
      }
    });
  }

  createCorplUser({BuildContext? context, String? name, Function? onSuccess}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreateCorporateUser('Corporate', name!, (result, error) {
      Get.back();
      if(error != null){
        Get.back();
        DialogConstant.messageAlert(
          context: context,
          title: 'Peringatan',
          message: error['message'].toString(),
        );
      }
      if(result != null){
        var data = result['data'];
        var customer = data['customer'];
        PelangganModel model = PelangganModel();
        model.id = data['id'] ?? 0;
        model.name = customer['name'] ?? '';
        model.no_telpon = customer['telpon'] ?? '';
        setPersonalCorp(model);
        onSuccess!(model);
      }
    });
  }

  createCorporateLocation({BuildContext? context, Function? onSuccess}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreateCorporateLocation(dataCorp.value.id.toString(), edtCabang.text, edtAlamatPerusahaan.text, (result, error) {
      Get.back();
      if(error != null){
      }
      if(result != null){
        var data = AddressModel.fromJson(result['data']);
        dataAlamatCorporate.value.add(data);
        setAlamatCorporate(context, data);
        // onSuccess!(data);
      }
    });
  }

  createPICCorp({BuildContext? context, Function? onSuccess}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreatePIC(corpAddress.value.id.toString(), edtPIC.text, edtTlpPIC.text, (result, error) {
      Get.back();
      if(error != null){
      }
      if(result != null){
        // var data = AddressModel.fromJson(result['data']);
        // dataAlamatCorporate.value.add(data);
        // setAlamatCorporate(context, data);
        // onSuccess!(data);
      }
    });
  }

  getPICCorp(BuildContext context, int id) async {
    // DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.getPICCorp(id, (result, error) {
      // Get.back();
      if(error != null){
      }
      if(result != null) {
        var pic = (result['data'] as List).map((e) => e == null ? null : ModelPIC.fromJson(e as Map<String, dynamic>)).toList();
        if (pic != null) {
          ModelPIC model = ModelPIC();
          model.id = 1990;
          model.name = 'Tambah PIC Baru';
          pic.add(model);
          dataPIC.value = pic as List<ModelPIC>;
        }
      }
    });
  }



  getLokasiByCustomer(BuildContext context, int id, String type) async {
    // DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.getLocationByCustomer(id, (result, error) {
      // Get.back();
      if(error != null){
      }
      if(result != null) {
        var alamat = (result['data'] as List).map((e) =>
        e == null ? null : AddressModel.fromJson(e as Map<String, dynamic>)).toList();
        if (alamat != null) {
          AddressModel model = AddressModel();
          model.id = 1989;
          model.address = 'Tambah Alamat Baru';
          alamat.add(model);
          if(type == 'personal'){
            dataAlamatPelanggan.value = alamat as List<AddressModel>;
          }else{
            dataAlamatCorporate.value = alamat as List<AddressModel>;
          }

        }
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

  getFieldService(String serviceID){
    NewAPI.getFieldService(serviceID, (result, error) {
      // Navigator.of(context).pop();
      if(error != null){
        // String errorMsg = '';
        // if(error['message']['code'] != null){
        //   errorMsg = error['message']['code'];
        // }
        // DialogConstant.messageAlert(
        //   context: context,
        //   title: 'Peringatan',
        //   message: errorMsg,
        // );
      }
      if(result != null){
        List<SectionFieldModel> data = [];
        result['data'].forEach((dynamicKey, list) {
          SectionFieldModel model = SectionFieldModel();
          model.name = dynamicKey;
          model.values = list?.map((item) => FieldModel.fromJson(item as Map<String, dynamic>))?.toList();
          data.add(model);
          // dynamicKey will be 'ones', 'twos', ....
          // list will be the corresponding list of maps
        });
        dataSection.value = data;
        // var dataField = (result['data'] as List).map((e) => e == null ? null : FieldModel.fromJson(e as Map<String, dynamic>)).toList();
        // if(dataField != null){
        //   dataFields.value = dataField as List<FieldModel>;
        // }
      }
    });
  }

  openDatePicker(BuildContext context, TextEditingController controller) async {
    DateTime dateTime;
    dateTime = DateTime.now();
    final DateTime picked = (await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blue, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black87, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.blue, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate:  dateTime,
        firstDate: new DateTime(1900),
        lastDate: dateTime //new DateTime(2100)
    ))!;
    if (picked != null){
      final dateFormat = DateFormat("yyyy-MM-dd");
      controller.text = dateFormat.format(picked);
    }
  }

  List<ItemFieldModel> _postFields = [];
  List<ItemFieldModel> get postFields => _postFields;

  insertField(ItemFieldModel data){
    if(postFields.length > 0){
      if(postFields.contains(data)){
        postFields.remove(data);
        postFields.add(data);
      }else{
        postFields.add(data);
      }
    }else{
      postFields.add(data);
    }
  }

  createUnit({BuildContext? context, Function? onSuccess, Function? onError}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreateUnit(personalUser.value.id.toString(),
        userAddress.value,
        categorySelectd,
        edtTglPasang.text,
        edtCatatan.text, postFields, (result, error) {
      Get.back();
      if(error != null){
        String errorMsg = '';
        if(error['message']['code'] != null){
          errorMsg = error['message']['code'];
        }
        DialogConstant.messageAlert(
          context: context,
          title: 'Peringatan',
          message: errorMsg,
        );
      }
      if(result != null){
        var errorTrue = result['error'];
        if(!errorTrue){
          ModelUnit data = ModelUnit.fromJson(result['data']);
          // var customer = data['customer']['customer'];
          // PelangganModel model = PelangganModel();
          // model.id = customer['id'] ?? 0;
          // model.name = customer['name'] ?? '';
          // model.no_telpon = customer['telpon'] ?? '';
          // setPersonalUser(model);
          onSuccess!(data);
        }
      }
    });
  }

  createUnitCorporate({BuildContext? context, Function? onSuccess, Function? onError}) async {
    DialogConstant.loading(context!, 'Mohon tunggu...');
    NewAPI.postCreateUnit(dataCorp.value.id.toString(),
        corpAddress.value,
        categorySelectd,
        edtTglPasang.text,
        edtCatatan.text, postFields, (result, error) {
          Get.back();
          if(error != null){
            String errorMsg = '';
            if(error['message']['code'] != null){
              errorMsg = error['message']['code'];
            }
            DialogConstant.messageAlert(
              context: context,
              title: 'Peringatan',
              message: errorMsg,
            );
          }
          if(result != null){
            var errorTrue = result['error'];
            if(!errorTrue){
              ModelUnit data = ModelUnit.fromJson(result['data']);
              // var customer = data['customer']['customer'];
              // PelangganModel model = PelangganModel();
              // model.id = customer['id'] ?? 0;
              // model.name = customer['name'] ?? '';
              // model.no_telpon = customer['telpon'] ?? '';
              // setPersonalUser(model);
              onSuccess!(data);
            }
          }
        });
  }
}