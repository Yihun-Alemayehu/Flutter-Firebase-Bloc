import 'package:user_repository/user_repository.dart';

class PostEntity {
  String postId;
  String post;
  DateTime timeStamp;
  MyUser myUser;

  PostEntity({
    required this.postId,
    required this.post,
    required this.timeStamp,
    required this.myUser,
  });

  Map<String, Object?> toDocument() {
    return {
      'postId': postId,
      'post': post,
      'timeStamp': timeStamp,
      'myUser': myUser.toEntity().toDocument(),
    };
  }

  static PostEntity fromDocument(Map<String, dynamic> doc) {
    return PostEntity(
      postId: doc['postId'],
      post: doc['post'],
      timeStamp:DateTime.parse(doc['timeStamp']),
      myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc['myUser'])) ,
    );
  }

  @override
  List<Object?> get props => [postId, post, timeStamp, myUser];

  @override
  String toString() {
    return '''PostEntity: {
      postId: $postId
      post: $post
      timeStamp: $timeStamp
      myUser: $myUser
      }''';
  }
}
