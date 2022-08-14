import Foundation
import RxSwift

class GetLastContactsListUseCase {
    private let lastStateRepository: LastStateRepository
    
    init(lastStateRepository: LastStateRepository) {
        self.lastStateRepository = lastStateRepository
    }

    func invoke() -> [DomainContact] {
        lastStateRepository.getContactsList()
    }
}
