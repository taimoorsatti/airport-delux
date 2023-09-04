
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentAddressItemList extends StatelessWidget {
  final String addressTitle;
  final String address;
  final IconData myIcon;
  final Color myIconColor;
  final Color myBackgrounColor;
  bool isLastIndex;
  bool isShowEditIcon;
  VoidCallback myOnEditIconTap;
  final double iconsize;
  void Function() onTap;

  RecentAddressItemList({
    Key key,
    @required this.addressTitle,
    this.address = "",
    @required this.myIcon,
    @required this.myIconColor,
    @required this.myBackgrounColor,
    this.isLastIndex = false,
    this.isShowEditIcon = false,
    this.myOnEditIconTap,
    this.iconsize,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
                color: myBackgrounColor,
                borderRadius: BorderRadius.circular(
                  40 / 2,
                )),
            child: Center(
              child: Icon(
                myIcon,
                size: 18.sp,
                color: myIconColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-200,

                child: Text(
                  addressTitle,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kPrimaryColor,
                        fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: address == "" ? 0 : 5,
              ),
              address == ""
                  ? SizedBox()
                  : Container(
                      width: 210,
                      child: Text(
                        address,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: kLoginBlack,
                              fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
              /*SizedBox(
                height: 15,
              ),
              isLastIndex
                  ? SizedBox()
                  : Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width - 130,
                      color: kGrey,
                    ),*/
            ],
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          isShowEditIcon
              ? GestureDetector(
                  onTap: myOnEditIconTap,
                  child: Icon(
                    Icons.edit,
                    size: 21,
                    color: kDottedBorder,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}


class NoSuggestion extends StatefulWidget {
  const NoSuggestion({Key key}) : super(key: key);

  @override
  _NoSuggestionState createState() => _NoSuggestionState();
}

class _NoSuggestionState extends State<NoSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("No Suggestion"),
      ),
    );
  }
}

