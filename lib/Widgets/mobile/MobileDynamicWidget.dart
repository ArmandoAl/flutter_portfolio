// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/Widgets/mobile/MobileAbout.dart';
import 'package:portfolio/Widgets/mobile/MobileExperience.dart';
import 'package:portfolio/Widgets/mobile/MobileProjects.dart';
import 'package:portfolio/Widgets/mobile/MobileWelcome.dart';
import 'package:provider/provider.dart';

class MobileDynamicWidget extends StatefulWidget {
  const MobileDynamicWidget({super.key});

  @override
  State<MobileDynamicWidget> createState() => _MobileDynamicWidgetState();
}

class _MobileDynamicWidgetState extends State<MobileDynamicWidget> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    List<Widget> info = [
      const MobileWelcome(),
      const MobileAbout(),
      const MobileProjects(),
      const MobileExperience()
    ];
    return Expanded(
        child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: IndexedStack(
        index: uiProvider.index,
        children: info,
      ),
    ));
  }
}
