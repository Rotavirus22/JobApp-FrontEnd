import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/provider/login/login_state.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              const CustomAppBar(
                child: Center(
                  child: Text('JobTree'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 228, 20, 0),
                child: Container(
                  child: Column(
                    children: [
                      kTextFormFIeld(
                        obscureText: false,
                        hintText: ' Email',
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: loginState.onEmailChanged,
                      ),
                      mHeightSpan,
                      kTextFormFIeld(
                        obscureText: true,
                        hintText: 'Password',
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: loginState.onPasswordChanged,
                      ),
                      lHeightSpan,
                      KButton(
                        onPressed: () {
                          loginState.login();
                        },
                        child: loginState.isLoading
                            ? CircularProgressIndicator()
                            : Text('Login'),
                      ),
                      lHeightSpan,
                      Row(
                        children: [
                          elWidthSpan,
                          elWidthSpan,
                          elWidthSpan,
                          elWidthSpan,
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                navigagorKey.currentState!
                                    .pushNamed('/forgotPassword');
                              },
                              child: Text('Forgot Password?'),
                            ),
                          ),
                        ],
                      ),
                      elHeightSpan,
                      Row(
                        children: [
                          Text('Don\'t have an Account?'),
                          TextButton(
                            onPressed: () {
                              navigagorKey.currentState!.pushNamed('/register');
                            },
                            child: Text('Register'),
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
