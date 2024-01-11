import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? picture;
  final String role;

  const MyUserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
    required this.role,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'picture': picture,
      'role': role,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      picture: doc['picture'],
      role: doc['role'],
    );
  }

  @override
  List<Object?> get props => [id, name, email, picture, role];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      name: $name
      email: $email
      picture: $picture
      role: $role
      }''';
  }
}
