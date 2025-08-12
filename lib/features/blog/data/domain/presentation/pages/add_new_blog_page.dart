import 'dart:io';

import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/pick_image.dart';
import 'package:blog_app/features/blog/data/domain/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AddNewBlogPage(),
      );
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  List<String> selectedTopics = []; // List to hold selected topics
  File? image; // Variable to hold the selected image
  void selectImage() async {
    final pickedImage =
        await pickImage(); // Function to pick an image from the gallery
    if (pickedImage != null) {// Check if an image was picked
      // If an image was picked, update the state with the new image
      setState(() {
        image =
            pickedImage; // Update the image variable with the selected image
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Main column to hold the content
            children: [
              image != null
                  ? GestureDetector(
                    onTap: () {
                        selectImage();
                      }, // Call selectImage function when tapped
                      // Display the selected image in a rounded rectangle
                    child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ) // Display the selected image if available
                  : GestureDetector(
                      //
                      // Gesture to handle image selection
                      onTap: () {
                        selectImage();
                      }, // Call selectImage function when tapped
                      child: DottedBorder(
                        // Dotted border widget
                        color: AppPallete.borderColor,
                        dashPattern: const [10, 4], // Dotted line pattern
                        radius: const Radius.circular(10),
                        borderType:
                            BorderType.RRect, // Rounded rectangle border
                        strokeCap: StrokeCap.round,
                        child: Container(
                          // Container to hold the content
                          height: 150,
                          width: double.infinity, // Full width
                          child: const Column(
                            // Center the content vertically
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center the content vertically
                            children: [
                              Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Chọn tệp của bạn',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                // Scrollable area for text input
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    'Công nghệ',
                    'Kinh doanh',
                    'Lập trình',
                    'Giải trí',
                  ]
                      .map(
                        // Convert list of strings to chips
                        (e) => Padding(
                          // Padding around each chip
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            // Gesture to handle chip selection
                            onTap: () {
                              if (selectedTopics.contains(e)) {
                                selectedTopics.remove(
                                    e); // Remove topic if already selected
                              } else {
                                selectedTopics
                                    .add(e); // Add selected topic to the list
                              }
                              setState(() {}); // Update the UI
                            },

                            child: Chip(
                              // Create a chip for each tag
                              label: Text(e), // Display the tag text
                              color: selectedTopics.contains(e)
                                  ? const WidgetStatePropertyAll(
                                      AppPallete
                                          .gradient1, // Change color if selected
                                    )
                                  : null, // Default color if not selected
                              side: selectedTopics.contains(e)
                                  ? null
                                  : const BorderSide(
                                      color: AppPallete.borderColor,
                                    ), // Border color and width
                            ),
                          ),
                        ),
                      )
                      .toList(), // Convert list of strings to chips,
                ),
              ),
              const SizedBox(height: 10),
              BlogEditor(
                  controller: titleController,
                  hintText: 'Tiêu đề Blog'), // Text field for blog title
              const SizedBox(height: 10),
              BlogEditor(
                controller: contentController,
                hintText: 'Nội dung Blog',
              ), // Text field for blog content
            ],
          ),
        ),
      ),
    );
  }
}
