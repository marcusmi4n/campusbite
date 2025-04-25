import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          OnboardingPage(
            image: 'assets/onboarding1.json',
            title: "Easy Campus Delivery",
            description: "We deliver your favorite meals on time.",
          ),
          OnboardingPage(
            image: 'assets/onboarding2.json',
            title: "Track Your Order",
            description: "Stay updated with live tracking.",
          ),
          OnboardingPage(
            image: 'assets/onboarding3.json',
            title: "Earn Discounts",
            description: "Refer friends and enjoy student deals!",
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Use Lottie.asset(image) if using Lottie
          Container(
            height: 300,
            width: 300,
            color: Colors.grey.shade200, // Placeholder for Lottie
            child: Center(child: Text("Lottie: $image")),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C663B),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
