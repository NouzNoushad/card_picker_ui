import 'package:flutter/material.dart';

class CardPickerHome extends StatefulWidget {
  const CardPickerHome({super.key});

  @override
  State<CardPickerHome> createState() => _CardPickerHomeState();
}

class _CardPickerHomeState extends State<CardPickerHome> {
  static List<List<Color>> colors = [
    [
      Colors.red,
      Colors.red.shade800,
    ],
    [
      Colors.purple,
      Colors.purple.shade800,
    ],
    [
      Colors.blue,
      Colors.blue.shade800,
    ],
    [
      Colors.orange,
      Colors.orange.shade800,
    ],
    [
      Colors.pink,
      Colors.pink.shade800,
    ]
  ];

  int selectedIndex = 0;
  double topSpace = 320;
  double cardSpace = 30;
  double topMinSpace = 20;

  unSelectedPosition(index) {
    if (index < selectedIndex) {
      return index;
    } else {
      return index - 1;
    }
  }

  topPosition(int index, bool selected) {
    if (selected) {
      return topMinSpace;
    } else {
      return topSpace + unSelectedPosition(index) * cardSpace;
    }
  }

  scaleCard(int index, bool selected) {
    if (selected) {
      return 1.0;
    } else {
      int unSelected = colors.length - 1;
      return 1.0 - (unSelected - unSelectedPosition(index) - 1) * 0.05;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          for (int i = 0; i < colors.length; i++)
            AnimatedPositioned(
              top: topPosition(i, i == selectedIndex),
              duration: const Duration(milliseconds: 300),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: scaleCard(i, i == selectedIndex),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(15),
                    height: 230,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          colors[i][0],
                          colors[i][1],
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Acmebank',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Image.asset(
                          'assets/chip_image.png',
                          height: 70,
                        ),
                        Text(
                          '1234 1234 1234 1234',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '12/12',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Visa'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
