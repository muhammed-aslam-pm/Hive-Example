import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_24_11/controller/cart_screen_controller.dart';
import 'package:test_24_11/model/prodect_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List cartItems = [];
  var box = Hive.box<ProductModel>('cart');

  @override
  void initState() {
    // TODO: implement initState
    cartItems = box.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My cart",
        ),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      box.get(cartItems[index])!.image),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              box.get(cartItems[index])!.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              box.get(cartItems[index])!.price.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              CartController()
                                  .deleteItem(ItemKey: cartItems[index]);
                              cartItems = box.keys.toList();
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  CartController().decrementQuantity(
                                      product: box.get(cartItems[index])!,
                                      itemKey: cartItems[index]);
                                  setState(() {});
                                },
                                icon: Icon(Icons.remove)),
                            Text(
                              box.get(cartItems[index])!.quatity.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                                onPressed: () {
                                  CartController().incrementQuantity(
                                      product: box.get(cartItems[index])!,
                                      itemKey: cartItems[index]);
                                  setState(() {});
                                },
                                icon: Icon(Icons.add)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: 20,
                ),
            itemCount: cartItems.length),
      ),
    );
  }
}
