

import '../Helpers/Shared_Pref_helper.dart';

class Api{
  Future<void> loginuser()async{
    String token="hsusjlll";
    await Shared_pref_helper().setAuthToken(token);

  }

 }