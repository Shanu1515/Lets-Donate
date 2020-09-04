import 'package:donate/Global/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  user1 = user.uid;
  SharedPreferences pref15 = await SharedPreferences.getInstance();
  pref15.setString("alreadyregistered", user.uid);
  SharedPreferences pref1 = await SharedPreferences.getInstance();
  pref1.setString("name", name);
  SharedPreferences pref2 = await SharedPreferences.getInstance();
  pref2.setString("image", imageUrl);
  SharedPreferences pref3 = await SharedPreferences.getInstance();
  pref3.setString("email", email);
  return 'signInWithGoogle succeeded: $user';
}

Future signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
