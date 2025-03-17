abstract class AppStrings {
  // 🏠 Titles
  static const String appTitle = 'Riverpod Reminder';
  static const String toggleTheme = 'Toggle Theme';

  // 🌍 Fatal Game Texts
  static const String pageTitle = '🌍 The World Depends on You!';
  static const String criticalDifference = '⚠ Critical Difference: ';
  static const String noDifference =
      "Now is no difference, what the difference...";
  static const String firstCoreLabel = '💥 First Core Value:  ';
  static const String secondCoreLabel = '🌀 Primary Core Value:  ';
  static const String incrementButtonText = '🔼 Increase Core Power (+5)';
  static const String decrementButtonText = '🔽 Decrease Counterforce (-5)';
  static const String restartButtonText = '🔄 Next time I\'ll stop, for sure';

  static const Map<int, String> apocalypseWarnings = {
    20:
        "⚠ The balance is shifting! \nPlease, stay calm before it's too late! 🧘‍♂️😳⏳",
    35: "🛰️ Google Trends: \n‘How to stop global disaster’, coincidence? 🤔📉🔥",
    50:
        "🚨 The Earth trembles! \nScientists say: ‘This shouldn’t be happening…’ 🌍🔬",
    70:
        "⚡ Government launches  'STOP CLICKING’ Project, \nBut will you listen?  🤨🤞",
    90:
        "Humanity's fate hangs by a thread! Not only 'black lives', but also \nEVERY click matters!🫷☠️🫸",
    95:
        "🔥 Cities report power outages, Trump becomes normal one, even your Wi-Fi signal is panicking 📶😱",
    100:
        "💥 GAME OVER! The timeline collapses into chaos! \nYour fault! \nNice job, genius. 🫵👀",
  };

  // 📱 Basic StateProvider Page Texts
  static const String basicStatePageTitle =
      'on this page using \n Basic StateProvider';
  static const String basicStateInstruction =
      'You are amazing🤩, \nyou\'ve already clicked:';

  // 🟢 Counter Screen Texts
  static const String counterScreenTitle =
      'using StateProvider \nwith AutoDisposed mode';
  static const String counterInstruction =
      'Dude, nice 😎, \nyou\'ve already clicked:';
  static const String clickSingular = 'time';
  static const String clickPlural = 'times';

  static const Map<int, String> counterWarningMessages = {
    2: "Whoa! You've clicked 2 times! Easy there, champ! 🏆",
    4: "Okay, 4 clicks... are you trying to break something?! 🤨",
    5: "🚨 ALERT! 5 clicks detected! Authorities have been notified! 🚔😂",
  };
}
