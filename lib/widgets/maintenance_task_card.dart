import 'package:flutter/material.dart';
import '../models/maintenance_task.dart';

class MaintenanceTaskCard extends StatelessWidget {
  final MaintenanceTask task;
  final VoidCallback onMarkCompleted;

  const MaintenanceTaskCard({
    Key? key,
    required this.task,
    required this.onMarkCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: task.getStatusColor().withOpacity(0.3),
          width: 1.5,
        ),
      ),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          _showTaskDetails(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: task.getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: task.getStatusColor(),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      task.getStatusText(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: task.getStatusColor(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.speed, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'Due at: ${task.dueMileage} miles',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.refresh, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'Every: ${task.mileageInterval} miles',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              if (task.status != MaintenanceStatus.completed) ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onMarkCompleted,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36),
                    backgroundColor: task.getStatusColor(),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Mark as Completed'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showTaskDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: task.getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: task.getStatusColor(),
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      task.getStatusText(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: task.getStatusColor(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    task.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Service Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(Icons.speed, 'Due at', '${task.dueMileage} miles'),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                      Icons.refresh, 'Service Interval', '${task.mileageInterval} miles'),
                  if (task.completedDate != null) ...[
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      Icons.check_circle,
                      'Completed on',
                      '${task.completedDate!.month}/${task.completedDate!.day}/${task.completedDate!.year}',
                    ),
                  ],
                  const SizedBox(height: 24),
                  if (task.status != MaintenanceStatus.completed)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onMarkCompleted();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: task.getStatusColor(),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Mark as Completed',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
} 