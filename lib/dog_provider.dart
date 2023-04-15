import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dog_api.dart';

final dogImageProvider = StateNotifierProvider((ref) => DogImageNotifier());

class DogImageNotifier extends StateNotifier<String> {
  DogImageNotifier() : super('https://images.dog.ceo/breeds/terrier-lakeland/n02095570_375.jpg');

  Future<void> fetchDogImage() async {
    state = await DogApi.getRandomDogImageUrl();
  }
}

