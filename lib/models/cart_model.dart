import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_gradle_app/models/product_model.dart';

class Cart with ChangeNotifier {
  final List<ProductModel> _items = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  double _totalPrice = 0.0;

  void add(ProductModel item) async {
    _items.add(item);
    _totalPrice += item.price;

    await _firestore.collection('carts').add({
      'title': item.title,
      'price': item.price,
      'image': item.image,
    });

    notifyListeners();
  }

  Future<void> remove(ProductModel item) async {
    final cartItems = await _firestore
        .collection('carts')
        .where('title', isEqualTo: item.title)
        .where('price', isEqualTo: item.price)
        .where('image', isEqualTo: item.image)
        .get();

    if (cartItems.docs.isNotEmpty) {
      await _firestore
          .collection('carts')
          .doc(cartItems.docs.first.id)
          .delete();
    }

    _items.remove(item);
    _totalPrice -= item.price;

    notifyListeners();
  }

  Future<void> fetchCartItems() async {
    final cartItems = await _firestore.collection('carts').get();

    _items.clear();
    _totalPrice = 0.0;

    for (var item in cartItems.docs) {
      _items.add(
        ProductModel(
          title: item['title'],
          price: item['price'],
          image: item['image'],
        ),
      );
      _totalPrice += item['price'];
    }

    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<ProductModel> get basketItem {
    return _items;
  }
}
