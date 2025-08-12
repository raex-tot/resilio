import 'package:hooks_riverpod/hooks_riverpod.dart';

final purchasesServiceProvider = Provider<PurchasesService>((_) => PurchasesService());

class PurchasesService {
  Future<void> purchaseExportPdf() async {
    // TODO: implement in-app purchase or Stripe
  }

  Future<void> purchaseAdvancedInsights() async {
    // TODO: implement purchase
  }
}
