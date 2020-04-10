// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum App {
    /// Movies
    internal static let title = L10n.tr("Localizable", "app.title")
  }

  internal enum Detail {
    /// Release date: %@
    internal static func releaseDate(_ p1: String) -> String {
      return L10n.tr("Localizable", "detail.releaseDate", p1)
    }
  }

  internal enum EmptyText {
    /// No content
    internal static let `default` = L10n.tr("Localizable", "emptyText.default")
  }

  internal enum Favorites {
    /// Favorites
    internal static let title = L10n.tr("Localizable", "favorites.title")
    internal enum TableView {
      /// You do not have any favorites yet.
      internal static let empty = L10n.tr("Localizable", "favorites.tableView.empty")
    }
  }

  internal enum Home {
    /// Home
    internal static let title = L10n.tr("Localizable", "home.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
