import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;
  const BlogCard({
    super.key,
    required this.blog,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, BlogViewerPage.route(blog),);
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(
            16.0).copyWith(bottom: 4,), //outside container, padding inside container
        padding: const EdgeInsets.all(16.0), //inside container
        decoration: BoxDecoration(
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  // Scrollable area for text input
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: blog.topics
                        .map(
                          // Convert list of strings to chips
                          (e) => Padding(
                            // Padding around each chip
                            padding: const EdgeInsets.all(5.0),
                            child: Chip(
                              // Create a chip for each tag
                              label: Text(e), // Border color and width
                            ),
                          ),
                        )
                        .toList(), // Convert list of strings to chips,
                  ),
                ),
                Text(
                  blog.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text('${calculateReadingTime( blog.content)} phút đọc'),
          ],
        ),
      ),
    );
  }
}
