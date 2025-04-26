import pages

type 
  Pos = object
    x, y: cint

type
  Dir = enum
    Left, Right, Up, Down, Stay

var p = Pos(x: 0, y: 0)
var d = Stay

let cnv = getElementById("c1")
let ctx = cnv.getContext2d()

proc draw_bg() =
  ctx.beginPath()
  ctx.fillStyle(255, 255, 255)
  ctx.rect(0, 0, 330, 240)
  ctx.fill()

proc draw_r(x: cint, y: cint) =
  ctx.beginPath()
  ctx.fillStyle(10, 230, 80)
  ctx.rect(x, y, 30, 30)
  ctx.fill()

proc update() =
  case d
  of Left:
    p.x -= 30
  of Right:
    p.x += 30
  of Up:
    p.y -= 30
  of Down:
    p.y += 30
  else: discard
  if p.x > 330: p.x = 0
  if p.y > 240: p.y = 0
  if p.x < 0: p.x = 330
  if p.y < 0: p.y = 240

proc animate() =
  update()
  draw_bg()
  draw_r(p.x, p.y)

proc key_event(k: KeyEvent) =
  let c = getKeyCode(k)
  case c
  of 37:
    d = if d == Right: Stay else: Left
  of 39:
    d = if d == Left: Stay else: Right
  of 38:
    d = if d == Down: Stay else: Up
  of 40:
    d = if d == Up: Stay else: Down
  else: discard

addKeyDownEventListener(key_event)
setInterval(animate, 1000 div 5)

