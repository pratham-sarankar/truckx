import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transport/app/data/models/chat.dart';
import 'package:transport/app/data/models/message.dart';

class ChatRepository {
  Stream<QuerySnapshot<Message>> streamMessages(Chat chat) {
    return FirebaseFirestore.instance
        .collection("chats")
        .doc(chat.id)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Message.fromMap(data);
      },
      toFirestore: (value, options) {
        return value.toMap();
      },
    ).snapshots();
  }

  Future<void> sendMessage(Chat chat, Message message) async {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(chat.id)
        .collection('messages')
        .add(message.toMap());
  }

  Future<Chat> initiateChat(List<String> participants) async {
    // Sort the participant IDs to ensure consistency in chat IDs
    participants.sort();

    // Query chats based on the sorted participant IDs
    final chatQuery = await FirebaseFirestore.instance
        .collection('chats')
        .where('participants', isEqualTo: participants)
        .get();

    if (chatQuery.docs.isNotEmpty) {
      // If an existing chat is found, return the first one (you can add more logic if needed)
      final existingChatData = chatQuery.docs.first.data();
      existingChatData['id'] = chatQuery.docs.first.id;
      return Chat.fromJson(existingChatData);
    } else {
      // If no existing chat is found, create a new chat
      final newChatRef =
          await FirebaseFirestore.instance.collection('chats').add({
        'participants': participants,
        'lastMessage': null, // Initialize with no last message
        'lastMessageTime': null, // Initialize with no last message time
      });

      // Retrieve the newly created chat and return it
      final newChatSnapshot = await newChatRef.get();
      final newChatData = newChatSnapshot.data() as Map<String, dynamic>;
      newChatData['id'] = newChatSnapshot.id;
      return Chat.fromJson(newChatData);
    }
  }

  Future<List<Chat>> getChats() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final chats = await FirebaseFirestore.instance
        .collection("chats")
        .where("participants", arrayContains: uid)
        .get();
    List<Chat> result = [];
    for (final chat in chats.docs) {
      final data = chat.data();
      data['id'] = chat.id;
      final participants = data['participants'] as List<dynamic>;
      final userDetails = await getUserDetails(
          participants.firstWhere((element) => element != uid));
      data['userDetails'] = userDetails;
      result.add(Chat.fromJson(data));
    }
    return result;
  }

  Future<Map<String, dynamic>> getUserDetails(String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .get()
        .then((value) {
      final data = value.data()!;
      return data;
    });
  }
}
