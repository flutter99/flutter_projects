import 'package:flutter/material.dart';
import 'package:flutter_widgets/calculator/providers/calculator_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/circle_button_widget.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final List<String> texts = [
    'AC',
    'DC',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '00',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: calculatorProvider.isDarkTheme
          ? const Color(0xff121212)
          : Colors.white,

      appBar: AppBar(
        backgroundColor: calculatorProvider.isDarkTheme
            ? const Color(0xff121212)
            : Colors.white,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Calculator',
          style: GoogleFonts.dmSans(
            fontSize: 30,
            color: calculatorProvider.isDarkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              calculatorProvider.isDarkTheme
                  ? Icons.brightness_2_rounded
                  : Icons.brightness_7_rounded,
              color:
                  calculatorProvider.isDarkTheme ? Colors.white : Colors.black,
            ),
            onPressed: () {
              calculatorProvider.toggleTheme();
            },
          ),
        ],
      ),

      /// body
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: calculatorProvider.isDarkTheme
                ? const Color(0xff121212)
                : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  calculatorProvider.display,
                  style: TextStyle(
                    fontSize: height * 0.08,
                    color: calculatorProvider.isDarkTheme
                        ? Colors.white
                        : const Color(0xff121212),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Column(
                children: _buildGrid(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGrid(context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    List<Widget> rows = [];
    for (int i = 0; i < texts.length; i += 4) {
      List<Widget> items = [];
      for (int j = i; j < i + 4 && j < texts.length; j++) {
        items.add(
          CircleButtonWidget(
            btnText: texts[j],
            btnTextColor: calculatorProvider.getButtonTextColor(
                texts[j], calculatorProvider.isDarkTheme),
            onTap: () {
              calculatorProvider.handleButtonPress(texts[j]);
            },
          ),
        );
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      );
    }
    return rows;
  }
}
