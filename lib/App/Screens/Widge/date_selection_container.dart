
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:flutter/material.dart';

class DateSelectionContainer extends StatelessWidget {
  final String myText;
  final VoidCallback myOnTap;
  final double myHeight;

  const DateSelectionContainer({
    @required this.myText,
    @required this.myOnTap,
    this.myHeight = 51,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Container(
        height: myHeight,
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        decoration: BoxDecoration(
          color: kShareCodeBg,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Opacity(
          opacity: 0.64,
          child: Center(
            child: Text(
              myText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kLoginBlack,
                    fontSize: 15,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
