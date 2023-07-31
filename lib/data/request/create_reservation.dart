class CreateReservationRequest {
  int storeId;

  CreateReservationRequest(this.storeId);

  Map<String, dynamic> toJson() => {
        'storeId': storeId,
      };
}
