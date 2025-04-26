import random
import pages

type
  Pos = object
    x, y: cint

type
  Circles = object
    list: seq[Pos]

proc `+`*(a, b: Pos): Pos =
  result.x = a.x + b.x
  result.y = a.y + b.y

proc `-`*(a, b: Pos): Pos =
  result.x = a.x - b.x
  result.y = a.y - b.y

proc `*`*(a: Pos, k: cdouble): Pos =
  result.x = cint(cdouble(a.x) * k)
  result.y = cint(cdouble(a.y) * k)

proc `/`*(a: Pos, k: cdouble): Pos =
  result.x = cint(cdouble(a.x) / k)
  result.y = cint(cdouble(a.y) / k)

randomize()  # initialises the seed

let cnv = getElementById("c8")
let ctx = cnv.getContext2d()

proc rand_pos(): Pos =
  result = Pos(x: cint(rand(0..480)), y: cint(rand(0..560)))

var circles = Circles(list: @[])
for i in 1..12:
  circles.list.insert(rand_pos(), 0)

let i = rand(circles.list.len - 1)
var p = circles.list[i]

let j = rand(circles.list.len - 1)
var d = circles.list[j]

while d == p:
  let j = rand(circles.list.len - 1)
  d = circles.list[j]

var t: cdouble = 0.0

proc draw_bg() =
  ctx.beginPath()
  ctx.fillStyle(255, 255, 255)
  ctx.rect(0, 0, 480, 560)
  ctx.fill()

proc draw_c(c: Pos) =
  ctx.beginPath()
  ctx.strokeStyle("#ccc")
  ctx.circle(c.x, c.y, 36)
  ctx.stroke()

proc draw_p(p: Pos) =
  ctx.beginPath()
  ctx.fillStyle(10, 230, 80)
  ctx.circle(p.x, p.y, 22)
  ctx.fill()

proc draw_p2(p: Pos) =
  ctx.beginPath()
  ctx.fillStyle(240, 180, 20)
  ctx.circle(p.x, p.y, 22)
  ctx.fill()

proc linear(a: Pos, b: Pos, t: cdouble): Pos =
  let t2 = 1.0 - t
  ( (a * t2) + (b * t) )

proc mouse_event(m: MouseEvent) =
  discard

proc new_dest() =
  p = d
  let j = rand(circles.list.len - 1)
  d = circles.list[j]
  while d == p:
    let j = rand(circles.list.len - 1)
    d = circles.list[j]

proc animate() =
  draw_bg()
  for c in circles.list:
    draw_c(c)
  draw_p(p)
  let p2 = linear(p, d, t)
  if t > 1.0:
    new_dest()
    t = 0.0
  draw_p2(p2)
  t += 0.01

addMouseDownEventListener(mouse_event)
setInterval(animate, 1000 div 26)

