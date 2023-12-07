import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/text.dart';
import 'package:provider/provider.dart';

class MobileWelcome extends StatefulWidget {
  const MobileWelcome({super.key});

  @override
  State<MobileWelcome> createState() => _MobileWelcomeState();
}

class _MobileWelcomeState extends State<MobileWelcome> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            Text(
              'Armando Alvarado',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF276678),
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            Text(
              'Software Developer',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            Image(
              image: const AssetImage('lib/Assets/her.gif'),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            TextButton(
              onPressed: () {
                uiProvider.changeIndex(1);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF1687A7)),
              ),
              child: Text(
                uiProvider.isSpanish ? spanish['about']! : english['about']!,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 243, 243)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
