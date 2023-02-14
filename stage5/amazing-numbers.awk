BEGIN {
    split("even odd buzz duck palindromic gapful spy", Properties, / /)
}
/[^[:digit:] ]/ {
    print "number is not natural!"; exit 1
}

NF == 1 {
    print "Properties of " $1
    for (i in Properties) {
        property = Properties[i]
        has = @property($1) ? "true" : "false"
        printf("%12s: %s\n", property, has)
    }
}

NF == 2 {
    for (k = 0; k < $2; ++k) {
        number = $1 + k
        out = ""
        for (i in Properties) {
            property = Properties[i]
            out = out (@property(number) ? ", "property : "")
        }
        sub(/^, /, number" is ", out)
        print out
    }
}

NF > 2 {

}
function even(number) {
    return !odd(number)
}
function odd(number) {
    return number % 2
}
function buzz(number) {
    return number % 7 == 0 || number % 10 == 7
}
function duck(number) {
    return +number ~ /0/
}
function palindromic(number,   len,i) {
    len = length(number)
    for (i = (len - len % 2) / 2; i > 0; --i)
        if (substr(number, i, 1) != substr(number, len + 1 - i, 1))
            return 0
    return 1
}
function gapful(number,   divider) {
    if (length(number) != 3) return 0
    divider = substr(number, 1, 1) substr(number, 3)
    return number % divider == 0
}
function spy(number,   product,digit,sum) {
    product = 1
    do {
        sum += digit = number % 10
        product *= digit
    } while(number = int(number / 10))
    return product == sum
}
