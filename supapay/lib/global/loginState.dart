import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> userSignupState() async {

  try {
    FirebaseAuth auth = FirebaseAuth.instance;

    final currentUser = auth.currentUser;

    return currentUser != null;
  } catch (e) {
    print(e);
    return false;
  }
}


