import 'dart:convert';

/// message : "message"
/// sender : "nickname"
/// timestamp : 1222233

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));
String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
  ChatMessage({
    String? message,
    String? sender,
    num? timestamp,
  }) {
    _message = message;
    _sender = sender;
    _timestamp = timestamp;
  }

  ChatMessage.fromJson(dynamic json) {
    _message = json['message'];
    _sender = json['sender'];
    _timestamp = json['timestamp'];
  }
  String? _message;
  String? _sender;
  num? _timestamp;
  ChatMessage copyWith({
    String? message,
    String? sender,
    num? timestamp,
  }) =>
      ChatMessage(
        message: message ?? _message,
        sender: sender ?? _sender,
        timestamp: timestamp ?? _timestamp,
      );
  String? get message => _message;
  String? get sender => _sender;
  num? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['sender'] = _sender;
    map['timestamp'] = _timestamp;
    return map;
  }
}
