import 'package:flutter/material.dart';

enum MaintenanceStatus {
  upcoming,
  due,
  overdue,
  completed,
}

class MaintenanceTask {
  final String id;
  final String title;
  final String description;
  final int dueMileage;
  final int mileageInterval;
  final MaintenanceStatus status;
  final DateTime? completedDate;

  MaintenanceTask({
    required this.id,
    required this.title,
    required this.description,
    required this.dueMileage,
    required this.mileageInterval,
    this.status = MaintenanceStatus.upcoming,
    this.completedDate,
  });

  MaintenanceTask copyWith({
    String? id,
    String? title,
    String? description,
    int? dueMileage,
    int? mileageInterval,
    MaintenanceStatus? status,
    DateTime? completedDate,
  }) {
    return MaintenanceTask(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueMileage: dueMileage ?? this.dueMileage,
      mileageInterval: mileageInterval ?? this.mileageInterval,
      status: status ?? this.status,
      completedDate: completedDate ?? this.completedDate,
    );
  }

  Color getStatusColor() {
    switch (status) {
      case MaintenanceStatus.upcoming:
        return Colors.blue;
      case MaintenanceStatus.due:
        return Colors.orange;
      case MaintenanceStatus.overdue:
        return Colors.red;
      case MaintenanceStatus.completed:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String getStatusText() {
    switch (status) {
      case MaintenanceStatus.upcoming:
        return 'Upcoming';
      case MaintenanceStatus.due:
        return 'Due Now';
      case MaintenanceStatus.overdue:
        return 'Overdue';
      case MaintenanceStatus.completed:
        return 'Completed';
      default:
        return 'Unknown';
    }
  }
} 