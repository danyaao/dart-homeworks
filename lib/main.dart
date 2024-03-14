// ignore_for_file: prefer_final_fields, unused_field, prefer_function_declarations_over_variables, avoid_print

typedef Strategy = double Function(List<String>, List<String>);

class PokerPlayer {
  /// Список текущих карт в руке у игрока
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double surenessInWin = 0;

  /// Вычислить шансы на выигрыш
  void calculateProbabilities(
    List<String> cardOnDesk,

    /// Это часть первого задания. [Strategy] пока не сущестивует.
    ///
    /// Опишите его.
    Strategy strategy,
  ) =>
      surenessInWin = strategy(cardOnDesk, _currentHand);
}

void main() {
  final opponent = PokerPlayer();

  /// Это часть первого задания. [Strategy] пока не сущестивует.
  ///
  /// Опишите его.
  final Strategy fakeStrategy = (p0, p1) {
    print(
      'Карты на столе: '
      '${p0.reduce(
        (value, element) => '$value, $element',
      )}',
    );
    print(
      'Карты в руке оппонента: '
      '${p1.reduce(
        (value, element) => '$value, $element',
      )}',
    );

    return 0.31;
  };

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'King of hearts'],
    fakeStrategy,
  );

  print(
    'Шансы оппонента на победу: '
    '${opponent.surenessInWin}',
  );
}
