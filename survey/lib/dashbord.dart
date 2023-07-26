import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
//import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'signupnow.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  int _currentPageIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<Widget> carousalItems = [
      Column(
        children: [
          const SizedBox(height: 100),
          Image.asset('images/Group 64.png'),
          const Text(
            "Take a Short Survey",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "on the issues",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
      Expanded(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Image.asset('images/Group 65.png'),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset('images/Group 66.png'),
          ],
        ),
      )
    ];

    List<Widget> _buildCarouselDots() {
      return List<Widget>.generate(carousalItems.length, (index) {
        return GestureDetector(
          onTap: () {
            _carouselController.animateToPage(index);
          },
          child: Container(
            width: _currentPageIndex == index ? 24 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              //  shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(20),
              color: _currentPageIndex == index ? Colors.purple : Colors.grey,
            ),
          ),
        );
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 500,
                height: 650,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: CarouselSlider(
                    carouselController: _carouselController,
                    items: carousalItems,
                    options: CarouselOptions(
                      autoPlay: false,
                      disableCenter: true,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _currentPageIndex = index;
                          },
                        );
                      },
                      enableInfiniteScroll: false,
                      scrollDirection: axisDirectionToAxis(
                        flipAxisDirection(AxisDirection.right),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 80,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildCarouselDots(),
                  ),
                ),
              ),
              if (_currentPageIndex == carousalItems.length - 1)
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('Signup now'),
                  ),
                ),
              Positioned(
                top: 40,
                right: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, elevation: 0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text('Skip>', style: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
          //const SizedBox(height: 50),
          Stack(
            children: [
              Container(
                width: 500,
                height: 70,
                //color: Colors.red,
              ),
              if (_currentPageIndex >= 1)
                Positioned(
                  left: 30,
                  bottom: 5,
                  child: Container(
                    //width: 180,
                    height: 40,
                    //color: Colors.pink,
                    child: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _currentPageIndex--;
                          },
                        );
                        _carouselController.previousPage();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeftLong,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              if (_currentPageIndex < carousalItems.length - 1)
                Positioned(
                  right: 30,
                  bottom: 5,
                  child: Container(
                    height: 40,
                    //width: 100,
                    //color: Colors.amber,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _currentPageIndex++;
                        });
                        _carouselController.nextPage();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowRightLong,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
