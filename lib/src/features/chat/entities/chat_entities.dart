import 'dart:convert';

class ChatEntity {
  final String message;
  final String senderId;
  final String receiverId;
  final DateTime dateTime;
  ChatEntity({
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
  });

  ChatEntity copyWith({
    String? message,
    String? senderId,
    String? receiverId,
    DateTime? dateTime,
  }) {
    return ChatEntity(
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory ChatEntity.fromMap(Map<String, dynamic> map) {
    return ChatEntity(
      message: map['message'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatEntity.fromJson(String source) =>
      ChatEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatEntity(message: $message, senderId: $senderId, receiverId: $receiverId, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant ChatEntity other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        senderId.hashCode ^
        receiverId.hashCode ^
        dateTime.hashCode;
  }
}
