
class Blog {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final List<String> topics;
  final String imageUrl;
  final DateTime updatedAt;
  final String? posterName;
  Blog({
    required this.id,
    required this.posterId,
    required this.title,
    required this.content,
    required this.topics,
    required this.imageUrl,
    required this.updatedAt,
    this.posterName,
  });

}
