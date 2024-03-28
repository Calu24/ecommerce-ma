import 'dart:convert';

import 'package:http/http.dart' as http;

const endpointMethodIdUrl =
    'https://stripe-pay-endpoint-method-id-52b7ybw5bq-uc.a.run.app';

const endpointIntentIdUrl =
    'https://stripe-pay-endpoint-method-id-52b7ybw5bq-uc.a.run.app';

class PaymentClient {
  final http.Client client;

  PaymentClient({http.Client? client}) : client = client ?? http.Client();

  Future<Map<String, dynamic>> processPayment({
    required String paymentMethodId,
    required List<Map<String, dynamic>> items,
    String currency = 'gbp',
    bool useStripeSdk = true,
  }) async {
    final url = Uri.parse(endpointMethodIdUrl);
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'paymentMethodId': paymentMethodId,
        'items': items,
        'currency': currency,
        'useStripeSdk': useStripeSdk,
      }),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> confirmPayment({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse(endpointIntentIdUrl);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'paymentIntentId': paymentIntentId}),
    );

    return json.decode(response.body);
  }
}
