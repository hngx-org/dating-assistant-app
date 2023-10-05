import 'package:dating_assitant_app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _pref;
  Future<StorageServices> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }


  Future<String> getString(String key) async{
    return _pref.getString(key)?? '';
  }

  String getUserCookie(){
    return _pref.getString(AppConstants.localStorageCookie) ?? '';
  }
}