import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoes_app/constants.dart';

import 'home_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 1000)
    );

    _position = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 1))..addListener(() {
        setState(() {
        });
      })
    );

    _opacity = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 1))..addListener(() {
          setState(() {
          });
        })
    );

    _controller.repeat();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: MyColors.myBlack,
        child: Stack(
          children: [
            Positioned(
                bottom: -250,
                child: Container(
                  width: size.width,
                  height: size.width + 250,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.80,
                      colors: [
                        MyColors.myOrange,
                        MyColors.myBlack
                      ]
                    )
                  ),
                ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(50),
                width: size.width,
                child: Image.asset("assets/img_nike_text.png"),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(50),
                width: size.width,
                child: Image.asset("assets/img_shoes.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top:40),
                height: size.height / 2,
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "JUST DO IT",
                          style: TextStyle(
                          color: Colors.white,
                            fontSize: 37,
                            fontWeight: FontWeight.bold
                      )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Smart, gorgeous & fashionable\n",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                          )
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        int senstivity = 8;
                        if(details.delta.dy < -senstivity) {
                          Navigator.push(context, PageTransition(child: HomeScreen(), type: PageTransitionType.bottomToTop));
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Opacity(
                                  opacity: _opacity.value,
                                  child: const Icon(
                                    CommunityMaterialIcons.chevron_double_up,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: "Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,)
                            ],
                          ),
                        ),
                    ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
