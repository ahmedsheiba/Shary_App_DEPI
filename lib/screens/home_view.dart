import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sharyApp/models/cart_model.dart';
import 'package:sharyApp/models/product_model.dart';
import 'package:sharyApp/screens/cart_view.dart';
import 'package:sharyApp/screens/login_view.dart';
import 'package:sharyApp/service/get_all_products_services.dart';
import 'package:sharyApp/widgets/custom_card.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  static String id = 'HomePage';
  List<ProductModel> items = [];
  @override
  Widget build(BuildContext context) {
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
                  Color.fromARGB(255, 179, 152, 184)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
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
                    icon: const Icon(FontAwesomeIcons.cartPlus,
                        color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text(
                        '${cart.count}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'S H A R Y ',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductServices().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 68,
                    ),
                    itemBuilder: (context, index) {
                      return Consumer<Cart>(builder: (context, cart, child) {
                        return CustomCard(
                          icon: const Icon(Icons.add),
                          onTap: () {
                            cart.add(products[index]);
                          },
                          product: products[index],
                        );
                      });
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
