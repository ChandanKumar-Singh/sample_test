import 'dart:ui';

import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF66B0BD);
const Color mainDarkColor = Color(0xFF5C949F);
const Color redcolor = Color(0xFFFF0202);
const Color greenColor = Color(0xFF9AFF60);

const mainGradient =
    LinearGradient(colors: [mainColor, redcolor], stops: [3, 6]);
const maxProgressBarGradient = LinearGradient(
  colors: [greenColor, redcolor],
  stops: [3, 6],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const lessProgressBarGradient = LinearGradient(
  colors: [greenColor, greenColor],
  stops: [3, 6],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const mediumProgressBarGradient = LinearGradient(
  colors: [greenColor,Colors.amber],
  // stops: [3, 6],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
