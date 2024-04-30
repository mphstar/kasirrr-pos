import 'package:sarpras_app/models/cart_model.dart';

class TransaksiModel {
  int totalHarga;
  List<CartModel> listProduct;

  TransaksiModel({
    required this.listProduct,
    required this.totalHarga,
  });
}
