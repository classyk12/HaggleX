import 'package:get_storage/get_storage.dart';

class Storage {
  //this retrieves the token from local storage
  static String read(String key) {
    final datacount = GetStorage();
    final value = datacount.read(key);
    if (value != null) {
      return value as String;
    }
    return null;
  }

  static dynamic reloadStorage() async {
    final datacount = GetStorage();
    datacount.erase();
  }

//this saves decoded token into local storage
  static bool save(String key, String value) {
    if (value != null) {
      final datacount = GetStorage();
      datacount.write(key, value);
      return true;
    }
    return false;
  }

//this removes a specified local storage value from storage
  static Future<bool> remove(String key) async {
    final datacount = GetStorage();
    await datacount.remove(key);
    return true;
  }

//this clears all local storage values
  static Future<bool> clearAll() async {
    final datacount = GetStorage();
    await datacount.erase();
    return true;
  }
}
