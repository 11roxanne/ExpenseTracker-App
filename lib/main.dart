import 'package:flutter/material.dart';
import 'Expense.dart';
import 'package:flutter/services.dart';  //To lock the orientation of the screen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn){
    runApp(
      const MaterialApp(
        home:Expense(),
      ),
    );
  }
  );
}