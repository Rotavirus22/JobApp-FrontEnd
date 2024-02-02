// ignore: camel_case_type
import 'package:flutter/material.dart';
import 'package:jobapp/themes/app_themes.dart';

class kTextFormFIeld extends StatelessWidget {
  const kTextFormFIeld(
      {super.key,
      required this.onChanged,
      this.autoValidateMode,
      this.hintText,
      this.onSaved,
      this.validator,
      this.keyboardType});
  final dynamic onChanged;
  final dynamic autoValidateMode;
  final dynamic validator;
  final dynamic onSaved;
  final dynamic hintText;
  final dynamic keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TextFormField(
        style: AppTheme()
            .lightTheme
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black),
        onChanged: onChanged,
        autovalidateMode: autoValidateMode,
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme().lightTheme.textTheme.bodySmall,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
