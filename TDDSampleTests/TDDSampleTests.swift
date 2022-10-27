//
//  TDDSampleTests.swift
//  TDDSampleTests
//
//  Created by 薮木翔大 on 2022/10/27.
//

import XCTest
@testable import TDDSample

// 「動作するきれいなコード」、ロン・ジェフリーズのこの簡潔な言葉は、TDD（テスト駆動開発）の目標である。動作するきれいなコードは、
//  あらゆる理由で価値がある。

//TDDとは
// レッド→グリーン→リファクタリングの三工程を繰り返していく開発手法
// レッド　　       -> 失敗するコード
// グリーン　       -> テストに成功するコード
// リファクタリング　-> 読みやすいコードとなるように書き換える


//ストーリを考える　Gherkin
// テストのタイトル  :
// given　(前提条件):
// when (操作や入力):
// then 　(その結果):
// and but


class TDDSampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //テストが開始する一番最初に呼ばれる
    override class func setUp() {}
    //核メソッド開始時に呼ばれる
    override func setUp() {}
    //各テストメソッド終了時に呼ばれる
    override class func tearDown() {}
    //全てのテストメソッドが終了したタイミングで呼ばれる
    override func tearDown() { }
    func testExample() throws {}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    //Equalかどうか
    func test_XCTAssertEqual(){
        XCTAssertEqual("Swift", "Swift")
    }
    
    //trueかどうか
    func test_XCTAssertTrue(){
        XCTAssertTrue(true)
    }
    
    //nilかどうか
    func test_XCTAssertNil(){
        XCTAssertNil(nil)
    }
    //nilじゃないかどうか
    func test_XCTAssertNotNil(){
        XCTAssertNotNil("nilじゃないよ")
    }
    
    //APIリクエストで使ったりする
    //時間内にfullfillが呼ばれたら成功
    func test_XCTestExpectation(){
        let exp = XCTestExpectation(description: "成功")
        DispatchQueue.global(qos: .default).async {
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
    
    //例外を発生しているかどうか NSError
    func test_XCTAssertThrowsError(){
        XCTAssertThrowsError(try log(text: ""))
    }
    //例外が発生していないかどうか NSError
    func test_XCTAssertNoThrow(){
        XCTAssertNoThrow(try log(text: "エラーなし"))
    }
    
    func log(text:String) throws {
        if text.isEmpty {
            throw NSError(domain: "error", code: -1)
        }
        print(text)
    }
    //大小関係
    //X > Y
    func test_XCTAssertGreaterThan(){
        XCTAssertGreaterThan(200, 100)
    }
    // X >= Y
    func test_XCTAssertGreaterThanOrEqual(){
        XCTAssertGreaterThanOrEqual(100, 100)
        
    }
     // X < Y
    func test_XCTAssertLessThan(){
        XCTAssertLessThan(70, 100)
    }
    // X <= Y
    func test_XCTAssertLessThanOrEqual(){
        XCTAssertLessThanOrEqual(100, 100)
    }
    
   
}


