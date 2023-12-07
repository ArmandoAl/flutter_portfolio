// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/Widgets/desktop/AboutWidget.dart';
import 'package:portfolio/Widgets/desktop/ExperienceWidget.dart';
import 'package:portfolio/Widgets/desktop/ProjectsWidget.dart';
import 'package:portfolio/Widgets/desktop/WelcomeWidget.dart';
import 'package:provider/provider.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    List<Widget> info = [
      const Welcome(),
      const About(),
      const ProjectsWidget(),
      const Experience()
    ];
    return Expanded(
        child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        border: Border.all(
          //put a gradient here
          color: uiProvider.index == 0
              ? Colors.transparent
              : const Color(0xFF1687A7),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IndexedStack(
        index: uiProvider.index,
        children: info,
      ),
    ));
  }
}
