import jsffi

type
  JsCanvas* = JsObject
  Ctx2D* = JsObject

proc getElementById*(id: cstring): JsCanvas
  {.importjs: "document.getElementById(#)".}

proc getContext2d*(cnv: JsCanvas): Ctx2D
  {.importjs: "#.getContext('2d')".}

proc rect*(ctx: Ctx2D, x: cint, y: cint, w: cint, h: cint)
  {.importjs: "#.rect(#, #, #, #)".}

proc circle*(ctx: Ctx2D, cx: cdouble, cy: cdouble, r: cdouble)
  {.importjs: "#.arc(#, #, #, 0, 2 * Math.PI)".}

proc beginPath*(ctx: Ctx2D) {.importjs: "#.beginPath()".}
proc strokeStyle*(ctx: Ctx2D, r: cint, g: cint, b: cint) {.importjs: "#.strokeStyle = 'rgb(#, #, #)'".}
proc fillStyle*(ctx: Ctx2D, r: cint, g: cint, b: cint) {.importjs: "#.fillStyle = 'rgb(#, #, #)'".}
proc fill*(ctx: Ctx2D) {.importjs: "#.fill()".}
proc stroke*(ctx: Ctx2D) {.importjs: "#.stroke()".}

proc log*(msg: cstring) {.importjs: "console.log(#)".}
proc alert*(msg: cstring) {.importjs: "alert(#)".}
proc now*(): cdouble {.importjs: "Date.now()".}

