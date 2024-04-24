// ignore: camel_case_type
import 'package:flutter/material.dart';

import 'package:jobapp/themes/app_themes.dart';

class kTextFormFIeld extends StatefulWidget {
  const kTextFormFIeld({
    super.key,
    required this.onChanged,
    this.autoValidateMode,
    this.hintText,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = true,
    this.maxLine,
    this.minLine,
    this.labelText,
    this.readOnly = false,
  });
  final bool obscureText;
  final dynamic onChanged;
  final dynamic autoValidateMode;
  final dynamic validator;
  final dynamic onSaved;
  final dynamic hintText;
  final dynamic keyboardType;
  final Widget? suffixIcon;
  final int? maxLine;
  final int? minLine;
  final dynamic labelText;
  final bool readOnly;

  @override
  State<kTextFormFIeld> createState() => _kTextFormFIeldState();
}

class _kTextFormFIeldState extends State<kTextFormFIeld> {
  late bool obscures;
  @override
  void initState() {
    super.initState();
    obscures = widget.obscureText;
  }

  Widget? suffixIconCondition() {
    if (widget.obscureText) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscures = !obscures;
          });
          return null;
        },
        icon: Icon(obscures ? Icons.visibility_off : Icons.visibility),
        color: Colors.grey,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: TextFormField(
        readOnly: widget.readOnly,
        maxLines: widget.obscureText ? 1 : widget.maxLine,
        minLines: widget.minLine,
        obscureText: obscures,
        style: AppTheme()
            .lightTheme
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black),
        onChanged: widget.onChanged,
        autovalidateMode: widget.autoValidateMode,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.red.shade300,
              ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: textFieldColor),
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: AppTheme()
              .lightTheme
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
          hintStyle: AppTheme().lightTheme.textTheme.bodySmall,
          suffixIcon: widget.suffixIcon ?? suffixIconCondition(),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          isDense: true,
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
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white), // Set the border color to white
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
