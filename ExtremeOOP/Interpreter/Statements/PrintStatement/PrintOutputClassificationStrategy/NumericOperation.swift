protocol NumericOperation {
    var symbol: String { get }
    var function: (Int, Int) -> Int { get }
    init()
}

struct Addition: NumericOperation {
    let symbol = "+"
    let function = { (fst: Int, snd: Int ) in fst + snd }
}

struct Subtraction: NumericOperation {
    let symbol = "-"
    let function = { (fst: Int, snd: Int ) in fst - snd }
}

struct Multiplication: NumericOperation {
    let symbol = "*"
    let function = { (fst: Int, snd: Int) in fst * snd }
}
