//
//  TeamDetailViewModelTests.swift
//  PetcoTeamsTests
//
//  Created by MaurZac on 28/01/25.
//

import XCTest
import PetcoTeams

final class TeamDetailViewModelTests: XCTestCase {

    class MockTeamService: TeamServiceProtocol {
            var shouldReturnError = false
            
            func fetchTeamDetails(teamID: String, completion: @escaping (Result<Team, Error>) -> Void) {
                if shouldReturnError {
                    completion(.failure(NSError(domain: "TestError", code: 1, userInfo: nil)))
                } else {
                    let team = Team(idTeam: "133602", strTeam: "Liverpool", strDescriptionEN: "A football club", 
                    completion(.success(team))
                }
            }
        }
        
        func testFetchTeamDetailsSuccess() {
            let mockService = MockTeamService()
            let viewModel = TeamDetailViewModel(service: mockService)
            
            viewModel.fetchTeamDetails(teamID: "133602")
            
            XCTAssertEqual(viewModel.loadingState, .loading)
            
            DispatchQueue.main.async {
                XCTAssertNotNil(viewModel.team)
                XCTAssertEqual(viewModel.loadingState, .complete)
            }
        }
        
        func testFetchTeamDetailsFailure() {
            let mockService = MockTeamService()
            mockService.shouldReturnError = true
            let viewModel = TeamDetailViewModel(service: mockService)
            
            viewModel.fetchTeamDetails(teamID: "133602")
            
            XCTAssertEqual(viewModel.loadingState, .loading)
            
            DispatchQueue.main.async {
                XCTAssertNil(viewModel.team)
                XCTAssertEqual(viewModel.loadingState, .error)
            }
        }

}
