import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  static late SharedPreferences prefs;

  Future init() async{
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Session> getSessions() {
    List<Session> ss = [];
    Set<String> keys = prefs.getKeys(); //set is un-ordered list. 
    print(keys);
    keys.forEach((k) {
      Session session  = Session.fromJson(json.decode(prefs.getString(k)??''));
      ss.add(session);
     });
     return ss;
  }

}