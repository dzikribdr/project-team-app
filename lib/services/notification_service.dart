import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart'; // Penting untuk fitur Copy

// Handler untuk background message (harus di luar class/top-level)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Jika perlu melakukan sesuatu saat background, misal simpan ke local storage
  print("Handling a background message: ${message.messageId}");
}