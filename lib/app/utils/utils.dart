import 'package:flutter/material.dart';
import 'package:mywebsite/app/section/contact/contact.dart';
import 'package:mywebsite/app/section/home/homepage.dart';
import 'package:mywebsite/app/section/portfolio/portfolio.dart';
import 'package:mywebsite/app/section/services/services.dart';
import 'package:mywebsite/app/section/skills/skills.dart';

class BodyUtils {
  static List<Widget> views = [
    const HomePage(),
    const Services(),
    const Skills(),
    const Portfolio(),
    const Contact(),
  ];
}
