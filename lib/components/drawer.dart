import 'package:flutter/material.dart';
import 'package:sarpras_app/components/custom_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF202224),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 37),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/icons/ic_profile.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bintang Malindo",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          "Operator",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              color: Color(0xFFB8B8B8)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: CustomTile(
                      icon: Icons.money,
                      title: const Text(
                        "Operator",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: CustomTile(
                      icon: Icons.history_rounded,
                      title: const Text(
                        "Retur Penjualan",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
