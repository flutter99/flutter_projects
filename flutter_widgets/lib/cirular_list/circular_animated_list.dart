import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyCircularList extends StatelessWidget {
  final List<Widget> items;
  final Animation<double> animation;

  const MyCircularList({
    Key? key,
    required this.animation,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: List.generate(10, (index) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final angle = 2 * math.pi * (index / 10) + (2 * math.pi * animation.value);
            final radius = height * 0.16;
            final x = radius * math.cos(angle);
            final y = radius * math.sin(angle);
            return Positioned(
              left: x + 155,
              top: y + 155,
              child: child!,
            );
          },
          child: items[index],
        );
      }),
    );
  }
}


class MyCircularListWidget extends StatefulWidget {
  const MyCircularListWidget({super.key});

  @override
  State<MyCircularListWidget> createState() => _MyCircularListWidgetState();
}

class _MyCircularListWidgetState extends State<MyCircularListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.repeat();
      } else if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();

  }

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
              child: MyCircularList(
                animation: animation,
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
