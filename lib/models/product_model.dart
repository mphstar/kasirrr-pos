import 'package:sarpras_app/models/kategori_model.dart';

class ProductModel {
  int id;
  String name;
  KategoriModel kategori;
  int stok;
  int harga;
  String pathGambar;

  ProductModel({
    required this.name,
    required this.kategori,
    required this.stok,
    required this.harga,
    required this.pathGambar,
    required this.id,
  });
}
