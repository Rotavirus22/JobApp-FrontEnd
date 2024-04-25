import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/provider/forgotPassword/forgotPassword.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotState = Provider.of<ForgotPasswordState>(context);
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
                      labelText: 'Email',
                      maxLine: 1,
                      obscureText: false,
                      onChanged: forgotState.onEmailChanged,
                    ),
                  ),
                  elHeightSpan,
                  elHeightSpan,
                  KButton(
                    onPressed: () {
                      forgotState.forgotPassword();
                    },
                    child: forgotState.isLoading
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
