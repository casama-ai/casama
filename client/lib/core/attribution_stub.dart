/// Non-web stub for initial web attribution capture (D-533).
Map<String, String>? readInitialWebAttribution() => null;

/// Non-web stub: only the web app reads a creator code from its address or cookie (D-543).
String? readInitialWebPartner() => null;

/// Non-web stub: only the web app reads a pricing-page plan tier (`?plan=plus|pro|max`).
String? readInitialWebPlan() => null;

/// Non-web stub: clears the pending pricing-page plan tier.
void clearInitialWebPlan() {}
