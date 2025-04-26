// lib/main.dart
import 'package:flutter/material.dart';
import 'package:campusbite/app/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campusbite/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CampusBiteApp());
}

class CampusBiteApp extends StatelessWidget {
  const CampusBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusBite',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(primary: AppColors.primary),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
