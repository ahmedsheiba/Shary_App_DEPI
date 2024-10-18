import 'package:flutter/material.dart';
import 'package:sharyApp/screens/bottom_navigation_bar.dart';
import 'package:sharyApp/widgets/custum_button.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});
  static String id = 'SuccessView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/success.png')),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Success',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your payment was done successfully',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, BottomNavigation.id);
                  },
                  child: CustomButton(color: Colors.purple, text: 'Ok')),
            ],
          ),
        ),
      ),
    );
  }
}
