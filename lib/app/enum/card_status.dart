// ignore_for_file: constant_identifier_names
enum CardStatus {
  IN_PROGRESS,
  WAITING,
  PENDING,
  DONE,
  CANCELED,
}

final statusMapping = {
  CardStatus.IN_PROGRESS: {'status': 'InProgress', 'title': '案内中'},
  CardStatus.WAITING: {'status': 'Waiting', 'title': '案内待ち'},
  CardStatus.PENDING: {'status': 'Pending', 'title': '保留'},
  CardStatus.DONE: {'status': 'Done', 'title': '案内済み'},
  CardStatus.CANCELED: {'status': 'Canceled', 'title': 'キャンセル'},
};

CardStatus getCardStatus(String str) {
  switch (str) {
    case 'InProgress':
      return CardStatus.IN_PROGRESS;
    case 'Waiting':
      return CardStatus.WAITING;
    case 'Pending':
      return CardStatus.PENDING;
    case 'Done':
      return CardStatus.DONE;
    case 'Canceled':
      return CardStatus.CANCELED;
    default:
      throw ArgumentError('Invalid card status');
  }
}

String getCardStatusTitle(CardStatus status) {
  return statusMapping[status]?['title'] ?? '';
}
