class MatchUserParams {
  MatchUserParams({
    required this.vector,
    required this.gender,
    required this.excludeIds,
    required this.interestFilter,
  });

  final List<num> vector;
  final String gender;
  final List<String>? excludeIds;
  final String? interestFilter;
}
