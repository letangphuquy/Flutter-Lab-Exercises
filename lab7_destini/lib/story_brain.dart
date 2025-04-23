import 'package:lab7_destini/story.dart';

class StoryBrain {
  static const int notChooseIndex = -1;  // Used for invalid or missing choices

  int _currentIndex = 0;

  final List<Story> _stories = [
    Story(
      storyText: 'Bạn đến trước cổng rừng ma… Bạn vào hay quay về?',
      choices: [
        Choice(choiceText: 'Vào rừng', nextIndex: 1),
        Choice(choiceText: 'Quay về', nextIndex: 2),
      ],
    ),
    Story(
      storyText: 'Bạn gặp một con rồng… Bạn chiến hay chạy?',
      choices: [
        Choice(choiceText: 'Chiến', nextIndex: 3),
        Choice(choiceText: 'Chạy', nextIndex: 4),
      ],
    ),
    Story(
      storyText: 'Bạn đã chạy thoát khỏi con rồng. Bạn tiếp tục hành trình hay dừng lại?',
      choices: [
        Choice(choiceText: 'Tiếp tục', nextIndex: 5),
        Choice(choiceText: 'Dừng lại', nextIndex: 6),
      ],
    ),
    Story(
      storyText: 'Cả hành trình kết thúc. Bạn đã đạt được mục tiêu.',
      choices: [],
    ),
  ];

  Story get currentStory => _stories[_currentIndex];

  bool get isEnd => _currentIndex >= _stories.length - 1;

  void choose(int choiceNumber) {
    if (choiceNumber < 0 || choiceNumber >= currentStory.choices.length) {
      print("Invalid choice number: $choiceNumber");
      return;
    }
    
    final nextIndex = currentStory.choices[choiceNumber].nextIndex;
    if (nextIndex != notChooseIndex) {
      _currentIndex = nextIndex;
    } else {
      print("End of story or no valid next choice.");
    }
  }

  void restart() {
    _currentIndex = 0;
  }
}
