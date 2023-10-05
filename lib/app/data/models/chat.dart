import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transport/app/data/models/user.dart';

class Chat {
  String id; // Unique chat room ID
  final List<String> participants; // List of user IDs participating in the chat
  final String? lastMessage; // Content of the last message in the chat
  final DateTime? lastMessageTime; // Timestamp of the last message
  final FirestoreUser userDetails;

  Chat({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.userDetails,
  });

  // Factory constructor to create a Chat object from a map (Firestore data)
  factory Chat.fromJson(Map<String, dynamic> map) {
    return Chat(
      id: map['id'],
      participants: List<String>.from(map['participants']),
      lastMessage: map['lastMessage'],
      lastMessageTime: (map['lastMessageTime'] as Timestamp?)?.toDate(),
      // Convert Firestore Timestamp to DateTime
      userDetails: FirestoreUser.fromMap(map['userDetails']),
    );
  }

  // Convert a Chat object to a map for Firestore storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
    };
  }
}
