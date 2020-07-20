//
//  MercadoChallengeTests.swift
//  MercadoChallengeTests
//
//  Created by troquer on 7/19/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import XCTest
@testable import MercadoChallenge

class MercadoChallengeTests: XCTestCase {
    var mockProduct: Product = Product()
    override func setUpWithError() throws {
        mockProduct = Product(title:"Test Product", price: 5540)
        print("setup")
    }
    
    override func tearDownWithError() throws {
        print("teardown")
    }
    
    // Example of testing a method of a View Controller
    func testProductDetailTitleSetup() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
        sut.loadViewIfNeeded()
        sut.productData = mockProduct
        sut.setup()
        XCTAssertEqual(sut.title, mockProduct.title, "Navigation Title is not set")
    }
    
    func testPriceFormatting() {
        let formattedPrice = mockProduct.formattedPrice()
        XCTAssertEqual(formattedPrice, "COP 5.540", "Bad price formatting")
    }
    
    
    
}
