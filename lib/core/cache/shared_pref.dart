import 'package:shared_preferences/shared_preferences.dart';

class sharedHelper {
  static late SharedPreferences sharedPreferences;
  // static const String favoritesListKey = "favorites_list";
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  static String getToken() {
    return sharedPreferences.getString(
          "token",
        ) ??
        "";
  }

  static deleteToken() {
    sharedPreferences.remove("token");
  }

  static Future<void> addToFavorites(String productId) async {
    List<String> favoritesList =
        sharedPreferences.getStringList(getToken()) ?? [];
    if (!favoritesList.contains(productId)) {
      favoritesList.add(productId);
      await sharedPreferences.setStringList(getToken(), favoritesList);
    }
  }

  static Future<List<String>> getFavorites() async {
    List<String> favoritesList =
        sharedPreferences.getStringList(getToken()) ?? [];
    return favoritesList;
  }

  static Future<void> removeFromFavorites(String productId) async {
    List<String> favoritesList =
        sharedPreferences.getStringList(getToken()) ?? [];
    if (favoritesList.contains(productId)) {
      favoritesList.remove(productId);
      await sharedPreferences.setStringList(getToken(), favoritesList);
    }
  }
}
