// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileLinkButtons extends StatefulWidget {
  const MobileLinkButtons({super.key});

  @override
  State<MobileLinkButtons> createState() => _MobileLinkButtonsState();
}

class _MobileLinkButtonsState extends State<MobileLinkButtons> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            //go to this link https://github.com/ArmandoAl <--- this is my github
            String url = "https://github.com/ArmandoAl";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: SvgPicture.asset('lib/Assets/github2.svg',
              width: 40,
              height: 40,
              color: uiProvider.isHoveringG ? Colors.grey[700] : Colors.black),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        GestureDetector(
          onTap: () async {
            String url = "https://www.linkedin.com/in/armando-al-014b76258/";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: SvgPicture.asset(
            'lib/Assets/linkedin.svg',
            width: 40,
            height: 40,
            color: uiProvider.isHoveringL ? Colors.grey[700] : Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        GestureDetector(
          onTap: () {
            _launchEmail("alvaradoarmandodev@gmail.com");
          },
          child: SvgPicture.asset(
            'lib/Assets/gmail.svg',
            width: 40,
            height: 40,
            color: uiProvider.isHoveringE ? Colors.grey[700] : Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextButton(
          onPressed: () {
            uiProvider.changeLanguage();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: Text(
            uiProvider.isSpanish ? 'English' : 'Español',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextButton(
          onPressed: () {
            uiProvider.changeIndex(2);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: const Text(
            'Projects',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.01,
        ),
        TextButton(
          onPressed: () {
            uiProvider.changeIndex(3);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: const Text(
            'Experience',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

void _launchEmail(String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query:
        'subject= Hello there, I saw your portfolio and I would like to contact you.',
  );

  final String url = params.toString();

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la aplicación de correo electrónico.';
  }
}
