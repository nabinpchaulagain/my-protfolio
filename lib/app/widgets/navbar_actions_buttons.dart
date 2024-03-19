import 'package:flutter/material.dart';

import 'package:mywebsite/core/animations/entrance_fader.dart';
import 'package:mywebsite/core/providers/scroll_provider.dart';
import 'package:mywebsite/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class NavBarActionButton extends StatefulWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);

    // theme

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isClicked = value;
          });
        },
        onTap: () {
          scrollProvider.jumpTo(widget.index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 1000),
            duration: const Duration(milliseconds: 250),
            child: Text(
              widget.label,
              style: TextStyle(
                color: isClicked ? Colors.red : theme.textColor,
                decoration:
                    isClicked ? TextDecoration.none : TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
