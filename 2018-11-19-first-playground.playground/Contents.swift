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

let exponentFormattedDouble = 1.2e-3

print(exponentFormattedDouble)
print(type(of: exponentFormattedDouble)) // still defaults to double. Thought from the documentation it would be float, based on the use of the term "floats" in " Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e; hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p.", but I guess a double is just a special type of float (with twice the precision / bits)


let paddedInt = 000123456 // this would be interpreted as octal in some other languages, but here it's just zero padding. Octals use 0o123456 syntax.

let paddedOctal = 0o123456

print(type(of: paddedOctal)) // let's convert this to an unsigned int
let unsignedVersion: UInt = UInt(paddedOctal) // to cast, use the constructor function. Have to assign to a new variable. Probably better that way.

// I guess I should stop calling them constructors. They're initializers in the Swift vernacular. Look forward to reading about Extensions.

let three = 3
let pointOneFour = 0.14 // Just .14 will fail, need the zero
let pi = Double(three) + pointOneFour // have to wrap three in initializer. Beats other languages where casting happens automatically and often arbitrarily
let integerPi = Int(pi) // just realized, thanks to this documentation, that there is a difference between truncation and flooring, which is how they interact with negative numbers. Never really occured to me before.


typealias ReallyBigNumber = UInt64
typealias ReallySmallNumber = Int8

let bigNum = ReallyBigNumber.max // cool. Useful if processing binary file formats and protocols, for code legibility, I guess
let smallNumber = ReallySmallNumber.min

if bigNum > smallNumber { // no brackets around if expressions
    print("Big numbers are bigger than small numbers") // this is the one
} else {
    print("The fundamental laws of the universe don't apply here")
}


let i = 1

if i == 1 { // okay, so no if i { } business, which I'll miss, but it's for the best - type safety and all that. I'm not as good at keeping track of types in my head as I like to think, so it's good to have the compiler remind me every so often. == doesn't do automatic type conversion either, so no need for === though I think you can define that yourself.
    print("I exist.")
}

print(type(of: (404, "Not Found"))) // I guess this is why (besides simply being extraneous) brackets aren't used in if statements. Brackets make tuples. Tuples don't have their own type, they are a list of types for values contained therein.

print(type(of: (404, 405, 406))) // (Int, Int, Int) - see?


let (z1, _, z3) = (1, 2, 3) // tuple decomposition. Loving the _ placeholder to ignore parts.

print(z1) // 1

print(45)

// just figured out why Xcode playgrounds sometimes reevaluates all the code. They do that if a let statement changes. They have to do that because unlike JavaScript, you can't just var x = 5; twice. Only one declaration is permitted.

//: `let (a1, a2, a3) = (1, 2, 3, 4, 5, 6, 7) // uneven sizes - what of it?`
//:
//: above errors out.

let myTuple = ("Joe", "Taylor", 30) // double quotes only

let firstName = myTuple.0
let lastName = myTuple.1
let age = myTuple.2 // I love this. age+n a-okay too.

// print(myTuple["age"]) // no bracket notation in Swift

let http200Status = (
    statusCode: 200,  // oh, cool, named tuples
    description: "OK" // not hash maps but probably faster anyhow since Swift is a compiled language
)

print(http200Status.description)

//: > Tuples are useful for temporary groups of related values. They’re not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple. For more information, see Structures and Classes.
//:
//: Duely noted.

var asdf : Int? = 5

asdf = nil // can't just set anything to nil. Have to make it explicit with Optionals syntax (a question mark after the type)

var x9 : Any = 34 // oh, so we can make variables that can accept any type. Good. Best not overuse it though.

x9 = "foo"

x9 = 5.3

let fooOptional : Int? = 34 // this is somehow okay even though let doesn't allow overwriting of variables, so the allowance of nil is moot. Seems pointless to support this, though I guess it could come in handy in some type inference scenarios


var surveyAnswer: String?

// cool, no need to assign it right away if optional

/// print(surveyAnswer) // this warns about implicit conversion to Any, which is annoying. Will have to look into that later. #TODO

surveyAnswer = "42"

print("Survey answer: \(surveyAnswer!)") // need to include an exclamation mark to signal that the surveyAnswer definitely has a value at this point in the control flow. The exlamation mark is performing what's known as a "Forced Unwrap", which probably means converting the type from Optional(String) to String

//: ## Optional Binding

// > Xcode is crashing a lot. This sucks.

var possibleNumber : Int? // in the swift book's example code, I guess possible number is just a string, but doing it a bit different here.

func checkNumber(inString:String) -> () {
    possibleNumber = Int(inString)

    if let actualNumber = possibleNumber {
        print("Actually, the number is \(actualNumber)")
    } else {
        print("No numbers to work with.")
    }
}

checkNumber(inString: "foo")
checkNumber(inString: "42")

let myClosure = {
    // I can omit the arguments list here
    if let firstNumber = Int("4"), let secondNumber = Int("5") {
        print("Chained optional binding is working!")
        print("Values are \(firstNumber) and \(secondNumber)")
    }
}

myClosure()


/*
 
You can't create closures just to encapsulate a few variables without assigning them to variables of their own,
 apparently, e.g. you can't create a closure then immediately call it like in JavaScript with (function() { })().
 
*/

var bar573 : String?

bar573 = "foo"

if let foo42 = bar573 {
    print(foo42)
}

// print(foo42) // constants bound with let statements in optional binding clauses are not available outside their scope. This line errors out.

enum NeedlessError : Error { // skipped ahead a bit to read about enums. Looks interesting. Look forward to using them.
    case feltLikeBreaking(reason : String)
}

func canThrowAnError() throws { // no need to specify an error type
    // if let randInt = Int.random(in: 1...10), randInt > 5 { // this didn't work, need to be binding an optional to use in an if statement. Seems like a needless restriction, but hey.
    
    let randInt = Int.random(in: 1...10) // range syntax
    
    if randInt > 5 {
        throw NeedlessError.feltLikeBreaking(reason: "Trouble in danger land.")
    }
    
    print("All's well in danger land.")
}
    
do {
    try canThrowAnError()
} catch { // general error catching works fine
    print("Caught an error.")
}

assert(1 == 1)  // we're still cool, right?


