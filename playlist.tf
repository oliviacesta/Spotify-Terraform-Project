resource "spotify_playlist" "study_music" {
    name = "Study Music"
    tracks = ["6fxVffaTuwjgEk5h9QyRjy"]
}

data "spotify_search_track" "TheFray" {
    artist = "The Fray"
}

resource "spotify_playlist" "theFrayBestHits" {
    name = "The Fray Best Hits"
    tracks = [data.spotify_search_track.TheFray.tracks[0].id,
              data.spotify_search_track.TheFray.tracks[1].id,
              data.spotify_search_track.TheFray.tracks[2].id,
              data.spotify_search_track.TheFray.tracks[3].id
    ]
}