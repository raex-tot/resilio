import 'package:flutter_test/flutter_test.dart';
import 'package:dbt_plus/core/util/result.dart';

void main() {
  test('result success', () {
    const res = Success(1);
    final val = res.when(success: (v) => v, failure: (_) => 0);
    expect(val, 1);
  });
}
