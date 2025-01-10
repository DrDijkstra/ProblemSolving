class Solution {
    func extractNameAndDpmain(_ email: String) -> (String, String)? {
        let components = email.split(separator: "@")
        // Ensure there are exactly two components
        guard components.count == 2 else {
            return nil
        }

        let name = components[0]
        let filteredName = name.split(separator: "+")[0]
        let dotFilteredNames = filteredName.split(separator: ".")
        var finalName = ""
        for dotFilteredName in dotFilteredNames {
            finalName += dotFilteredName
        }
        return (finalName,String(components[1]))
    }

    func numUniqueEmails(_ emails: [String]) -> Int {
        var hashEmail : [String : Int] = [:]
        var count = 0
        for email in emails{
           if let emailDomain = extractNameAndDpmain(email) {
                var key = "email:" + emailDomain.0 + "domain:" + emailDomain.1
               if  hashEmail[key] == nil {
                    hashEmail[key] = 0
                    count += 1
               }else{
                    hashEmail[key]! += 1
               }
           }

        }
        return count
    }
}