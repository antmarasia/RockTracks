# Rock Tracks

The Rock Tracks app displays a list of rock tracks from the iTunes store. The list shows the album art, track name, artist name and the price. Clicking on the table cell will segue to show more detail. The same info as before is show plus the duration and the release date. There is also a more details button that will open your web browser to the tracks page on iTunes. The play button will play a preview of the selected track.


# TODO

 - Refactor to MVVM to avoid having to format the price, duration and release date in the ViewController
 - Cache the album art to avoid re-downloading over and over again
 - Display more information that is available from the API

## Requirements

iOS 11+
Tested with Xcode 12
Swift 5
