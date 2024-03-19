import 'package:flutter/material.dart';
import 'package:mywebsite/app/utils/utils.dart';
import 'package:mywebsite/core/providers/scroll_provider.dart';

import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return ScrollablePositionedList.builder(
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
      itemScrollController: scrollProvider.itemScrollController,
    );
  }
}
