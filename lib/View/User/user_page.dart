import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce/View/User/components/user_body.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/userScreen';

  const UserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final userId = _auth.currentUser!.uid;
    final User? user = _auth.currentUser;

    return FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(userId).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (user!.isAnonymous) {
            return UserPageBody();
          }
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print("Full Name: ${data['name']}");
            // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
            return UserPageBody(
              email: data['email'],
              image: data['imageUrl'],
              joinedDate: data['joinedAt'],
              phoneNumber: data['phoneNumber'].toString(),
              name: data['name'],
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
