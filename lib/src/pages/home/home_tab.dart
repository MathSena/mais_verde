import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../config/app_data.dart' as app_data;
import 'components/category_tile.dart';
import 'components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text.rich(TextSpan(
              style: TextStyle(
                fontSize: 30,
              ),
              children: [TextSpan(text: 'Green'), TextSpan(text: 'Grocer')])),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Badge(
                    badgeColor: Colors.red,
                    badgeContent: const Text('1',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    child: const Icon(
                      Icons.shopping_cart,
                    )),
              ),
            )
          ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui...',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.red, size: 21),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )))),
        ),
        Container(
          padding: const EdgeInsets.only(left: 25),
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return CategoryTile(
                onPressed: () {
                  setState(() {
                    selectedCategory = app_data.categories[index];
                  });
                },
                category: app_data.categories[index],
                isSelected: app_data.categories[index] == selectedCategory,
              );
            },
            separatorBuilder: (_, index) => const SizedBox(width: 10),
            itemCount: app_data.categories.length,
          ),
        ),
        
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2, 
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            childAspectRatio:9/11.5,),
          
          itemCount: app_data.items.length,
          itemBuilder: (_, index){
              return ItemTile(
                item: app_data.items[index],
              );
          },
          ),
        ),
      ],
      
      ),
    );
  }
}
