import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';

class CircleButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  final Color? btnTextColor;

  const CircleButtonWidget({
    super.key,
    required this.btnText,
    required this.onTap,
    required this.btnTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.transparent,
        child: Container(
          height: height * 0.09,
          width: height * 0.09,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: calculatorProvider.isDarkTheme
                ? Colors.black87 : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Text(
              btnText,
              style: GoogleFonts.dmSans(
                fontSize: height * 0.03,
                color: btnTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
