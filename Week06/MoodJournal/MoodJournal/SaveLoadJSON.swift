//
//  SaveLoadJSON.swift
//  MoodJournal
//
//  From 06-ImageEditDemoJSON. <T: Encodable> makes these generic:
//  they work for any type that can be turned into JSON, like [Entry].
//

import Foundation

// Write a value to a JSON file in the documents directory
func saveJSON<T: Encodable>(fileName: String, val: T) throws {
  let filePath = try documentPath(fileName: fileName, create: true)

  let encoder = JSONEncoder()
  encoder.outputFormatting = .prettyPrinted
  encoder.dateEncodingStrategy = .iso8601  // readable dates in the file

  let jsonData = try encoder.encode(val)
  try jsonData.write(to: filePath, options: .atomic)

  // In the simulator, paste this into Terminal to look at the file
  print("cp \(filePath.path) ~/Downloads/.")
}

// Read a value back from a JSON file in the documents directory
func loadJSON<T: Decodable>(_ type: T.Type, fileName: String) throws -> T {
  let filePath = try documentPath(fileName: fileName)
  if !FileManager.default.fileExists(atPath: filePath.path) {
    throw FileError.missing
  }
  let jsonData = try Data(contentsOf: filePath)

  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .iso8601
  return try decoder.decode(type, from: jsonData)
}

enum FileError: Error {
  case missing
}

// The URL of a file in the app's documents directory
func documentPath(fileName: String, create: Bool = false) throws -> URL {
  let directory = try FileManager.default.url(
    for: .documentDirectory,
    in: .userDomainMask,
    appropriateFor: nil,
    create: create)
  return directory.appendingPathComponent(fileName)
}
