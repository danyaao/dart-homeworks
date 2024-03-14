// ignore_for_file: avoid_print

void main(List<String> args) {
  int? a = 5;

  final b = a ?? 5;

  if (a != null) {
    print(a);
  } else {
    print('a is null');
  }
}