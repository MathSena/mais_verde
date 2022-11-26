// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mais_verde/src/pages/cart/components/cart_tile.dart';
import '../../models/cart_item_model.dart';
import '../../services/utils_services.dart';
import '../../config/app_data.dart' as app_data;
import '../common_widgets/payment_dialog.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilServices = UtilsServices();

  // ignore: non_constant_identifier_names
  void RemoveItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);

      utilServices.showToast(message: "${cartItem.item.itemName} removido!", isError: true);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: app_data.cartItems.length,
                itemBuilder: (_, index) {
                  return CartTile(
                    cartItem: app_data.cartItems[index],
                    remove: RemoveItemFromCart,
                  );
                })),
        Container(
            padding: const EdgeInsets.all(16),
            height: 150,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Total Geral: ',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                  Text(
                    utilServices.priceToCurrency(cartTotalPrice()),
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () async {
                          bool? result =  showOrderConfirmation() as bool?;

                          if(result ?? false) {

                          }
                        },
                        child: const Text(
                          'Concluir Pedido',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ))
                ]))
      ]),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }


}
