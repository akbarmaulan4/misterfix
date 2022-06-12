import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/model/unit/address/address_model.dart';
import 'package:misterfix/model/unit/pelanggan/pelanggan_corp_model.dart';
import 'package:misterfix/model/unit/pelanggan/pelanggan_model.dart';
import 'package:misterfix/model/unit/pic/model_pic.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class FieldUnitWidget extends StatefulWidget {
  List? data;
  String? label;
  String? type;
  Function? onSuggestionSelected;
  TextEditingController? controller;
  FieldUnitWidget({this.label, this.controller, this.data, this.onSuggestionSelected, this.type});

  @override
  _FieldUnitWidgetState createState() => _FieldUnitWidgetState();
}

class _FieldUnitWidgetState extends State<FieldUnitWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: widget.controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
                fillColor: Colors.white,
                hintText: widget.label ?? '',
                labelText: widget.label ?? '',
                labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Utils.colorFromHex(ColorCode.greyPrimary)
                ),
                suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
            )
        ),
        suggestionsCallback: (pattern) async {
          // return await BackendService.getSuggestions(pattern);
          // return widget.data ?? [];
          return queryData(widget.type ?? '', pattern);
        },
        hideOnError: true,
        itemBuilder: (context, suggestion) {
          var data = getModel(widget.type ?? '', suggestion);
          return ListTile(
            leading: getLeading(data),
            title: Text(getModelLabel(widget.type ?? '', suggestion)),
          );
        },
        noItemsFoundBuilder: (context) => ListTile(
          onTap: ()=>widget.onSuggestionSelected!(null),
          leading: Icon(Icons.add_circle_outline_rounded, color: Utils.colorFromHex(ColorCode.bluePrimary),),
          title: TextMeta(getLabel(widget.type ?? ''), size: 16, weight: FontWeight.w600, color: Utils.colorFromHex(ColorCode.bluePrimary)),
        ),
        onSuggestionSelected: (suggestion) {
          setField(widget.type ?? '', suggestion);
          widget.onSuggestionSelected!(suggestion);
        },
      ),
    );
  }

  queryData(String type, String key){
    switch(type){
      case 'customer':
        var data = widget.data as List<PelangganModel>;
        var result = data.where((element) => element.name.toLowerCase().contains(key)).toList();
        return result;
      case 'corp':
        var data = widget.data as List<PelangganCorpModel>;
        var result = data.where((element) => element.corp_name.toLowerCase().contains(key)).toList();
        return result;
      case 'location':
        var data = widget.data as List<AddressModel>;
        var result = data.where((element) => element.address.toLowerCase().contains(key)).toList();
        return result;
      case 'pic':
        var data = widget.data as List<ModelPIC>;
        var result = data.where((element) => element.name.toLowerCase().contains(key)).toList();
        return result;
      default:null;
    }
  }

  getId(String type){
    switch(type){
      case 'customer':
        return 1988;
      case 'corp':
        return 1988;
      case 'location':
        return 1989;
      case 'pic':
        return 1990;
      default:null;
    }
  }

  getLeading(var data){
    if(data != null){
      if(data.id == 1988 || data.id == 1989 || data.id == 1990){
        return Icon(Icons.add_circle_outline_rounded, color: Utils.colorFromHex(ColorCode.bluePrimary),);
      }
    }else{
      return null;
    }
  }
  getLabel(String type){
    switch(type){
      case 'customer':
        return 'Tambah Customer Baru';
      case 'corp':
        return 'Tambah Customer Baru';
      case 'location':
        return 'Tambah Alamat Baru';
      case 'pic':
        return 'Tambah PIC Baru';
      default:null;
    }
  }
  getModel(String type, var data){
    switch(type){
      case 'customer':
        return data as PelangganModel;
      case 'corp':
        return data as PelangganCorpModel;
      case 'location':
        return data as AddressModel;
      case 'pic':
        return data as ModelPIC;
      default:null;
    }
  }
  getModelLabel(String type, var data){
    switch(type){
      case 'customer':
        return (data as PelangganModel).name;
      case 'corp':
        return (data as PelangganCorpModel).corp_name;
      case 'location':
        return (data as AddressModel).address;
      case 'pic':
        return (data as ModelPIC).name;
      default:null;
    }
  }
  setField(String type, var data){
    switch(type){
      case 'customer':
        widget.controller!.text = getModelLabel(widget.type ?? '', data);
        break;
      case 'corp':
        widget.controller!.text = getModelLabel(widget.type ?? '', data);
        break;
      case 'location':
        widget.controller!.text  = getModelLabel(widget.type ?? '', data);
        break;
      case 'pic':
        widget.controller!.text = getModelLabel(widget.type ?? '', data);
        break;
      default:null;
    }

  }
}
