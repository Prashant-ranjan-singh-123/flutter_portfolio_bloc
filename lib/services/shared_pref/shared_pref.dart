import 'package:prashant_portfolio/services/shared_pref/shared_pref_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SharedPrefFunctions{

  static Future<bool> isFirstRunOnboard() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isFisrtRun = await pref.getBool(SharedPrefVariable.isShowOnboard);
    isFisrtRun ??= true;

    if(isFisrtRun){
      return true;
    }else{
      return false;
    }
  }

  static setFirstRunBoolOnboardFalse() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(SharedPrefVariable.isShowOnboard, false);
  }
}