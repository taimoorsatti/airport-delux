import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'RequestRideViewModel.dart';

class RequestRideView extends StatefulWidget {
  @override
  _RequestRideViewState createState() => _RequestRideViewState();
}

class _RequestRideViewState extends State<RequestRideView> {


  int slideIndex = 0;
  PageController controller;
  String token="dhjdklsjnva";

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF4BE3B0) : Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestRideViewModel(),
      builder: (RequestRideViewModel viewModel){
        return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff3C8CE7), Color(0xff00EAFF)])),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                height: MediaQuery.of(context).size.height - 100,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  children: <Widget>[
                    SlideTile(
                        imagePath: viewModel.imgList[0],
                        title: viewModel.imgList1[0],
                        desc: viewModel.imgList2[0]
                    ),
                    SlideTile(
                        imagePath: viewModel.imgList[1],
                        title: viewModel.imgList1[1],
                        desc: viewModel.imgList2[1]
                    ),
                    SlideTile(
                        imagePath: viewModel.imgList[2],
                        title: viewModel.imgList1[2],
                        desc: viewModel.imgList2[2]
                    ),


                  ],
                ),
              ),
              bottomSheet: slideIndex != 2 ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: (){
                        controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "SKIP",
                        style: TextStyle(color: Color(0xFF4BE3B0), fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                        ],),
                    ),
                    MaterialButton(
                      onPressed: (){
                        print("this is slideIndex: $slideIndex");
                        controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "NEXT",
                        style: TextStyle(color: Color(0xFF4BE3B0), fontWeight: FontWeight.w600,),
                      ),
                    ),
                  ],
                ),
              ):
              InkWell(
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Color(0xff4BE3B0),
                  alignment: Alignment.center,
                  child: Text(
                    "GET STARTED NOW",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath,this.title,  this.desc});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          SizedBox(
            height: MediaQuery.of(context).size.height/8,
          ),
          Container(
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width/1.5,

            //width: 215,

            decoration: BoxDecoration(
              //color: Colors.black,
              //borderRadius: BorderRadius.circular(100),
                shape: BoxShape.circle
            ),
            child: Image.asset(imagePath,fit: BoxFit.fitWidth,),

          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height/12,
          // ),
          Container(
            // margin: EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                Container(
                  child:  Text(  title,style: TextStyle(
                    fontFamily: 'Roboto Slab',
                    color: Color(0xff141416),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,

                  ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/30,

                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  //color: Colors.black54,
                  child: Text(desc,textAlign: TextAlign.center,overflow:TextOverflow.clip,style: TextStyle(
                    fontFamily: 'Roboto Slab',
                    color: Color(0xff171719),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,

                  ),
                  ),
                ),
              ],
            ),
          ),

          Container(height: 30,),


        ],
      ),

    );
  }
}