// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/projectsInfo.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileProjects extends StatefulWidget {
  const MobileProjects({super.key});

  @override
  State<MobileProjects> createState() => _MobileProjectsState();
}

class _MobileProjectsState extends State<MobileProjects> {
  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < projects.length; i++)
              GestureDetector(
                onTap: () async {
                  if (projects[i]['link'] != null) {
                    if (await canLaunch(projects[i]['link']!)) {
                      launch(projects[i]['link']!);
                    }
                  } else {
                    Navigator.pushNamed(context, projects[i]['mobileRoute']!);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: uiProvider.isProjectHovering[i]
                        ? Colors.grey[700]
                        : const Color(0xFF276678),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projects[i]['name']!,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        uiProvider.isSpanish
                            ? projects[i]['description']!
                            : projects[i]['englishDescription']!,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 230, 228, 228),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                          child: Text(
                            'View Project',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.02),
                          ))
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
