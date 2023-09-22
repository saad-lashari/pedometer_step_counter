import 'package:cypherkicks/components/custom_widgets/custom_text_field.dart';
import 'package:cypherkicks/components/custom_widgets/primary_button.dart';
import 'package:cypherkicks/components/images.dart';
import 'package:cypherkicks/data/auth_service/db_auth.dart';
import 'package:cypherkicks/data/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/db_service/firebase_db.dart';
import '../utils/styles.dart';
import '../utils/themes/themes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(paddingLarge(context)),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.logo),
                  SizedBox(
                    height: Get.height * 0.12,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your username';
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.person_pin_circle_outlined,
                        color: kgreyColor,
                      ),
                      height: Get.height * 0.07,
                      prefixIconColor: kgreyColor,
                      loginController: AuthController.i.username,
                      hintText: 'Username',
                      contentPadding: EdgeInsets.all(paddingDefault(context)),
                      isObscure: false),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty || !value.isEmail) {
                          return 'Please provide a valid Email';
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: kgreyColor,
                      ),
                      prefixIconColor: kgreyColor,
                      height: Get.height * 0.07,
                      loginController: AuthController.i.email,
                      hintText: 'Email',
                      isObscure: false),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'password length is too short';
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: kgreyColor,
                      ),
                      prefixIconColor: kgreyColor,
                      height: Get.height * 0.07,
                      loginController: AuthController.i.password,
                      hintText: 'Password',
                      isObscure: true),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Re-enter your password to continue';
                        }
                        if (AuthController.i.password.text !=
                            AuthController.i.confirmPass.text) {
                          return 'passwords do not match';
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: kgreyColor,
                      ),
                      prefixIconColor: kgreyColor,
                      height: Get.height * 0.07,
                      loginController: AuthController.i.confirmPass,
                      hintText: 'Confirm Password',
                      isObscure: true),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  PrimaryButon(
                    width: Get.width * 0.65,
                    textColor: kblackColor,
                    radius: 10,
                    title: 'Sign Up',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await AuthService().signupwithEmail(
                            email: AuthController.i.email.text,
                            password: AuthController.i.password.text);
                        await FirebaseDB().sendUsertoFirebase();
                      } else {}
                    },
                    backgroundColor: kwhiteColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
