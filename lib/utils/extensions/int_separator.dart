extension SeparatedInt on int {
  String separated() {
    final str = this.toString();
    String result = '';

    for (int i = 0; i < str.length; ++i) {
      result += str[i];
      if ((str.length - i - 1) % 3 == 0)
        result += ' ';
    }

    return result.trim();
  }
}