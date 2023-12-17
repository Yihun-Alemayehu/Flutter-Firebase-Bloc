import 'package:user_repository/user_repository.dart';

import '../entities/entities.dart';

class Post {
  String postId;
  String post;
  DateTime timeStamp;
  MyUser myUser;

  Post({
    required this.postId,
    required this.post,
    required this.timeStamp,
    required this.myUser,
  });

  //Empty user
  static final empty = Post(
    postId: '',
    post: '',
    timeStamp: DateTime.now(),
    myUser: MyUser.empty,
  );

  Post copyWith({
    String? postId,
    String? post,
    DateTime? timeStamp,
    MyUser? myUser,
  }) {
    return Post(
      postId: postId ?? this.postId,
      post: post ?? this.post,
      timeStamp: timeStamp ?? this.timeStamp,
      myUser: myUser ?? this.myUser,
    );
  }

  //getter to determine whether the currect user is empty
  bool get isEmpty => this == Post.empty;

  //getter to determine whether the currect user is not empty
  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() {
    return PostEntity(
      postId: postId,
      post: post,
      timeStamp: timeStamp,
      myUser: myUser,
    );
  }

  static Post fromEntity(PostEntity entity) {
    return Post(
      postId: entity.postId,
      post: entity.post,
      timeStamp: entity.timeStamp,
      myUser: entity.myUser,
    );
  }

  @override
  String toString() {
    return '''Post: {
      postId: $postId
      post: $post
      timeStamp: $timeStamp
      myUser: $myUser
      }''';
  }
  // @override
  // List<Object?> get props => [postId, post, timeStamp, myUser];
}