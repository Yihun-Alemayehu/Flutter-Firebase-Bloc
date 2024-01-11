import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String email;
  String? picture;
  String role;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
    required this.role
  });

  //Empty user
  static final empty = MyUser(
    id: '',
    name: '',
    email: '',
    picture: '',
    role: '',
  );

  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    String? picture,
    String? role
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      role: role ?? this.role,
    );
  }

  //getter to determine whether the currect user is empty
  bool get isEmpty => this == MyUser.empty;

  //getter to determine whether the currect user is not empty
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      name: name,
      email: email,
      picture: picture,
      role: role,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      picture: entity.picture,
      role: entity.role,
    );
  }

  @override
  List<Object?> get props => [id, name, email, picture, role];
}
