void main() {
  void task1() {
    print('## task1 Work');
  }

   task2()async {
    await Future.delayed(Duration(seconds: 10));
    print('## task2 Work');
  }

  void task3() {
    print('## task3 Work');
  }

  task1();
  task2();
  task3();
}
