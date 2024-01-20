// import 'package:flutter/material.dart';
// import 'package:ihealthapp/common_widgets/build_text.dart';
// import 'package:ihealthapp/features/diagnosticPage/symptoms.dart';

// class DiagnosticPage extends StatefulWidget {
//   final String pageTitle;

//   const DiagnosticPage({Key? key, required this.pageTitle}) : super(key: key);

//   @override
//   DiagnosticPageState createState() => DiagnosticPageState();
// }

// class DiagnosticPageState extends State<DiagnosticPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         flexibleSpace: const FlexibleSpaceBar(
//           titlePadding: EdgeInsets.only(top: 20),
//           title: BuildCustomText(
//             text: 'Диагностика',
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               height: 10,
//             ),
//             const BuildCustomText(
//               text: 'Выберите участок тела где есть симптомы',
//               fontWeight: FontWeight.w500,
//             ),
//             InteractiveViewer(
//               panEnabled: false,
//               boundaryMargin: const EdgeInsets.all(80),
//               minScale: 1.0,
//               maxScale: 4.0,
//               child: LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   return AspectRatio(
//                     aspectRatio: 2.5 / 3,
//                     child: Image.asset(
//                       'assets/img/anatomy.gif',
//                       width: constraints.maxWidth,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Text(
//               'Диагностика ${widget.pageTitle} части тела',
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(
//               height: 40,
//               width: 300,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             const SymptomsPage(pageTitle: 'Укажите симптомы')),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromRGBO(187, 242, 239, 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//                 child: const BuildCustomText(
//                   text: 'Выбрать',
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ihealthapp/common_widgets/build_text.dart';
import 'package:ihealthapp/features/diagnosticPage/symptoms.dart';

class DiagnosticPage extends StatefulWidget {
  final String pageTitle;

  const DiagnosticPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  DiagnosticPageState createState() => DiagnosticPageState();
}

class DiagnosticPageState extends State<DiagnosticPage> {
  Map<String, bool> selectedParts = {};

  void _toggleSelection(String bodyPart) {
    setState(() {
      selectedParts[bodyPart] = !(selectedParts[bodyPart] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> selectedPartsList = selectedParts.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    String selectedPartsText = selectedPartsList.join(', ');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(top: 20),
          title: BuildCustomText(
            text: 'Диагностика',
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            const BuildCustomText(
              text: 'Выберите участок тела где есть симптомы',
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: InteractiveViewer(
                panEnabled: false,
                boundaryMargin: const EdgeInsets.all(80),
                minScale: 1.0,
                maxScale: 4.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                        'assets/img/anatomy.gif'), // Путь к вашему изображению
                    ..._createBodyPartButtons(),
                  ],
                ),
              ),
            ),
            Text(
              'Диагностика части тела: ${selectedPartsText.isEmpty ? widget.pageTitle : selectedPartsText}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SymptomsPage(pageTitle: 'Укажите симптомы'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(187, 242, 239, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const BuildCustomText(
                  text: 'Выбрать',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createBodyPartButtons() {
    // Определите координаты для каждой части тела на изображении
    // Значения Offset будут зависеть от размера изображения и могут потребовать настройки
    var bodyPartsOffsets = {
      'Голова': const Offset(0.3, 0.05),
      'Руки': const Offset(0.1, 0.3),
      // Добавьте другие части тела с их координатами
      // 'Левая рука': Offset(...),
      // 'Правая рука': Offset(...),
      // ...
    };

    List<Widget> buttons = [];
    bodyPartsOffsets.forEach((bodyPart, offset) {
      buttons.add(
        Positioned(
          left: offset.dx * MediaQuery.of(context).size.width,
          top: offset.dy * MediaQuery.of(context).size.height,
          child: InkWell(
            onTap: () => _toggleSelection(bodyPart),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: selectedParts[bodyPart] ?? false
                    ? Colors.green
                    : Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                selectedParts[bodyPart] ?? false ? Icons.check : Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      );
    });

    return buttons;
  }
}
