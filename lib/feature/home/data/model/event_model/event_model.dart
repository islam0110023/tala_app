import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventModel {
  EventModel({
    required this.bookedSeats,
    required this.capacity,
    required this.createdAt,
    required this.dateTime,
    required this.description,
    required this.eventType,
    required this.image,
    required this.location,
    required this.name,
    required this.price,
    required this.status,
    required this.updatedAt,
    required this.bookingEndAt,
    required this.effectiveBookingEndAt,
    required this.id,
    this.isFavorite = false,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      bookedSeats: json['bookedSeats'] ?? 0,
      capacity: json['capacity'] ?? 0,
      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      description: json['description'] ?? '',
      eventType: json['eventType'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      status: json['status'] ?? '',
      updatedAt: json['updatedAt'] is Timestamp
          ? (json['updatedAt'] as Timestamp).toDate()
          : DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
      dateTime: parseAndFormat(json['dateTime']),
      bookingEndAt: parseAndFormat(json['bookingEndAt']),
      effectiveBookingEndAt: parseAndFormat(json['effectiveBookingEndAt']),
      id: json['id'] ?? '',
    );
  }
  factory EventModel.fromJsonCache(Map<String, dynamic> json) {
    return EventModel(
      bookedSeats: json['bookedSeats'] ?? 0,
      capacity: json['capacity'] ?? 0,
      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      description: json['description'] ?? '',
      eventType: json['eventType'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      status: json['status'] ?? '',
      updatedAt: json['updatedAt'] is Timestamp
          ? (json['updatedAt'] as Timestamp).toDate()
          : DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
      dateTime: parseAndFormat(json['dateTime']),
      bookingEndAt: parseAndFormat(json['bookingEndAt']),
      effectiveBookingEndAt: parseAndFormat(json['effectiveBookingEndAt']),
      id: json['id'] ?? '',
      isFavorite: json['isFavorite'],
    );
  }
  final int bookedSeats;
  final int capacity;
  final DateTime createdAt;
  final String dateTime;
  final String description;
  final String eventType;
  final String image;
  final String location;
  final String name;
  final int price;
  final String status;
  final DateTime updatedAt;
  final String id;
  final String bookingEndAt;
  final String effectiveBookingEndAt;
  bool isFavorite;

  Map<String, dynamic> toJson() {
    return {
      'bookedSeats': bookedSeats,
      'capacity': capacity,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'dateTime': dateTime,
      'description': description,
      'eventType': eventType,
      'image': image,
      'location': location,
      'name': name,
      'price': price,
      'status': status,
      'id': id,
      'isFavorite': isFavorite,
      'bookingEndAt': bookingEndAt,
      'effectiveBookingEndAt': effectiveBookingEndAt,
    };
  }

  EventModel copyWith({bool? isFavorite}) {
    return EventModel(
      bookedSeats: bookedSeats,
      capacity: capacity,
      createdAt: createdAt,
      dateTime: dateTime,
      description: description,
      eventType: eventType,
      image: image,
      location: location,
      name: name,
      price: price,
      status: status,
      updatedAt: updatedAt,
      id: id,
      bookingEndAt: bookingEndAt,
      effectiveBookingEndAt: effectiveBookingEndAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  static String parseAndFormat(dynamic value) {
    if (value == null || value.toString().isEmpty) return '';

    try {
      DateTime date;

      if (value is Timestamp) {
        date = value.toDate();
      } else if (value is int) {
        date = DateTime.fromMillisecondsSinceEpoch(value);
      } else if (value is String) {
        date =
            DateTime.tryParse(value) ??
            DateFormat('dd/MM/yyyy - hh:mm a', 'en').parse(value);
      } else {
        return '';
      }

      return DateFormat('dd/MM/yyyy - hh:mm a', 'en').format(date.toLocal());
    } catch (e) {
      return '';
    }
  }
}
