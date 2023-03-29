class AppUrl {
  // Base Url
  static const String baseUrl =
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event';

  // get Api data endpoint
  static const String endpoint = '/v1/event';

  String eventUrlEndpoint() {
    return baseUrl + endpoint;
  }

  String singleEventDetails(int key) {
    return baseUrl + endpoint + '/$key';
  }
}
