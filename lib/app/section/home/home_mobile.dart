import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/app/changes/string.dart';
import 'package:mywebsite/app/section/home/widgets/animation_text.dart';
import 'package:mywebsite/app/socials/socials.dart';
import 'package:mywebsite/core/animations/entrance_fader.dart';
import 'package:mywebsite/core/configs/others/app_typography.dart';
import 'package:mywebsite/core/configs/others/space.dart';
import 'package:mywebsite/core/res/responsive_size.dart';
import 'package:mywebsite/core/theme/app_theme.dart';
import 'package:sizer/sizer.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  hellotag,
                  style: AppText.h3!.copyWith(
                    fontSize: isFontSize(context, 16),
                  ),
                ),
                //Space.x!,
              ],
            ),
            Text(
              yourname,
              style: TextStyle(
                fontSize: isFontSize(context, 28),
                fontWeight: FontWeight.w600,
              ),
            ),
            Space.y(1.w)!,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "A",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: isFontSize(context, 30),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Space.y(5.w)!,
                AnimatedTextKit(
                  animatedTexts: mobileList,
                  repeatForever: true,
                  isRepeatingAnimation: true,
                )
              ],
            ),
            Space.y(10.w)!,
            const Text(
              "Flutter Developer experienced in web design and development, proficient in firebase and mobile application development",
              style: TextStyle(fontSize: 20),
            ),
            Space.y(15.w)!,
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
                  height: 55,
                  width: 120,
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
                    padding: const EdgeInsets.only(left: 9, top: 4),
                    child: Text(
                      "Hire Me",
                      style: TextStyle(
                          color: isClicked ? Colors.red : theme.textColor,
                          decoration: isClicked
                              ? TextDecoration.none
                              : TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Social(),
      ]),
    );
  }
}
