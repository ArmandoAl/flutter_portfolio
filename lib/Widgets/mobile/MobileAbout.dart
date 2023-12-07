import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/text.dart';
import 'package:provider/provider.dart';

class MobileAbout extends StatefulWidget {
  const MobileAbout({super.key});

  @override
  State<MobileAbout> createState() => _MobileAboutState();
}

class _MobileAboutState extends State<MobileAbout> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              uiProvider.isSpanish
                  ? spanish['aboutInfo1']!
                  : english['aboutInfo1']!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: const Color(0xFF276678),
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              uiProvider.isSpanish
                  ? spanish['aboutInfo2']!
                  : english['aboutInfo2']!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: const Color(0xFF276678),
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
