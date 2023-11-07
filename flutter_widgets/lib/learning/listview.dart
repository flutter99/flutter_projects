import 'package:flutter/material.dart';


class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List titles = [
      'Ali',
      'Usama',
      'Ahmad',
      'Hassan',
      'Hamza',
      'Ahmad',
    ];

    List subTitle = [
      'subtitle 1',
      'subtitle 2',
      'subtitle 3',
      'subtitle 4',
      'subtitle 5',
      'subtitle 6',
    ];
    return ListView.builder(
      itemCount: titles.length,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                titles[index],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subTitle[index],
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
