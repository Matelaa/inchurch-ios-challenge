//
//  MovieViewModel.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import Foundation
import RealmSwift

struct MovieView {
    
    var id = 0
    var title = ""
    var overview = "Without overview"
    var image = ""
    var releaseDate = ""
    var favorite = false
    
    var imageUrl: URL? {
        return URL(string: imageBaseURL + self.image)
    }
}

class MovieViewModel {
    static func getAsView(movie: Movie?) -> MovieView {
        guard let movie = movie else {
            return MovieView()
        }
        
        var movieView = MovieView()
        movieView.id = movie.id.value ?? 0
        movieView.title = movie.title ?? ""
        movieView.image = movie.image ?? ""
        movieView.releaseDate = movie.releaseDate ?? ""
        movieView.favorite = movie.favorite.value ?? false
        
        if let overview = movie.overview, overview != "" {
            movieView.overview = overview
        }
        
        return movieView
    }
    
    static func getAsView(sequence: [Movie]) -> [MovieView] {
        var moviesView: [MovieView] = []
        for movie in sequence {
            moviesView.append(self.getAsView(movie: movie))
        }
        return moviesView
    }
    
    static func saveAll(movies: [Movie]) {
        for movie in movies {
            let movieView = self.get(by: movie.id.value ?? -1)
            movie.favorite.value = movieView.favorite
        }
        try! uiRealm.write {
            uiRealm.add(movies, update: .all)
        }
    }
    
    static func getAll() -> [MovieView] {
        return self.getAsView(sequence: self.get())
    }
    
    static func getFavorites() -> [MovieView] {
        return self.getAll().filter({ $0.favorite })
    }
    
    static func deleteAll() {
        let objects = self.get().filter { (movie) -> Bool in
            if let favorite = movie.favorite.value {
                return !favorite
            }
            return true
        }
        try! uiRealm.write {
            uiRealm.delete(objects)
        }
    }
    
    static func favoriteMovie(by id: Int) -> MovieView {
        let movie = uiRealm.object(ofType: Movie.self, forPrimaryKey: id)
        if let favorite = movie?.favorite.value {
            try! uiRealm.write {
                movie?.favorite.value = !favorite
            }
        }
        return self.getAsView(movie: movie)
    }
    
    static func get() -> [Movie] {
        let objects = uiRealm.objects(Movie.self).sorted(byKeyPath: "title")
        var movies: [Movie] = []
        movies.append(contentsOf: objects)
        return movies
    }
    
    static func get(by id: Int) -> MovieView {
        let object = uiRealm.object(ofType: Movie.self, forPrimaryKey: id)
        return self.getAsView(movie: object)
    }
}
