import 'package:airport_deluxe/App/Helpers/ImportFile.dart';

class progressdialog extends StatelessWidget {
  String msg;
  progressdialog({this.msg});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:Colors.white70,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(6),

        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const SizedBox(
                width: 6.0,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(msg,style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w500


              ),)


            ],
          ),
        ),
      ),
    );
  }

}

