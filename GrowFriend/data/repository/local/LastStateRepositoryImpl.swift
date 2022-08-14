import Foundation

class LastStateRepositoryImpl: LastStateRepository {

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func getContactsList() -> [DomainContact] {
        if let data = UserDefaults.standard.data(forKey: "lastContactsList") {
            do {
                let decoder = JSONDecoder()
                let contactsList = try decoder.decode([DomainContact].self, from: data)
                return contactsList
            } catch {
                print("Unable to Decode lastContactsList (\(error))")
            }
        }
        return []
    }

    func setContactsList(newValue: [DomainContact]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(newValue)
            UserDefaults.standard.set(data, forKey: "lastContactsList")

        } catch {
            print("Unable to Encode lastContactsList \(error)")
        }
    }
}
