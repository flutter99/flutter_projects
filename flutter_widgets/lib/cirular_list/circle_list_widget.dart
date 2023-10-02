import 'dart:math' as math;
import 'package:flutter/material.dart';

class CircularList extends StatelessWidget {
  final List<Widget> items;

  const CircularList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: List.generate(items.length, (index) {
        final angle = 2 * math.pi * (index / items.length);
        final radius = height * 0.16;
        final x = radius * math.cos(angle);
        final y = radius * math.sin(angle);
        return Positioned(
          left: x + 155, // center x
          top: y + 155, // center y
          child: items[index],
        );
      }),
    );
  }
}


class CircularListWidget extends StatefulWidget {
  const CircularListWidget({super.key});

  @override
  State<CircularListWidget> createState() => _CircularListWidgetState();
}

class _CircularListWidgetState extends State<CircularListWidget> {

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Circular List'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 600,
              width: width,
              child: CircularList(
                items: List.generate(
                  10,
                  (index) => Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
