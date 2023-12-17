part of 'get_post_bloc.dart';

sealed class GetPostState extends Equatable {
  const GetPostState();
  
  @override
  List<Object> get props => [];
}

final class GetPostInitial extends GetPostState {}
