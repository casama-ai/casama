import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
  /// With scenes, iOS hands Handoff (docs/APPLE-INTEGRATIONS-PLAN.md §6.10) to the scene, never to
  /// the app delegate: a cold start brings it in the connection options, a running app here.
  override func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    super.scene(scene, willConnectTo: session, options: connectionOptions)
    for activity in connectionOptions.userActivities where Handoff.open(activity) {
      break
    }
  }

  override func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    // Plugins still see every activity (universal links go to app_links this way).
    super.scene(scene, continue: userActivity)
    _ = Handoff.open(userActivity)
  }
}
