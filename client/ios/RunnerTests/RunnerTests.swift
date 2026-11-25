import Flutter
import UIKit
import XCTest

@testable import Runner

/// The small pure pieces of Siri AI (docs/SIRI-AI-PLAN.md §12).
class RunnerTests: XCTestCase {

  func testShortcutListIsReadFromTheChannelMap() {
    let items = ShortcutStore.from([
      ["id": "b1", "name": "Milo"],
      ["id": "c1", "name": "Coffee", "detail": "Milo", "bot_id": "b1"],
      ["id": "x"],  // no name: skipped
      ["name": "no id"],  // no id: skipped
    ])
    XCTAssertEqual(items.map(\.id), ["b1", "c1"])
    XCTAssertEqual(items[1].detail, "Milo")
    XCTAssertEqual(items[1].bot_id, "b1")
    XCTAssertTrue(ShortcutStore.from(nil).isEmpty)
    XCTAssertTrue(ShortcutStore.from("not a list").isEmpty)
  }

  func testMessageTextJoinsSubjectWordsAndLinks() {
    let text = SiriMessageText.join(
      subject: AttributedString("  Launch "),
      content: AttributedString("check the list\n"),
      links: [URL(string: "https://casama.ai")!])
    XCTAssertEqual(text, "Launch\n\ncheck the list\n\nhttps://casama.ai")
    XCTAssertEqual(SiriMessageText.join(subject: nil, content: AttributedString("   "), links: []), "")
  }

  func testDraftRightAfterTheSameSendIsAnEcho() {
    let now = Date()
    SiriMessageText.sent("Remind me to buy coffee", at: now)
    XCTAssertTrue(SiriMessageText.isEcho("remind me to buy coffee ", now: now.addingTimeInterval(8)))
    XCTAssertFalse(SiriMessageText.isEcho("Something else", now: now.addingTimeInterval(8)))
    XCTAssertFalse(SiriMessageText.isEcho("Remind me to buy coffee", now: now.addingTimeInterval(31)))
    XCTAssertTrue(SiriMessageText.isEcho("", now: now.addingTimeInterval(120)))
  }

  func testABotIsFoundByItsNameOrOneLetterOff() throws {
    guard #available(iOS 27.0, *) else { throw XCTSkip("Messages schemas need iOS 27") }
    let bots = [BotPersonEntity(id: "b1", name: "Milo"), BotPersonEntity(id: "b2", name: "Research Desk")]
    XCTAssertEqual(BotPersonQuery.closest(to: "milo", in: bots).map(\.id), ["b1"])
    // Siri hands over the closest contact: one letter off from a word of it counts.
    XCTAssertEqual(BotPersonQuery.closest(to: "Nong Nilo Tricycle", in: bots).map(\.id), ["b1"])
    XCTAssertEqual(BotPersonQuery.closest(to: "Research Desks", in: bots).map(\.id), ["b2"])
    XCTAssertTrue(BotPersonQuery.closest(to: "Ana", in: bots).isEmpty)
    // Short names must match exactly: "Ada" is not "Ana".
    XCTAssertTrue(BotPersonQuery.closest(to: "Ana", in: [BotPersonEntity(id: "b3", name: "Ada")]).isEmpty)
    // Two bots both one letter off: neither is picked.
    let twins = [BotPersonEntity(id: "a", name: "Milo"), BotPersonEntity(id: "b", name: "Mila")]
    XCTAssertTrue(BotPersonQuery.closest(to: "Mili", in: twins).isEmpty)
  }
}
