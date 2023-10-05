import 'package:dating_assitant_app/commons/services/storage.dart';
import 'package:flutter/material.dart';

class Global {
  static late StorageServices storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageServices = await StorageServices().init(); 
  }
}