import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../models/post.dart';
import '../../repositories/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository repository;

  PostsBloc(this.repository);

  @override
  PostsState get initialState => PostsInitial();

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    yield* event.execute(repository, state);
  }
}
