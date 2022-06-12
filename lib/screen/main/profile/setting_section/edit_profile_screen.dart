import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:misterfix/controller/profile/profile_controller.dart';
import 'package:misterfix/model/unit/category/category_model.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final ImagePicker _picker = ImagePicker();
  ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initEditProfile();
    controller.getCategoryService();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Utils.colorFromHex(ColorCode.bluePrimary),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white ),
        title: new TextMeta('Edit Profile', size: 16, weight: FontWeight.w500),
        actions: [
          InkWell(
            onTap: ()=>controller.updateProfile(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.save_rounded),
            ),
          )
        ],
      ),
      body: Obx(()=>Container(
        color: Utils.colorFromHex(ColorCode.bluePrimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 165,
                    width: 165,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)
                    ),
                    // child: ClipOval(
                    //   child: CachedNetworkImage(
                    //     placeholder: (context, url) => Center(),
                    //     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/FBS_logo_1.jpg/600px-FBS_logo_1.jpg',
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    child: controller.fileImage.value.path != null ? CircleAvatar(
                      radius: 16.0,
                      child: ClipRRect(
                        child: Image.file(
                          controller.fileImage.value,
                          fit: BoxFit.cover,
                          height: 165,
                          width: 165,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ) : ClipOval(
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Center(),
                        imageUrl: controller.dataProfile.value.avatar != '' ? controller.dataProfile.value.avatar:
                          'https://fe.unram.ac.id/wp-content/uploads/2015/12/no-profile-img.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10, right: 5,
                      child: InkWell(
                        onTap: ()=>showPicker(),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: ConstantStyle.boxCircle(color: Utils.colorFromHex(ColorCode.bgBluePrimary)),
                          child: Icon(Icons.camera_alt_rounded),
                        ),
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: ConstantStyle.boxRadiusOnly(
                  topRight: 10,topLeft: 10,
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemInfo(label: 'Username*', ctrl: controller.edtName),
                    itemInfo(label: 'Email Address*', ctrl: controller.edtEmail, inputType: TextInputType.emailAddress),
                    itemInfo(label: 'Phone*', ctrl: controller.edtPhone, inputType: TextInputType.phone),
                    SizedBox(height: 15),
                    TextMeta('Gender*', size: 14, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: ()=>controller.strGender.value = 'L',
                          child: Container(
                            decoration: ConstantStyle.boxButtonBorder(radius: 8, widthBorder: 1, colorBorder: Utils.colorFromHex(ColorCode.greyPrimary)),
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Row(
                              children: [
                                Icon(controller.strGender.value == 'L' ? Icons.check_circle_outline_rounded:Icons.radio_button_off, size: 20,),
                                SizedBox(width: 10),
                                TextMeta('Male', size: 16, weight: FontWeight.w500, color: Colors.black87),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: ()=>controller.strGender.value = 'P',
                          child: Container(
                            decoration: ConstantStyle.boxButtonBorder(radius: 8, widthBorder: 1, colorBorder: Utils.colorFromHex(ColorCode.greyPrimary)),
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Row(
                              children: [
                                Icon(controller.strGender.value == 'P' ? Icons.check_circle_outline_rounded:Icons.radio_button_off, size: 20,),
                                SizedBox(width: 10),
                                TextMeta('Female', size: 16, weight: FontWeight.w500, color: Colors.black87),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextMeta('Date of Birt', size: 14, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            TextMeta(controller.strBirtDate.value, size: 14, color: Colors.black87),
                            Expanded(child: InkWell(
                              onTap: ()=>Utils.openDatePicker(context, (val){
                                controller.strBirtDate.value = val;
                              }),
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.calendar_today),
                              ),
                            ))
                          ],
                        ),
                        Divider(color: Utils.colorFromHex(ColorCode.greyPrimary))
                      ],
                    ),
                    SizedBox(height: 15),
                    autoComplete(controller.dataCategory.value),
                    Container(
                      child: Wrap(
                        children: controller.selectedKeahlian.map((element) =>
                          Container(
                            width: size.width * 0.30,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 5,top: 5),
                            decoration: ConstantStyle.boxButtonBorder(
                              color: Colors.white,
                              radius: 8,
                              widthBorder: 1,
                              colorBorder: Colors.blue.shade200
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Container(child: TextMeta(element.name, color: Colors.black45,))),
                                InkWell(
                                  onTap: ()=>controller.removeKeahlian(element),
                                  child: Icon(Icons.close, size: 15,)
                                )
                              ],
                            )
                          )
                        ).toList()
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: controller.edtAbout,
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                          fillColor: Colors.white,
                          hintText: 'About Me*',
                          labelText: 'About Me*',
                          labelStyle: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Utils.colorFromHex(ColorCode.greyPrimary)
                          ),
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 15)
                      ),
                      // onChanged: (val)=> controller.isEnableLogin(),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }

  itemInfo({
    String? label,
    String? value,
    TextEditingController? ctrl,
    TextInputType inputType = TextInputType.text
  }){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMeta(label ?? '', size: 14, weight: FontWeight.w500, color: Utils.colorFromHex(ColorCode.greyPrimary)),
          label!.contains('Phone') ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 5),
              Container(
                decoration: ConstantStyle.boxShadowButon(
                    radius: 8, color: Colors.white,
                    colorShadow: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1, blurRadius: 4, offset: Offset(1,3)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                  child: TextMeta('+62', color: Colors.black87,),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: TextField(
                    controller: ctrl,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                    ],
                  ),
                ),
              ),
            ],
          ):TextField(
            controller: ctrl,
            keyboardType: inputType,
          )
        ],
      ),
    );
  }

  autoComplete(List<CategoryModel> dataKeahlian){
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: controller.edtKeahlian,
            onChanged: (val){
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
              fillColor: Colors.white,
              hintText: 'Bidang Keahlian',
              labelText: 'Bidang Keahlian',
              labelStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Utils.colorFromHex(ColorCode.greyPrimary)
              ),
              suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
              contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            )
        ),
        suggestionsCallback: (pattern) async {
          List<CategoryModel> data = dataKeahlian.where((element) => element.name.toLowerCase().contains(pattern)).toList();
          return data;
        },
        hideOnError: true,
        itemBuilder: (context, suggestion) {
          var data = suggestion as CategoryModel;
          return ListTile(
            leading: Icon(Icons.check_circle_outline_rounded),
            title: Text(data.name),
          );
        },
        noItemsFoundBuilder: (context) => ListTile(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
            // controller.addKeahlian(controller.edtKeahlian.text);
          },
          // leading: Icon(Icons.add_circle_outline_rounded, color: Utils.colorFromHex(ColorCode.bluePrimary),),
          title: TextMeta('Data tidak ditemukan', size: 16, weight: FontWeight.w500),
        ),
        onSuggestionSelected: (suggestion) {
          var data = suggestion as CategoryModel;
          FocusScope.of(context).requestFocus(new FocusNode());
          controller.edtKeahlian.text = '';
          controller.addKeahlian(data);
        },
      ),
    );
  }

  showPicker(){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  _imgFromGallery() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (xFile != null) {
      var image = File(xFile.path);
      controller.changeImage(image);
    }
  }

  _imgFromCamera({int? index}) async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.camera, imageQuality: 70);
    if (xFile != null) {
      var image = File(xFile.path);
      controller.changeImage(image);
    }
  }
}
