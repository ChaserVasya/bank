class DaySeparator {
  const DaySeparator();

  ///Returns a result that indicates whether the time should be
  ///separated from the previous one
  static List<bool> needSeparate(
    List<DateTime> times, [
    bool startSeparator = true,
  ]) {
    List<bool> needSeparate = [];
    for (var i = 0; i < times.length; i++) {
      if (i == 0) {
        needSeparate.add(true);
        continue;
      }

      final time = times[i].toLocal();
      final previous = times[i - 1].toLocal();

      needSeparate.add(time.day != previous.day);
    }
    return needSeparate;
  }
}
