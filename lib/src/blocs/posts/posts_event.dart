part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {
  Stream<PostsState> execute(PostRepository repository, PostsState state);
}

class PostsStarted extends PostsEvent {
  @override
  Stream<PostsState> execute(
    PostRepository repository,
    PostsState state,
  ) async* {
    yield PostsLoading();
    final result = await repository.fetchAll();

    yield result.fold(
      (failure) => PostsFailure(failure),
      (posts) => PostsLoaded(posts),
    );
  }
}

class PostsRefreshed extends PostsEvent {
  @override
  Stream<PostsState> execute(
    PostRepository repository,
    PostsState state,
  ) async* {
    final result = await repository.fetchAll();

    yield result.fold(
      (failure) => state,
      (refreshedPosts) => PostsLoaded(refreshedPosts),
    );
  }
}
