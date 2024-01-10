import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final String pageTitle;

  const SignUpPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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