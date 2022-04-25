import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misterfix/model/unit/field/field_model.dart';
import 'package:misterfix/model/unit/field/item_field_model.dart';
import 'package:misterfix/utils/color_code.dart';
import 'package:misterfix/utils/utils.dart';
import 'package:misterfix/widget/font/text_meta.dart';

class NewFieldUnitWidget extends StatefulWidget {
  List? data;
  String? label;
  Function? onSuggestionSelected;
  NewFieldUnitWidget({this.label, this.data, this.onSuggestionSelected});
  @override
  _NewFieldUnitWidgetState createState() => _NewFieldUnitWidgetState();
}

class _NewFieldUnitWidgetState extends State<NewFieldUnitWidget> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: controller,
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
                hintText: widget.label ?? '',
                labelText: widget.label ?? '',
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
          List<ItemFieldModel> data = widget.data as List<ItemFieldModel>;
          var ok = data.where((element) => element.value.toLowerCase().contains(pattern.toLowerCase())).toList();
          // return await BackendService.getSuggestions(pattern);
          return ok;
        },
        hideOnError: true,
        itemBuilder: (context, suggestion) {
          var data = suggestion as ItemFieldModel;
          return ListTile(
            // leading: Icon(Icons.add_circle_outline_rounded, color: Utils.colorFromHex(ColorCode.bluePrimary)),
            title: Text(data.value),
          );
        },
        noItemsFoundBuilder: (context) => ListTile(
          onTap: (){
            List<ItemFieldModel> data = widget.data as List<ItemFieldModel>;
            ItemFieldModel model = ItemFieldModel();
            model.id = 0;
            model.value = controller.text;
            model.fields_id = data[0].fields_id;
            widget.onSuggestionSelected!(model);
          },
          leading: Icon(Icons.add_circle_outline_rounded, color: Utils.colorFromHex(ColorCode.bluePrimary),),
          title: TextMeta('Tambah ${widget.label}', size: 16, weight: FontWeight.w600, color: Utils.colorFromHex(ColorCode.bluePrimary)),
        ),
        onSuggestionSelected: (suggestion) {
          var data = suggestion as ItemFieldModel;
          controller.text = data.value;
          widget.onSuggestionSelected!(suggestion);
        },
      ),
    );
  }
}
