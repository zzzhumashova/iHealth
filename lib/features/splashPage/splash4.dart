import 'package:flutter/material.dart';
import 'package:ihealthapp/features/splashPage/progress_bar.dart';

class Splash4 extends StatelessWidget {
  const Splash4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/image2.png', 
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: ProgressBar(
              currentPage: 2, 
              pageCount: 3,
              barWidth: MediaQuery.of(context).size.width / 3 - 10,
            ),
          ),
          const Positioned(
            bottom: 200,
            left: 20,
            right: 0,
            child: Text(
              'Здоровое сообщество начинается с вас',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 120, 
            child: ElevatedButton(
              onPressed: () {
                // RegistrationScreen
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBBF2EF), 
                foregroundColor: Colors.white, // используйте 'foregroundColor' вместо 'primary'
                minimumSize: const Size(double.infinity, 60), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), 
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
              ),
              child: const Text('Get Started'),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 60, 
            child: TextButton(
              onPressed: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              style: TextButton.styleFrom(
                 foregroundColor: const Color(0xFFBBF2EF), 
              ),
              child: const Text('У вас уже есть аккаунт? Войти'),
            ),
          ),
        ],
      ),
    );
  }
}



