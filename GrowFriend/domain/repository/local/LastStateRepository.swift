import Foundation

protocol LastStateRepository {
    func getContactsList() -> [DomainContact]
    func setContactsList(newValue: [DomainContact])
}
