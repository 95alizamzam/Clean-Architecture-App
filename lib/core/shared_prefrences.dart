import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesClass {
  late SharedPreferences sp;
  Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  Future<void> saveString({required String key, required String value}) async {
    await sp.setString(key, value);
  }

  String? readString({required String key}) => sp.getString(key);
}
