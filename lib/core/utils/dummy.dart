import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

List<Mission> dummyMissions = [
  Mission(
    title: 'Groceries',
    date: '02/01/2025',
    time: '12:35 PM',
    colorIndex: 0,
    tasks: [
      Task(title: 'Carrots', isCompleted: false),
      Task(title: 'Tomatos', isCompleted: true),
      Task(title: 'Salsa', isCompleted: false),
      Task(title: 'Milk', isCompleted: true),
      Task(title: 'Bread', isCompleted: false),
    ],
  ),
  Mission(
    title: 'Reminder',
    date: '04/01/2025',
    time: '09:35 AM',
    colorIndex: 1,
    tasks: [
      Task(title: 'Attend son graduation', isCompleted: false),
      Task(title: 'Visit grandmother', isCompleted: true),
      Task(title: 'Take medicine', isCompleted: false),
      Task(title: 'Pay electricity bill', isCompleted: true),
      Task(title: 'Check car oil', isCompleted: false),
    ],
  ),
  Mission(
    title: 'Work',
    date: '05/01/2025',
    time: '08:00 AM',
    colorIndex: 2,
    tasks: [
      Task(title: 'Submit project report', isCompleted: true),
      Task(title: 'Prepare slides for presentation', isCompleted: false),
      Task(title: 'Email team updates', isCompleted: true),
      Task(title: 'Schedule meeting with client', isCompleted: false),
      Task(title: 'Review code for module A', isCompleted: false),
    ],
  ),
  Mission(
    title: 'Exercise',
    date: '06/01/2025',
    time: '07:00 AM',
    colorIndex: 3,
    tasks: [
      Task(title: 'Morning jog', isCompleted: false),
      Task(title: 'Stretching', isCompleted: true),
      Task(title: 'Push-ups', isCompleted: false),
      Task(title: 'Squats', isCompleted: true),
      Task(title: 'Cool-down routine', isCompleted: false),
    ],
  ),
  Mission(
    title: 'Travel Preparation',
    date: '07/01/2025',
    time: '05:00 PM',
    colorIndex: 0,
    tasks: [
      Task(title: 'Pack suitcase', isCompleted: false),
      Task(title: 'Book taxi to airport', isCompleted: true),
      Task(title: 'Print boarding pass', isCompleted: false),
      Task(title: 'Buy travel snacks', isCompleted: true),
      Task(title: 'Check travel documents', isCompleted: false),
    ],
  ),
  Mission(
    title: 'Home Maintenance',
    date: '08/01/2025',
    time: '03:30 PM',
    colorIndex: 1,
    tasks: [
      Task(title: 'Fix leaking faucet', isCompleted: false),
      Task(title: 'Clean windows', isCompleted: true),
      Task(title: 'Organize garage', isCompleted: false),
      Task(title: 'Mow the lawn', isCompleted: true),
      Task(title: 'Inspect roof', isCompleted: false),
    ],
  ),
];
