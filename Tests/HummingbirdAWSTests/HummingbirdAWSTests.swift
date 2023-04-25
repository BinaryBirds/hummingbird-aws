import XCTest
import Hummingbird
import HummingbirdAWS

final class HummingbirdAWSTests: XCTestCase {

    func test() async throws {
        let app = HBApplication()
        _ = app.aws.client
    }
}
