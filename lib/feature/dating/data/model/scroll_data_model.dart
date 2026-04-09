class ScrollDataModel {
  // yyyy-MM-dd

  ScrollDataModel({required this.scrollCount, required this.date});

  factory ScrollDataModel.fromJson(Map<String, dynamic> json) {
    return ScrollDataModel(
      scrollCount: json['scrollCount'],
      date: json['date'],
    );
  }
  final int scrollCount;
  final String date;

  Map<String, dynamic> toJson() => {'scrollCount': scrollCount, 'date': date};
}
