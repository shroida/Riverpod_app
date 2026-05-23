import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/providers/cart_provider.dart';
import 'package:riverpod_app/providers/products_provider.dart';
import 'package:riverpod_app/screens/shared/cart_icon.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder:(context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withValues(alpha: 0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 60, height: 60),
                  Text(allProducts[index].title),
                  Text('£${allProducts[index].price}'),
                  if(cartProducts.contains(allProducts[index]))
                    ElevatedButton(
                      onPressed: () => ref.read(cartProvider.notifier).removeFromCart(allProducts[index]),
                      child: const Text('Remove from Cart'),
                    )
                  else
                    ElevatedButton(
                      onPressed: () => ref.read(cartProvider.notifier).addToCart(allProducts[index]),
                      child: const Text('Add to Cart'),
                    )
                ]
              )
            );
          },
        ),
      ),
    );
  }
}