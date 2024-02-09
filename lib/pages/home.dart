// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarpras_app/providers/home_provider.dart';

import '../components/card_item.dart';
import '../components/top_bar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              children: [
                TopBar(
                    leftIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                      ),
                    ),
                    title: "Pesanan Baru",
                    rightIcon: search.text != ''
                        ? IconButton(
                            onPressed: () {},
                            icon: const Badge(
                              child: Icon(
                                Icons.shopping_cart_outlined,
                              ),
                            ),
                          )
                        : Container()),
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
                  child: ListView.builder(
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
                          },
                          child: const CardItem(),
                        ),
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
