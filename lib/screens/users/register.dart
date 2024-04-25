import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/provider/register/registerState.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerState = Provider.of<RegisterState>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const CustomAppBar(
                child: Center(child: Text('JobTree')),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 228, 20, 0),
                child: Container(
                  child: Column(
                    children: [
                      kTextFormFIeld(
                        obscureText: false,
                        hintText: 'Full Name',
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: registerState.onFullNameChanged,
                        onSaved: (String? value) {
                          value = registerState.fullName;
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
                        obscureText: false,
                        hintText: 'Email',
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: registerState.onEmailChanged,
                        onSaved: (String? value) {
                          value = registerState.email;
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
                        onChanged: registerState.onPasswordChanged,
                        onSaved: (String? value) {
                          value = registerState.email;
                        },
                      ),
                      lHeightSpan,
                      KButton(
                        child: registerState.isLoading
                            ? CircularProgressIndicator()
                            : Text('Register'),
                        onPressed: () {
                          registerState.register();
                        },
                      ),
                      elHeightSpan,
                      Row(
                        children: [
                          Text('Already have an Account'),
                          TextButton(
                            onPressed: () {
                              navigagorKey.currentState!.pushNamed('/login');
                            },
                            child: Text('Login'),
                          ),
                        ],
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
