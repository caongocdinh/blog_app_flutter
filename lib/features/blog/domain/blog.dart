// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final List<String> topics;
  final String imageUrl;
  final DateTime updatedAt;
  Blog({
    required this.id,
    required this.posterId,
    required this.title,
    required this.content,
    required this.topics,
    required this.imageUrl,
    required this.updatedAt,
  });
}
