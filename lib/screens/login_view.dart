import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sharyApp/screens/bottom_navigation_bar.dart';
import 'package:sharyApp/screens/register_view.dart';
import 'package:sharyApp/widgets/custom_snak_bar.dart';
import 'package:sharyApp/widgets/custom_text_button_field.dart';
import 'package:sharyApp/widgets/custum_button.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static String id = 'LoginPage';
  @override
  State<LogInView> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInView> {
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    var screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Spacer(flex: 1),
              Image.asset(
                'assets/images/shary_logo.png',
                height: screenHeight * 0.25, // Responsive image size
              ),

              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06, // Responsive font size
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              CustomTextFormField(
                onChanged: (data) {
                  email = data;
                },
                hinttext: const Text('Email'),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextFormField(
                onChanged: (data) {
                  password = data;
                },
                obscureText: true,
                hinttext: const Text('Password'),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomButton(
                color: Colors.purple,
                text: "Log in",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginUser();
                      Navigator.pushReplacementNamed(
                          context, BottomNavigation.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'User not found');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      print(e);
                      showSnackBar(context, 'There was an error!');
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    child: Text(
                      '  Register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
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

  Future<void> loginUser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
