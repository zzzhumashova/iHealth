import 'package:flutter/material.dart';

class HealthImprove extends StatefulWidget {
  final String pageTitle;

  const HealthImprove({Key? key, required this.pageTitle}) : super(key: key);

  @override
  HealthImproveState createState() => HealthImproveState();
}

class HealthImproveState extends State<HealthImprove> {
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