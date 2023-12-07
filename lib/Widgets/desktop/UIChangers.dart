// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:provider/provider.dart';

class UIChangers extends StatefulWidget {
  const UIChangers({super.key});

  @override
  State<UIChangers> createState() => _UIChangersState();
}

class _UIChangersState extends State<UIChangers> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              uiProvider.onEnterPr();
            },
            onExit: (event) {
              uiProvider.onExitPr();
            },
            child: GestureDetector(
              onTap: () {
                uiProvider.changeIndex(2);
              },
              child: Row(
                children: [
                  Text(
                    'Projects',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: uiProvider.isHoveringPr
                            ? Colors.grey[700]
                            : const Color(0xFF276678),
                        decoration: TextDecoration.none),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              uiProvider.onEnterEx();
            },
            onExit: (event) {
              uiProvider.onExitEx();
            },
            child: GestureDetector(
              onTap: () {
                uiProvider.changeIndex(3);
              },
              child: Row(
                children: [
                  Text(
                    'Experience',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: uiProvider.isHoveringEx
                            ? Colors.grey[700]
                            : const Color(0xFF276678),
                        decoration: TextDecoration.none),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
