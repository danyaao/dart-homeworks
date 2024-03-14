// ignore_for_file: avoid_print

class Person {
  final String name;

  Person({
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}

class Team {
  final String name;
  final List<Person> members;
  Trener? trener;

  Team({
    required this.name,
    required this.members,
  });

  @override
  String toString() {
    return '$name\n'
        'members:${members.map((e) => e.name)}\n'
        'trener:${trener?.name}';
  }
}

class Gamer extends Person {
  Team? team;
  int gamesCount = 0;

  Gamer({
    required super.name,
    required this.team,
    gamesCount,
  }) {
    team?.members.add(this);
  }

  @override
  String toString() {
    return '$name\n'
        'team:${team?.name}\n'
        'gamesCount:$gamesCount';
  }
}

class Trener extends Person {
  final Team team;
  int trophiesCount = 0;

  Trener({
    required super.name,
    required this.team,
    trophiesCount,
  }) {
    team.trener = this;
  }

  @override
  String toString() {
    return '$name\n'
        'team:${team.name}\n'
        'trophiesCount:$trophiesCount';
  }
}

class Doter extends Gamer {
  int mmr;

  Doter({
    required super.name,
    super.team,
    required this.mmr,
  });

  @override
  String toString() {
    return '$name\n'
        'team:${team?.name}\n'
        'gamesCount:$gamesCount\n'
        'mmr:$mmr';
  }
}

void main() {
  final team = Team(
    name: 'Surf',
    members: [],
  );

  final trener = Trener(
    name: 'Mark',
    team: team,
  );

  final gamer = Gamer(
    name: 'Evgenia',
    team: team,
  );

  final doter = Doter(
    name: 'Daniil',
    team: team,
    mmr: 1000,
  );

  print(team);
  print(trener);
  print(gamer);
  print(doter);
}
