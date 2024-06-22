import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flpy/falppy_bird.dart';
import 'package:flpy/utils/assets.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBird> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
