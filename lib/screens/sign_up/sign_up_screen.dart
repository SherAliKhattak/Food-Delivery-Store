// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/snackbars.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/screens/sign_in/sign_in_screen.dart';
import 'package:store_app/utils/light_them.dart';
import '../../components/circular_back_botton.dart';
import '../../components/custom_appbarr.dart';
import '../../components/custom_round_botton.dart';
import '../../components/custom_round_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController storeName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController town = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPass = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var contr = Get.put<AuthController>(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBarr(
            leading: CircularBackButton(),
          )),
      body: GetBuilder<AuthController>(builder: (contr) {
        return contr.isLoading == false
            ? SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          children: [
                             Text(
                              textAlign: TextAlign.center,
                              "Let's Sign Up",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500, color: Theme.of(context).secondaryHeaderColor),
                            ),
                            SizedBox(
                              height: Get.height * .03,
                            ),
                            imageWidget(),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                             Text(
                              "Create Account",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500, color: Theme.of(context).secondaryHeaderColor),
                            ),
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            CustomRoundTextfield(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Store name is required';
                                }
                                return null;
                              },
                              controller: storeName,
                              hintText: 'Store Name',
                            ),
                            SizedBox(
                              height: Get.height * .015,
                            ),
                            CustomRoundTextfield(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your email';
                                } else if (!value.isEmail) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              controller: email,
                              hintText: 'Email',
                            ),
                            SizedBox(
                              height: Get.height * .015,
                            ),
                            CustomRoundTextfield(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter town name';
                                }
                                return null;
                              },
                              controller: town,
                              hintText: 'Town',
                            ),
                            SizedBox(
                              height: Get.height * .015,
                            ),
                            CustomRoundTextfield(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your password';
                                }
                                return null;
                              },
                              controller: password,
                              hintText: 'Password',
                            ),
                            SizedBox(
                              height: Get.height * .015,
                            ),
                            CustomRoundTextfield(
                              validator: (value) {
                                if (password.text !=
                                    confirmPass.text) {
                                  return 'passwords do not match';
                                } else {
                                  return null;
                                }
                              },
                              controller: confirmPass,
                              hintText: 'Rewrite-Password',
                            ),
                            SizedBox(
                              height: Get.height * .015,
                            ),
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            CustomRoundButton(
                              margin: EdgeInsets.zero,
                              title: 'Sign Up',
                              onPresse: () {
                                if (formKey.currentState!.validate() &&
                                    AuthController.i.file != null) {
                                  AuthService().registerStore(
                                      email: email.text,
                                      password:password.text,
                                      storeName:
                                          storeName.text,
                                      town: town.text);
                                } else {
                                  showSnackbar(
                                      context: Get.context!,
                                      content:
                                          'Fill in the required fields and add a background image');
                                }
                              },
                            ),
                            const HaveAnAccountWidget(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }

  Widget imageWidget() {
    return InkWell(
        onTap: () {
          AuthController.i.pickImage();
        },
        child: AuthController.i.file == null
            ? const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: kgreyContainer,
                  radius: 60,
                  child: Icon(
                    Icons.add,
                    size: 60,
                    color: kwhiteContainer,
                  ),
                ),
              )
            : CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(AuthController.i.file!),
              ));
  }
}

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          'Already have an account?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).secondaryHeaderColor),
        ),
        TextButton(
            onPressed: () {
              Get.to(const SignInScreen());
            },
            child: const Text('Sign In'))
      ],
    );
  }
}
