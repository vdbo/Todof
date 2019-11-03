class Task {
  final int id;
  final String title;
  final String description;
  final bool isActive;
  final bool isCompleted;

  Task(
    this.title, [
    this.description = "",
    this.isActive = false,
    this.isCompleted = false,
    this.id = -1,
  ]);
}
