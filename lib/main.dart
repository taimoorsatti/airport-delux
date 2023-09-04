import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'App/ets_app.dart';

void main() async{
  WidgetsFlutterBinding. ensureInitialized();
  await Firebase.initializeApp(
  );


  //Assign publishable key to flutter_stripe
  Stripe.publishableKey =
  "pk_test_xb739PxfRxHyM9vyhXkJsdip00iITqaWHR";

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EtsApp(
    );
  }
}


