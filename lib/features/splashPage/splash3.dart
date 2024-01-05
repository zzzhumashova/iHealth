import 'package:flutter/material.dart';
import 'package:ihealthapp/features/splashPage/splash4.dart';
import 'progress_bar.dart'; 

class Splash3 extends StatelessWidget {
  const Splash3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/image3.png', 
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
              currentPage: 1,
              pageCount: 3,
              barWidth: MediaQuery.of(context).size.width / 3 - 10,
            ),
          ),
          const Positioned(
            bottom: 150,
            left: 20,
            right: 0,
            child: Text(
              'Ваш путь к здоровью начинается здесь',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, 
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Splash4()));
              },
              backgroundColor: const Color(0xFFBBF2EF),
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
