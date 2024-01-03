import 'package:flutter/material.dart';

class DiagnosticPage extends StatefulWidget {
  final String pageTitle;

  const DiagnosticPage
({Key? key, required this.pageTitle}) : super(key: key);

  @override
  DiagnosticPageState createState() => DiagnosticPageState();
}

class DiagnosticPageState extends State<DiagnosticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(
        child: Text('Это страница: ${widget.pageTitle}'),
      ),
    );
  }
}