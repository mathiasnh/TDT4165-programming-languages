/*
HOW DOES IT WORK?
The input is read as a string of values, with space as the separator, and put in a list as lexemes. These lexemes are then 
tokenized so that they can further be interpreted as either numbers, operators or commands. The nature of the input lends the list to 
be in the style of a calculation in postfix notation, and the list of tokens are traversed recursively until all operators and commands are 
executed on the stack. If the token is a number, it is added to a stack. If the token is an operator, the operator is executed on the two 
top elements of the stack. If the token is a command, it is applied to the top element of the stack. The list of tokens is traversed 
until empty, at which point the stack is returned.
*/

/* Takes in a String and splits it into a list of lexemes. */
fun {Lex Str}
    {String.tokens Str & } %Splits string on " " (space)
end 

/*
Recursively traverses a list of lexemes and puts each lexeme into a record depending on whether its an 
operator, a command or a number. Returns a list of records.
*/
fun {Tokenize Lexeme}
    case Lexeme of Head|Tail then 
        case Head of "+" then 
            operator(type:plus)|{Tokenize Tail}
        [] "-" then 
            operator(type:minus)|{Tokenize Tail}
        [] "*" then 
            operator(type:multiply)|{Tokenize Tail}
        [] "/" then 
            operator(type:divide)|{Tokenize Tail}
        [] "p" then
            command(print)|{Tokenize Tail}
        [] "d" then 
            command(duplicatetop)|{Tokenize Tail}
        [] "i" then 
            command(inverse)|{Tokenize Tail}
        [] "^" then 
            command(multinverse)|{Tokenize Tail}
        else %The head element has to be a number (if input is valid)
            number({String.toFloat Head})|{Tokenize Tail} % Invalid input (such as "a", "&" or "~") are rooted out with String.toFloat
        end
    else 
        nil 
    end
end

/*
Interpret takes in a list of tokens and executes the operators on the stack operands until the input list in empty. A helper function
Interpret_ is needed to keep track of the Stack. The function recursively traverses throught the Tokens list. When the current element (head)
is a number it is added to the stack. If the current element is an operation, the operation is executed on the two top elements of the stack. 
If the current element is a command, it either prints the current stack, duplicates the top element, flips the sign of the top element or 
takes the multiplicative inverse of the top element.
*/
fun {Interpret Tokens}
    fun {Interpret_ Stack Tokens}
        case Tokens of nil then
            {List.reverse Stack} %Reverse list to accommodate return requirements
        [] number(N)|Tail then
            {Interpret_ number(N)|Stack Tail}
        [] operator(type:Op)|Tail then
            number(Num1)|number(Num2)|Rest = Stack in %Access the first two elements of the stack 
            {Interpret_ {Execute Op Num1 Num2}|Rest Tail}
        [] command(Cmd)|Tail then
            number(Top)|Rest = Stack in
            case Cmd of print then
                {System.show {List.reverse Stack}} %Prints the stack at this point
                {Interpret_ Stack Tail}
            [] duplicatetop then 
                {Interpret_ number(Top)|Stack Tail} %Duplicates the top element
            [] inverse then
                {Interpret_ number(~Top)|Rest Tail} %Flips sign of top element
            [] multinverse then
                {Interpret_ number(1.0 / Top)|Rest Tail} %Multiplicative inverse of last element
            end
        end
    end
in 
    {Interpret_ nil Tokens}
end

/* Helper function to do operations. Takes in the operation and executes it on the two numbers */
fun {Execute Operation Num1 Num2}
    case Operation of plus then 
        number(Num1 + Num2)
    [] minus then
        number(Num1 - Num2)
    [] divide then
        number(Num1 / Num2)
    [] multiply then 
        number(Num1 * Num2)
    end
end