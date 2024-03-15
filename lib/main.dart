// ignore_for_file: avoid_print

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  // final List<Territory> territoriesBefore2010 = mapBefore2010.values
  //     .expand(
  //       (territory) => territory,
  //     )
  //     .toList();

  // final List<Territory> territoriesBefore2010 = [];
  // for (final territory in mapBefore2010.values) {
  //   territoriesBefore2010.addAll(territory);
  // }

  // final List<Territory> territoriesAfter2010 = mapAfter2010.values
  //     .expand(
  //       (territory) => territory,
  //     )
  //     .toList();

  // final List<Territory> territoriesAfter2010 = [];
  // for (final territory in mapAfter2010.values) {
  //   territoriesAfter2010.addAll(territory);
  // }

  // final List<Territory> territoriesForAllTime = [
  //   ...territoriesBefore2010,
  //   ...territoriesAfter2010,
  // ];

  final List<Territory> territoriesForAllTime = [
    ...mapBefore2010.values
        .expand(
          (territory) => territory,
        )
        .toList(),
    ...mapBefore2010.values.expand(
      (territory) => territory,
    ),
  ];

  // final Set<AgriculturalMachinery> uniqueAgriculturalMachineries = {
  //   ...territoriesForAllTime.expand(
  //     (element) => element.machineries,
  //   )
  // };

  final Set<AgriculturalMachinery> uniqueAgriculturalMachineries = {};

  for (final territory in territoriesForAllTime) {
    uniqueAgriculturalMachineries.addAll(territory.machineries);
  }

  final int agriculturalMachineriesReleaseYearsSum = uniqueAgriculturalMachineries
      .map(
        (agriculturalMachinery) => agriculturalMachinery.releaseDate.year,
      )
      .reduce(
        (result, currentReleaseYear) => result + currentReleaseYear,
      );

  final double agriculturalMachineriesAverageReleaseYear =
      agriculturalMachineriesReleaseYearsSum / uniqueAgriculturalMachineries.length;

  final double agriculturalMachineriesAverageYear =
      DateTime.now().year - agriculturalMachineriesAverageReleaseYear;

  print(
    'Средний возраст '
    'всей техники: '
    '${agriculturalMachineriesAverageYear.toStringAsFixed(1)}',
  );

  final List<AgriculturalMachinery> oldestHalfOfAgriculturalMachineries =
      uniqueAgriculturalMachineries.toList();

  oldestHalfOfAgriculturalMachineries.sort(
    (
      agriculturalMachinery,
      anotherAgriculturalMachinery,
    ) =>
        agriculturalMachinery.releaseDate.year
            .compareTo(anotherAgriculturalMachinery.releaseDate.year),
  );

  oldestHalfOfAgriculturalMachineries.removeRange(
    oldestHalfOfAgriculturalMachineries.length ~/ 2,
    oldestHalfOfAgriculturalMachineries.length,
  );

  final int oldestAgriculturalMachineriesReleaseYearsSum = oldestHalfOfAgriculturalMachineries
      .map(
        (agriculturalMachinery) => agriculturalMachinery.releaseDate.year,
      )
      .reduce(
        (result, currentYear) => result + currentYear,
      );

  final double oldestAgriculturalMachineriesAverageReleaseYear =
      oldestAgriculturalMachineriesReleaseYearsSum / oldestHalfOfAgriculturalMachineries.length;

  final double oldestAgriculturalMachineriesAverageYear =
      DateTime.now().year - oldestAgriculturalMachineriesAverageReleaseYear;

  print(
    'Средний возраст '
    'половины самой старохой техники: '
    '${oldestAgriculturalMachineriesAverageYear.toStringAsFixed(1)}',
  );
}
