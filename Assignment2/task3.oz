/*
HOW DOES IT WORK?
The input is read a list of tokens, in the style of postfix calculation, containing three possible types: numbers, operators and commands. 
The list is traversed recursively and each value is checked for token-type. If the token is a number, it is added to the stack. 
If it is an operator, the two top elements of the stack are extracted, and a non-ambiguous infix expression is made surrounded by parentheses,
and the new infix expression is added to the stack. If the token is a command, the top element of the stack is extracted, and an infix-style 
expression is made with the command and added to the stack. The list of tokens is traversed until empty, and the resulting stack is returned 
as a virtual string that is the infix representation of the input.  
*/

/* 
Takes in a list of Tokens in the style of a postfix expression, and returns a virtual string that is an infix representation of the input
Uses InfixInternal to keep track of the expression stack
*/
fun {Infix Tokens}
    {InfixInternal Tokens nil}
end


/*
Recursively traverses a list of tokens while building an output stack of expressions. If the head of the token list is a number it is added 
to the stack. If the head is an operator, the two top expressions of the stack are removed and a non-ambiguous infix expression is made 
(with either +, -, / or *) by the helper function Construct. If the head is a command, the same helper function is used, but only on one expression,
since ~ and ^ only require a single input. 
*/
fun {InfixInternal Tokens ExpressionStack} 
    case Tokens of nil then 
        % ExpressionStack looks like [Exp], so we need to access and return the head. Equivalently, ExpressionStack.1 (less verbose though).
        FinalExp|nil = ExpressionStack in
        FinalExp
    [] number(N)|Tail then 
        {InfixInternal Tail N|ExpressionStack}
    [] operator(type:Op)|Tail then
        Num1|Num2|Rest = ExpressionStack in 
        {InfixInternal Tail {Construct Op Num1 Num2}|Rest}
    [] command(Cmd)|Tail then 
        Top|Rest = ExpressionStack in
        {InfixInternal Tail {Construct Cmd Top nil}|Rest}
    end
end


/* 
Helper function to construct a string representing an expression. Takes in an operation and two expressions.
Variables A and B have ambiguous names because they can be both numbers and expressions (e.g. 4 og (2 + 2))
*/
fun {Construct Operation A B}
    case Operation of plus then 
        "(" # B # "+" # A # ")" 
    [] minus then
        "(" # B # "-" # A # ")"
    [] divide then
        "(" # B # "/" # A # ")"
    [] multiply then 
        "(" # B # "*" # A # ")"
    [] inverse then
        "~" # A
    [] multinverse then 
        "1/" # A
    end
end