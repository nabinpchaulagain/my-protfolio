import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywebsite/core/configs/connection/bloc/connected_bloc.dart';
import 'package:mywebsite/core/configs/connection/network_check.dart';
import 'package:mywebsite/core/providers/drawer_provider.dart';
import 'package:mywebsite/core/providers/scroll_provider.dart';
import 'package:mywebsite/core/theme/app_theme.dart';
import 'package:mywebsite/core/theme/cubit/theme_cubit.dart';
import 'package:mywebsite/core/theme/cubit/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MySite extends StatelessWidget {
  const MySite({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => ConnectedBloc()),
      ],
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DrawerProvider()),
            ChangeNotifierProvider(create: (_) => ScrollProvider()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            return Sizer(builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "NC",
                theme: AppTheme.themeData(state.isLightThemeOn, context),
                initialRoute: "/",
                routes: {"/": (context) => const NChecking()},
              );
            });
          })),
    );
  }
}
