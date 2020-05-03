import Fluent
import Vapor

struct Movie: Content {
    let name: String
    let year: Int
}

func routes(_ app: Application) throws {
    
    app.get("movies") { req in
        return Movie(name: "Lord of the Rings", year: 2002)
    }
    
    app.get("movies", "genre", ":genre") { req -> String in
        
        let genre = req.parameters.get("genre") ?? ""
        return "The genre value is \(genre)"
    }
    
    app.post("add-movie") { req -> Movie in
        
        let movie = try? req.content.decode(Movie.self)
        return movie!
    }
}
