import Foundation

class SetLastContactsListUseCase {
    private let lastStateRepository: LastStateRepository
    
    init(lastStateRepository: LastStateRepository) {
        self.lastStateRepository = lastStateRepository
    }

    func invoke(newValue: [DomainContact]) {
        lastStateRepository.setContactsList(newValue: newValue)
    }
}
