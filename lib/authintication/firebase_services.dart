import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static final FirebaseServices instance = FirebaseServices();

  factory FirebaseServices(){
    return instance;
  }

  static void signOut(){
    FirebaseAuth.instance.signOut();
  }
}