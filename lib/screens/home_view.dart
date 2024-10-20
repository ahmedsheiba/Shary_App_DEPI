import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sharyApp/models/cart_model.dart';
import 'package:sharyApp/models/product_model.dart';
import 'package:sharyApp/screens/cart_view.dart';
import 'package:sharyApp/screens/login_view.dart';
import 'package:sharyApp/service/get_all_products_services.dart';
import 'package:sharyApp/widgets/Custom_card_home.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  static String id = 'HomePage';
  List<ProductModel> items = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacementNamed(context, LogInView.id);
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 43, 26, 68),
              Color.fromARGB(255, 107, 64, 113),
              Color.fromARGB(255, 179, 152, 184),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartView()));
                },
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text(
                      '${cart.count}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 0,
        title: Text(
          'S H A R Y',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.03,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;

              // Adjust the crossAxisCount and childAspectRatio dynamically based on screen size
              return LayoutBuilder(
                builder: (context, constraints) {
                  // Determine childAspectRatio dynamically
                  double childAspectRatio =
                      (screenWidth / 2) / (screenHeight / 2.5);

                  return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth < 600 ? 2 : 3,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: screenWidth * 0.02,
                      mainAxisSpacing: screenHeight * 0.03,
                    ),
                    itemBuilder: (context, index) {
                      return Consumer<Cart>(
                        builder: (context, cart, child) {
                          return TestCustomCard(
                            icon: const Icon(Icons.shopping_basket_rounded),
                            onTap: () {
                              cart.add(products[index]);
                            },
                            product: products[index],
                          );
                        },
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
