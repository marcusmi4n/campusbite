import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campusbite/screens/main_app/home_screen.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/order_success.json',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 32),
            Text(
              'Your order has been successfully placed!',
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Sit and relax while your order is being prepared. '
              'It\'ll take about 5-10 minutes before you get it.',
              style: GoogleFonts.quicksand(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              onPressed:
                  () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  ),
              child: Text(
                'Go back to home',
                style: GoogleFonts.quicksand(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
