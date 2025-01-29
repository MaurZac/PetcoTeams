//
//  APIServiceTests.swift
//  PetcoTeams
//
//  Created by MaurZac on 28/01/25.
//
import XCTest
@testable import PetcoTeams

class APIServiceTests: XCTestCase {
    var apiService: MockAPIService!

    override func setUp() {
        super.setUp()
        apiService = MockAPIService()
    }

    override func tearDown() {
        apiService = nil
        super.tearDown()
    }

    func testFetchStandings_Success() async throws {
        do {
            let football = try await apiService.fetchStandings(leagueID: "4328", season: "2024-2025")
            XCTAssertFalse(football.table.isEmpty, "La respuesta no debería estar vacía")
            XCTAssertEqual(football.table.first?.teamName, "Liverpool", "El primer equipo debería ser Liverpool")
        } catch {
            XCTFail("La prueba falló con un error inesperado: \(error)")
        }
    }
}
