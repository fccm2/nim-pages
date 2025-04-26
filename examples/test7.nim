import pages

type
  Pos = object
    x, y: cint

type
  Circles = object
    list: seq[Pos]

let cnv = getElementById("c1")
let ctx = cnv.getContext2d()

var circles = Circles(list: @[])

setFont(ctx, "normal 12px Arial")
fillText(ctx, "click in the canvas", 90, 18)

proc draw_c(x: cint, y: cint) =
  ctx.beginPath()
  ctx.fillStyle(240, 180, 20)
  ctx.circle(x, y, 22)
  ctx.fill()

proc mouse_event(m: MouseEvent) =
  let rect = getCanvasBoundingRect(cnv)
  let x = getClientX(m) - getLeft(rect)
  let y = getClientY(m) - getTop(rect)
  let p = Pos(x: x, y: y)
  circles.list.insert(p, 0)
  draw_c(x, y)

addMouseDownEventListener(mouse_event)
