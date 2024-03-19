import 'package:flutter/material.dart';
import 'package:mywebsite/app/section/home/home_desktop.dart';
import 'package:mywebsite/app/section/home/home_mobile.dart';
import 'package:mywebsite/app/section/home/home_tab.dart';
import 'package:mywebsite/core/res/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTablet(),
      desktop: HomeDesktop(),
    );
  }
}
