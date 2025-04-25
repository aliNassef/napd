class RecipeModel {
  final String title;
  final List<String> ingredients;
  final String calories;
  final String carbohydrates;
  final String fiber;
  final String protein;
  final String naturalSugars;
  final String imageUrl;

  const RecipeModel({
    required this.title,
    required this.ingredients,
    required this.calories,
    required this.carbohydrates,
    required this.fiber,
    required this.protein,
    required this.naturalSugars,
    required this.imageUrl,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json['Title'] ?? '',
      ingredients: List<String>.from(json['Ingredients'] ?? []),
      calories: json['Calories'] ?? '',
      carbohydrates: json['Carbohydrates'] ?? '',
      fiber: json['Fiber'] ?? '',
      protein: json['Protein'] ?? '',
      naturalSugars: json['NaturalSugars'] ?? '',
      imageUrl: json['ImageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Ingredients': ingredients,
      'Calories': calories,
      'Carbohydrates': carbohydrates,
      'Fiber': fiber,
      'Protein': protein,
      'NaturalSugars': naturalSugars,
      'ImageUrl': imageUrl,
    };
  }

  RecipeModel copyWith({
    String? title,
    List<String>? ingredients,
    String? calories,
    String? carbohydrates,
    String? fiber,
    String? protein,
    String? naturalSugars,
    String? imageUrl,
  }) {
    return RecipeModel(
      title: title ?? this.title,
      ingredients: ingredients ?? this.ingredients,
      calories: calories ?? this.calories,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fiber: fiber ?? this.fiber,
      protein: protein ?? this.protein,
      naturalSugars: naturalSugars ?? this.naturalSugars,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
