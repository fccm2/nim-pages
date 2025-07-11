import jsffi

type
  JsCanvas* = JsObject
  Ctx2D* = JsObject
  Image* = JsObject
  Gradient* = JsObject
  KeyEvent* = JsObject
  MouseEvent* = JsObject
  JsClientRect* = JsObject

proc getElementById*(id: cstring): JsCanvas
  {.importjs: "document.getElementById(#)".}

proc getContext2d*(cnv: JsCanvas): Ctx2D
  {.importjs: "#.getContext('2d')".}

proc rect*(ctx: Ctx2D, x: cint, y: cint, w: cint, h: cint)
  {.importjs: "#.rect(#, #, #, #)".}

proc circle*(ctx: Ctx2D, cx: cdouble, cy: cdouble, r: cdouble)
  {.importjs: "#.arc(#, #, #, 0, 2 * Math.PI)".}

proc circle*(ctx: Ctx2D, cx: cint, cy: cint, r: cint)
  {.importjs: "#.arc(#, #, #, 0, 2 * Math.PI)".}

proc moveTo*(ctx: Ctx2D, x: cdouble, y: cdouble) {.importjs: "#.moveTo(#, #)".}
proc lineTo*(ctx: Ctx2D, x: cdouble, y: cdouble) {.importjs: "#.lineTo(#, #)".}

proc moveTo*(ctx: Ctx2D, x: cint, y: cint) {.importjs: "#.moveTo(#, #)".}
proc lineTo*(ctx: Ctx2D, x: cint, y: cint) {.importjs: "#.lineTo(#, #)".}

proc beginPath*(ctx: Ctx2D) {.importjs: "#.beginPath()".}
proc closePath*(ctx: Ctx2D) {.importjs: "#.closePath()".}

proc strokeStyle*(ctx: Ctx2D, r: cint, g: cint, b: cint) {.importjs: "#.strokeStyle = 'rgb(#, #, #)'".}
proc fillStyle*(ctx: Ctx2D, r: cint, g: cint, b: cint) {.importjs: "#.fillStyle = 'rgb(#, #, #)'".}

proc strokeStyle*(ctx: Ctx2D, c: cstring) {.importjs: "#.strokeStyle = #".}
proc fillStyle*(ctx: Ctx2D, c: cstring) {.importjs: "#.fillStyle = #".}

proc fill*(ctx: Ctx2D) {.importjs: "#.fill()".}
proc stroke*(ctx: Ctx2D) {.importjs: "#.stroke()".}

proc lineWidth*(ctx: Ctx2D, w: cdouble) {.importjs: "#.lineWidth = #".}

proc newImage*(): Image {.importjs: "new Image()".}
proc setImgSrc*(img: Image, filename: cstring) {.importjs: "#.src = #".}
proc imgOnload*(img: Image, cb: proc()) {.importjs: "#.onload = #".}

proc drawImage8*(ctx: Ctx2D, img: Image, sx: cint, sy: cint, sw: cint, sh: cint, dx: cint, dy: cint, dw: cint, dh: cint)
  {.importjs: "#.drawImage(#, #, #, #, #, #, #, #, #)".}

proc setFont*(ctx: Ctx2D, f: cstring) {.importjs: "#.font = #".}
proc fillText*(ctx: Ctx2D, s: cstring, x: cint, y: cint) {.importjs: "#.fillText(#, #, #)".}

proc addColorStop*(grad: Gradient, offset: cdouble, color: cstring) {.importjs: "#.addColorStop(#, #)".}
proc createLinearGradient*(x1: cint, y1: cint, x2: cint, y2: cint): Gradient
  {.importjs: "#.createLinearGradient(#, #, #, #)".}

proc fillGradient*(ctx: Ctx2D, grad: Gradient) {.importjs: "#.fillStyle = #".}

proc addKeyDownEventListener*(f: proc(k: KeyEvent))
  {.importjs: "window.addEventListener('keydown', #)".}

proc addKeyUpEventListener*(f: proc(k: KeyEvent))
  {.importjs: "window.addEventListener('keyup', #)".}

proc addMouseDownEventListener*(f: proc(m: MouseEvent))
  {.importjs: "window.addEventListener('mousedown', #)".}

proc addMouseUpEventListener*(f: proc(m: MouseEvent))
  {.importjs: "window.addEventListener('mouseup', #)".}

proc addMouseMoveEventListener*(f: proc(m: MouseEvent))
  {.importjs: "window.addEventListener('mousemove', #)".}

proc addMouseEventListener*(e: cstring, f: proc(m: MouseEvent))
  {.importjs: "window.addEventListener(#, #)".}

proc setInterval*(f: proc(), d: cint)
  {.importjs: "setInterval(#, #)".}

proc getKeyCode*(k: KeyEvent): cint {.importjs: "#.keyCode".}
proc getKey*(k: KeyEvent): cstring {.importjs: "#.key".}

proc getCanvasBoundingRect*(c: JsCanvas): JsClientRect {.importjs: "#.getBoundingClientRect()".}

proc getLeft*(r: JsClientRect): cint {.importjs: "#.left".}
proc getTop*(r: JsClientRect): cint {.importjs: "#.top".}

proc getClientX*(m: MouseEvent): cint {.importjs: "#.clientX".}
proc getClientY*(m: MouseEvent): cint {.importjs: "#.clientY".}

proc getOffsetX*(m: MouseEvent): cint {.importjs: "#.offsetX".}
proc getOffsetY*(m: MouseEvent): cint {.importjs: "#.offsetY".}

proc log*(msg: cstring) {.importjs: "console.log(#)".}
proc alert*(msg: cstring) {.importjs: "alert(#)".}
proc now*(): cdouble {.importjs: "Date.now()".}

