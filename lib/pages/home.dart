// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarpras_app/models/cart_model.dart';
import 'package:sarpras_app/components/drawer.dart';
import 'package:sarpras_app/providers/home_provider.dart';

import '../components/card_item.dart';
import '../components/top_bar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController search = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).fetchProduct();
    });


    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              children: [
                TopBar(
                  leftIcon: IconButton(
                    onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                    ),
                  ),
                  title: "Pesanan Baru",
                  rightIcon: IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                    icon: Consumer<HomeProvider>(
                      builder: (context, model, child) {
                        return Badge(
                          isLabelVisible: model.transaksi.listProduct.isEmpty
                              ? false
                              : true,
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                TextField(
                  controller: search,
                  onSubmitted: (value) {},
                  onChanged: (value) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .setQuerySearch(search: value);
                  },
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: Consumer<HomeProvider>(
                        builder: (context, model, child) {
                          if (model.querySearch != '') {
                            return IconButton(
                              onPressed: () {
                                search.text = '';
                                Provider.of<HomeProvider>(context,
                                        listen: false)
                                    .setQuerySearch(search: '');
                              },
                              icon: const Icon(
                                Icons.cancel,
                                size: 14,
                              ),
                            );
                          }

                          return const Opacity(opacity: 0);
                        },
                      ),
                      hintText: "Cari Produk...",
                      labelStyle: const TextStyle(
                        fontFamily: 'Poppins',
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFFB7B7B7),
                      ),
                      border: InputBorder.none),
                ),
                Expanded(
                  child: Consumer<HomeProvider>(
                    builder: (context, model, child) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actionsAlignment: MainAxisAlignment.end,
                                        backgroundColor: Color(0xFFFFFFFF),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        title: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Tambahkan",
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: Icon(Icons.cancel))
                                          ],
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Produk",
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFF1F1F1),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const TextField(
                                                  readOnly: true,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                  decoration: InputDecoration(
                                                      labelStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                      hintStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFFB7B7B7),
                                                      ),
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                "Jumlah",
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color:
                                                        const Color(0xFFD0D0D0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                  decoration: InputDecoration(
                                                      labelStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                      hintStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFFB7B7B7),
                                                      ),
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Harga",
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Color(0xFF389D42),
                                            elevation: 0,
                                            textColor: Colors.white,
                                            child: Text("Simpan"),
                                          )
                                        ],
                                      );
                                    });

                                // model.addToCart(
                                //   CartModel(
                                //     product: model.dataProduct.elementAt(index),
                                //     qty: 1,
                                //     subtotal: model.dataProduct
                                //         .elementAt(index)
                                //         .harga,
                                //   ),
                                //   context,
                                // );
                              },
                              child: CardItem(
                                product: model.dataProduct.elementAt(index),
                              ),
                            ),
                          );
                        },
                        itemCount: model.dataProduct.length,
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
