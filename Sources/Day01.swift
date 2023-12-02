//
//  Day01.swift
//
//
//  Created by Luca Archidiacono on 01.12.2023.
//

import Foundation
import Algorithms

struct Day01: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var entities: [String] {
		data.split(separator: "\n").map { String($0) }
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		// Calculate the sum of the first set of input data
		entities.reduce(0) { partialResult, entity in
			guard let firstDigit = entity.first(where: { $0.isNumber })?.wholeNumberValue else { return partialResult }
			guard let lastDigit = entity.last(where: { $0.isNumber })?.wholeNumberValue else { return partialResult }

			return partialResult + (firstDigit * 10 ) + lastDigit
		}
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		let spelledNumbersForwards = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
		let spelledNumbersBackwards = spelledNumbersForwards.map { String($0.reversed()) }
		let spelledNumbersForwardsDict = Dictionary(uniqueKeysWithValues: spelledNumbersForwards.enumerated().map { ($1, $0+1) })
		let spelledNumbersBackwardsDict = Dictionary(uniqueKeysWithValues: spelledNumbersBackwards.enumerated().map { ($1, $0+1) })

		let regexForwards = "d|\(spelledNumbersForwards.joined(separator: "|"))"
		let regexBackwards = "d|\(spelledNumbersBackwards.joined(separator: "|"))"
		print(regexForwards)
		print(regexBackwards)

		let fRegex = try! Regex("\(regexForwards)")
		let bRegex = try! Regex("\(regexBackwards)")
//		let forwards = #/\d|one|two|three|four|five|six|seven|eight|nine/#

		// Sum the maximum entries in each set of data
		return entities.reduce(0) { partialResult, entity in
			var entity = entity
			var numbers: (Int?, Int?) = (nil, nil)
			// Check for first Digit
			if let firstNumber = entity.first?.wholeNumberValue {
				numbers = (firstNumber, numbers.1)
				entity.removeFirst()
			}
			if let lastNumber = entity.last?.wholeNumberValue {
				numbers = (numbers.0, lastNumber)
				entity.removeLast()
			}

			if let firstNumber = numbers.0, let lastNumber = numbers.1  {
				return partialResult + firstNumber * 10 + lastNumber
			}

			if let firstNumber = numbers.0 {
				// Search for the last number from behind
				guard let lastMatch = String(entity.reversed()).firstMatch(of: bRegex),
					  let lastNumber = spelledNumbersBackwardsDict[String(lastMatch.0)] else {
					return partialResult
				}
				return partialResult + firstNumber * 10 + lastNumber
			} else if let lastNumber = numbers.1 {
				// Search for the first number from the front
				guard let firstMatch = String(entity).firstMatch(of: fRegex),
					  let firstNumber = spelledNumbersForwardsDict[String(firstMatch.0)] else {
					return partialResult
				}
				return partialResult + firstNumber * 10 + lastNumber
			}
			return partialResult
		}
	}
}

//55291
