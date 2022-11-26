import 'package:mais_verde/src/models/item_model.dart';

import '../models/cart_item_model.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';

ItemModel apple = ItemModel(
  description: "A melhor maça do Brasil",
  imgUrl: 'assets/fruits/apple.png',
  itemName: "Maça",
  price: 5.5,
  unit: "kg",
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
  'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
  'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
  'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
  'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
  'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Verduras',
  'Grãos',
  'Temperos',
  'Cereais'
];

List<CartItemModel> cartItems = [
CartItemModel(item: apple,quantity:1),
CartItemModel(item: mango,quantity: 2),
CartItemModel(item: grape, quantity: 3),
];

UserModel user = UserModel(name: 'mathsena', email: 'teste@teste.com', phone: '1197111112', cpf: '411111111', password: '');


List<OrderModel> orders = [
  OrderModel(
    copyAndPaste: 'q1w2w3s5d8e',
    createdDateTime: DateTime.parse('2022-11-08 10:00:10.458'),
    id: 'v789789d',
    overdueDateTime: DateTime.parse('2022-11-30 10:00:10.458'),
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      
    ], status: 'pending_payment', total: 11.0,
    
  ),

  OrderModel(
    copyAndPaste: 'q1w2w3s5d8e',
    createdDateTime: DateTime.parse('2022-11-08 10:00:10.458'),
    id: 'v789789d',
    overdueDateTime: DateTime.parse('2022-11-21 10:00:10.458'),
    items: [
      CartItemModel(
        item: mango,
        quantity: 5,
      ),

    ], status: 'delivered', total: 11.0,

  ),
  
];