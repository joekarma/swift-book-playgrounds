import UIKit

//: Starting with [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)

let x = 5 // type inference

let s = "Hello"

let xType = type(of: s) // named arguments
let sType = type(of: x) // types including primitives have uppercase letters, e.g. String and Int
let xType2 = String.self // same as xType

print("xType is same as xType2? ", xType2 == xType) // see? Also print statements with variable length argument lists

// s = 34 // statically typed language, so this doesn't work since 34 isn't a string
// s = "foo" // ...or actually, in the above case, because let defines constants

var s2 = "foo"
s2 = "bar" // redefining variables works just fine assuming the types match

var j = 0.0, k = 3.4, l = "hello" // multiple variables on one line

// var s2 = "baz" // this isn't javascript though, so redeclaring a variable won't work. Maybe in blocks it's okay?

var m = {
    (x:String) ->() in
    print(x)
}

m("foo") // okay cool, so block syntax is pretty straightforward. A bit of an adjustment coming from JavaScript, but just syntax, easy enough.

var m2 = {
    () ->() in // no arguments
    print("foo")
}

m2()

var m3 = {
    () ->() in
    let s2 = "bar"
    print(s2) // variable override A-ok in closures
}


var m4 = {
    () ->() in
    print(s2)
}

m4()

let 🐶🐮 = "dogcow"

print(🐶🐮) // ok, so this is a bit of an abomination, but useful at times, so I'm glad it's allowed.

let `let` = "foo" //  backticks for reserved word variables

print(`let`) // convenient. Supposedly meant to avoid doing this, but I think it's fine - backticks do a good enough job of giving these away as variables. Don't see much room for ambiguity

print("hello", "world", separator: ",", terminator: "3 revenge of the machines") // has separator and terminator options which is great
print() // empty print statements for newlines

let love = "❤️" // COMMAND+CTRL+SPACE BAR

print("I \(love) string interpolation.")

// I already pretty much figured out comments.

// the usual, like double forward slashes

/*
    and so on and so forth...
*/

//: Markdown in comments for playgrounds is **cool**. I've now exhausted my Markdown syntax vocabulary, but there y'are.

let foo = "bar" ; let bar = "baz" ; print(foo, bar) // semi-colons are still a thing. Discouraged from using them at the end of a line for stylistic reasons

let statement = "fact"; // but you can if you want


//: ## Integers

let minValue = UInt8.min // these convenience constants are cool, good to know
let maxValue = UInt8.max

let realMin = Int8.min
let realMax = Int8.max

print(realMin)

// let overflow = maxValue + 1 // hey, cool, overflow protection!

print(String(Int.max, radix: 2)) // https://stackoverflow.com/questions/26181221/how-to-convert-a-decimal-number-to-binary-in-swift

print(String(Int.max, radix: 2).count) // https://stackoverflow.com/questions/24037711/get-the-length-of-a-string
// Int uses platform's native word size, so it looks like I'm on a 64 bit system.

//: > Even on 32-bit platforms, Int can store any value between -2,147,483,648 and 2,147,483,647, and is large enough for many integer ranges.

let unsignedInt:UInt = 45 // unsigned integers are a thing too of course

print(unsignedInt + 2_147_483_647) // I can format integers with underscores for readability


//: ## Floats and Doubles

let myPi = 3.14 // type inference defaults to doubles, sensibly enough

print("Expecting my pi to be double: ", type(of: myPi))

let binaryFormatted = 0b101010101 + 0o777 // all the standard formats for literal integers are supported
