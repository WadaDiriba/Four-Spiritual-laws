import 'package:flutter/material.dart';
import 'package:four_laws/constants/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColor.bgoverlay),
                child: Text(
                  "Seerota Afuura Arfan",
                  style: TextStyle(
                    color: AppColor.light,
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
