//
//  main.swift
//  Splanter
//
//  Created by Edward Loveall on 6/8/14.
//  Copyright (c) 2014 Edward Loveall. All rights reserved.
//

import Foundation


let fileManager = NSFileManager.defaultManager()
let process = NSProcessInfo.processInfo()
let currentDirectory = NSURL.fileURLWithPath(fileManager.currentDirectoryPath)

var source: NSURL
var destination: NSURL

switch process.arguments.count {
// Two arguments
case 3:
    let sanitizedPath = process.arguments[2].stringByResolvingSymlinksInPath
    source = NSURL.fileURLWithPath("\(NSHomeDirectory())/.splanter/\(process.arguments[1])")
    destination = NSURL(string: "\(sanitizedPath)/\(process.arguments[1])", relativeToURL: currentDirectory)
// One argument
case 2:
    source = NSURL.fileURLWithPath("\(NSHomeDirectory())/.splanter/\(process.arguments[1])")
    destination = NSURL(string: process.arguments[1] as String, relativeToURL: currentDirectory)
default:
    println("You must supply a template")
    exit(0)
}

let contents = fileManager.enumeratorAtURL(source, includingPropertiesForKeys: [NSURLIsDirectoryKey], options: nil, errorHandler: nil)
var copyError: NSError? = nil
fileManager.copyItemAtURL(source, toURL: destination, error: &copyError)

if let error = copyError {
    println("atempted to copy \(source) to \(destination)")
    println(error.localizedDescription)
}
