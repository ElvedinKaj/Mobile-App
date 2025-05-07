class Car {
  final String id;
  final String make;
  final String model;
  final int year;
  final int currentMileage;
  final String imageUrl;

  Car({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.currentMileage,
    this.imageUrl = '',
  });

  Car copyWith({
    String? id,
    String? make,
    String? model,
    int? year,
    int? currentMileage,
    String? imageUrl,
  }) {
    return Car(
      id: id ?? this.id,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      currentMileage: currentMileage ?? this.currentMileage,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
} 