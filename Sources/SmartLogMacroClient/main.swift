import SmartLogMacro
import OSLog

struct Custom {
    public static func log(_ category: LoggerCategory, _ message: String, _ logLevel: OSLogType) {

    }
}

typealias SmartLogMacroCustomLogger = Custom

//#log(.someLogCategory, .debug, "wow")
