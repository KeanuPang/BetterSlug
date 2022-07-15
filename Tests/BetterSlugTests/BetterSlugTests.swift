@testable import BetterSlug
import XCTest

final class BetterSlugTests: XCTestCase {
    func testNormalString() throws {
        XCTAssertEqual("just-a-normal-string-here", "just a normal string here".slugify())
        XCTAssertEqual("just-a-normal-string-here", "Just a normal string here".slugify())
    }
    
    func testNormalStringWithPunctuations() throws {
        XCTAssertEqual("just-a-normal-string-here", "just a normal string here---".slugify())
        XCTAssertEqual("just-a-normal-string-here", "just a normal string here.".slugify())
        XCTAssertEqual("hey-just-a-normal-string-here", "hey, just a normal string here.".slugify())
        XCTAssertEqual("hey-just-a-normal-string-here", "### hey! just a normal@string here.".slugify())
    }
    
    func testNormalStringWithEmojis() throws {
        XCTAssertEqual("just-a-normal-string-here", "😀just a normal string here".slugify())
        XCTAssertEqual("just-a-normal-string-here", "just a normal string ❤️❤️❤️ here".slugify())
        XCTAssertEqual("hey-just-a-normal-string-here", "hey, 😀just a normal string here".slugify())
        XCTAssertEqual("hey-just-a-normal-string-here", "hey, just a normal string here💪".slugify())
        XCTAssertEqual("hey-just-a-normal-string-here", "hey, 😀 just a normal 🦨 string ❤️❤️❤️ here💪".slugify())
    }
    
    func testChineseString() throws {
        // titles from the posts of https://matters.news/@Openbook
        XCTAssertEqual("話題-凝視時代-再見真實-tidf台灣國際紀錄片影展-5月6日至15日放映中",
                       "話題》凝視時代．再見真實——TIDF台灣國際紀錄片影展，5月6日至15日放映中！".slugify())
        XCTAssertEqual("5月繪本大師-不老少年丁丁的冒險旅程-渴望永恆童年的藝術家喬治-勒米-艾爾吉-herge",
                       "5月繪本大師》不老少年丁丁的冒險旅程：渴望永恆童年的藝術家喬治．勒米（艾爾吉 Hergé）".slugify())
        XCTAssertEqual("身體有書-i-腦要動-身先動-來自身心-科學-美學的7本推薦書-ft-雲門教室執行長謝明霏",
                       "身體有書 I》腦要動，身先動，來自身心、科學、美學的7本推薦書 ft.雲門教室執行長謝明霏".slugify())
        XCTAssertEqual("奇幻之島-對談-台灣的日常-可能是世界的奇幻-小說家吳明益x紀大偉",
                       "奇幻之島．對談》台灣的日常，可能是世界的奇幻：小說家吳明益X紀大偉".slugify())
        XCTAssertEqual("書評-自然與人文雙美-李瑞騰讀黃春明詩集-零零落落",
                       "書評》自然與人文雙美：李瑞騰讀黃春明詩集《零零落落》".slugify())
        
      // titles from the posts of https://matters.news/@hi176
        XCTAssertEqual("以寫作作為行動-在場-獎學金-6-月-11-日舉行作品發佈會-並開啟第二季報名",
                       "以寫作作為行動｜「在場」獎學金 6 月 11 日舉行作品發佈會，並開啟第二季報名".slugify())
        XCTAssertEqual("非虛構寫作背後的生態條件-李雪莉-莊瑞琳-甯卉-張潔平-時間裡的同行者",
                       "非虛構寫作背後的生態條件 | 李雪莉&莊瑞琳&甯卉&張潔平：時間裡的同行者".slugify())
        XCTAssertEqual("挖寶基地之新興-nft公鏈-tezos-徵文活動",
                       "挖寶基地之新興 NFT公鏈 Tezos 徵文活動 🚀".slugify())
        XCTAssertEqual("the-space-白皮書正式公開-烏塗邦計劃-將空投2千萬枚-space",
                       "The Space 白皮書正式公開，「烏塗邦計劃」將空投2千萬枚＄SPACE".slugify())
    }
}
