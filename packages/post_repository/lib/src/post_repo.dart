import 'package:post_repository/post_repository.dart';

abstract class PostRepository {
  Future<Post> createPost(Post post);
  Future<List<Post>> getPost();
}
