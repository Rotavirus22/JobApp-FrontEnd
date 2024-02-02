import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/provider/login/login_state.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 290,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        appPrimaryColor,
                        Color(0xFF5effb1),
                        Color(0xFF68FFB6),
                        Color(0xFF7FFFC0),
                        Color(0xFF8AFFC6),
                        Color(0xFFAAFFD6),
                        Color(0xFFBDFCDD),
                      ],
                      tileMode: TileMode.mirror),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: const Center(
                  child: Text('JobTree'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 228, 20, 0),
                child: Container(
                  height: 325,
                  child: Column(
                    children: [
                      kTextFormFIeld(
                        hintText: ' Email',
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: loginState.onEmailChanged,
                        onSaved: (String? value) {
                          value = loginState.email;
                        },
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter an email';
                        //   }
                        //   return null;
                        // },
                      ),
                      mHeightSpan,
                      kTextFormFIeld(
                        hintText: 'Password',
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: loginState.onPasswordChanged,
                        onSaved: (String? value) {
                          value = loginState.email;
                        },
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter a password';
                        //   }
                        //   return null;
                        // },
                      ),
                      lHeightSpan,
                      MaterialButton(
                        height: 58,
                        color: secondaryColor,
                        child: loginState.isLoading
                            ? CircularProgressIndicator()
                            : Text('Login'),
                        onPressed: () {
                          loginState.login();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
