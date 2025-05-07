import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/maintenance_task.dart';

class MaintenanceService {
  // Mock data for a car
  Car getMockCar() {
    return Car(
      id: '1',
      make: 'Toyota',
      model: 'Camry',
      year: 2020,
      currentMileage: 35000,
      imageUrl: 'https://via.placeholder.com/150',
    );
  }

  // Mock data for maintenance tasks
  List<MaintenanceTask> getMockTasks() {
    final Car car = getMockCar();
    
    return [
      MaintenanceTask(
        id: '1',
        title: 'Oil Change',
        description: 'Change engine oil and replace oil filter',
        dueMileage: 38000,
        mileageInterval: 5000,
        status: _calculateStatus(car.currentMileage, 38000),
      ),
      MaintenanceTask(
        id: '2',
        title: 'Tire Rotation',
        description: 'Rotate tires to ensure even wear',
        dueMileage: 37000,
        mileageInterval: 6000,
        status: _calculateStatus(car.currentMileage, 37000),
      ),
      MaintenanceTask(
        id: '3',
        title: 'Air Filter Replacement',
        description: 'Replace engine air filter',
        dueMileage: 40000,
        mileageInterval: 15000,
        status: _calculateStatus(car.currentMileage, 40000),
      ),
      MaintenanceTask(
        id: '4',
        title: 'Brake Inspection',
        description: 'Inspect brake pads, rotors, and brake fluid',
        dueMileage: 36000,
        mileageInterval: 10000,
        status: _calculateStatus(car.currentMileage, 36000),
      ),
      MaintenanceTask(
        id: '5',
        title: 'Transmission Fluid Check',
        description: 'Check transmission fluid level and condition',
        dueMileage: 45000,
        mileageInterval: 30000,
        status: _calculateStatus(car.currentMileage, 45000),
      ),
    ];
  }

  // Calculate maintenance status based on current mileage and due mileage
  MaintenanceStatus _calculateStatus(int currentMileage, int dueMileage) {
    final int difference = dueMileage - currentMileage;
    
    if (difference < 0) {
      return MaintenanceStatus.overdue;
    } else if (difference < 500) {
      return MaintenanceStatus.due;
    } else if (difference < 2000) {
      return MaintenanceStatus.upcoming;
    } else {
      return MaintenanceStatus.upcoming;
    }
  }

  // Update car mileage and recalculate maintenance statuses
  List<MaintenanceTask> updateMileage(List<MaintenanceTask> tasks, Car car, int newMileage) {
    return tasks.map((task) {
      return task.copyWith(
        status: _calculateStatus(newMileage, task.dueMileage),
      );
    }).toList();
  }

  // Mark a task as completed
  MaintenanceTask completeTask(MaintenanceTask task) {
    return task.copyWith(
      status: MaintenanceStatus.completed,
      completedDate: DateTime.now(),
    );
  }
} 