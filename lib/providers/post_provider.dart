import 'package:flutter/foundation.dart';

import '../models/post.dart';
import '../services/post_service.dart';

class PostProvider extends ChangeNotifier {
  PostProvider(this._postService);

  final PostService _postService;

  List<Post> _posts = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Post> get posts => List.unmodifiable(_posts);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _postService.fetchPosts();
      _posts = result.take(20).toList();
    } catch (_) {
      _errorMessage =
          'Something went wrong while loading data. Check your internet connection and try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
