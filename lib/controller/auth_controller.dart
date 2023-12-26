import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:socialmidia/model/user.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Rxn<ModelUser> modelUser = Rxn<ModelUser>();

  @override
  void onInit() {
    super.onInit();
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        modelUser.value = null;
      } else {
        _firebaseFirestore.collection('users').doc(user.uid).get().then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            modelUser.value = ModelUser.fromMap(documentSnapshot.data() as Map<String, dynamic>);
          }
        });
      }
    });
  }

  //entrar
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //cadastrar
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
    String username,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set(
            ModelUser(id: userCredential.user!.uid, name: name, username: username).toMap(),
          );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
