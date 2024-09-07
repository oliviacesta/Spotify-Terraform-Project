resource "spotify_playlist" "study_music" {
    name = "Study Music"
    tracks = ["6fxVffaTuwjgEk5h9QyRjy", "2hKdd3qO7cWr2Jo0Bcs0MA", "3Vr3zh0r7ALn8VLqCiRR10",
              "2RiBogNRfulkNf7fVbPOrJ", "0FDzzruyVECATHXKHFs9eJ", "7cA3PnUQDlUyBBwpRozQeo",
              "4U45aEWtQhrm8A5mxPaFZ7", "3vUn7FE3ZaQgJmkhIrIirF", "1fDtoTPDyzkNOfFIRXxsC5",
              "3ZffCQKLFLUvYM59XKLbVm", "7hVZJGsh5fxFtwaqgJq1nf", "0W4Kpfp1w2xkY3PrV714B7",
              "2ixsaeFioXJmMgkkbd4uj1", "6vWXl7JGlTTIHJCDCQTPjD", "6me7F0aaZjwDo6RJ5MrfBD"]
}
data "spotify_search_track" "TheFray" {
    artist = "The Fray"
}

resource "spotify_playlist" "theFrayBestHits" {
    name   = "The Fray Best Hits"
    tracks = slice(data.spotify_search_track.TheFray.tracks[*].id, 0, 10)
}
