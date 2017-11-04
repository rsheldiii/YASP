# YASP, Yet Another SCAD Program


YASP is a OpenSCAD DSL in Ruby. 

## The goal

complete coverage

## The design methodology

Keep It Simple

## Why

All I wanna do is use variables in my SCAD man.

SCAD is not a programming language, and that bothers me. Variables, for one thing, would be an extreme help in reducing
code complexity for my 3d objeccts, as well as proper looping mechanisms and possibly functions as arguments.

The aim of this DSL is to provide a dead simple Ruby interface to SCAD programming that fits into a regular work flow
with any editor, and that's about it. the brevity of the code speaks for itself:

```
Yasp.file("./scad.scad") do
	#the power of YASP
	9.times do |x|
		7.times do |y|
			translate(x*3,y*4,0) do
				sphere(1)
			end
		end
	end

	#the power of GREYSKULL
	translate(3,4,5) do
		minkowski() do
			cube(4)
			sphere(3)
		end
	end
end
```

![](http://i.imgur.com/kPxZ6GJ.png)

go ahead and look at the source in scad.scad, it's not pretty. Can you do it shorter than that? of course you can, I don't care about shortness in my scad code, even my translates have brackets.

You can't do it shorter in SCAD than you can in YASP though

# TODO (not in order):
* support hash for function calls. I could do both somehow, I know it
* gem
* test?
* fix empty yasp tree creating syntax error
* register all functions
* create new primitives like maybe implicitcad's height function primitives
* rotate prism primitive
