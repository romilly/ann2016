:Class Perceptron
    :Field Public weights
    :Field Public bias
    ∇ New inputShape
        ⍝ inputShape is shape of input
        ⍝ input is usually a vector ,
        ⍝ so inputShape is usually a (scalar) length
        :Access Public
        :Implements Constructor
        bias←0
        weights←inputShape⍴0
    ∇
    ∇ z←output input
        :Access Public
        ⍝ calculate output from input array
        ⍝ using current bias, weights
        z←0<bias+input+.×weights
    ∇
    ∇ z←expected adjust input;error
        :Access Public
        ⍝ adjusts weights, bias to improve performance
        ⍝ expected ←→ what output should be for given input
        ⍝ boolean z shows if a change was made
        error←expected-output(input)
        bias+←error
        weights+←eta×error×input
        z←error≠0
    ∇
:EndClass
