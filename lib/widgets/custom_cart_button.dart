import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCartCard extends StatelessWidget {
  CustomCartCard({
    super.key,
    required this.title,
    required this.icon,
    required this.image,
  });
  String title;
  IconButton icon;
  String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 20,
              offset: const Offset(1, 1),
            )
          ]),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      title.substring(0, 10),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: icon,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: -80,
          child: Image.network(
            image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
