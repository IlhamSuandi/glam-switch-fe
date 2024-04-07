import 'package:flutter/material.dart';
import 'package:glam_switch_fe/components/logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.appLogo = const Logo(), this.leading});

  final Widget? appLogo;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25 / 2.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel, size: 36),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 48.0),
            child: Center(child: appLogo!),
          ))
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 150);
}
