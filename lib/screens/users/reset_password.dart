import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/provider/forgotPassword/resetPassword.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final resetState = Provider.of<ResetPasswordState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomAppBar(
              child: Center(
                child: Text('Find your Account'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 280,
                    ),
                    child: kTextFormFIeld(
                      labelText: 'New Password',
                      maxLine: 1,
                      obscureText: false,
                      onChanged: resetState.onNewPasswordChanged,
                    ),
                  ),
                  kTextFormFIeld(
                    labelText: 'OTP',
                    maxLine: 1,
                    obscureText: false,
                    onChanged: resetState.onOtpChanged,
                  ),
                  elHeightSpan,
                  elHeightSpan,
                  KButton(
                    onPressed: () {
                      resetState.resetPassword();
                    },
                    child: resetState.isLoading
                        ? CircularProgressIndicator()
                        : Text('Send OTP'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
