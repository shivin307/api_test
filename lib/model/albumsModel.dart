class WeatherResponse {
  String output;
  List<SafetyRating> safetyRatings;

  WeatherResponse({required this.output, required this.safetyRatings});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> safetyRatingsList = json['safetyRatings'];
    List<SafetyRating> safetyRatings = safetyRatingsList.map((rating) => SafetyRating.fromJson(rating)).toList();

    return WeatherResponse(
      output: json['output'],
      safetyRatings: safetyRatings,
    );
  }
}

class SafetyRating {
  String category;
  String probability;

  SafetyRating({required this.category, required this.probability});

  factory SafetyRating.fromJson(Map<String, dynamic> json) {
    return SafetyRating(
      category: json['category'],
      probability: json['probability'],
    );
  }
}
