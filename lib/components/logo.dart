import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum EnumLogoVariant { primary, secondary }

class Logo extends StatelessWidget {
  const Logo({super.key, this.variant = EnumLogoVariant.primary});
  final EnumLogoVariant variant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 54),
            margin: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Divider(
              color: variant == EnumLogoVariant.primary
                  ? Colors.black
                  : Colors.white,
              height: 1,
              thickness: 1,
            ),
          ),
          Text(
            'GLAM SWITCH',
            style: GoogleFonts.montserrat(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: variant == EnumLogoVariant.primary
                  ? const Color.fromRGBO(35, 35, 35, 1)
                  : Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 54, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: Divider(
                      color: variant == EnumLogoVariant.primary
                          ? Colors.black
                          : Colors.white,
                      height: 4,
                    ),
                  ),
                ),
                Text(
                  "Studio",
                  style: GoogleFonts.parisienne(
                      fontSize: 22, // Adjust font size as needed
                      fontWeight: FontWeight.w400,
                      color: variant == EnumLogoVariant.primary
                          ? const Color.fromRGBO(35, 35, 35, 1)
                          : Colors.white),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: Divider(
                      color: variant == EnumLogoVariant.primary
                          ? Colors.black
                          : Colors.white,
                      height: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
