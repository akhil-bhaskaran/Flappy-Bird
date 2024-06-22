import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flpy/component/background.dart';
import 'package:flpy/component/bird.dart';
import 'package:flpy/component/ground.dart';
import 'package:flpy/component/pipe_set.dart';
import 'package:flpy/utils/configs.dart';

class FlappyBird extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBird();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            // style:  TextStyle(
            //     fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
            ));
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
