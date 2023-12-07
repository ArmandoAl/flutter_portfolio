// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/Widgets/mobile/MobileDynamicWidget.dart';
import 'package:portfolio/Widgets/mobile/MobileLinkButtons.dart';
import 'package:provider/provider.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.width * 0.15),
        decoration: const BoxDecoration(
          //put this color F5F5F5
          color: Color(0xFFf5f5f5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    uiProvider.changeIndex(0);
                  },
                  child: SvgPicture.asset('lib/Assets/aa.svg',
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      color: uiProvider.isHomeHovering
                          ? Colors.grey[700]
                          : const Color(0xFF276678)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: MobileDynamicWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.6,
          child: const Row(children: [
            Spacer(),
            MobileLinkButtons(),
          ])),
    );
  }
}
