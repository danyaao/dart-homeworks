void main() {
  while (!wantSleep()) {
    if (wantEat()) {
      eat();
    } else {
      if (needMoney() case [amount(), 1000000]) {
        needALotOfMoney();
        workHardly();
      } else if (needMoney() case [amount(), 1000]) {
        needSomeMoney();
        work();
      } else {
        needNoMoney();
        for (int i = 0; i < 11; i++) {
          sleep();
          i == 7 ? turnOffAlarm() : snooze();
          if (i == 9) {
            wakeUp();
            break;
          }
        }
      }
    }
  }
}

bool wantEat() {
  switch (wantFood()) {
    case 'meat':
      wantMeat();
      return true;
    case 'nuts':
      wantNuts();
      return true;
    default:
      wantNothing();
      return false;
  }
}
