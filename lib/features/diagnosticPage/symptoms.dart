import 'package:flutter/material.dart';

class SymptomsPage extends StatefulWidget {
  final String pageTitle;

  const SymptomsPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  SymptomsPageState createState() => SymptomsPageState();
}

class SymptomsPageState extends State<SymptomsPage> {
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