class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var domainCounts = [String: Int]()
        
        for cpdomain in cpdomains {
            // Split the count and domain
            let parts = cpdomain.split(separator: " ")
            guard let count = Int(parts[0]) else { continue }
            let domain = String(parts[1])
            
            // Generate all subdomains
            var subdomains = domain.split(separator: ".")
            while !subdomains.isEmpty {
                let subdomain = subdomains.joined(separator: ".")
                domainCounts[subdomain, default: 0] += count
                subdomains.removeFirst() // Remove the first part
            }
        }
        
        // Format the result
        return domainCounts.map { "\($0.value) \($0.key)" }
    }
}
