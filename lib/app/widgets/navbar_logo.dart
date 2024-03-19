import 'package:flutter/material.dart';
import 'package:mywebsite/core/res/responsive.dart';
import 'package:mywebsite/core/theme/app_theme.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textsty = TextStyle(
      color: theme.textColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Protest Riot",
      fontSize: Responsive.isDesktop(context) ? 45 : 35,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Responsive.isDesktop(context) ? "NC" : "NC",
          style: textsty,
        )
      ],
    );
  }
}
