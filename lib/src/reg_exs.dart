const _symbols = '·・ー_';
const _numbers = '0-9０-９';
const _englishLetters = 'a-zA-Zａ-ｚＡ-Ｚ';
const _japaneseLetters = 'ぁ-んァ-ン一-龠';
const _koreanLetters = '\u1100-\u11FF\uAC00-\uD7A3';
const _spanishLetters = 'áàãâéêíóôõúüçÁÀÃÂÉÊÍÓÔÕÚÜÇ';
const _arabicLetters = '\u0621-\u064A';
const _thaiLetters = '\u0E00-\u0E7F';
const _detectionContentLetters = _symbols + _numbers + _englishLetters + _japaneseLetters + _koreanLetters + _spanishLetters + _arabicLetters + _thaiLetters;
const _urlRegexContent = "((http|https)://)?(www.)?[-a-zA-Z0-9@:%._\\+~#?&//=]{1,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)";

class RegExs {
  static final hashTagAtSignDollarSignUrlRegExp = RegExp("(?!\\n)(?:^|\\s)([\$#@]([$_detectionContentLetters]+))|$_urlRegexContent", multiLine: true);
  static final usernameRegExp = RegExp(r'[-!@#$&*~%()+=.,:]');
  static final snakeCaseRegExp = RegExp(r'^[a-z]+(_[a-z]+)*$');
  static final noSpaceRegExp = RegExp(r'^\S*$');
  static final numberRegExp = RegExp(r'[0-9]');
}