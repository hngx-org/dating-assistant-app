import 'package:dating_assitant_app/commons/services/storage.dart';

class Global {
  static late StorageServices storageServices;

  static Future init() async {
    storageServices = await StorageServices().init(); 
  }
}