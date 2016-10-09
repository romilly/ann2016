X backprop y;l0;l1;l1_delta;l1_error;l2;l2_delta;l2_error;syn0;syn1
⍝ based on three-layer example from
⍝ https://iamtrask.github.io/2015/07/12/basic-python-network/
syn0←¯1+2×?3 4⍴0
syn1←¯1+2×?4 1⍴0
:For j :In ⍳60000
 ⍝Feed forward through layers 0, 1, and 2
    l0←X
    l1←sigmoid l0+.×syn0
    l2←sigmoid l1+.×syn1
⍝ how much did we miss the target value?
    l2_error←y-l2
    :If 0=j|10000
        'Error :',⍕(+/÷≢),l2_error
    :EndIf
⍝ in what direction is the target value?
    l2_delta←l2_error×dSigmoid l2
⍝ how much did each l1 value contribute to the l2 error (according to the weights)?
    l1_error←l2_delta+.×⍉syn1
⍝ in what direction is the target l1?
    l1_delta←l1_error×dSigmoid l1
    syn1+←(⍉l1)+.×l2_delta
    syn0+←(⍉l0)+.×l1_delta
:EndFor