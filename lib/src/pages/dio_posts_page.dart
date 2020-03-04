import 'dart:async';

import 'package:flutter/material.dart';

import '../../injection_container.dart';
import '../blocs/posts/posts_bloc.dart';
import '../models/post.dart';
import '../widgets/bloc_state_mapper.dart';
import '../widgets/products/empty_widget.dart';
import '../widgets/products/failure_widget.dart';
import '../widgets/products/loading_widget.dart';

class DioPostsPage extends StatefulWidget {
  @override
  _DioPostsPageState createState() => _DioPostsPageState();
}

class _DioPostsPageState extends State<DioPostsPage> {
  final _postsBloc = sl<PostsBloc>();
  Completer<void> _refreshCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _postsBloc.add(PostsStarted());
    _postsBloc.listen(_onRefreshed);
  }

  void _onRefreshed(PostsState state) {
    if (state is PostsLoaded) {
      _refreshCompleter?.complete();
      _refreshCompleter = Completer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Posts"),
      ),
      body: BlocStateMapper<PostsBloc, PostsState>(
        bloc: _postsBloc,
        statesToWidgets: {
          PostsLoading: (_) => LoadingWidget(),
          PostsLoaded: (state) {
            return _buildPostsList(
              (state as PostsLoaded).posts,
            );
          },
          PostsFailure: (state) {
            return FailureWidget(
              error: (state as PostsFailure).error,
            );
          },
        },
      ),
    );
  }

  Widget _buildPostsList(List<Post> posts) {
    if (posts.isEmpty) {
      return EmptyWidget();
    }

    return RefreshIndicator(
      onRefresh: () {
        _postsBloc.add(PostsRefreshed());
        return _refreshCompleter.future;
      },
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
    );
  }
}
