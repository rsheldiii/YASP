#YASP, Yet Another SCAD Program

All I wanna do is use variables in my SCAD man.

YASP is a OpenSCAD DSL in Ruby. I have one main goal: complete coverage, and I aim to complete this goal through one design methodology: Keep It Simple. All the other DSL's I've seen have eventually crapped out or been abandoned by their creator before they are feature complete. I want to at least implement all functions before I crap out. I think a pragmatic approach with a conservative goal will be a lot easier to handle than trying to repackage the wheel with a million other bits and baubles. 

This is a mess because it's 2 in the morning on a wednesday, but it makes primitives inside a DSL block and that's better than any other DSL I've made.

#TODO (not in order):
* support hash for function calls. I could do both somehow, I know it
* gem
* test?
* fix empty yasp tree creating syntax error
* register all functions
* create new primitives like maybe implicitcad's height function primitives
* rotate prism primitive