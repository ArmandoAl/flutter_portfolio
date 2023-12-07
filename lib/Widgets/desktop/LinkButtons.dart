// ignore_for_file: deprecated_member_use, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButtons extends StatefulWidget {
  const LinkButtons({super.key});

  @override
  State<LinkButtons> createState() => _LinkButtonsState();
}

class _LinkButtonsState extends State<LinkButtons> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            uiProvider.onEnterSpanish();
          },
          onExit: (event) {
            uiProvider.onExitSpanish();
          },
          child: GestureDetector(
            onTap: () {
              uiProvider.changeLanguage();
            },
            child: Text(
              uiProvider.isSpanish ? 'English' : 'Español',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                  fontWeight: FontWeight.bold,
                  color: uiProvider.isSpanishHovering
                      ? Colors.grey[700]
                      : const Color(0xFF276678),
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            uiProvider.onEnterG();
          },
          onExit: (event) {
            uiProvider.onExitG();
          },
          child: GestureDetector(
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
                width: 30,
                height: 30,
                color:
                    uiProvider.isHoveringG ? Colors.grey[700] : Colors.black),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            uiProvider.onEnterL();
          },
          onExit: (event) {
            uiProvider.onExitL();
          },
          child: GestureDetector(
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
              width: 30,
              height: 30,
              color: uiProvider.isHoveringL ? Colors.grey[700] : Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            uiProvider.onEnterE();
          },
          onExit: (event) {
            uiProvider.onExitE();
          },
          child: GestureDetector(
            onTap: () {
              _launchEmail("alvaradoarmandodev@gmail.com");
            },
            child: SvgPicture.asset(
              'lib/Assets/gmail.svg',
              width: 30,
              height: 30,
              color: uiProvider.isHoveringE ? Colors.grey[700] : Colors.black,
            ),
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
