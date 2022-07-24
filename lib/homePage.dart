import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_test/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List> selectionTileList = [
    [80, false],
    [42, false],
    [25, false],
    [75, false],
    [80, false],
    [42, false],
    [25, false],
    [75, false],
    [80, false],
    [42, false],
    [25, false],
    [75, false],
    [60, false]
  ];
  bool selectionMode = false;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      backgroundColor: const Color(0xFFC0D3CF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
          child: Column(
            children: [
              buildProfileCard(s, h, w),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: selectionTileList.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onLongPress: () {
                          if (!selectionMode) {
                            setState(() {
                              selectionMode = true;
                              selectionTileList[i][1] =
                                  !selectionTileList[i][1];
                            });
                          }
                        },
                        onTap: () {
                          if (selectionMode) {
                            setState(() {
                              selectionTileList[i][1] =
                                  !selectionTileList[i][1];
                              bool isAnyTrue = selectionTileList
                                  .any((element) => element[1] == true);
                              if (!isAnyTrue) {
                                selectionMode = false;
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: selectionTileList[i][1]
                              ? const EdgeInsets.all(8.0)
                              : const EdgeInsets.symmetric(vertical: 4.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: h * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectionTileList[i][1]
                                    ? Colors.tealAccent
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Stay positive & say 3 positive things to myself everyday.',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 4.0),
                                                      child:
                                                          Text('2 days left'),
                                                    ),
                                                    // Stack(
                                                    //   children: [
                                                    //     Container(
                                                    //       height: h * .015,
                                                    //       width: w * 0.5,
                                                    //       decoration: BoxDecoration(
                                                    //         borderRadius:
                                                    //             BorderRadius.circular(20),
                                                    //         color: Colors.grey,
                                                    //       ),
                                                    //     ),
                                                    //     Container(
                                                    //       height: h * .015,
                                                    //       // width: w*80/100,
                                                    //       width: (w * 0.5) * 80 / 100,
                                                    //       decoration: BoxDecoration(
                                                    //         borderRadius:
                                                    //             BorderRadius.circular(20),
                                                    //         color: Colors.red,
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.black12,
                                                            width: 1),
                                                      ),
                                                      child:
                                                          StepProgressIndicator(
                                                        totalSteps: 100,
                                                        currentStep:
                                                            selectionTileList[i]
                                                                    [0]
                                                                .toInt(),
                                                        size: 8,
                                                        padding: 0,
                                                        selectedColor:
                                                            Colors.yellow,
                                                        unselectedColor:
                                                            Colors.white,
                                                        roundedEdges:
                                                            const Radius
                                                                .circular(10),
                                                        selectedGradientColor: selectionTileList[
                                                                    i][0] <
                                                                40
                                                            ? lessProgressBarGradient
                                                            : selectionTileList[i]
                                                                            [
                                                                            0] >
                                                                        40 &&
                                                                    selectionTileList[i]
                                                                            [
                                                                            0] <
                                                                        70
                                                                ? mediumProgressBarGradient
                                                                : const LinearGradient(
                                                                    begin: Alignment
                                                                        .topLeft,
                                                                    end: Alignment
                                                                        .bottomRight,
                                                                    colors: [
                                                                      greenColor,
                                                                      redcolor
                                                                    ],
                                                                  ),
                                                        // unselectedGradientColor: LinearGradient(
                                                        //   begin: Alignment.topLeft,
                                                        //   end: Alignment.bottomRight,
                                                        //   colors: [Colors.black, Colors.blue],
                                                        // ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  // primary: Colors.white,
                                                  // backgroundColor: Colors.teal,
                                                  side: const BorderSide(
                                                      color: mainColor,
                                                      width: 2),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: const Text(
                                                  'Add Notes',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(120)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(1, 0),
                                                    blurRadius: 20,
                                                    spreadRadius: 1,
                                                    color: Colors.grey),
                                              ],
                                            ),
                                            child: CircleAvatar(
                                              radius: w * 0.1,
                                              
                                              backgroundColor: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Stack(
                                                  children: [
                                                    Transform.rotate(
                                                      angle: pi,
                                                      child:
                                                          CircularStepProgressIndicator(
                                                        totalSteps: 100,
                                                        currentStep: 40,
                                                        stepSize: 5,
                                                        selectedColor:
                                                            mainColor,
                                                        unselectedColor:
                                                            Colors.grey[200],
                                                        padding: 0,
                                                        width: w * 0.2,
                                                        height: w * 0.2,
                                                        selectedStepSize: 5,
                                                        roundedCap: (_, __) =>
                                                            true,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          text: '${4}',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: mainColor),
                                                          children: [
                                                            TextSpan(
                                                              text: ' / 10',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Text('${4}/10'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            color: mainColor,
                                            onPressed: () {},
                                            child: const Text(
                                              'Update',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildProfileCard(Size s, double h, double w) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // color: mainColor,
      child: SizedBox(
        height: s.height * 0.3,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/images.jfif'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Self Version 2.0',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'Hi, Maxon',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '5',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Practicing',
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(
                        child: Text(
                          'One small step at a time until these become your habits.',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [mainDarkColor, mainColor],
                    stops: [0, 9],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'Wiz Score',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              Text(
                                '160',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.white70,
                        child: CircleAvatar(
                          radius: w * 0.15 - 13,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: w * 0.15 - 23,
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: w * 0.15,
                                  color: Color(0xFF21655B),
                                ),
                                Positioned(
                                  right: 1,
                                  bottom: 1,
                                  child: Icon(
                                    Icons.play_circle_outline_outlined,
                                    size: w * 0.05,
                                    color: Color(0xFF21655B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
