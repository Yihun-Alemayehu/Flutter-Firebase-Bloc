import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  PostRepository _postRepository;
  GetPostBloc({
    required PostRepository myPostRepository,
  })  : _postRepository = myPostRepository,
        super(GetPostInitial()) {
    on<GetPost>((event, emit) async {
      emit(GetPostLoading());
      try {
        List<Post> posts = await _postRepository.getPost();
        emit(GetPostSuccess(posts));
      } catch (e) {
        rethrow;
      }
    });
  }
}
