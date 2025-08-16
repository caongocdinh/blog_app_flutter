int calculateReadingTime(String content) {
  final wordCount = content.split(RegExp(r'\s+')).length;// Split content into words using whitespace as a delimiter
  final readingTime = wordCount / 225; // Average reading speed is 225 words per minute
  return readingTime.ceil(); // Round up to the nearest whole number
}