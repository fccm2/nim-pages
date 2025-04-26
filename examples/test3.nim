import pages

let cnv = getElementById("c1")
let ctx = cnv.getContext2d()

ctx.beginPath()
ctx.fillStyle(10, 230, 80)
ctx.rect(10, 10, 60, 40)
ctx.fill()

ctx.beginPath()
ctx.fillStyle(240, 180, 20)
ctx.circle(76, 42, 26)
ctx.fill()

proc key_event(k: KeyEvent) =
  alert("Key-Down")

proc mouse_event(m: MouseEvent) =
  alert("Mouse-Down")

addKeyDownEventListener(key_event)
addMouseDownEventListener(mouse_event)

