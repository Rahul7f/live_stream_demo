// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

import 'live_page.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  /// Users who use the same liveID can join the same live streaming.
  final liveTextCtrl = TextEditingController();
  final userIDController = TextEditingController();
  final nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(120, 60),
      backgroundColor: const Color(0xff2C2F3E).withOpacity(0.6),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID:${userIDController.text}'),
            const Text('Please test with two or more devices'),
            TextFormField(controller: userIDController, decoration: const InputDecoration(labelText: 'User ID'),),
            const SizedBox(height: 20,),
            TextFormField(controller: nameController, decoration: const InputDecoration(labelText: 'Name'),),
            const SizedBox(height: 20),
            TextFormField(controller: liveTextCtrl, decoration: const InputDecoration(labelText: 'Live ID'),),
            const SizedBox(height: 20),
            // click me to navigate to LivePage
            ElevatedButton(

              child: const Text('Start a live'),
              onPressed: () => jumpToLivePage(
                context,
                liveID: liveTextCtrl.text.trim(),
                isHost: true,
                userID: userIDController.text.trim(),
                name: nameController.text.trim(),
              ),
            ),
            const SizedBox(height: 20),
            // click me to navigate to LivePage
            ElevatedButton(

              child: const Text('Watch a live'),
              onPressed: () => jumpToLivePage(
                context,
                liveID: liveTextCtrl.text.trim(),
                isHost: false,
                userID: userIDController.text.trim(),
                name: nameController.text.trim(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void jumpToLivePage(BuildContext context, {required String liveID, required bool isHost,required String userID,required String name}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivePage(liveID: liveID, isHost: isHost, userID: userID, name: name,),
      ),
    );
  }
}