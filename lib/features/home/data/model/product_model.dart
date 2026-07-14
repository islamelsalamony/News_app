class ProductModel {
  final int id;
  final String title;
  final String category;
  final String details;
  final String image;
  final String date;
  final String time;

  ProductModel({
    required this.id,

    required this.title,
    required this.category,
    required this.details,
    required this.image,
    required this.date,
    required this.time,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      category: json['category'] ?? 'No Category',
      details: json['details'] ?? 'No Details',
      image: json['image'] ?? 'No Image',
      date: json['date'] ?? 'No Date',
      time: json['time'] ?? 'No Time',
    );
  }
}
