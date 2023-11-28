import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_24_11/controller/home_screen_controller.dart';
import 'package:test_24_11/view/cart_screen/cart_screen.dart';
import 'package:test_24_11/view/utils/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var box = Hive.box('cart');
  // List<int> selectedIndexes = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   selectedIndexes = box.get("indexes");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Collection",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Trending",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Top Selling",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 260,
              ),
              itemBuilder: (context, index) => Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(Database.products[index].image),
                              fit: BoxFit.cover)),
                      height: 190,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                // if (selectedIndexes.contains(index)) {
                                //   selectedIndexes.remove(index);
                                //   box.put("indexes", selectedIndexes);
                                // } else {
                                //   selectedIndexes.add(index);
                                //   box.put("indexes", selectedIndexes);
                                // }
                                // print(box.get("indexes"));
                                ProductController()
                                    .addToCart(Database.products[index]);
                                setState(() {});
                              },
                              icon:
                                  //  selectedIndexes.contains(index)
                                  //     ? Icon(Icons.favorite)
                                  //     : Icon(Icons.favorite_border)
                                  Icon(Icons.favorite))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Database.products[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Database.products[index].price.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              itemCount: Database.products.length,
            ),
          )
        ],
      ),
    );
  }
}
