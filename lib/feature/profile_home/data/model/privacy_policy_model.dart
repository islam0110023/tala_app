import 'package:cloud_firestore/cloud_firestore.dart';

class PrivacyPolicyModel {

  PrivacyPolicyModel({
    required this.pageTitle,
    required this.sections,
    required this.updatedAt,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      pageTitle: json['pageTitle'] ?? '',
      sections: (json['sections'] as List)
          .map((e) => PolicySection.fromJson(e))
          .toList(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }
  final String pageTitle;
  final List<PolicySection> sections;
  final DateTime updatedAt;
}

class PolicySection {

  PolicySection({
    required this.title,
    required this.points,
  });

  factory PolicySection.fromJson(Map<String, dynamic> json) {
    return PolicySection(
      title: json['title'] ?? '',
      points: List<String>.from(json['points'] ?? []),
    );
  }
  final String title;
  final List<String> points;
}