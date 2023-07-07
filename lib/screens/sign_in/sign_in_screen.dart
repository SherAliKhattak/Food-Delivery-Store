import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:store_app/screens/sign_up/sign_up_screen.dart';

import '../../components/custom_round_botton.dart';
import '../../components/custom_round_textfield.dart';
import '../../components/images_paths.dart';
import '../../data/repositories/auth_repository.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Image.asset(Images.shawarma),
              Text(
                textAlign: TextAlign.center,
                "Let's Sign In",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).secondaryHeaderColor),
              ),
              SizedBox(
                height: Get.height * .07,
              ),
              CustomRoundTextfield(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.isEmail) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                hintText: 'Email',
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              CustomRoundTextfield(
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid password';
                  }

                  return null;
                },
                hintText: 'Password',
              ),
              // Align(
              //     alignment: Alignment.centerRight,
              //     child: SizedBox(
              //         height: Get.height * .04,
              //         child: TextButton(
              //           onPressed: () {},
              //           child: const Text('Forgot Password?'),
              //         ))),
              const Spacer(),
              CustomRoundButton(
                margin: EdgeInsets.zero,
                title: 'Sign In',
                onPresse: () {
                  if (formKey.currentState!.validate()) {
                    AuthService()
                        .loginStore(email: email.text, password: password.text);
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const SignUpScreen());
                      },
                      child: const Text('Sign up'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
