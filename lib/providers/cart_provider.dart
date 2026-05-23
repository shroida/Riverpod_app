import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {

  @override
  Set<Product> build() {
    return {
      Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'assets/products/shorts.png'),
    };
  }

  void addToCart(Product product) {
    state = {...state, product};
  }

  void removeFromCart(Product product) {
    state = {...state}..remove(product);
  }
}

final cartProvider = NotifierProvider<CartNotifier, Set<Product>>(() => CartNotifier());