import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? picture;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
  });

  //Empty user
  static const empty = MyUser(
    id: '',
    name: '',
    email: '',
    picture: '',
  );

  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    String? picture,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
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
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      picture: entity.picture,
    );
  }

  @override
  List<Object?> get props => [id, name, email, picture];
}
