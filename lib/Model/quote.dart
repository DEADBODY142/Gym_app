class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['quote'],
      author: json['author'],
    );
  }

  static List<Quote> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Quote.fromJson(json)).toList();
  }
}
