import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  RealtimeChannel? _channel;

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initSettings = InitializationSettings(android: androidSettings);
    await _notificationsPlugin.initialize(initSettings);
  }

  void startListening() {
    _channel = Supabase.instance.client.channel('activities-changes');

    _channel!
        .on(
          RealtimeListenTypes.postgresChanges,
          ChannelFilter(event: 'INSERT', schema: 'public', table: 'activities'),
          (payload, [ref]) {
            debugPrint('NEW EVENT: $payload');
            final newRecord = payload['new'] as Map<String, dynamic>?;
            final title = newRecord?['title'] ?? 'Event Baru';
            showNotification(title: '📅 Event Baru!', body: title);
          },
        )
        .on(
          RealtimeListenTypes.postgresChanges,
          ChannelFilter(event: 'UPDATE', schema: 'public', table: 'activities'),
          (payload, [ref]) {
            debugPrint('EVENT UPDATED: $payload');
            final newRecord = payload['new'] as Map<String, dynamic>?;
            final title = newRecord?['title'] ?? 'Event';
            showNotification(
              title: '🔄 Event Diperbarui',
              body: '$title telah diperbarui',
            );
          },
        )
        .subscribe();

    debugPrint('Supabase Realtime listening started');
  }

  void stopListening() {
    _channel?.unsubscribe();
    _channel = null;
    debugPrint('Supabase Realtime listening stopped');
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'events_channel',
      'Event Notifications',
      channelDescription: 'Notifications for new and updated events',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
    );
  }
}
