import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {

  @override
  Set<Product> build() {
    return {};
  }

  void addToCart(Product product) {
    state = {...state, product};
  }

  void removeFromCart(Product product) {
    state = {...state}..remove(product);
  }
}