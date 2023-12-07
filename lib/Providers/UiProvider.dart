// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio/utils/projectsInfo.dart';

class UIProvider extends ChangeNotifier {
  int index = 0;
  bool isHoveringG = false;
  bool isHoveringL = false;
  bool isHoveringE = false;

  bool isHoveringEx = false;
  bool isHoveringPr = false;

  bool isHomeHovering = false;

  List<bool> isProjectHovering = projects.map((e) => false).toList();

  bool isSpanish = false;
  bool isSpanishHovering = false;

  void onEnterSpanish() {
    isSpanishHovering = true;
    notifyListeners();
  }

  void onExitSpanish() {
    isSpanishHovering = false;
    notifyListeners();
  }

  void changeLanguage() {
    isSpanish = !isSpanish;
    notifyListeners();
  }

  void onEnterProject(int index) {
    isProjectHovering[index] = true;
    notifyListeners();
  }

  void onExitProject(int index) {
    isProjectHovering[index] = false;
    notifyListeners();
  }

  void onEnterG() {
    isHoveringG = true;
    notifyListeners();
  }

  void onExitG() {
    isHoveringG = false;
    notifyListeners();
  }

  void onEnterL() {
    isHoveringL = true;
    notifyListeners();
  }

  void onExitL() {
    isHoveringL = false;
    notifyListeners();
  }

  void onEnterE() {
    isHoveringE = true;
    notifyListeners();
  }

  void onExitE() {
    isHoveringE = false;
    notifyListeners();
  }

  void onEnterEx() {
    isHoveringEx = true;
    notifyListeners();
  }

  void onExitEx() {
    isHoveringEx = false;
    notifyListeners();
  }

  void onEnterPr() {
    isHoveringPr = true;
    notifyListeners();
  }

  void onExitPr() {
    isHoveringPr = false;
    notifyListeners();
  }

  void onEnterHome() {
    isHomeHovering = true;
    notifyListeners();
  }

  void onExitHome() {
    isHomeHovering = false;
    notifyListeners();
  }

  void changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
