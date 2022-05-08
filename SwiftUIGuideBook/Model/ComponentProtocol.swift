import Foundation
import SwiftUI

protocol ComponentProtocol {
    var componentCategory: ComponentName { get }
    var componentName: String { get }
    var swiftCode: String { get }
    var URL: String { get }
    var exampleView: AnyView { get }
}
