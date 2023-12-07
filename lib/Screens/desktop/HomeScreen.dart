// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/Widgets/desktop/DynamicInfoWidget.dart';
import 'package:portfolio/Widgets/desktop/LinkButtons.dart';
import 'package:portfolio/Widgets/desktop/UIChangers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.15,
          bottom: MediaQuery.of(context).size.height * 0.05),
      decoration: const BoxDecoration(
        //put this color F5F5F5
        color: Color(0xFFf5f5f5),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (event) {
                    uiProvider.onEnterHome();
                  },
                  onExit: (event) {
                    uiProvider.onExitHome();
                  },
                  child: GestureDetector(
                    onTap: () {
                      uiProvider.changeIndex(0);
                    },
                    child: SvgPicture.asset('lib/Assets/aa.svg',
                        width: 40,
                        height: 40,
                        color: uiProvider.isHomeHovering
                            ? Colors.grey[700]
                            : const Color(0xFF276678)),
                  ),
                ),
                const Spacer(),
                //linking the icon button to the github page
                const LinkButtons(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [InfoWidget(), UIChangers()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
