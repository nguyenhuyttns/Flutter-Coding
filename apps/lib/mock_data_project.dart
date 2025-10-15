class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.date,
    required this.progress,
    required this.status,
    this.isError = false,
  });

  final String title;
  final String subtitle;
  final String duration;
  final String date;
  final double progress;
  final String status;
  final bool isError;
}

const List<ProjectItem> mockProjects = [
  ProjectItem(
    title: 'Creative_1',
    subtitle: 'Photo Enhance',
    duration: '01:59',
    date: '12-03-2024',
    progress: 0.35,
    status: 'Error',
    isError: true,
  ),
  ProjectItem(
    title: 'Portrait Fix',
    subtitle: 'Face Retouch',
    duration: '03:24',
    date: '21-04-2024',
    progress: 0.8,
    status: 'Completed',
  ),
  ProjectItem(
    title: 'Landscape',
    subtitle: 'Color Grading',
    duration: '00:47',
    date: '02-05-2024',
    progress: 0.5,
    status: 'Processing',
  ),
  ProjectItem(
    title: 'Wedding_Edit',
    subtitle: 'Photo Enhance',
    duration: '02:15',
    date: '15-05-2024',
    progress: 0.65,
    status: 'Processing',
  ),
  ProjectItem(
    title: 'Nature_Shot',
    subtitle: 'Color Grading',
    duration: '01:30',
    date: '18-05-2024',
    progress: 0.9,
    status: 'Completed',
  ),
  ProjectItem(
    title: 'Studio_Session',
    subtitle: 'Face Retouch',
    duration: '04:20',
    date: '20-05-2024',
    progress: 0.25,
    status: 'Error',
    isError: true,
  ),
  ProjectItem(
    title: 'Product_Photo',
    subtitle: 'Photo Enhance',
    duration: '01:45',
    date: '22-05-2024',
    progress: 0.7,
    status: 'Processing',
  ),
  ProjectItem(
    title: 'Event_Coverage',
    subtitle: 'Color Grading',
    duration: '03:10',
    date: '25-05-2024',
    progress: 0.55,
    status: 'Processing',
  ),
  ProjectItem(
    title: 'Fashion_Shoot',
    subtitle: 'Face Retouch',
    duration: '02:50',
    date: '28-05-2024',
    progress: 0.4,
    status: 'Processing',
  ),
  ProjectItem(
    title: 'Architecture',
    subtitle: 'Photo Enhance',
    duration: '01:20',
    date: '30-05-2024',
    progress: 1.0,
    status: 'Completed',
  ),
];
