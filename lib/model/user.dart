// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelUser {
  final String id;
  final String nome;
  final String username;
  ModelUser({
    required this.id,
    required this.nome,
    required this.username,
  });

  ModelUser copyWith({
    String? id,
    String? nome,
    String? username,
  }) {
    return ModelUser(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'username': username,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      id: map['id'] as String,
      nome: map['nome'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) => ModelUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelUser(id: $id, nome: $nome, username: $username)';

  @override
  bool operator ==(covariant ModelUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.username == username;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ username.hashCode;
}
