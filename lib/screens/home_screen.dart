import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/maintenance_task.dart';
import '../services/maintenance_service.dart';
import '../widgets/car_details_card.dart';
import '../widgets/maintenance_task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Car _car;
  late List<MaintenanceTask> _tasks;
  final MaintenanceService _maintenanceService = MaintenanceService();

  @override
  void initState() {
    super.initState();
    _car = _maintenanceService.getMockCar();
    _tasks = _maintenanceService.getMockTasks();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateMileage() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController mileageController =
            TextEditingController(text: _car.currentMileage.toString());
        return AlertDialog(
          title: const Text('Update Mileage'),
          content: TextField(
            controller: mileageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Current Mileage',
              suffixText: 'miles',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final int newMileage = int.tryParse(mileageController.text) ?? _car.currentMileage;
                if (newMileage >= _car.currentMileage) {
                  setState(() {
                    _car = _car.copyWith(currentMileage: newMileage);
                    _tasks = _maintenanceService.updateMileage(_tasks, _car, newMileage);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _markTaskCompleted(MaintenanceTask task) {
    setState(() {
      final int index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = _maintenanceService.completeTask(task);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Maintenance Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    // Filter tasks based on selected tab
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildHistoryTab();
      case 2:
        return _buildSettingsTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    // Get pending tasks (not completed)
    final List<MaintenanceTask> pendingTasks = _tasks
        .where((task) => task.status != MaintenanceStatus.completed)
        .toList();

    // Sort by priority
    pendingTasks.sort((a, b) {
      if (a.status == MaintenanceStatus.overdue && b.status != MaintenanceStatus.overdue) {
        return -1;
      } else if (a.status != MaintenanceStatus.overdue && b.status == MaintenanceStatus.overdue) {
        return 1;
      } else if (a.status == MaintenanceStatus.due && b.status != MaintenanceStatus.due) {
        return -1;
      } else if (a.status != MaintenanceStatus.due && b.status == MaintenanceStatus.due) {
        return 1;
      } else {
        return a.dueMileage.compareTo(b.dueMileage);
      }
    });

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarDetailsCard(
            car: _car,
            onUpdateMileage: _updateMileage,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Upcoming Maintenance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (pendingTasks.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'No upcoming maintenance tasks!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          else
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pendingTasks.length,
              itemBuilder: (context, index) {
                final task = pendingTasks[index];
                return MaintenanceTaskCard(
                  task: task,
                  onMarkCompleted: () => _markTaskCompleted(task),
                );
              },
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    // Get completed tasks
    final List<MaintenanceTask> completedTasks = _tasks
        .where((task) => task.status == MaintenanceStatus.completed)
        .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Maintenance History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (completedTasks.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'No completed maintenance tasks yet!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          else
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];
                return MaintenanceTaskCard(
                  task: task,
                  onMarkCompleted: () {},
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.settings,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Settings will be available in future updates',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
} 