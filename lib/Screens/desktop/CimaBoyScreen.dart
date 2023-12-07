// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CimaBoyScreen extends StatefulWidget {
  const CimaBoyScreen({super.key});

  @override
  State<CimaBoyScreen> createState() => _CimaBoyScreenState();
}

class _CimaBoyScreenState extends State<CimaBoyScreen> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CimaBoy'),
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
                          ? spanish['cimaboy1']!
                          : english['cimaboy1']!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      uiProvider.isSpanish
                          ? spanish['cimaboy2']!
                          : english['cimaboy2']!,
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
                        String url =
                            "https://github.com/ArmandoAl/FlutterVoiceChatbot";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text('Code'),
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
                    image: const AssetImage('lib/Assets/cimaboy.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Image(
                    image: const AssetImage('lib/Assets/ideacimaboy.png'),
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
