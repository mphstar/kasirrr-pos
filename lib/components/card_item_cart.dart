import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarpras_app/models/cart_model.dart';
import 'package:sarpras_app/providers/home_provider.dart';

// ignore: must_be_immutable
class CardItemCart extends StatelessWidget {
  CartModel item;

  CardItemCart({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          child: Image.network(
            item.product.pathGambar,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.product.name,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF202224)),
            ),
            Text(
              'Rp. ${item.subtotal}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF389D42),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text(
                  "Qty",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF818181),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .handleQty(option: "kurang", item: item);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Image.asset(
                            'assets/icons/ic_min.png',
                          ),
                        ),
                      ),
                      Text(
                        item.qty.toString(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .handleQty(option: "tambah", item: item);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Image.asset(
                            'assets/icons/ic_plus.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
