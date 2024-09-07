# Spotify-Terraform-Project
Devops project to create spotify playlists and add songs using terraform. Demonstrates how to create playlists via track ids, or through an array of an artist's most popular songs. This project was super helpful to grow my understanding of IaC principles!

## Elements involved in project
* Docker Desktop
* Terraform
* Spotify Account
* Spotify Developer Account

## End result!
Take a look at the playlists created in my spotify account thanks to this project:

### Example 1 
Using a `spotify_playlist` resource block, I created a Study Music Playlist using track ids from individual songs on spotify with the following code:

```
tracks = ["6fxVffaTuwjgEk5h9QyRjy", "2hKdd3qO7cWr2Jo0Bcs0MA", "3Vr3zh0r7ALn8VLqCiRR10",
          "2RiBogNRfulkNf7fVbPOrJ", "0FDzzruyVECATHXKHFs9eJ", "7cA3PnUQDlUyBBwpRozQeo",
          "4U45aEWtQhrm8A5mxPaFZ7", "3vUn7FE3ZaQgJmkhIrIirF", "1fDtoTPDyzkNOfFIRXxsC5",
          "3ZffCQKLFLUvYM59XKLbVm", "7hVZJGsh5fxFtwaqgJq1nf", "0W4Kpfp1w2xkY3PrV714B7",
          "2ixsaeFioXJmMgkkbd4uj1", "6vWXl7JGlTTIHJCDCQTPjD", "6me7F0aaZjwDo6RJ5MrfBD"]
```
<img width="879" alt="Screenshot 2024-09-07 at 4 22 42 PM" src="https://github.com/user-attachments/assets/a5912e15-3848-402f-bbbc-a55aade982e5">

### Example 2
Using a `spotify_playlist` and a `spotify_search_track`, I created a Playlist of The Fray's greatest hits, by including the artist's name and then adding their top 10 most popular songs:

```
data "spotify_search_track" "TheFray" {
    artist = "The Fray"
}

resource "spotify_playlist" "theFrayBestHits" {
    name = "The Fray Best Hits"
    tracks = slice(data.spotify_search_track.TheFray.tracks[*].id, 0, 10)
}
```
<img width="890" alt="Screenshot 2024-09-07 at 4 23 26 PM" src="https://github.com/user-attachments/assets/9a3c3153-32cb-4daa-b980-de9b5f222e97">
