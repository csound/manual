<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

struct Point x:i, y:i
struct NamedPoint name:S, position:Point
struct Curve points:Point[], label:S

instr 1
  ; No arguments leave a new struct's members at their defaults.
  origin:Point = init()
  prints("Default point = %.0f, %.0f\n", origin.x, origin.y)

  ; Supply one value per member, in declaration order.
  point:Point = init(3, 4)
  named:NamedPoint = init("start", point)
  prints("%s = %.0f, %.0f\n", named.name, named.position.x, named.position.y)

  ; Copy the values of a struct of the same type at initialization.
  copied:Point = init(point)
  prints("Copied point = %.0f, %.0f\n", copied.x, copied.y)

  ; Array init takes sizes even when the elements are structs.
  points:Point[] = init(2)
  points[0] = origin
  points[1] = point
  curve:Curve = init(points, "path")
  prints("%s has %d points, last x = %.0f\n", \
         curve.label, lenarray(curve.points), curve.points[1].x)
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
