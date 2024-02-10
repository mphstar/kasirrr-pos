import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

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
            'https://picsum.photos/200/300',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Batako Kotak Biasa",
              style: TextStyle(
                fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF202224)),
            ),
            Text(
              'Bata | Stok : 40',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Rp. 2.000',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF389D42),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        )
      ],
    );
  }
}
