import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_manager/Utilities/theme.dart';
import 'package:restaurant_manager/home/homepage.dart';

void main() {
  runApp(const ManagerApp());
}

class ManagerApp extends StatelessWidget {
  const ManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant Manager',
        theme: appTheme,
        home: const HomePage(),
      ),
    );
  }
}

class AppProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
