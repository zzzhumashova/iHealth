// import 'package:flutter/material.dart';
// import 'splash2.dart';

// class Splash1 extends StatefulWidget {
//   const Splash1({Key? key}) : super(key: key);

//   @override
//   _Splash1State createState() => _Splash1State();
// }

// class _Splash1State extends State<Splash1> {
//   @override
//   void initState() async {
//     super.initState();
//     await Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Splash2()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEDF6F6),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               child: Image.asset(
//                 'assets/img/icon.png',
//                 width: 150,
//                 height: 150,
//               ),
//             ),
//             const SizedBox(height: 200),
//             const Text(
//               'iHealth',
//               style: TextStyle(
//                 fontSize: 50,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFBBF2EF),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'splash2.dart';


class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Splash1State createState() => Splash1State();
}

class Splash1State extends State<Splash1> {
  @override
  void initState() async {
    super.initState();
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Splash2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF6F6),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                'assets/img/icon.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 200),
            const Text(
              'iHealth',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBBF2EF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

