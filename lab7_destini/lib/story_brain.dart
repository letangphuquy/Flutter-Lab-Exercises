import 'package:lab7_destini/story.dart';

class StoryBrain {
  static const int notChooseIndex = -1; // Chỉ mục không hợp lệ

  int _currentIndex = 0;

  // Dữ liệu câu chuyện đã sửa, đảm bảo không có các chỉ mục vòng lặp
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
      storyText:
          'Bạn đã chạy thoát khỏi con rồng. Bạn tiếp tục hành trình hay dừng lại?',
      choices: [
        Choice(choiceText: 'Tiếp tục', nextIndex: 5),
        Choice(choiceText: 'Dừng lại', nextIndex: 6),
      ],
    ),
    Story(
      storyText: 'Cả hành trình kết thúc. Bạn đã đạt được mục tiêu.',
      choices: [], // Không có lựa chọn tiếp
    ),
    Story(
      storyText: 'Bạn lạc vào khu rừng tối. Bạn có muốn tiếp tục đi?',
      choices: [
        Choice(choiceText: 'Tiếp tục', nextIndex: 2),
        Choice(choiceText: 'Tìm lối thoát', nextIndex: 7),
      ],
    ),
    Story(
      storyText: 'Cảnh vật tươi sáng nhưng bạn đã rơi vào bẫy. Game Over.',
      choices: [], // Kết thúc
    ),
  ];

  Story get currentStory {
    // Kiểm tra nếu currentIndex là notChooseIndex, nếu có thì hiển thị câu chuyện đặc biệt
    if (_currentIndex == notChooseIndex) {
      return Story(
        storyText: "Câu chuyện đã kết thúc hoặc không có lựa chọn hợp lệ.",
        choices: [], // Không có lựa chọn
      );
    }
    return _stories[_currentIndex];
  }

  bool get isEnd =>
      (_currentIndex < 0) ||
      (_currentIndex >= _stories.length - 1) ||
      _stories[_currentIndex].choices.isEmpty;

  // Kiểm tra lựa chọn hợp lệ trước khi cập nhật chỉ mục

  void choose(int choiceNumber) {
    assert(0 <= choiceNumber && choiceNumber < currentStory.choices.length);

    final nextIndex = currentStory.choices[choiceNumber].nextIndex;

    if (nextIndex != notChooseIndex && nextIndex < _stories.length) {
      _currentIndex = nextIndex;
    } else {
      print("End of story or no valid next choice.");
      _currentIndex = notChooseIndex;
    }
  }

  void restart() {
    _currentIndex = 0;
  }
}
