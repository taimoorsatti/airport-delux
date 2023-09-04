

import 'Helpers/ImportFile.dart';
import 'Screens/SelectRide/selectRidevView.dart';
import 'Screens/Splash/splash/splash_screen.dart';
import 'Screens/onborading/onborading_screen.dart';
import 'Screens/signin_signup/signIn/signInView.dart';
import 'Screens/signin_signup/signup/SignUpView.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case LanguageScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LanguageScreen(),
        );

      case "/":
        return MaterialPageRoute(
          builder: (_) => OnBoardScreen(),
        );

      case OnBoardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OnBoardScreen(),
        );


      // case ForgotPasswordScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => ForgotPasswordScreen(),
      //   );

      // case OTPScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => OTPScreen(),
      //   );

      // case ResetPassScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => ResetPassScreen(),
      //   );

      case SelectRideScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SelectRideScreen(),
        );

    /*case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );*/

      // case HomeScreen.routeName:
      //   return PageRouteBuilder(
      //       pageBuilder: (context, animation, Animation secondaryAnimation) =>
      //           HomeScreen(),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) {
      //         return ScaleTransition(
      //           scale: Tween<double>(
      //             begin: 0.0,
      //             end: 1.0,
      //           ).animate(
      //             CurvedAnimation(
      //               parent: animation,
      //               curve: Curves.fastOutSlowIn,
      //             ),
      //           ),
      //           child: child,
      //         );
      //       });

      // case LoyaltyProgramDetailsScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => LoyaltyProgramDetailsScreen(),
      //   );
      //
      // case FreeRidesHowWorkDetailsScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => FreeRidesHowWorkDetailsScreen(),
      //   );
      //
      // case CashScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => CashScreen(),
      //   );
      //
      // case CreditCardScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => CreditCardScreen(),
      //   );
      //
      // case CreditCardScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => CreditCardScreen(),
      //   );
      //
      // case ApplePayScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => ApplePayScreen(),
      //   );
      //
      // case GPayScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => GPayScreen(),
      //   );
      //
      // case AddPaymentMethodScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => AddPaymentMethodScreen(),
      //   );
      //
      // case AddCardScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => AddCardScreen(),
      //   );
      //
      case SignupScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );
      //
      // case EmergencyContactScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => EmergencyContactScreen(),
      //   );
      //
      // case FavAddressScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => FavAddressScreen(),
      //   );
      //
      // case EditFavAddressScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => EditFavAddressScreen(),
      //   );
      //
      // case FavDriverScreen.routeName:
      //   return CupertinoPageRoute(
      //     builder: (_) => FavDriverScreen(),
      //   );
      //
      // case ContactUsScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => ContactUsScreen(),
      //   );
      //
      // case FeedBackScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => FeedBackScreen(),
      //   );
      //
      // case HelpSupportQuestionsScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => HelpSupportQuestionsScreen(),
      //   );
      //
      // case AddApplePayScreen.routeName:
      // // Validation of correct data type
      //   if (args is PayMethodsModal) {
      //     return MaterialPageRoute(
      //       builder: (_) => AddApplePayScreen(
      //         args: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      // case RidePersonalProfileScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => RidePersonalProfileScreen(),
      //   );
      //
      // case EditProfileNameScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => EditProfileNameScreen(),
      //   );
      //
      // case AddBusinessProfileScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => AddBusinessProfileScreen(),
      //   );
      //
      // case WhatsYourBusinessEmailScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => WhatsYourBusinessEmailScreen(),
      //   );
      //
      // case ChoosePaymentMethodScreen.routeName:
      //   if (args is ChoosePaymentMethodScreenArguments) {
      //     return MaterialPageRoute(
      //       builder: (_) => ChoosePaymentMethodScreen(
      //         arguments: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      //
      // case PaymentOptionScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => PaymentOptionScreen(),
      //   );
      //
      // case HelpSupportQuestionAnswerScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => HelpSupportQuestionAnswerScreen(),
      //   );
      //
      // case ChangePasswordScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangePasswordScreen(),
      //   );
      //
      // case AddAddressToMylistScreen.routeName:
      // // Validation of correct data type
      //   if (args is AddAddressToMylistScreenArguments) {
      //     return MaterialPageRoute(
      //       builder: (_) => AddAddressToMylistScreen(
      //         arguments: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      //
      // case LocationFromMapScreen.routeName:
      // // Validation of correct data type
      //   if (args is LocationFromMapScreenArguments) {
      //     return MaterialPageRoute(
      //       builder: (_) => LocationFromMapScreen(
      //         arguments: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      //
      // case WhereToScreen.routeName:
      // // Validation of correct data type
      //   if (args is WhereToScreenArguments) {
      //     return MaterialPageRoute(
      //       builder: (_) => WhereToScreen(
      //         arguments: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      //
      // case VehicleInformationScreen.routeName:
      // // Validation of correct data type
      //   if (args is VehicleInformationScreenArguments) {
      //     return MaterialPageRoute(
      //       builder: (_) => VehicleInformationScreen(
      //         arguments: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      // case RattingScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => RattingScreen(),
      //   );
      default:
        return _errorRoute();
    }

    /*switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }*/
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        ),
      );
    });
  }

}