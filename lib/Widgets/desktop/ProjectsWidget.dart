// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/utils/projectsInfo.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    UIProvider uiProvider = Provider.of<UIProvider>(context, listen: true);
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < projects.length; i += 2)
              Row(
                children: [
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        uiProvider.onEnterProject(i);
                      },
                      onExit: (event) {
                        uiProvider.onExitProject(i);
                      },
                      child: GestureDetector(
                        onTap: () async {
                          if (projects[i]['link'] != null) {
                            if (await canLaunch(projects[i]['link']!)) {
                              launch(projects[i]['link']!);
                            }
                          } else {
                            Navigator.pushNamed(context, projects[i]['route']!);
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
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
                                  color:
                                      const Color.fromARGB(255, 230, 228, 228),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                  ),
                                  child: Text(
                                    'View Project',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (i + 1 < projects.length)
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (event) {
                          uiProvider.onEnterProject(i + 1);
                        },
                        onExit: (event) {
                          uiProvider.onExitProject(i + 1);
                        },
                        child: GestureDetector(
                          onTap: () async {
                            if (projects[i + 1]['link'] != null) {
                              if (await canLaunch(projects[i + 1]['link']!)) {
                                launch(projects[i + 1]['link']!);
                              }
                            } else {}
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: uiProvider.isProjectHovering[i + 1]
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
                                  projects[i + 1]['name']!,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
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
                                    color: const Color.fromARGB(
                                        255, 230, 228, 228),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                    ),
                                    child: Text(
                                      'View Project',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
