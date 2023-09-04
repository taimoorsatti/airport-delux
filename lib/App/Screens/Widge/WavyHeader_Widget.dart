import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ets_appbar.dart';

class WavyHeaderScreen extends StatelessWidget {
  final bool isBack;
  final VoidCallback onBackTap;

  const WavyHeaderScreen({this.isBack = false, this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: MediaQuery.of(context).size.width / 2 - 62,
          child: Column(
            children: [
              Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120 / 2),
                    border: Border.all(
                      width: 5,
                      color: kPrimaryColor,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/connectcars.jpg",
                      height: 130.h,
                      width: 130.w,

                    ),
                  )
              )

            ],
          ),
        ),
        isBack
            ? Align(
                alignment: Alignment.topLeft,
                child: ViitAppBarIconWidget(
                  viitAppBarIconType: ViitAppBarIconTypes.BACK,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var secondControlPoint =
        Offset(size.width - (size.width / 2), size.height - 120);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 5);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
