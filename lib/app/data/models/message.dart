import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id; // Unique message ID
  final String senderId; // ID of the user who sent the message
  final String content; // Message content
  final DateTime timestamp; // Timestamp when the message was sent

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  // Factory constructor to create a Message object from a map (Firestore data)
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      senderId: map['senderId'],
      content: map['content'],
      timestamp: (map['timestamp'] as Timestamp)
          .toDate(), // Convert Firestore Timestamp to DateTime
    );
  }

  // Convert a Message object to a map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'content': content,
      'timestamp': timestamp,
    };
  }
}
