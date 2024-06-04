import MarkdownUI
import SwiftUI
import WebKit

struct HTMLView: View {
  private let content = #"""
    You can show raw HTML complying with the [GitHub Flavored Markdown Spec](https://github.github.com/gfm/#html-block)

    ```
    <table style="font-size:40pt; width:100%">
    <tr>
    <td>**Hello**</td>
    <td><span style="color:#FF0000">_world_</span></td>
    </tr></table>
    ```
    <table style="font-size:40pt; width:100%">
    <tr>
    <td>**Hello**</td>
    <td><span style="color:#FF0000">_world_</span></td>
    </tr></table>
    """#

  var body: some View {
    DemoView {
      Markdown(self.content)

      Section("Customization Example") {
        Markdown(self.content)
      }
      .markdownBlockStyle(\.html) { configuration in
        HTMLWebView(html: configuration.content.renderMarkdown())
          .frame(maxWidth: .infinity, minHeight: 200)
      }
    }
  }

  struct HTMLWebView: UIViewRepresentable {
      let html: String

      func makeUIView(context: Context) -> WKWebView {
          WKWebView()
      }

      func updateUIView(_ uiView: WKWebView, context: Context) {
          uiView.loadHTMLString(html, baseURL: nil)
      }
  }
}

struct HTMLView_Previews: PreviewProvider {
  static var previews: some View {
    HTMLView()
  }
}
