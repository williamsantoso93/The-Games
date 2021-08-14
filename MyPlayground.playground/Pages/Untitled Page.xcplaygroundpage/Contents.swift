import UIKit

var greeting = "Hello, playground"




let baseAPI = "https://api.rawg.io/api"
let apiKey = "e07d0723795c4dfc8130cbcaf6083be6"

let urlString = baseAPI + "/games"
let queryItems: [URLQueryItem]? = [URLQueryItem(name: "key", value: "apiKey")]

var components = URLComponents(string: urlString)!
//if let queryItems = queryItems {
//    components.queryItems = queryItems
//} else {
//    let queryItems1: [URLQueryItem]? = [URLQueryItem(name: "key", value: "apiKey1")]
//    components.queryItems = queryItems1
//}
//components.queryItems = [URLQueryItem(name: "key", value: "apiKey2")]

var query = [URLQueryItem(name: "key", value: apiKey)]

if let queryItems = queryItems {
    query.append(contentsOf: queryItems)
}

components.queryItems = query

print(components)
// Getting a URL from our components is as simple as
// accessing the 'url' property.
let url = components.url


print(url)
