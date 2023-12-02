//
//  Day01.swift
//  
//
//  Created by Luca Archidiacono on 01.12.2023.
//

import Foundation
import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
	// Smoke test data provided in the challenge question
	let testData1 = """
	1abc2
	pqr3stu8vwx
	a1b2c3d4e5f
	treb7uchet
	"""
	
	let testData2 = """
	two1nine
	eightwothree
	abcone2threexyz
	xtwone3four
	4nineeightseven2
	zoneight234
	7pqrstsixteen
	"""

	func testPart1() throws {
		let challenge = Day01(data: testData1)
		XCTAssertEqual(String(describing: challenge.part1()), "142")
	}

	func testPart2() throws {
		let challenge = Day01(data: testData2)
		XCTAssertEqual(String(describing: challenge.part2()), "281")
	}
}
