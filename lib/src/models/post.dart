class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Post copyWith({
    int userId,
    int id,
    String title,
    String body,
  }) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      userId: map['userId']?.toInt(),
      id: map['id']?.toInt(),
      title: map['title'],
      body: map['body'],
    );
  }
}
