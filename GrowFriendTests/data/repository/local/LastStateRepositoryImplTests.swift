import Cuckoo
import XCTest

@testable import GrowFriend

class LastStateRepositoryImplTests: XCTestCase {
    private let userDefaults = UserDefaults(suiteName: #file)!
    private var repository: LastStateRepository!

    override func setUp() {
        repository = LastStateRepositoryImpl(userDefaults: userDefaults)
    }
    
    override func tearDown() {
        userDefaults.removePersistentDomain(forName: #file)
    }
    
    func testContactsList() {
        let expectedLastContactsList = [DomainFixtures.DomainContactUtils.createMale()]
        repository.setContactsList(newValue: expectedLastContactsList)
        
        let result = repository.getContactsList()
        XCTAssertEqual(result, expectedLastContactsList)
    }
}
