#YASP, Yet Another SCAD Program

All I wanna do is use variables in my SCAD man.

YASP is a OpenSCAD DSL in Ruby. 

##The goal

complete coverage

##The design methodology

Keep It Simple

##Why

All the other DSL's I've seen have eventually crapped out or been abandoned by their creator before they are feature complete; I think a pragmatic approach with a conservative goal will be a lot easier to handle. I think SCAD's primitives and approach is fine, so you won't see many crazy features, at least not for a while. My biggest gripe is that the language, rather than the approach, and tieing it all to an IDE, sucks.

I mean, I'm not really adding anything new here, but it is pretty cool what you can do:

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

#TODO (not in order):
* support hash for function calls. I could do both somehow, I know it
* gem
* test?
* fix empty yasp tree creating syntax error
* register all functions
* create new primitives like maybe implicitcad's height function primitives
* rotate prism primitive