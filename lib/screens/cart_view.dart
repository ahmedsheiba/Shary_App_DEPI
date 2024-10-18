import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharyApp/models/cart_model.dart';
import 'package:sharyApp/screens/checkout_view.dart';
import 'package:sharyApp/widgets/custum_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static String id = 'CartView';

  @override
  Widget build(BuildContext context) {
    Provider.of<Cart>(context, listen: false).fetchCartItems();

    return Scaffold(
      appBar: AppBar(
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
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Cart',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.basketItem.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/empty_cart.png'),
                  const Text(
                    'There are no products in your cart.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cart.basketItem.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 50,
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 20,
                              offset: const Offset(1, 1),
                            )
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  cart.basketItem[index].image,
                                ),
                              ),
                              title: Text(cart.basketItem[index].title
                                  .substring(0, 10)),
                              trailing: IconButton(
                                onPressed: () {
                                  cart.remove(cart.basketItem[index]);
                                },
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, PaymentView.id);
                  },
                  color: const Color.fromARGB(255, 43, 26, 68),
                  text: 'Checkout : ${cart.totalPrice.toStringAsFixed(3)} \$',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
