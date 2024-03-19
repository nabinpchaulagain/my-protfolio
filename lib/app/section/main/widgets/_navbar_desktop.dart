import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywebsite/app/utils/navbar_utils.dart';
import 'package:mywebsite/app/widgets/navbar_actions_buttons.dart';
import 'package:mywebsite/app/widgets/navbar_logo.dart';
import 'package:mywebsite/core/animations/entrance_fader.dart';
import 'package:mywebsite/core/apis/links.dart';
import 'package:mywebsite/core/configs/others/space.dart';
import 'package:mywebsite/core/providers/drawer_provider.dart';
import 'package:mywebsite/core/res/responsive.dart';
import 'package:mywebsite/core/theme/app_theme.dart';
import 'package:mywebsite/core/theme/cubit/theme_cubit.dart';
import 'package:mywebsite/core/theme/cubit/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({super.key});

  @override
  State<NavbarDesktop> createState() => NavbarDesktopState();
}

class NavbarDesktopState extends State<NavbarDesktop> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        color: theme.navBarColor,
        child: Row(
          children: [
            const NavBarLogo(),
            Space.xm!,
            ...NavBarUtils.names
                .asMap()
                .entries
                .map((e) => NavBarActionButton(label: e.value, index: e.key)),
            //space.x!,
            InkWell(
              onHover: (value) {
                setState(() {
                  isClicked = value;
                });
              },
              onTap: () {},
              child: EntranceFader(
                offset: const Offset(0, -10),
                delay: const Duration(milliseconds: 1000),
                duration: const Duration(milliseconds: 250),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: theme.navBarColor,
                      border: Border.all(
                        width: 4,
                        color: isClicked ? Colors.red : theme.textColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: isClicked
                              ? const Color.fromARGB(255, 12, 40, 255)
                              : theme.textColor,
                          spreadRadius: isClicked ? 4 : 0,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 6),
                    child: Text(
                      "Contact",
                      style: TextStyle(
                          color: isClicked ? Colors.red : theme.textColor,
                          decoration: isClicked
                              ? TextDecoration.none
                              : TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            //space.x!,
            InkWell(
                onTap: () {
                  context.read<ThemeCubit>().updateTheme(!state.isLightThemeOn);
                },
                child: Image.network(
                  state.isLightThemeOn ? IconUrls.lightIcon : IconUrls.darkIcon,
                  height: 30,
                  width: 30,
                  color: state.isLightThemeOn ? Colors.white : Colors.black,
                )),
            //space.x!,
          ],
        ),
      );
    });
  }
}

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    var theme = Theme.of(context);
    return Container(
      color: theme.navBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          Space.xm!,
          const NavBarLogo(),
          // Space.x1!,
        ],
      ),
    );
  }
}
