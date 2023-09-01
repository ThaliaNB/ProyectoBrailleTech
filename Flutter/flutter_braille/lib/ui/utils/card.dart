enum CardType {
  otherBrand,
  mastercard,
  visa,
  americanExpress,
  discover,
}

/// Credit Card prefix patterns as of March 2019
/// A [List<String>] represents a range.
/// i.e. ['51', '55'] represents the range of cards starting with '51' to those starting with '55'
Map<CardType, Set<List<String>>> cardNumPatterns = <CardType, Set<List<String>>>{
  CardType.visa: <List<String>>{
    <String>['4'],
  },
  CardType.americanExpress: <List<String>>{
    <String>['34'],
    <String>['37'],
  },
  CardType.discover: <List<String>>{
    <String>['6011'],
    <String>['622126', '622925'],
    <String>['644', '649'],
    <String>['65']
  },
  CardType.mastercard: <List<String>>{
    <String>['51', '55'],
    <String>['2221', '2229'],
    <String>['223', '229'],
    <String>['23', '26'],
    <String>['270', '271'],
    <String>['2720'],
  },
};

const Map<CardType, String> CardTypeIconAsset = <CardType, String>{
  CardType.visa: 'assets/images/brand/visa.png',
  CardType.americanExpress: 'assets/images/brand/amex.png',
  CardType.mastercard: 'assets/images/brand/mastercard.png',
  CardType.discover: 'assets/images/brand/discover.png',
};
