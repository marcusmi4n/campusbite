// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:campusbite/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 150),
            const SizedBox(height: 20),
            Text(
              'CampusBite',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text(
              'FOOD + DRINK',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
