import SmartLogMacro
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import OSLog

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(SmartLogMacroMacros)
import SmartLogMacroMacros

let testMacros: [String: Macro.Type] = [
    "log": SmartLog.self,
    "logPublic": SmartLogPublic.self
]
#endif

final class SmartLogTests: XCTestCase {
    func testSmartLogPublic() throws {
        #if canImport(SmartLogMacroMacros)
        assertMacroExpansion(
            """
            #log(.webSocket, .info, "test")
            """,
            expandedSource: """
            {
                LoggerCategory.webSocket.logger.log(level: .info, "test")
                SmartLogMacroCustomLogger.log(LoggerCategory.webSocket, "test", .info)
            }()
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
