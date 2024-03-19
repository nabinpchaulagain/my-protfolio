import 'package:flutter/material.dart';
import 'package:mywebsite/core/animations/entrance_fader.dart';
import 'package:mywebsite/core/theme/app_theme.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 425, right: 300),
            child: InkWell(
              onHover: (value) {
                // Use Future.delayed to slow down hover effect
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    isClicked = value; // Update isHovered based on hover state
                  });
                });
              },
              onTap: () {},
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: EntranceFader(
                  offset: const Offset(0, -10),
                  delay: const Duration(milliseconds: 1000),
                  duration: const Duration(milliseconds: 250),
                  child: isClicked
                      ? Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                width: 3,
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: isClicked
                              //         ? const Color.fromARGB(255, 12, 40, 255)
                              //         : theme.textColor,
                              //     spreadRadius: isClicked ? 4 : 0,
                              //     blurRadius: 5,
                              //   )
                              // ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 9, top: 6),
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 65,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.navBarColor,
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/socials/facebook-logo.png"),
                                fit: BoxFit.cover),
                            border: Border.all(
                              color: Colors.red,
                              width: 3.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isClicked
                                    ? const Color.fromARGB(255, 12, 40, 255)
                                    : theme.textColor,
                                spreadRadius: isClicked ? 4 : 0,
                                blurRadius: 5,
                              )
                            ],
                          ),
                        )),
            ),
          ),
        ])
      ],
    );
  }
}
