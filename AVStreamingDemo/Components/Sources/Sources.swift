import Foundation

protocol SourceModeling {
    var data: [SourceModel] { get }
}

class Sources: SourceModeling {
    let data: [SourceModel] = [
        SourceModel(url: "https://abclive1-lh.akamaihd.net/i/abc_live05@423399/master.m3u8", title: "ABC Live"),
        SourceModel(url: "https://liveproduseast.global.ssl.fastly.net/btv/desktop/us_live.m3u8", title: "Bloomberg TV"),
        SourceModel(url: "http://161.0.157.5/PLTV/88888888/224/3221227026/01.m3u8", title: "HBO 2"),
        SourceModel(url: "http://161.0.157.51/PLTV/88888888/224/3221227040/01.m3u8", title: "NBC"),
        SourceModel(url: "https://adultswim-vodlive.cdn.turner.com/live/rick-and-morty/stream_7.m3u8", title: "Rick & Morty"),
        SourceModel(url: "https://adultswim-vodlive.cdn.turner.com/live/superjail/stream_7.m3u8", title: "Superjail"),
        SourceModel(url: "https://adultswim-vodlive.cdn.turner.com/live/eric-andre/stream_7.m3u8", title: "The Eric Andre Show"),
        SourceModel(url: "https://adultswim-vodlive.cdn.turner.com/live/venture-bros/stream_7.m3u8", title: "Venture Bros.")
    ]
}
