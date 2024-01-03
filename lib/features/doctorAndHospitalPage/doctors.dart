import 'package:flutter/material.dart';

class DoctorsPage extends StatefulWidget {
  final String pageTitle;

  const DoctorsPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  DoctorsPageState createState() => DoctorsPageState();
}

class DoctorsPageState extends State<DoctorsPage> {
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