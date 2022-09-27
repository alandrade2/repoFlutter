import 'package:flutter/material.dart';
import './screens/onboarding.dart';

class Bank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DashBoards",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Onboarding(),
    );
  }
}
