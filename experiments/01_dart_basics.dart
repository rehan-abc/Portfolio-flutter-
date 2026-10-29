// Experiment 1: Dart Programming Basics
// Demonstrates variables, built-in types, arithmetic operations,
// string interpolation, and conditional logic applied to developer portfolio metrics.

void main(List<String> args) {
  // 1. Variable declarations with strong types
  const String developerName = 'Rehan';
  const String primaryRole = 'Flutter & Full-Stack Developer';
  int yearsOfExperience = args.length > 1 ? int.tryParse(args[1]) ?? 3 : 3;
  int completedProjects = args.isNotEmpty ? int.tryParse(args[0]) ?? 20 : 20;
  double clientRating = 4.9;
  bool isAvailableForHire = args.length > 2 ? args[2] == 'true' : true;

  // 2. String interpolation and printing profile summary
  print('========================================');
  print('          DEVELOPER PROFILE SUMMARY      ');
  print('========================================');
  print('Name: $developerName');
  print('Role: $primaryRole');
  print('Experience: $yearsOfExperience years');
  print('Projects Delivered: $completedProjects');
  print('Rating: $clientRating / 5.0');
  print('Available for Opportunities: $isAvailableForHire');
  print('----------------------------------------');

  // 3. Arithmetic operations on metrics
  int mobileApps = 12;
  int webApps = 8;
  int totalTrackedApps = mobileApps + webApps;
  double avgProjectsPerYear = totalTrackedApps / yearsOfExperience;

  print('Breakdown: $mobileApps Mobile Apps, $webApps Web Apps');
  print('Productivity: ${avgProjectsPerYear.toStringAsFixed(1)} projects/year');

  // 4. Conditional evaluation of seniority & status
  if (completedProjects >= 15 && yearsOfExperience >= 3) {
    print('Seniority Tier: Mid-Senior Developer (High Impact)');
  } else if (completedProjects >= 5) {
    print('Seniority Tier: Intermediate Developer');
  } else {
    print('Seniority Tier: Junior Developer');
  }

  // 5. Ternary operator check
  String workStatus = isAvailableForHire
      ? 'Currently open to new projects and freelance work.'
      : 'Currently committed to ongoing projects.';
  print('Status: $workStatus');
  print('========================================');
}
