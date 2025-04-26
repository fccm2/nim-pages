import jsffi

type
  JsCanvas* = JsObject
  Ctx2D* = JsObject
  Gradient* = JsObject

proc getElementById*(id: cstring): JsCanvas
  {.importjs: "document.getElementById(#)".}

proc getContext2d*(cnv: JsCanvas): Ctx2D
  {.importjs: "#.getContext('2d')".}

proc rect*(ctx: Ctx2D, x: cint, y: cint, w: cint, h: cint)
  {.importjs: "#.rect(#, #, #, #)".}

proc circle*(ctx: Ctx2D, cx: cdouble, cy: cdouble, r: cdouble)
  {.importjs: "#.arc(#, #, #, 0, 2 * Math.PI)".}

proc moveTo*(ctx: Ctx2D, x: cdouble, y: cdouble) {.importjs: "#.moveTo(#, #)".}
proc lineTo*(ctx: Ctx2D, x: cdouble, y: cdouble) {.importjs: "#.lineTo(#, #)".}

proc beginPath*(ctx: Ctx2D) {.importjs: "#.beginPath()".}
proc closePath*(ctx: Ctx2D) {.importjs: "#.closePath()".}

proc strokeStyle*(ctx: Ctx2D, r: cint, g: cint, b: cint) {.importjs: "#.strokeStyle = 'rgb(#, #, #)'".}
proc fillStyle*(ctx: Ctx2D, r: cint, g: cint, b: cint) {.importjs: "#.fillStyle = 'rgb(#, #, #)'".}

proc fill*(ctx: Ctx2D) {.importjs: "#.fill()".}
proc stroke*(ctx: Ctx2D) {.importjs: "#.stroke()".}

proc lineWidth*(ctx: Ctx2D, w: cdouble) {.importjs: "#.lineWidth = #".}

proc addColorStop*(grad: Gradient, offset: cdouble, color: cstring) {.importjs: "#.addColorStop(#, #)".}
proc createLinearGradient*(x1: cint, y1: cint, x2: cint, y2: cint): Gradient
  {.importjs: "#.createLinearGradient(#, #, #, #)".}

proc fillGradient*(ctx: Ctx2D, grad: Gradient) {.importjs: "#.fillStyle = #".}

proc log*(msg: cstring) {.importjs: "console.log(#)".}
proc alert*(msg: cstring) {.importjs: "alert(#)".}
proc now*(): cdouble {.importjs: "Date.now()".}

