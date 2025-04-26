// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:campusbite/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Welcome to CampusBite 😊',
      description:
          'Your go-to app for affordable, healthy & delicious meals on campus.',
      image: 'assets/onboarding1.png',
    ),
    OnboardingPage(
      title: 'Easy Ordering 🌟',
      description:
          'Skip queues, place orders, and enjoy quick delivery right to your lecture room.',
      image: 'assets/onboarding2.png',
    ),
    OnboardingPage(
      title: 'Lightning Fast Delivery',
      description: 'Get your meals in 30 minutes or less\nCrave. Order. Enjoy',
      image: 'assets/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),
          _buildIndicator(),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(page.image, height: 250),
          const SizedBox(height: 40),
          Text(
            page.title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            page.description,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 150,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            _pages.map((page) {
              int index = _pages.indexOf(page);
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentPage == index
                          ? AppColors.primary
                          : Colors.grey[300],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Positioned(
      bottom: 80,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (_currentPage < _pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
              child: Text(
                _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed:
                  () => Navigator.pushReplacementNamed(context, '/login'),
              child: Text('Skip', style: TextStyle(color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}
