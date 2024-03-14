// ignore_for_file: avoid_print, prefer_final_fields

abstract interface class Sleeper {
  void sleep();
}

class Swarm {
  final String name;
  final SwarmSize size;

  Swarm({
    required this.name,
    required this.size,
  });
}

enum SwarmSize {
  small,
  medium,
  large,
}

class Frog implements Sleeper {
  String _name;
  final String species;
  final int age;
  bool isHungry = false;
  final Swarm swarm;

  Frog(
    this._name,
    this.species,
    this.age, {
    required this.swarm,
  });

  Frog.old(
    this._name,
    this.species,
    this.swarm,
  ) : age = 1000;

  String get name => _name;

  void eat() {
    if (isHungry) {
      print('Легушъка $_name наелась.');
      isHungry = false;
    } else {
      print('Легушъка $_name уже не голодна.');
    }
  }

  @override
  void sleep() {
    print('Легушъка спит');
  }
}

class ColoredFrog extends Frog with Jumper {
  final String color;

  ColoredFrog(
    String name,
    String species,
    int age,
    Swarm swarm, [
    this.color = 'синего',
  ]) : super(
          name,
          species,
          age,
          swarm: swarm,
        );

  @override
  void sleep() {
    super.sleep();
    print('Легушка цвета $color спит');
  }
}

mixin Jumper {
  void jump() {
    print('Прыг-скок');
  }
}

void main() {
  final frog = Frog(
    'Ы',
    'Легушъка',
    2,
    swarm: Swarm(name: 'Болото', size: SwarmSize.small),
  );

  final shreksSwarm = Swarm(
    name: 'Болото Шрека',
    size: SwarmSize.small,
  );

  final coloredFrog = ColoredFrog(
    'Ъуъ',
    'Легушъка Шрека',
    2,
    shreksSwarm,
    'зеленого',
  );

  frog.eat();
  coloredFrog.eat();
  coloredFrog.jump();
  coloredFrog.sleep();
}
