import Foundation

protocol SourceModeling {
    var data: [SourceModel] { get }
}

class Sources: SourceModeling {
    let data: [SourceModel] = [
        SourceModel(url: "http://cdnbakmi.kaltura.com/p/243342/sp/24334200/playManifest/entryId/0_uka1msg4/flavorIds/1_vqhfu6uy,1_80sohj7p/format/applehttp/protocol/http/a.m3u8", title: "Folgers Coffee Commercial"),
        SourceModel(url: "https://www.adultswim.com/streams/rick-and-morty", title: "Rick & Morty Stream"),
        SourceModel(url: "https://www.adultswim.com/streams/the-venture-bros", title: "Venture Bros. Stream"),
        SourceModel(url: "https://www.adultswim.com/streams/the-eric-andre-show", title: "The Eric Andre Show"),
        SourceModel(url: "https://www.adultswim.com/streams/your-pretty-face-is-going-to-hell", title: "Your Pretty Face is going to Hell")
    ]
}
