import 'package:hive/hive.dart';

part 'prodect_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String des;
  @HiveField(2)
  String image;
  @HiveField(3)
  num price;
  @HiveField(4)
  bool isCarted;
  @HiveField(5)
  int productId;
  @HiveField(6)
  int quatity;

  ProductModel(
      {required this.productId,
      required this.title,
      required this.des,
      required this.image,
      required this.price,
      this.isCarted = false,
      this.quatity = 0});
}
