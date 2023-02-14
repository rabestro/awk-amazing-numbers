BEGIN {
    split("even odd buzz duck", Properties, / /)
}
/[^[:digit:]]/ {
    print "This number is not natural!"; exit 1
}
{
    print "Properties of " $1
    for (i in Properties) {
        property = Properties[i]
        has = @property($1) ? "true" : "false"
        printf("%12s: %s\n", property, has)
    }
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
    return number ~ /0/
}
