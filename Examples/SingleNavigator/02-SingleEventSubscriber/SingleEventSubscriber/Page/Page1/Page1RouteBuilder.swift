import LinkNavigator
import SwiftUI

struct Page1RouteBuilder<RootNavigator: RootNavigatorType> {

  static func generate() -> RouteBuilderOf<RootNavigator> {
    var matchPath: String { "page1" }
    return .init(matchPath: matchPath) { navigator, items, diContainer -> RouteViewController? in
      guard let env: AppDependency = diContainer.resolve() else { return .none }
      let query: HomeToPage1Item? = items.decoded()
      let deepLinkItem: DeepLinkItem? = items.decoded()
      return WrappingController(matchPath: matchPath) {
        Page1View(
          navigator: navigator,
          item: query,
          deepLinkItem: deepLinkItem,
          sharedViewModel: env.sharedRootViewModel)
      }
    }
  }
}
