import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_24_11/model/prodect_model.dart';
import 'package:hive/hive.dart';

class ProductController {
  var box = Hive.box<ProductModel>('cart');
  addToCart(ProductModel product) async {
    await box.add(product);
  }
}
