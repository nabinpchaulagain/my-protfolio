import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywebsite/app/utils/navbar_utils.dart';
import 'package:mywebsite/app/widgets/color_chage_btn.dart';
import 'package:mywebsite/app/widgets/navbar_logo.dart';
import 'package:mywebsite/core/configs/others/space.dart';
import 'package:mywebsite/core/providers/scroll_provider.dart';
import 'package:mywebsite/core/theme/cubit/theme_cubit.dart';
import 'package:mywebsite/core/theme/cubit/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    // theme
    var theme = Theme.of(context);
    return Drawer(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: NavBarLogo()),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      state.isLightThemeOn
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode,
                      // color: theme.textColor,
                    ),
                    title:
                        Text(state.isLightThemeOn ? "Light Mode" : "Dark Mode"),
                    trailing: Switch(
                      value: state.isLightThemeOn,
                      activeColor: theme.primaryColor,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (newValue) {
                        context.read<ThemeCubit>().updateTheme(newValue);
                      },
                    ),
                  ),
                  const Divider(),
                  ...NavBarUtils.names.asMap().entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            hoverColor: theme.primaryColor.withAlpha(70),
                            onPressed: () {
                              // scrollProvider.scrollMobile(e.key);
                              scrollProvider.jumpTo(e.key);
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              leading: Icon(
                                NavBarUtils.icons[e.key],
                                // color: theme.primaryColor,
                              ),
                              title: Text(
                                e.value,
                                // style: AppText.l1,
                              ),
                            ),
                          ),
                        ),
                      ),
                  Space.y(5.w)!,
                  ColorChageButton(
                    text: 'RESUME',
                    onTap: () {
                      // openURL(resume);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
