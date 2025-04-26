import random
import pages

type 
  Pos = object
    x, y: cint

type
  Dir = enum
    Left, Right, Up, Down, NoDir

type
  Apple = object
    pos: Pos

type
  Player = object
    pos: Pos
    dir: Dir
    trail: seq[Pos]
    size: cint

randomize()  # initialises the seed

proc rand_pos(): Pos =
  result = Pos(x: cint(30 * rand(0..13)), y: cint(30 * rand(0..9)))

var player = Player(pos: Pos(x: 0, y: 0), dir: NoDir, trail: @[], size: 4)
var apple = Apple(pos: rand_pos())

let cnv = getElementById("c1")
let ctx = cnv.getContext2d()

proc draw_bg() =
  ctx.beginPath()
  ctx.fillStyle(255, 255, 255)
  ctx.rect(0, 0, 410, 300)
  ctx.fill()

proc draw_r(p: Pos) =
  ctx.beginPath()
  ctx.fillStyle(10, 230, 80)
  ctx.rect(p.x, p.y, 30, 30)
  ctx.fill()

proc draw_t(trail: seq[Pos]) =
  ctx.beginPath()
  ctx.fillStyle(40, 255, 160)
  for p in trail:
    ctx.rect(p.x, p.y, 30, 30)
  ctx.fill()

proc draw_a(p: Pos) =
  ctx.beginPath()
  ctx.fillStyle(240, 180, 20)
  ctx.rect(p.x, p.y, 30, 30)
  ctx.fill()

proc player_moves(p: var Pos, d: Dir) =
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

proc wrap_sides(p: var Pos) =
  if p.x > 410: p.x = 0
  if p.y > 300: p.y = 0
  if p.x < 0: p.x = 410
  if p.y < 0: p.y = 300

proc new_apple(p: var Pos, exclude: seq[Pos]) =
  p = rand_pos()
  while p in exclude:
    p = rand_pos()

proc update() =
  player_moves(player.pos, player.dir)
  wrap_sides(player.pos)
  if player.pos == apple.pos:
    new_apple(apple.pos, player.trail & @[player.pos])
    player.size += 1
  player.trail.insert(player.pos, 0)
  while player.trail.len > player.size:
    discard player.trail.pop()

proc animate() =
  update()
  draw_bg()
  draw_a(apple.pos)
  draw_t(player.trail)
  draw_r(player.pos)

proc key_event(k: KeyEvent) =
  var d = addr player.dir
  let c = getKeyCode(k)
  case c
  of 37:
    d[] = if d[] == Right: NoDir else: Left
  of 39:
    d[] = if d[] == Left: NoDir else: Right
  of 38:
    d[] = if d[] == Down: NoDir else: Up
  of 40:
    d[] = if d[] == Up: NoDir else: Down
  else: discard

addKeyDownEventListener(key_event)
setInterval(animate, 1000 div 5)

