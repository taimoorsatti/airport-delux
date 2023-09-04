
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Screens/Widge/wave_animation_widget.dart';
import 'package:airport_deluxe/App/Screens/signin_signup/signIn/signInView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'fab_button_widget.dart';



class OnboardWidget extends StatefulWidget {
  var images = [""];
  var titles = [""];
  var subtitles = [""];
  final myOnSkipPressed;
  final myOnNextPressed;
  int onTapImageIndex;

  OnboardWidget({
    this.onTapImageIndex,
    this.images,
    this.titles,
    this.subtitles,
    this.myOnNextPressed,
    this.myOnSkipPressed,
  });

  @override
  _OnboardWidgetState createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  PageController _controller;
  PageController _controllerTitle;
  int currentPageValue;


  @override
  void initState() {
    super.initState();
    currentPageValue = widget.onTapImageIndex;
    _controller = PageController(
      initialPage: widget.onTapImageIndex,
      viewportFraction: 1,
    );

    _controllerTitle = PageController(
      initialPage: widget.onTapImageIndex,
      viewportFraction: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(MediaQuery.of(context).size.width, 360.0);
    return Stack(
      children: <Widget>[
        //Static wave image
        /*Image.asset(
            "assets/onboarding_shape.png",
            width: MediaQuery.of(context).size.width,
        )*/

        //Bottom wave animation
        Align(
          alignment: Alignment.bottomCenter,
          child: ColorCurveBodyBottom(
            size: size,
            xOffset: 20,
            yOffset: 86,
            color: kPrimaryColor,
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: ColorCurveBodyTop(
            size: size,
            xOffset: 10,
            yOffset: 50,
            color: kPrimaryColor,
          ),
        ),

        //Image slider
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 260,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 46),
            child: PageView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              onPageChanged: (int page) {
                _controllerTitle.animateToPage(
                  page,
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                 curve: Curves.easeInOut,
                );
                _getChangedPageAndMoveBar(page);
              },
              controller: _controller,
              itemBuilder: (BuildContext ctxt, int index) {
                return _buildImage(index, widget.images[index]);
              },
            ),
          ),
        ),

        // Onboarding title and subtitles
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 120.sp,
                child: PageView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.subtitles.length,
                  controller: _controllerTitle,
                  onPageChanged: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      curve: Curves.easeInOut,
                    );
                    _getChangedPageAndMoveBar(page);
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 28.sp,
                        right: 18.sp,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.titles[index],
                            style:
                            Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              wordSpacing: 0.44,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                              widget.subtitles[index],
                              style:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Padding(
                padding:  EdgeInsets.only(
                  left: 28.sp,
                  right: 18.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap:(){
                        Get.to(SignInView());
                      },
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: kAccentColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 24, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _getCircles(currentPageValue),
                      ),
                    ),
                    FABButton(
                        bgColor: Colors.white,
                        icon: Icon(
                          Viiticons.next_arrow,
                          color: kPrimaryColor,
                          size: 18.sp,
                        ),
                        onTap: () {
                          if (currentPageValue >= 2) {
                            Get.to(SignInView());
                          } else {
                            ++currentPageValue;
                            _controller.animateToPage(
                              currentPageValue,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                            _getChangedPageAndMoveBar(currentPageValue);
                          }
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 21.h,
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildImage(int index, String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image: AssetImage("$image"),
          ),
        ),
      ),
    );
  }

  _getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  _getCircles(int selectedIndex) {
    List<Widget> circleList = [];

    for (int i = 0; i < 3; i++) {
      circleList.add(
        CircleBarWidget(selectedIndex == i, () {
          _controller.animateToPage(
            i,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          currentPageValue = i;
          setState(() {});
        }),
      );
    }

    return circleList;
  }

  Widget CircleBarWidget(bool isActive, var _myOnTap) {
    print("Welcome:circleBar");

    return GestureDetector(
      onTap: _myOnTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 400,
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: isActive ? 14 : 12,
        width: isActive ? 14 : 12,
        decoration: BoxDecoration(
          color: isActive ? kAccentColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
    /* return Theme(
      data: isActive ? ThemeData.light() : ThemeData.dark(),
      child: Radio(
        value: isActive ? null : 1,
        activeColor: kAccentColor,
        onChanged: (int value) {
          print("");
        },
        groupValue: null,
      ),
    );*/
  }
}
