import 'package:flutter/material.dart';
import 'package:sharyApp/models/product_model.dart';

// ignore: must_be_immutable
class TestCustomCard extends StatelessWidget {
  TestCustomCard({
    super.key,
    required this.product,
    required this.icon,
    required this.onTap,
  });

  final ProductModel product;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Colors.purple.withOpacity(.4),
            spreadRadius: 20,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: icon,
                    onPressed: onTap,
                    iconSize: screenWidth * 0.06,
                  ),
                  Text(
                    r'$' '${product.price.toString()}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Image.network(
                product.image,
                height: screenHeight * 0.20,
                width: screenWidth * 0.35,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                product.title.length > 10
                    ? product.title.substring(0, 10) + '...'
                    : product.title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.045,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
