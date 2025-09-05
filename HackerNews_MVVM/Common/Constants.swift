
enum Server: String {
    case endPoint = "https://hn.algolia.com/api/v1/search?tags=front_page"
}

enum TableCellIdentifier: String {
    case listCell = "NewsTableViewCell"
}

enum Screen {
    enum LoginView: String {
        case title = "Log in To Your Account!"
        case subtitles = "We're so glad to see you again. Log in to continue."
    }
}
