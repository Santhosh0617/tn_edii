import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/auth_provider.dart';
import 'package:tn_edii/repositories/auth_repository.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/form_extension.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController contEmail = TextEditingController();
  final TextEditingController contPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextCustom('Getting Started.!',
                        fontWeight: FontWeight.w700, size: 20),
                    const HeightHalf(),
                    const TextCustom(
                      'You can sign up into EDII-TN by entering the following details',
                      fontWeight: FontWeight.bold,
                      color: Palette.grey,
                    ),
                    const HeightFull(multiplier: 2),
                    TextFormFieldCustom(
                        label: 'Name',
                        controller: contEmail,
                        hint: 'Enter your name'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Email ID',
                        controller: contEmail,
                        hint: 'Enter your email'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Phone Number',
                        controller: contEmail,
                        hint: 'Enter your phone number'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Password',
                        controller: contPassword,
                        obscured: true,
                        hint: 'Enter your password'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Confirm Password',
                        controller: contPassword,
                        obscured: true,
                        hint: 'Re-enter the password'),
                    const HeightFull(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomCheckBox(
                        value: isAgreed,
                        onChanged: toggleAgreement,
                        title: 'I agree to the terms and conditions',
                      ),
                    ),
                    const HeightFull(multiplier: 2),
                    Consumer<AuthProvider>(
                      builder: (context, value, child) => Row(children: [
                        Expanded(
                            child: ButtonPrimary(
                          onPressed: onRegister,
                          label: 'Sign Up',
                          isLoading: value.isLoading,
                        )),
                      ]),
                    ),
                    const HeightFull(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextCustom("Already have an account?",
                            fontWeight: FontWeight.bold,
                            color: Palette.grey,
                            align: TextAlign.center),
                        TextButton(
                            onPressed: onLogin,
                            child: const TextCustom("SIGN IN")),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void onRegister() {
    AuthRepository().navigateHome(context);
    return;
    if (_formKey.hasError) return;
    Map<String, dynamic> params = {
      'email': contEmail.text,
      'password': contPassword.text
    };
    AuthRepository().login(context, params);
  }

  void onLogin() {
    context.go(Routes.login);
  }

  void toggleAgreement() {
    isAgreed = !isAgreed;
    setState(() {});
  }
}
