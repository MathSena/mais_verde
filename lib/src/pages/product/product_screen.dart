import 'package:flutter/material.dart';

import '../../models/item_model.dart';
import '../../services/utils_services.dart';
import '../common_widgets/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
    required this.item,
  }) : super(
          key: key,
        );

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(tag: widget.item.imgUrl, child: Image.asset(widget.item.imgUrl)),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.item.itemName,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: QuantityWidget(
                                    suffixText: widget.item.unit,
                                    value: cartItemQuantity,
                                    result: (quantity) {
                                      setState(() {
                                        cartItemQuantity = quantity;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            Text(utilsServices.priceToCurrency(widget.item.price),
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                )),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SingleChildScrollView(
                                  child: Text(widget.item.description,
                                      style: const TextStyle(height: 1.5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                                  onPressed: () {},
                                  label: const Text('Adicionar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  )),
                            )
                          ])))
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ))),
          )
        ],
      ),
    );
  }
}
