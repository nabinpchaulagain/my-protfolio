import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywebsite/app/section/main/widgets/_navbar_desktop.dart';
import 'package:mywebsite/app/section/main/widgets/body.dart';
import 'package:mywebsite/app/section/main/widgets/navbar_mobile.dart';
import 'package:mywebsite/core/configs/app.dart';
import 'package:mywebsite/core/providers/drawer_provider.dart';
import 'package:mywebsite/core/res/responsive.dart';
import 'package:mywebsite/core/theme/cubit/theme_cubit.dart';
import 'package:mywebsite/core/theme/cubit/theme_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          tablet: NavBarTablet(),
          mobile: NavBarTablet(),
          desktop: NavbarDesktop(),
        ),
      ),
      drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return const Scaffold(
            body: Body(),

            // children: [
            //   Positioned(
            //     top: height * 0.2,
            //     left: -88,
            //     child: Container(
            //       height: height / 3,
            //       width: 166,
            //       decoration: const BoxDecoration(
            //           shape: BoxShape.circle, color: secondaryColor),
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
            //         child: Container(
            //           height: 166,
            //           width: 166,
            //           color: Colors.transparent,
            //         ),
            //       ),
            //     ),
            //   ),
            //   Positioned(
            //     bottom: 0,
            //     right: -100,
            //     child: Container(
            //       height: 100,
            //       width: 200,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: primaryColor.withOpacity(0.5),
            //       ),
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(
            //           sigmaX: 500,
            //           sigmaY: 500,
            //         ),
            //         child: Container(
            //           height: 200,
            //           width: 200,
            //           color: Colors.transparent,
            //         ),
            //       ),
            //     ),
            //   ),
            //   if (!state.isLightThemeOn)
            //     Align(
            //       alignment: Alignment.center,
            //       child: Image.asset(
            //         "assets/images/logoNPC.png",
            //         opacity: const AlwaysStoppedAnimation<double>(0.2),
            //         width: width,
            //         height: height,
            //         fit: BoxFit.cover,
            //         alignment: Alignment.topCenter,
            //       ),
            //     )
            //     // .......
            // ],
          );
        },
      ),
    );
  }
}
