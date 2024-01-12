import 'package:flutter/material.dart';
import 'progress_bar.dart'; // Make sure the ProgressBar widget is defined in this import

class UniversalSplashScreen extends StatelessWidget {
  final String backgroundImage;
  final String text;
  final VoidCallback onNavigateForward;
  final int currentPage;
  final int totalPages;

  const UniversalSplashScreen({
    Key? key,
    required this.backgroundImage,
    required this.text,
    required this.onNavigateForward,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = (screenWidth / totalPages) - 10;

    return Scaffold(
      body: Stack(
        children: [
          // Image as the background, covering the entire screen
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit
                  .cover, // Ensures the image covers the screen without distortion
            ),
          ),
          // Gradient overlay on the image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3), // Slightly dark at the top
                    Colors.transparent, // Transparent in the middle
                    Colors.black.withOpacity(
                        0.7), // Darker at the bottom to highlight the text
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.5, 1.0], // Stops for gradient effect
                ),
              ),
            ),
          ),
          // Progress bar indicating the current page
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: ProgressBar(
              currentPage: currentPage,
              pageCount: totalPages,
              barWidth: barWidth, // Width for each segment of the progress bar
            ),
          ),
          // Text widget positioned at the bottom of the screen
          Positioned(
            bottom: 150,
            left: 20,
            right: 20,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors
                    .white, // White color for text to be visible on dark gradient
              ),
            ),
          ),
          // Floating action button positioned at the bottom of the screen
          Positioned(
            left: 150,
            right: 150,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: onNavigateForward, // Callback при нажатии на кнопку
              backgroundColor: const Color(0xFFBBF2EF), // Иконка внутри кнопки
              // ignore: prefer_const_constructors
              shape: CircleBorder(), // Цвет фона кнопки
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
