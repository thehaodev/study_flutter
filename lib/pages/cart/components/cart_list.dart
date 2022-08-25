import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/pages/cart/components/cart_item.dart';
import 'package:ecommerce_app/pages/cart/data/cart_state.dart';
import 'package:ecommerce_app/pages/production/production_page.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
    required this.onPressedRemoveButton,
    required this.onPressedAddButton,
  }) : super(key: key);

  final Function(int) onPressedRemoveButton;
  final Function(int) onPressedAddButton;

  @override
  Widget build(BuildContext context) {
    int itemCount = cartState.cartList.length;
    return itemCount == 0
        ? const Center(
            child: CustomText(
              text: 'Empty Cart. Go buy some stuff',
              textColor: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              size: 32,
              textAlign: TextAlign.center,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                CartItemModel cartItem = cartState.cartList.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CartItem(
                    onPressedItem: () {
                      Navigator.of(context).pushNamed(
                        ProductionPage.routeName,
                        arguments: cartItem.product,
                      );
                    },
                    productImage: cartItem.product.image,
                    productName: cartItem.product.name,
                    productSize: cartItem.product.size,
                    productPrice: cartItem.product.currentPrice,
                    onPressedRemoveButton: (index) =>
                        onPressedRemoveButton(index),
                    productCount: cartItem.count,
                    onPressedAddButton: (index) => onPressedAddButton(index),
                  ),
                );
              },
            ),
          );
  }
}
