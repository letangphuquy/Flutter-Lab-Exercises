class Choice {
  final String choiceText;
  final int nextIndex;

  Choice({
    required this.choiceText,
    this.nextIndex = -1,  // Default to -1 to indicate no next choice.
  });
}

class Story {
  final String storyText;
  final List<Choice> choices;

  Story({
    required this.storyText,
    required this.choices,
  });
}
