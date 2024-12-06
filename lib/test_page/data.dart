class PremiumInfo {
  final String ixonPathSvg;
  final String title;
  final String subtitle;
  PremiumInfo(
    this.ixonPathSvg,
    this.title,
    this.subtitle,
  );
}

List<PremiumInfo> getPremiumInfoData = [
  PremiumInfo(
    'assets/icons/hamyon.svg',
    'Figma ipsum component variant',
    'Figma ipsum component variant main layer. Layer prototype clip flows list.',
  ),
  PremiumInfo(
    'assets/icons/notification.svg',
    'Doubled Limits',
    'Up to 1000 channels, 30 folders, 10 pins, 20 public links, 4 accounts and more.',
  ),
  PremiumInfo(
    'assets/icons/sdcard.svg',
    'Stories',
    'Unlimited posting, priority order, stealth mode, permanent view history and more.',
  ),
  PremiumInfo(
    'assets/icons/search.svg',
    'Telegram Business',
    'Upgrade your account with business features such as location, opening hours.',
  ),
];
