// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/text.dart';
import 'package:provider/provider.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Row(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            child: Column(
              children: [
                Text(
                  uiProvider.isSpanish
                      ? spanish['aboutInfo1']!
                      : english['aboutInfo1']!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: const Color(0xFF276678),
                      fontSize: MediaQuery.of(context).size.width * 0.02),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  uiProvider.isSpanish
                      ? spanish['aboutInfo2']!
                      : english['aboutInfo2']!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: const Color(0xFF276678),
                      fontSize: MediaQuery.of(context).size.width * 0.02),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
