import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noor_e_dua/home_screen.dart';
import 'package:noor_e_dua/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Ensure GetStorage is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool hasSeenIntro = box.read('intro_seen') ?? false;

    return GetMaterialApp(
      title: 'Noor e Dua',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: hasSeenIntro ? const HomeScreen() : const IntroScreen(),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}
