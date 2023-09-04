import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:flutter/cupertino.dart';

class PassengerLuggageScreen extends StatelessWidget {
  void Function() onPressed;
  double height;
  double minwidth;
  Color textcolor;
  String text;
  IconData icon;
  Color iconcolor;
  Color bcolor;
  double size;

  PassengerLuggageScreen(
      {this.onPressed,
      this.height,
      this.icon,
      this.text,
      this.textcolor,
      this.minwidth,
      this.iconcolor,
      this.bcolor,
      this.size,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: MediaQuery.of(context).size.width*0.03,
      minWidth: MediaQuery.of(context).size.width*0.03,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconcolor,
            size: size,
          ),
          Container(
            margin: const EdgeInsets.only(left: 3),
            child: Text(
              text,
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: MediaQuery.of(context).size.width*0.035,
                    color: textcolor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class PassengerReturnDateScreen extends StatelessWidget {
  void Function() onPressed;
  double height;
  double minwidth;
  Color textcolor;
  double width;
  String text;
  IconData icon;
  Color iconcolor;
  Color bcolor;
  double size;
  void Function() iconOnPressed;
  final BoxConstraints constraints;
  PassengerReturnDateScreen(
      {this.onPressed,
        this.iconOnPressed,
        this.constraints,
        this.height,
        this.icon,
        this.text,
        this.textcolor,
        this.minwidth,
        this.width,
        this.iconcolor,
        this.bcolor,
        this.size,
        Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: minwidth,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onPressed,
                child: Opacity(
                  opacity: 0.64,
                  child: Container(
                    width:width,
                   // margin: EdgeInsets.only(left: 3),
                    child: Text(
                      text,overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width*0.04,
                        color: textcolor,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),

              GestureDetector(
                onTap: iconOnPressed,
                child: Icon(
                  icon,
                  color: iconcolor,
                  size: MediaQuery.of(context).size.width*0.06,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
