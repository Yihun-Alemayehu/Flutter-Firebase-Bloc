import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? picture;

  const MyUserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'picture': picture,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      picture: doc['picture'],
    );
  }

  @override
  List<Object?> get props => [id, name, email, picture];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      name: $name
      email: $email
      picture: $picture
      }''';
  }
}
