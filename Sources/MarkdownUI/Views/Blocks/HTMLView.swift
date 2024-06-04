import SwiftUI

struct HTMLView: View {
  @Environment(\.theme.html) private var html

  private let content: String
  private let inlines: [InlineNode]

  init(content: String) {
    self.content = content.hasSuffix("\n") ? String(content.dropLast()) : content
    self.inlines = [.text(self.content)]
  }

  var body: some View {
    self.html.makeBody(
      configuration: .init(
        label: .init(InlineText(self.inlines)),
        content: .init(block: .htmlBlock(content: self.content))
      )
    )
  }
}
