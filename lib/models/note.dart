class Note {
  final String id;
  String title;
  String content;
  final DateTime? createdAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}
