import pages

type 
  Pos = object
    x, y: cint

var p = Pos(x: 0, y: 0)

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

proc animate() =
  draw_bg()
  draw_r(p.x, p.y)

proc key_event(k: KeyEvent) =
  let c = getKeyCode(k)
  case c
  of 37:
    p.x -= 30
  of 39:
    p.x += 30
  of 38:
    p.y -= 30
  of 40:
    p.y += 30
  else: discard

addKeyDownEventListener(key_event)
setInterval(animate, 1000 div 6)

