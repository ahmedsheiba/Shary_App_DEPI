import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sharyApp/widgets/custom_snak_bar.dart';
import 'package:sharyApp/widgets/custom_text_button_field.dart';
import 'package:sharyApp/widgets/custum_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';
  @override
  State<RegisterView> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterView> {
  bool isLoading = false;
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Image.asset(
                      'assets/images/shary_logo.png',
                      width: screenHeight * 0.25,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                        onChanged: (data) {
                          email = data;
                        },
                        hinttext: const Text('Email')),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        onChanged: (data) {
                          password = data;
                        },
                        obscureText: true,
                        hinttext: const Text('Password')),
                    SizedBox(height: screenHeight * 0.03),
                    CustomButton(
                        color: Colors.purple,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              await registerUser();
                              showSnackBar(context, 'Success');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(context, 'Weak password');
                              } else if (e.code == 'email-already-in-use') {
                                showSnackBar(context,
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              showSnackBar(context, 'There was an Error!');
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                        text: 'Register'),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '  LOGIN',
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
