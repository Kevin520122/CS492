import 'package:test/test.dart';
import 'package:wastesgram/models/post.dart';

void main() {
  test('Test Post Model', () {
    final date = 'Friday, Augest13,2021';
    const image = 'FAKE';
    const items = 1;

    final post = Post(date: date, image: image, items: items);

    expect(post.date, date);
    expect(post.image, image);
    expect(post.items, items);
  });
}
