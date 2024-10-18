import 'package:flutter/material.dart';
import 'package:sharyApp/models/product_model.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.product,
    required this.icon,
    required this.onTap,
  });
  ProductModel product;
  Icon icon;
  VoidCallback onTap;

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
                  Text(
                    product.title.substring(0, 10),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${product.price.toString()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: icon,
                        onPressed: onTap,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          top: -70,
          child: Image.network(
            product.image,
            height: 90,
            width: 90,
          ),
        ),
      ],
    );
  }
}
