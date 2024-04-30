import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarpras_app/components/card_item_cart.dart';
import 'package:sarpras_app/components/top_bar.dart';
import 'package:sarpras_app/providers/home_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 33,
          ),
          child: Column(
            children: [
              TopBar(
                leftIcon: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                title: "Keranjang",
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Consumer<HomeProvider>(
                  builder: (context, model, child) {
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CardItemCart(
                            item: model.transaksi.listProduct.elementAt(index),
                          ),
                        );
                      },
                      itemCount: model.transaksi.listProduct.length,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Tagihan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                            ),
                          ),
                          Consumer<HomeProvider>(
                            builder: (context, model, child) {
                              return Text(
                                "Rp. ${model.transaksi.totalHarga}",
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF389D42),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      color: const Color(0xFF389D42),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: const Text(
                        "Lanjutkan",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
