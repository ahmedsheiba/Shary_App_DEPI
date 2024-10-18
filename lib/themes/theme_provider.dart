import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharyApp/themes/themes.dart';

class ThemesProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemesProvider() {
    _loadTheme(); // Load the theme state when the provider is initialized
  }

  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;

  void toggleTheme() async {
    isDarkMode = !isDarkMode;
    notifyListeners();
    await _saveTheme(); // Save the theme state to Firebase
  }

  Future<void> _saveTheme() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('your_user_id') // Use proper user authentication if needed
          .set({
        'isDarkMode': isDarkMode,
      });
    } catch (e) {
      print('Error saving theme: $e');
    }
  }

  Future<void> _loadTheme() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc('your_user_id') // Use proper user authentication if needed
          .get();

      if (doc.exists) {
        isDarkMode = doc['isDarkMode'] ?? false;
        notifyListeners(); // Notify the UI that the theme state has changed
      }
    } catch (e) {
      print('Error loading theme: $e');
    }
  }
}
