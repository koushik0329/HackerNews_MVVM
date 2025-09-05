//
//  HackerNews_MVVMTests.swift
//  HackerNews_MVVMTests
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

import XCTest
@testable import HackerNews_MVVM

final class HackerNews_MVVMTests: XCTestCase {

    var loginViewModel: LoginViewModel!
    var homeViewModel: HomeScreenViewModel!
    var detailsViewModel: DetailsViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        loginViewModel = LoginViewModel()
        homeViewModel = HomeScreenViewModel()
        detailsViewModel = DetailsViewModel()
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Email Validation Tests
    func testValidEmail() throws {
        let result = loginViewModel.validateLoginEmail(email: "test@gmail.com")
        XCTAssertEqual(result, true)
    }
    
    func testInvalidEmailWithoutGmail() throws {
        let result = loginViewModel.validateLoginEmail(email: "test@yahom")
        XCTAssertEqual(result, false)
    }
    
    func testInvalidEmailTooShort() throws {
        let result = loginViewModel.validateLoginEmail(email: "a@gmail")
        XCTAssertEqual(result, false)
    }
    
    // MARK: - Password Validation Tests
    func testValidPassword() throws {
        let result = loginViewModel.validateLoginPassword(password: "strongPass1")
        XCTAssertEqual(result, true)
    }
    
    func testInvalidPasswordTooShort() throws {
        let result = loginViewModel.validateLoginPassword(password: "123")
        XCTAssertEqual(result, false)
    }
    
    func testNilPassword() throws {
        let result = loginViewModel.validateLoginPassword(password: nil)
        XCTAssertEqual(result, false)
    }
    
    // MARK: - HomeScreenViewModel Tests
    func testNewsListCount() throws {
        let count = homeViewModel.getNewsListCount()
        XCTAssertEqual(count, 6)
    }

    func testGetNewsAtValidIndex() throws {
        let news = homeViewModel.getNews(at: 0)
        XCTAssertNotNil(news, "News should not be nil at valid index")
        XCTAssertEqual(news?.id, "1")
        XCTAssertEqual(news?.title, "Show HN: Draw a fish and watch it swim with the others")
    }
    
    // MARK: - DetailsViewModel Tests (Title only)
    func testDetailsViewModelWithConfiguredNews_Title() throws {
        let sampleNews = News(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: nil, author: "shuuji3", created_at: "11 hours ago")
        
        detailsViewModel.configure(with: sampleNews)
        
        XCTAssertEqual(detailsViewModel.getTitle(), "Google shifts goo.gl policy: Inactive links deactivated, active links preserved")
    }

    func testDetailsViewModelWithoutConfiguredNews_Title() throws {
        XCTAssertEqual(detailsViewModel.getTitle(), "No Title")
    }

}
