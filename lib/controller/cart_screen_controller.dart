import 'package:hive_flutter/hive_flutter.dart';

import '../model/prodect_model.dart';

class CartController {
  var box = Hive.box<ProductModel>('cart');
  deleteItem({var ItemKey}) {
    box.delete(ItemKey);
  }

  incrementQuantity({required ProductModel product, required var itemKey}) {
    int qty = product.quatity;
    qty++;

    box.put(
        itemKey,
        ProductModel(
            productId: product.productId,
            title: product.title,
            des: product.des,
            image: product.image,
            price: product.price,
            quatity: qty));
  }

  decrementQuantity({required ProductModel product, required var itemKey}) {
    int qty = product.quatity;

    if (qty != 0) {
      qty--;
    }

    box.put(
      itemKey,
      ProductModel(
          productId: product.productId,
          title: product.title,
          des: product.des,
          image: product.image,
          price: product.price,
          quatity: qty),
    );
  }
}
