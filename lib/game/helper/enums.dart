enum GameState {
  initial,
  playing,
  gameOver,
  paused,
}

enum AnimationEffect {
  splash(
    effectName: 'splash',
    amount: 7,
    amountPerRow: 7,
    speed: 0.03,
    size: 384,
  ),
  crash(
    effectName: 'crash',
    amount: 11,
    amountPerRow: 6,
    speed: 0.03,
    size: 384,
  ),
  shield(
    effectName: 'shield',
    amount: 60,
    amountPerRow: 5,
    speed: 0.02,
    size: 192,
  ),
  ;

  final String effectName;
  final int amount;
  final int amountPerRow;
  final double speed;
  final double size;

  const AnimationEffect({
    required this.effectName,
    required this.amount,
    required this.amountPerRow,
    required this.speed,
    required this.size,
  });
}

enum SpeedMode {
  slow(speed: 150),
  speed1(speed: 250),
  speed2(speed: 300),
  speed3(speed: 400),
  speed4(speed: 500),
  boost(speed: 700),
  speed5(speed: 750),
  speed6(speed: 800),
  ;

  final double speed;
  const SpeedMode({required this.speed});
}

enum Enemy {
  shark,
  pufferfish,
  jellyfish,
  ;

  String get imagePath {
    switch (this) {
      case Enemy.shark:
        return 'shark_r.png';
      case Enemy.jellyfish:
        return 'jelly.png';
      case Enemy.pufferfish:
        return 'puffer_fish.png';
    }
  }
}

enum PlasticType {
  bottle,
  glass,
  bag,
  straw,
  ;

  String get imagePath {
    switch (this) {
      case PlasticType.bottle:
        return 'bottle.png';
      case PlasticType.glass:
        return 'bottle_1.png';
      case PlasticType.bag:
        return 'plastic_bag.png';
      case PlasticType.straw:
        return 'straw.png';
    }
  }
}
