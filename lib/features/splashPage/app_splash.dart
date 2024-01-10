import 'package:flutter/material.dart';
import 'package:ihealthapp/features/authentification/signup.dart';
import 'package:ihealthapp/features/splashPage/universal_splash.dart'; 


class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UniversalSplashScreen(
      backgroundImage: 'assets/img/image.png',
      text: 'Начни заботиться о своем здоровье сейчас',
      currentPage: 0,
      totalPages: 3,
      onNavigateForward: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ThirdSplashScreen()));
      },
    );
  }
}

class ThirdSplashScreen extends StatelessWidget {
  const ThirdSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UniversalSplashScreen(
      backgroundImage: 'assets/img/image2.png',
      text: 'Ваш путь к здоровью начинается здесь',
      currentPage: 1,
      totalPages: 3,
      onNavigateForward: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FourthSplashScreen()));
      },
    );
  }
}

class FourthSplashScreen extends StatelessWidget {
  const FourthSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UniversalSplashScreen(
      backgroundImage: 'assets/img/image3.png',
      text: 'Здоровое сообщество начинается с вас',
      currentPage: 2,
      totalPages: 3,
      onNavigateForward: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignUpPage(pageTitle: 'Sign Up bolady',)));
      },
    );
  }
}