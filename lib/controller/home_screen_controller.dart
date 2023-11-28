import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_24_11/model/prodect_model.dart';

class ProductController {
  void addToCart(ProductModel product) {
    var box = Hive.openBox('cartBox');
  }
}
