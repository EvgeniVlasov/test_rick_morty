import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationAndroidWidget extends StatelessWidget {
  final RemoteNotification remoteNotification;

  const NotificationAndroidWidget({Key? key, required this.remoteNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    remoteNotification.title.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(remoteNotification.body.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
