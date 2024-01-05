class Utils {
  static String format(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
  }

  static String formatDuration(Duration duration) {
    return duration
        .toString()
        .replaceFirst(RegExp(r'^0:'), "")
        .replaceFirst(RegExp(r'.\d+$'), "");
  }
}
