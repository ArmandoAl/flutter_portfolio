// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HerNotesScreen extends StatefulWidget {
  const HerNotesScreen({super.key});

  @override
  State<HerNotesScreen> createState() => _HerNotesScreenState();
}

class _HerNotesScreenState extends State<HerNotesScreen> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HerNotes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    Text(
                      uiProvider.isSpanish
                          ? spanish['hernotes1']!
                          : english['hernotes1']!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      uiProvider.isSpanish
                          ? spanish['hernotes2']!
                          : english['hernotes2']!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      uiProvider.isSpanish
                          ? spanish['hernotes3']!
                          : english['hernotes3']!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    //boton que te lleva a un link de youtube, el texto el boton debe ser "Ver codigo"
                    ElevatedButton(
                      onPressed: () async {
                        // Respond to button press
                        String url = "https://hernotes.web.app/";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text('Try it'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Respond to button press
                        String url = "https://github.com/ArmandoAl/HerNotes";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text('Frontend code'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Respond to button press
                        String url = "https://github.com/ArmandoAl/HerNotesC-";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text('Backend code'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Image(
                    image: const AssetImage('lib/Assets/notas.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Image(
                    image: const AssetImage('lib/Assets/estats.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Image(
                    image: const AssetImage('lib/Assets/emociones.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
