import 'package:flutter/material.dart';
import 'cash_back_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin nhận hoàn tiền', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.angleLeft),
            onPressed: () {
              // Handle back button press
            },
          ),
          elevation: 1,
          shadowColor: Colors.grey.withValues(alpha: 0.5),
        ),
        body: CashBackWidget(),
      ),
    );
  }
}
