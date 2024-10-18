import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharyApp/models/cart_model.dart';
import 'package:sharyApp/screens/bottom_navigation_bar.dart';
import 'package:sharyApp/screens/cart_view.dart';
import 'package:sharyApp/screens/checkout_view.dart';
import 'package:sharyApp/screens/home_view.dart';
import 'package:sharyApp/screens/login_view.dart';
import 'package:sharyApp/screens/register_view.dart';
import 'package:sharyApp/screens/splash_screen.dart';
import 'package:sharyApp/screens/success_view.dart';
import 'package:sharyApp/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA5SzxPgPiVPffdZg9W8ZMiRlSC2VuTkwQ",
      appId: "1:368468542544:android:4a729525cf797f903d3d55",
      messagingSenderId: "368468542544",
      projectId: "shary-app-6aace",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ThemesProvider()), // Theme Provider
        ChangeNotifierProvider(create: (context) => Cart()), // Cart Provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemesProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          routes: {
            HomeView.id: (context) => HomeView(),
            SplashView.id: (context) => const SplashView(),
            LogInView.id: (context) => const LogInView(),
            RegisterView.id: (context) => const RegisterView(),
            CartView.id: (context) => const CartView(),
            PaymentView.id: (context) => const PaymentView(),
            BottomNavigation.id: (context) => const BottomNavigation(),
            SuccessView.id: (context) => const SuccessView(),
          },
          initialRoute: SplashView.id,
        );
      },
    );
  }
}
