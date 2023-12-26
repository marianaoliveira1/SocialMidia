// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ModelPost {
  final String message;
  final List<String> likes;
  ModelPost({
    required this.message,
    required this.likes,
  });

  ModelPost copyWith({
    String? message,
    List<String>? likes,
  }) {
    return ModelPost(
      message: message ?? this.message,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'likes': likes,
    };
  }

  factory ModelPost.fromMap(Map<String, dynamic> map) {
    return ModelPost(
        message: map['message'] as String,
        likes: List<String>.from(
          (map['likes'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory ModelPost.fromJson(String source) => ModelPost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelPost(message: $message, likes: $likes)';

  @override
  bool operator ==(covariant ModelPost other) {
    if (identical(this, other)) return true;

    return other.message == message && listEquals(other.likes, likes);
  }

  @override
  int get hashCode => message.hashCode ^ likes.hashCode;
}
