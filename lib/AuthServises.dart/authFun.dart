// ignore_for_file: prefer_const_constructors

import '../constants.dart';

class AuthServices {
  static signupUser(String email, String password, String name, String address,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(address);
      await FirestoreServices.saveUser(
          name, email, password, address, userCredential.user!.uid);
      // Get.to(verifyScreen());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Verification Email sent')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // Get.to(verifyScreen());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successfully')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }
}
