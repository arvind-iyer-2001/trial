import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TrialFirebaseUser {
  TrialFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

TrialFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TrialFirebaseUser> trialFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TrialFirebaseUser>((user) => currentUser = TrialFirebaseUser(user));
