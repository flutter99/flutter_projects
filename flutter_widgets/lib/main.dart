import 'package:flutter/material.dart';
import 'package:flutter_widgets/calculator/calculator_widget.dart';
import 'package:flutter_widgets/calculator/providers/calculator_provider.dart';
import 'package:flutter_widgets/cirular_list/circle_list_widget.dart';
import 'package:flutter_widgets/cirular_list/circular_animated_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const CircularListWidget(),
        //home: MyCircularListWidget(),
        home: CalculatorWidget(),
      ),
    );
  }
}
