part of 'get_post_bloc.dart';

abstract class GetPostEvent extends Equatable {
  const GetPostEvent();

  @override
  List<Object> get props => [];
}

class GetPost extends GetPostEvent {}
