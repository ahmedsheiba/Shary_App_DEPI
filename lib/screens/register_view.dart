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
    // Get screen size
    final size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05), // Responsive padding
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Spacer(flex: 1),
              Image.asset(
                'assets/images/shary_logo.png',
                width: size.width * 0.5, // Responsive width
              ),
              const Spacer(
                flex: 2,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  color: Colors.purple,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading =
                            true; // Moved inside setState for proper UI update
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
                          isLoading =
                              false; // Ensure loading state is updated after operation
                        });
                      }
                    }
                  },
                  text: 'Register'),
              const SizedBox(
                height: 10,
              ),
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
                    child: const Text(
                      '  LOGIN',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const Spacer(flex: 3),
            ],
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
