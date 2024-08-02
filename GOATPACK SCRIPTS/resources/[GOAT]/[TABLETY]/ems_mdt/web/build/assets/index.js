(function() {
  const n = document.createElement("link").relList;
  if (n && n.supports && n.supports("modulepreload")) return;
  for (const i of document.querySelectorAll('link[rel="modulepreload"]')) r(i);
  new MutationObserver(i => {
      for (const a of i)
          if (a.type === "childList")
              for (const l of a.addedNodes) l.tagName === "LINK" && l.rel === "modulepreload" && r(l)
  }).observe(document, {
      childList: !0,
      subtree: !0
  });

  function t(i) {
      const a = {};
      return i.integrity && (a.integrity = i.integrity), i.referrerpolicy && (a.referrerPolicy = i.referrerpolicy), i.crossorigin === "use-credentials" ? a.credentials = "include" : i.crossorigin === "anonymous" ? a.credentials = "omit" : a.credentials = "same-origin", a
  }

  function r(i) {
      if (i.ep) return;
      i.ep = !0;
      const a = t(i);
      fetch(i.href, a)
  }
})();

function Bm(e) {
  return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
}
var S = {
      exports: {}
  },
  ee = {};
/** ss
* @license React
* react.production.min.js
*
* Copyright (c) Facebook, Inc. and its affiliates.
*
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree.
*/
var ei = Symbol.for("react.element"),
  Vm = Symbol.for("react.portal"),
  $m = Symbol.for("react.fragment"),
  Wm = Symbol.for("react.strict_mode"),
  Hm = Symbol.for("react.profiler"),
  Ym = Symbol.for("react.provider"),
  Gm = Symbol.for("react.context"),
  Qm = Symbol.for("react.forward_ref"),
  Km = Symbol.for("react.suspense"),
  Zm = Symbol.for("react.memo"),
  Xm = Symbol.for("react.lazy"),
  Xs = Symbol.iterator;

function Jm(e) {
  return e === null || typeof e != "object" ? null : (e = Xs && e[Xs] || e["@@iterator"], typeof e == "function" ? e : null)
}
var Mc = {
      isMounted: function() {
          return !1
      },
      enqueueForceUpdate: function() {},
      enqueueReplaceState: function() {},
      enqueueSetState: function() {}
  },
  Rc = Object.assign,
  Fc = {};

function tr(e, n, t) {
  this.props = e, this.context = n, this.refs = Fc, this.updater = t || Mc
}
tr.prototype.isReactComponent = {};
tr.prototype.setState = function(e, n) {
  if (typeof e != "object" && typeof e != "function" && e != null) throw Error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
  this.updater.enqueueSetState(this, e, n, "setState")
};
tr.prototype.forceUpdate = function(e) {
  this.updater.enqueueForceUpdate(this, e, "forceUpdate")
};

function Uc() {}
Uc.prototype = tr.prototype;

function Vo(e, n, t) {
  this.props = e, this.context = n, this.refs = Fc, this.updater = t || Mc
}
var $o = Vo.prototype = new Uc;
$o.constructor = Vo;
Rc($o, tr.prototype);
$o.isPureReactComponent = !0;
var Js = Array.isArray,
  Bc = Object.prototype.hasOwnProperty,
  Wo = {
      current: null
  },
  Vc = {
      key: !0,
      ref: !0,
      __self: !0,
      __source: !0
  };

function $c(e, n, t) {
  var r, i = {},
      a = null,
      l = null;
  if (n != null)
      for (r in n.ref !== void 0 && (l = n.ref), n.key !== void 0 && (a = "" + n.key), n) Bc.call(n, r) && !Vc.hasOwnProperty(r) && (i[r] = n[r]);
  var s = arguments.length - 2;
  if (s === 1) i.children = t;
  else if (1 < s) {
      for (var u = Array(s), c = 0; c < s; c++) u[c] = arguments[c + 2];
      i.children = u
  }
  if (e && e.defaultProps)
      for (r in s = e.defaultProps, s) i[r] === void 0 && (i[r] = s[r]);
  return {
      $$typeof: ei,
      type: e,
      key: a,
      ref: l,
      props: i,
      _owner: Wo.current
  }
}

function qm(e, n) {
  return {
      $$typeof: ei,
      type: e.type,
      key: n,
      ref: e.ref,
      props: e.props,
      _owner: e._owner
  }
}

function Ho(e) {
  return typeof e == "object" && e !== null && e.$$typeof === ei
}

function Dm(e) {
  var n = {
      "=": "=0",
      ":": "=2"
  };
  return "$" + e.replace(/[=:]/g, function(t) {
      return n[t]
  })
}
var qs = /\/+/g;

function qa(e, n) {
  return typeof e == "object" && e !== null && e.key != null ? Dm("" + e.key) : n.toString(36)
}

function Bi(e, n, t, r, i) {
  var a = typeof e;
  (a === "undefined" || a === "boolean") && (e = null);
  var l = !1;
  if (e === null) l = !0;
  else switch (a) {
      case "string":
      case "number":
          l = !0;
          break;
      case "object":
          switch (e.$$typeof) {
              case ei:
              case Vm:
                  l = !0
          }
  }
  if (l) return l = e, i = i(l), e = r === "" ? "." + qa(l, 0) : r, Js(i) ? (t = "", e != null && (t = e.replace(qs, "$&/") + "/"), Bi(i, n, t, "", function(c) {
      return c
  })) : i != null && (Ho(i) && (i = qm(i, t + (!i.key || l && l.key === i.key ? "" : ("" + i.key).replace(qs, "$&/") + "/") + e)), n.push(i)), 1;
  if (l = 0, r = r === "" ? "." : r + ":", Js(e))
      for (var s = 0; s < e.length; s++) {
          a = e[s];
          var u = r + qa(a, s);
          l += Bi(a, n, t, u, i)
      } else if (u = Jm(e), typeof u == "function")
          for (e = u.call(e), s = 0; !(a = e.next()).done;) a = a.value, u = r + qa(a, s++), l += Bi(a, n, t, u, i);
      else if (a === "object") throw n = String(e), Error("Objects are not valid as a React child (found: " + (n === "[object Object]" ? "object with keys {" + Object.keys(e).join(", ") + "}" : n) + "). If you meant to render a collection of children, use an array instead.");
  return l
}

function fi(e, n, t) {
  if (e == null) return e;
  var r = [],
      i = 0;
  return Bi(e, r, "", "", function(a) {
      return n.call(t, a, i++)
  }), r
}

function ep(e) {
  if (e._status === -1) {
      var n = e._result;
      n = n(), n.then(function(t) {
          (e._status === 0 || e._status === -1) && (e._status = 1, e._result = t)
      }, function(t) {
          (e._status === 0 || e._status === -1) && (e._status = 2, e._result = t)
      }), e._status === -1 && (e._status = 0, e._result = n)
  }
  if (e._status === 1) return e._result.default;
  throw e._result
}
var Re = {
      current: null
  },
  Vi = {
      transition: null
  },
  np = {
      ReactCurrentDispatcher: Re,
      ReactCurrentBatchConfig: Vi,
      ReactCurrentOwner: Wo
  };
ee.Children = {
  map: fi,
  forEach: function(e, n, t) {
      fi(e, function() {
          n.apply(this, arguments)
      }, t)
  },
  count: function(e) {
      var n = 0;
      return fi(e, function() {
          n++
      }), n
  },
  toArray: function(e) {
      return fi(e, function(n) {
          return n
      }) || []
  },
  only: function(e) {
      if (!Ho(e)) throw Error("React.Children.only expected to receive a single React element child.");
      return e
  }
};
ee.Component = tr;
ee.Fragment = $m;
ee.Profiler = Hm;
ee.PureComponent = Vo;
ee.StrictMode = Wm;
ee.Suspense = Km;
ee.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = np;
ee.cloneElement = function(e, n, t) {
  if (e == null) throw Error("React.cloneElement(...): The argument must be a React element, but you passed " + e + ".");
  var r = Rc({}, e.props),
      i = e.key,
      a = e.ref,
      l = e._owner;
  if (n != null) {
      if (n.ref !== void 0 && (a = n.ref, l = Wo.current), n.key !== void 0 && (i = "" + n.key), e.type && e.type.defaultProps) var s = e.type.defaultProps;
      for (u in n) Bc.call(n, u) && !Vc.hasOwnProperty(u) && (r[u] = n[u] === void 0 && s !== void 0 ? s[u] : n[u])
  }
  var u = arguments.length - 2;
  if (u === 1) r.children = t;
  else if (1 < u) {
      s = Array(u);
      for (var c = 0; c < u; c++) s[c] = arguments[c + 2];
      r.children = s
  }
  return {
      $$typeof: ei,
      type: e.type,
      key: i,
      ref: a,
      props: r,
      _owner: l
  }
};
ee.createContext = function(e) {
  return e = {
      $$typeof: Gm,
      _currentValue: e,
      _currentValue2: e,
      _threadCount: 0,
      Provider: null,
      Consumer: null,
      _defaultValue: null,
      _globalName: null
  }, e.Provider = {
      $$typeof: Ym,
      _context: e
  }, e.Consumer = e
};
ee.createElement = $c;
ee.createFactory = function(e) {
  var n = $c.bind(null, e);
  return n.type = e, n
};
ee.createRef = function() {
  return {
      current: null
  }
};
ee.forwardRef = function(e) {
  return {
      $$typeof: Qm,
      render: e
  }
};
ee.isValidElement = Ho;
ee.lazy = function(e) {
  return {
      $$typeof: Xm,
      _payload: {
          _status: -1,
          _result: e
      },
      _init: ep
  }
};
ee.memo = function(e, n) {
  return {
      $$typeof: Zm,
      type: e,
      compare: n === void 0 ? null : n
  }
};
ee.startTransition = function(e) {
  var n = Vi.transition;
  Vi.transition = {};
  try {
      e()
  } finally {
      Vi.transition = n
  }
};
ee.unstable_act = function() {
  throw Error("act(...) is not supported in production builds of React.")
};
ee.useCallback = function(e, n) {
  return Re.current.useCallback(e, n)
};
ee.useContext = function(e) {
  return Re.current.useContext(e)
};
ee.useDebugValue = function() {};
ee.useDeferredValue = function(e) {
  return Re.current.useDeferredValue(e)
};
ee.useEffect = function(e, n) {
  return Re.current.useEffect(e, n)
};
ee.useId = function() {
  return Re.current.useId()
};
ee.useImperativeHandle = function(e, n, t) {
  return Re.current.useImperativeHandle(e, n, t)
};
ee.useInsertionEffect = function(e, n) {
  return Re.current.useInsertionEffect(e, n)
};
ee.useLayoutEffect = function(e, n) {
  return Re.current.useLayoutEffect(e, n)
};
ee.useMemo = function(e, n) {
  return Re.current.useMemo(e, n)
};
ee.useReducer = function(e, n, t) {
  return Re.current.useReducer(e, n, t)
};
ee.useRef = function(e) {
  return Re.current.useRef(e)
};
ee.useState = function(e) {
  return Re.current.useState(e)
};
ee.useSyncExternalStore = function(e, n, t) {
  return Re.current.useSyncExternalStore(e, n, t)
};
ee.useTransition = function() {
  return Re.current.useTransition()
};
ee.version = "18.2.0";
(function(e) {
  e.exports = ee
})(S);
const rr = Bm(S.exports);
var Ll = {},
  Wc = {
      exports: {}
  },
  Ke = {},
  Hc = {
      exports: {}
  },
  Yc = {};
/**
* @license React
* scheduler.production.min.js
*
* Copyright (c) Facebook, Inc. and its affiliates.
*
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree.
*/
(function(e) {
  function n(T, B) {
      var H = T.length;
      T.push(B);
      e: for (; 0 < H;) {
          var Y = H - 1 >>> 1,
              M = T[Y];
          if (0 < i(M, B)) T[Y] = B, T[H] = M, H = Y;
          else break e
      }
  }

  function t(T) {
      return T.length === 0 ? null : T[0]
  }

  function r(T) {
      if (T.length === 0) return null;
      var B = T[0],
          H = T.pop();
      if (H !== B) {
          T[0] = H;
          e: for (var Y = 0, M = T.length, Z = M >>> 1; Y < Z;) {
              var G = 2 * (Y + 1) - 1,
                  de = T[G],
                  je = G + 1,
                  I = T[je];
              if (0 > i(de, H)) je < M && 0 > i(I, de) ? (T[Y] = I, T[je] = H, Y = je) : (T[Y] = de, T[G] = H, Y = G);
              else if (je < M && 0 > i(I, H)) T[Y] = I, T[je] = H, Y = je;
              else break e
          }
      }
      return B
  }

  function i(T, B) {
      var H = T.sortIndex - B.sortIndex;
      return H !== 0 ? H : T.id - B.id
  }
  if (typeof performance == "object" && typeof performance.now == "function") {
      var a = performance;
      e.unstable_now = function() {
          return a.now()
      }
  } else {
      var l = Date,
          s = l.now();
      e.unstable_now = function() {
          return l.now() - s
      }
  }
  var u = [],
      c = [],
      h = 1,
      g = null,
      y = 3,
      k = !1,
      E = !1,
      C = !1,
      O = typeof setTimeout == "function" ? setTimeout : null,
      p = typeof clearTimeout == "function" ? clearTimeout : null,
      f = typeof setImmediate < "u" ? setImmediate : null;
  typeof navigator < "u" && navigator.scheduling !== void 0 && navigator.scheduling.isInputPending !== void 0 && navigator.scheduling.isInputPending.bind(navigator.scheduling);

  function m(T) {
      for (var B = t(c); B !== null;) {
          if (B.callback === null) r(c);
          else if (B.startTime <= T) r(c), B.sortIndex = B.expirationTime, n(u, B);
          else break;
          B = t(c)
      }
  }

  function x(T) {
      if (C = !1, m(T), !E)
          if (t(u) !== null) E = !0, X(_);
          else {
              var B = t(c);
              B !== null && te(x, B.startTime - T)
          }
  }

  function _(T, B) {
      E = !1, C && (C = !1, p(w), w = -1), k = !0;
      var H = y;
      try {
          for (m(B), g = t(u); g !== null && (!(g.expirationTime > B) || T && !j());) {
              var Y = g.callback;
              if (typeof Y == "function") {
                  g.callback = null, y = g.priorityLevel;
                  var M = Y(g.expirationTime <= B);
                  B = e.unstable_now(), typeof M == "function" ? g.callback = M : g === t(u) && r(u), m(B)
              } else r(u);
              g = t(u)
          }
          if (g !== null) var Z = !0;
          else {
              var G = t(c);
              G !== null && te(x, G.startTime - B), Z = !1
          }
          return Z
      } finally {
          g = null, y = H, k = !1
      }
  }
  var L = !1,
      P = null,
      w = -1,
      N = 5,
      z = -1;

  function j() {
      return !(e.unstable_now() - z < N)
  }

  function U() {
      if (P !== null) {
          var T = e.unstable_now();
          z = T;
          var B = !0;
          try {
              B = P(!0, T)
          } finally {
              B ? W() : (L = !1, P = null)
          }
      } else L = !1
  }
  var W;
  if (typeof f == "function") W = function() {
      f(U)
  };
  else if (typeof MessageChannel < "u") {
      var Q = new MessageChannel,
          ce = Q.port2;
      Q.port1.onmessage = U, W = function() {
          ce.postMessage(null)
      }
  } else W = function() {
      O(U, 0)
  };

  function X(T) {
      P = T, L || (L = !0, W())
  }

  function te(T, B) {
      w = O(function() {
          T(e.unstable_now())
      }, B)
  }
  e.unstable_IdlePriority = 5, e.unstable_ImmediatePriority = 1, e.unstable_LowPriority = 4, e.unstable_NormalPriority = 3, e.unstable_Profiling = null, e.unstable_UserBlockingPriority = 2, e.unstable_cancelCallback = function(T) {
      T.callback = null
  }, e.unstable_continueExecution = function() {
      E || k || (E = !0, X(_))
  }, e.unstable_forceFrameRate = function(T) {
      0 > T || 125 < T ? console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported") : N = 0 < T ? Math.floor(1e3 / T) : 5
  }, e.unstable_getCurrentPriorityLevel = function() {
      return y
  }, e.unstable_getFirstCallbackNode = function() {
      return t(u)
  }, e.unstable_next = function(T) {
      switch (y) {
          case 1:
          case 2:
          case 3:
              var B = 3;
              break;
          default:
              B = y
      }
      var H = y;
      y = B;
      try {
          return T()
      } finally {
          y = H
      }
  }, e.unstable_pauseExecution = function() {}, e.unstable_requestPaint = function() {}, e.unstable_runWithPriority = function(T, B) {
      switch (T) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
              break;
          default:
              T = 3
      }
      var H = y;
      y = T;
      try {
          return B()
      } finally {
          y = H
      }
  }, e.unstable_scheduleCallback = function(T, B, H) {
      var Y = e.unstable_now();
      switch (typeof H == "object" && H !== null ? (H = H.delay, H = typeof H == "number" && 0 < H ? Y + H : Y) : H = Y, T) {
          case 1:
              var M = -1;
              break;
          case 2:
              M = 250;
              break;
          case 5:
              M = 1073741823;
              break;
          case 4:
              M = 1e4;
              break;
          default:
              M = 5e3
      }
      return M = H + M, T = {
          id: h++,
          callback: B,
          priorityLevel: T,
          startTime: H,
          expirationTime: M,
          sortIndex: -1
      }, H > Y ? (T.sortIndex = H, n(c, T), t(u) === null && T === t(c) && (C ? (p(w), w = -1) : C = !0, te(x, H - Y))) : (T.sortIndex = M, n(u, T), E || k || (E = !0, X(_))), T
  }, e.unstable_shouldYield = j, e.unstable_wrapCallback = function(T) {
      var B = y;
      return function() {
          var H = y;
          y = B;
          try {
              return T.apply(this, arguments)
          } finally {
              y = H
          }
      }
  }
})(Yc);
(function(e) {
  e.exports = Yc
})(Hc);
/**
* @license React
* react-dom.production.min.js
*
* Copyright (c) Facebook, Inc. and its affiliates.
*
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree.
*/
var Gc = S.exports,
  Qe = Hc.exports;

function A(e) {
  for (var n = "https://reactjs.org/docs/error-decoder.html?invariant=" + e, t = 1; t < arguments.length; t++) n += "&args[]=" + encodeURIComponent(arguments[t]);
  return "Minified React error #" + e + "; visit " + n + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
}
var Qc = new Set,
  Ar = {};

function xt(e, n) {
  Kt(e, n), Kt(e + "Capture", n)
}

function Kt(e, n) {
  for (Ar[e] = n, e = 0; e < n.length; e++) Qc.add(n[e])
}
var En = !(typeof window > "u" || typeof window.document > "u" || typeof window.document.createElement > "u"),
  jl = Object.prototype.hasOwnProperty,
  tp = /^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,
  Ds = {},
  eu = {};

function rp(e) {
  return jl.call(eu, e) ? !0 : jl.call(Ds, e) ? !1 : tp.test(e) ? eu[e] = !0 : (Ds[e] = !0, !1)
}

function ip(e, n, t, r) {
  if (t !== null && t.type === 0) return !1;
  switch (typeof n) {
      case "function":
      case "symbol":
          return !0;
      case "boolean":
          return r ? !1 : t !== null ? !t.acceptsBooleans : (e = e.toLowerCase().slice(0, 5), e !== "data-" && e !== "aria-");
      default:
          return !1
  }
}

function ap(e, n, t, r) {
  if (n === null || typeof n > "u" || ip(e, n, t, r)) return !0;
  if (r) return !1;
  if (t !== null) switch (t.type) {
      case 3:
          return !n;
      case 4:
          return n === !1;
      case 5:
          return isNaN(n);
      case 6:
          return isNaN(n) || 1 > n
  }
  return !1
}

function Fe(e, n, t, r, i, a, l) {
  this.acceptsBooleans = n === 2 || n === 3 || n === 4, this.attributeName = r, this.attributeNamespace = i, this.mustUseProperty = t, this.propertyName = e, this.type = n, this.sanitizeURL = a, this.removeEmptyString = l
}
var _e = {};
"children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style".split(" ").forEach(function(e) {
  _e[e] = new Fe(e, 0, !1, e, null, !1, !1)
});
[
  ["acceptCharset", "accept-charset"],
  ["className", "class"],
  ["htmlFor", "for"],
  ["httpEquiv", "http-equiv"]
].forEach(function(e) {
  var n = e[0];
  _e[n] = new Fe(n, 1, !1, e[1], null, !1, !1)
});
["contentEditable", "draggable", "spellCheck", "value"].forEach(function(e) {
  _e[e] = new Fe(e, 2, !1, e.toLowerCase(), null, !1, !1)
});
["autoReverse", "externalResourcesRequired", "focusable", "preserveAlpha"].forEach(function(e) {
  _e[e] = new Fe(e, 2, !1, e, null, !1, !1)
});
"allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope".split(" ").forEach(function(e) {
  _e[e] = new Fe(e, 3, !1, e.toLowerCase(), null, !1, !1)
});
["checked", "multiple", "muted", "selected"].forEach(function(e) {
  _e[e] = new Fe(e, 3, !0, e, null, !1, !1)
});
["capture", "download"].forEach(function(e) {
  _e[e] = new Fe(e, 4, !1, e, null, !1, !1)
});
["cols", "rows", "size", "span"].forEach(function(e) {
  _e[e] = new Fe(e, 6, !1, e, null, !1, !1)
});
["rowSpan", "start"].forEach(function(e) {
  _e[e] = new Fe(e, 5, !1, e.toLowerCase(), null, !1, !1)
});
var Yo = /[\-:]([a-z])/g;

function Go(e) {
  return e[1].toUpperCase()
}
"accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height".split(" ").forEach(function(e) {
  var n = e.replace(Yo, Go);
  _e[n] = new Fe(n, 1, !1, e, null, !1, !1)
});
"xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type".split(" ").forEach(function(e) {
  var n = e.replace(Yo, Go);
  _e[n] = new Fe(n, 1, !1, e, "http://www.w3.org/1999/xlink", !1, !1)
});
["xml:base", "xml:lang", "xml:space"].forEach(function(e) {
  var n = e.replace(Yo, Go);
  _e[n] = new Fe(n, 1, !1, e, "http://www.w3.org/XML/1998/namespace", !1, !1)
});
["tabIndex", "crossOrigin"].forEach(function(e) {
  _e[e] = new Fe(e, 1, !1, e.toLowerCase(), null, !1, !1)
});
_e.xlinkHref = new Fe("xlinkHref", 1, !1, "xlink:href", "http://www.w3.org/1999/xlink", !0, !1);
["src", "href", "action", "formAction"].forEach(function(e) {
  _e[e] = new Fe(e, 1, !1, e.toLowerCase(), null, !0, !0)
});

function Qo(e, n, t, r) {
  var i = _e.hasOwnProperty(n) ? _e[n] : null;
  (i !== null ? i.type !== 0 : r || !(2 < n.length) || n[0] !== "o" && n[0] !== "O" || n[1] !== "n" && n[1] !== "N") && (ap(n, t, i, r) && (t = null), r || i === null ? rp(n) && (t === null ? e.removeAttribute(n) : e.setAttribute(n, "" + t)) : i.mustUseProperty ? e[i.propertyName] = t === null ? i.type === 3 ? !1 : "" : t : (n = i.attributeName, r = i.attributeNamespace, t === null ? e.removeAttribute(n) : (i = i.type, t = i === 3 || i === 4 && t === !0 ? "" : "" + t, r ? e.setAttributeNS(r, n, t) : e.setAttribute(n, t))))
}
var Tn = Gc.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,
  mi = Symbol.for("react.element"),
  bt = Symbol.for("react.portal"),
  Pt = Symbol.for("react.fragment"),
  Ko = Symbol.for("react.strict_mode"),
  Il = Symbol.for("react.profiler"),
  Kc = Symbol.for("react.provider"),
  Zc = Symbol.for("react.context"),
  Zo = Symbol.for("react.forward_ref"),
  Ml = Symbol.for("react.suspense"),
  Rl = Symbol.for("react.suspense_list"),
  Xo = Symbol.for("react.memo"),
  In = Symbol.for("react.lazy"),
  Xc = Symbol.for("react.offscreen"),
  nu = Symbol.iterator;

function sr(e) {
  return e === null || typeof e != "object" ? null : (e = nu && e[nu] || e["@@iterator"], typeof e == "function" ? e : null)
}
var he = Object.assign,
  Da;

function vr(e) {
  if (Da === void 0) try {
      throw Error()
  } catch (t) {
      var n = t.stack.trim().match(/\n( *(at )?)/);
      Da = n && n[1] || ""
  }
  return `
` + Da + e
}
var el = !1;

function nl(e, n) {
  if (!e || el) return "";
  el = !0;
  var t = Error.prepareStackTrace;
  Error.prepareStackTrace = void 0;
  try {
      if (n)
          if (n = function() {
                  throw Error()
              }, Object.defineProperty(n.prototype, "props", {
                  set: function() {
                      throw Error()
                  }
              }), typeof Reflect == "object" && Reflect.construct) {
              try {
                  Reflect.construct(n, [])
              } catch (c) {
                  var r = c
              }
              Reflect.construct(e, [], n)
          } else {
              try {
                  n.call()
              } catch (c) {
                  r = c
              }
              e.call(n.prototype)
          }
      else {
          try {
              throw Error()
          } catch (c) {
              r = c
          }
          e()
      }
  } catch (c) {
      if (c && r && typeof c.stack == "string") {
          for (var i = c.stack.split(`
`), a = r.stack.split(`
`), l = i.length - 1, s = a.length - 1; 1 <= l && 0 <= s && i[l] !== a[s];) s--;
          for (; 1 <= l && 0 <= s; l--, s--)
              if (i[l] !== a[s]) {
                  if (l !== 1 || s !== 1)
                      do
                          if (l--, s--, 0 > s || i[l] !== a[s]) {
                              var u = `
` + i[l].replace(" at new ", " at ");
                              return e.displayName && u.includes("<anonymous>") && (u = u.replace("<anonymous>", e.displayName)), u
                          } while (1 <= l && 0 <= s);
                  break
              }
      }
  } finally {
      el = !1, Error.prepareStackTrace = t
  }
  return (e = e ? e.displayName || e.name : "") ? vr(e) : ""
}

function lp(e) {
  switch (e.tag) {
      case 5:
          return vr(e.type);
      case 16:
          return vr("Lazy");
      case 13:
          return vr("Suspense");
      case 19:
          return vr("SuspenseList");
      case 0:
      case 2:
      case 15:
          return e = nl(e.type, !1), e;
      case 11:
          return e = nl(e.type.render, !1), e;
      case 1:
          return e = nl(e.type, !0), e;
      default:
          return ""
  }
}

function Fl(e) {
  if (e == null) return null;
  if (typeof e == "function") return e.displayName || e.name || null;
  if (typeof e == "string") return e;
  switch (e) {
      case Pt:
          return "Fragment";
      case bt:
          return "Portal";
      case Il:
          return "Profiler";
      case Ko:
          return "StrictMode";
      case Ml:
          return "Suspense";
      case Rl:
          return "SuspenseList"
  }
  if (typeof e == "object") switch (e.$$typeof) {
      case Zc:
          return (e.displayName || "Context") + ".Consumer";
      case Kc:
          return (e._context.displayName || "Context") + ".Provider";
      case Zo:
          var n = e.render;
          return e = e.displayName, e || (e = n.displayName || n.name || "", e = e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef"), e;
      case Xo:
          return n = e.displayName || null, n !== null ? n : Fl(e.type) || "Memo";
      case In:
          n = e._payload, e = e._init;
          try {
              return Fl(e(n))
          } catch {}
  }
  return null
}

function op(e) {
  var n = e.type;
  switch (e.tag) {
      case 24:
          return "Cache";
      case 9:
          return (n.displayName || "Context") + ".Consumer";
      case 10:
          return (n._context.displayName || "Context") + ".Provider";
      case 18:
          return "DehydratedFragment";
      case 11:
          return e = n.render, e = e.displayName || e.name || "", n.displayName || (e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef");
      case 7:
          return "Fragment";
      case 5:
          return n;
      case 4:
          return "Portal";
      case 3:
          return "Root";
      case 6:
          return "Text";
      case 16:
          return Fl(n);
      case 8:
          return n === Ko ? "StrictMode" : "Mode";
      case 22:
          return "Offscreen";
      case 12:
          return "Profiler";
      case 21:
          return "Scope";
      case 13:
          return "Suspense";
      case 19:
          return "SuspenseList";
      case 25:
          return "TracingMarker";
      case 1:
      case 0:
      case 17:
      case 2:
      case 14:
      case 15:
          if (typeof n == "function") return n.displayName || n.name || null;
          if (typeof n == "string") return n
  }
  return null
}

function Xn(e) {
  switch (typeof e) {
      case "boolean":
      case "number":
      case "string":
      case "undefined":
          return e;
      case "object":
          return e;
      default:
          return ""
  }
}

function Jc(e) {
  var n = e.type;
  return (e = e.nodeName) && e.toLowerCase() === "input" && (n === "checkbox" || n === "radio")
}

function sp(e) {
  var n = Jc(e) ? "checked" : "value",
      t = Object.getOwnPropertyDescriptor(e.constructor.prototype, n),
      r = "" + e[n];
  if (!e.hasOwnProperty(n) && typeof t < "u" && typeof t.get == "function" && typeof t.set == "function") {
      var i = t.get,
          a = t.set;
      return Object.defineProperty(e, n, {
          configurable: !0,
          get: function() {
              return i.call(this)
          },
          set: function(l) {
              r = "" + l, a.call(this, l)
          }
      }), Object.defineProperty(e, n, {
          enumerable: t.enumerable
      }), {
          getValue: function() {
              return r
          },
          setValue: function(l) {
              r = "" + l
          },
          stopTracking: function() {
              e._valueTracker = null, delete e[n]
          }
      }
  }
}

function pi(e) {
  e._valueTracker || (e._valueTracker = sp(e))
}

function qc(e) {
  if (!e) return !1;
  var n = e._valueTracker;
  if (!n) return !0;
  var t = n.getValue(),
      r = "";
  return e && (r = Jc(e) ? e.checked ? "true" : "false" : e.value), e = r, e !== t ? (n.setValue(e), !0) : !1
}

function ea(e) {
  if (e = e || (typeof document < "u" ? document : void 0), typeof e > "u") return null;
  try {
      return e.activeElement || e.body
  } catch {
      return e.body
  }
}

function Ul(e, n) {
  var t = n.checked;
  return he({}, n, {
      defaultChecked: void 0,
      defaultValue: void 0,
      value: void 0,
      checked: t != null ? t : e._wrapperState.initialChecked
  })
}

function tu(e, n) {
  var t = n.defaultValue == null ? "" : n.defaultValue,
      r = n.checked != null ? n.checked : n.defaultChecked;
  t = Xn(n.value != null ? n.value : t), e._wrapperState = {
      initialChecked: r,
      initialValue: t,
      controlled: n.type === "checkbox" || n.type === "radio" ? n.checked != null : n.value != null
  }
}

function Dc(e, n) {
  n = n.checked, n != null && Qo(e, "checked", n, !1)
}

function Bl(e, n) {
  Dc(e, n);
  var t = Xn(n.value),
      r = n.type;
  if (t != null) r === "number" ? (t === 0 && e.value === "" || e.value != t) && (e.value = "" + t) : e.value !== "" + t && (e.value = "" + t);
  else if (r === "submit" || r === "reset") {
      e.removeAttribute("value");
      return
  }
  n.hasOwnProperty("value") ? Vl(e, n.type, t) : n.hasOwnProperty("defaultValue") && Vl(e, n.type, Xn(n.defaultValue)), n.checked == null && n.defaultChecked != null && (e.defaultChecked = !!n.defaultChecked)
}

function ru(e, n, t) {
  if (n.hasOwnProperty("value") || n.hasOwnProperty("defaultValue")) {
      var r = n.type;
      if (!(r !== "submit" && r !== "reset" || n.value !== void 0 && n.value !== null)) return;
      n = "" + e._wrapperState.initialValue, t || n === e.value || (e.value = n), e.defaultValue = n
  }
  t = e.name, t !== "" && (e.name = ""), e.defaultChecked = !!e._wrapperState.initialChecked, t !== "" && (e.name = t)
}

function Vl(e, n, t) {
  (n !== "number" || ea(e.ownerDocument) !== e) && (t == null ? e.defaultValue = "" + e._wrapperState.initialValue : e.defaultValue !== "" + t && (e.defaultValue = "" + t))
}
var gr = Array.isArray;

function Vt(e, n, t, r) {
  if (e = e.options, n) {
      n = {};
      for (var i = 0; i < t.length; i++) n["$" + t[i]] = !0;
      for (t = 0; t < e.length; t++) i = n.hasOwnProperty("$" + e[t].value), e[t].selected !== i && (e[t].selected = i), i && r && (e[t].defaultSelected = !0)
  } else {
      for (t = "" + Xn(t), n = null, i = 0; i < e.length; i++) {
          if (e[i].value === t) {
              e[i].selected = !0, r && (e[i].defaultSelected = !0);
              return
          }
          n !== null || e[i].disabled || (n = e[i])
      }
      n !== null && (n.selected = !0)
  }
}

function $l(e, n) {
  if (n.dangerouslySetInnerHTML != null) throw Error(A(91));
  return he({}, n, {
      value: void 0,
      defaultValue: void 0,
      children: "" + e._wrapperState.initialValue
  })
}

function iu(e, n) {
  var t = n.value;
  if (t == null) {
      if (t = n.children, n = n.defaultValue, t != null) {
          if (n != null) throw Error(A(92));
          if (gr(t)) {
              if (1 < t.length) throw Error(A(93));
              t = t[0]
          }
          n = t
      }
      n == null && (n = ""), t = n
  }
  e._wrapperState = {
      initialValue: Xn(t)
  }
}

function ed(e, n) {
  var t = Xn(n.value),
      r = Xn(n.defaultValue);
  t != null && (t = "" + t, t !== e.value && (e.value = t), n.defaultValue == null && e.defaultValue !== t && (e.defaultValue = t)), r != null && (e.defaultValue = "" + r)
}

function au(e) {
  var n = e.textContent;
  n === e._wrapperState.initialValue && n !== "" && n !== null && (e.value = n)
}

function nd(e) {
  switch (e) {
      case "svg":
          return "http://www.w3.org/2000/svg";
      case "math":
          return "http://www.w3.org/1998/Math/MathML";
      default:
          return "http://www.w3.org/1999/xhtml"
  }
}

function Wl(e, n) {
  return e == null || e === "http://www.w3.org/1999/xhtml" ? nd(n) : e === "http://www.w3.org/2000/svg" && n === "foreignObject" ? "http://www.w3.org/1999/xhtml" : e
}
var hi, td = function(e) {
  return typeof MSApp < "u" && MSApp.execUnsafeLocalFunction ? function(n, t, r, i) {
      MSApp.execUnsafeLocalFunction(function() {
          return e(n, t, r, i)
      })
  } : e
}(function(e, n) {
  if (e.namespaceURI !== "http://www.w3.org/2000/svg" || "innerHTML" in e) e.innerHTML = n;
  else {
      for (hi = hi || document.createElement("div"), hi.innerHTML = "<svg>" + n.valueOf().toString() + "</svg>", n = hi.firstChild; e.firstChild;) e.removeChild(e.firstChild);
      for (; n.firstChild;) e.appendChild(n.firstChild)
  }
});

function Lr(e, n) {
  if (n) {
      var t = e.firstChild;
      if (t && t === e.lastChild && t.nodeType === 3) {
          t.nodeValue = n;
          return
      }
  }
  e.textContent = n
}
var xr = {
      animationIterationCount: !0,
      aspectRatio: !0,
      borderImageOutset: !0,
      borderImageSlice: !0,
      borderImageWidth: !0,
      boxFlex: !0,
      boxFlexGroup: !0,
      boxOrdinalGroup: !0,
      columnCount: !0,
      columns: !0,
      flex: !0,
      flexGrow: !0,
      flexPositive: !0,
      flexShrink: !0,
      flexNegative: !0,
      flexOrder: !0,
      gridArea: !0,
      gridRow: !0,
      gridRowEnd: !0,
      gridRowSpan: !0,
      gridRowStart: !0,
      gridColumn: !0,
      gridColumnEnd: !0,
      gridColumnSpan: !0,
      gridColumnStart: !0,
      fontWeight: !0,
      lineClamp: !0,
      lineHeight: !0,
      opacity: !0,
      order: !0,
      orphans: !0,
      tabSize: !0,
      widows: !0,
      zIndex: !0,
      zoom: !0,
      fillOpacity: !0,
      floodOpacity: !0,
      stopOpacity: !0,
      strokeDasharray: !0,
      strokeDashoffset: !0,
      strokeMiterlimit: !0,
      strokeOpacity: !0,
      strokeWidth: !0
  },
  up = ["Webkit", "ms", "Moz", "O"];
Object.keys(xr).forEach(function(e) {
  up.forEach(function(n) {
      n = n + e.charAt(0).toUpperCase() + e.substring(1), xr[n] = xr[e]
  })
});

function rd(e, n, t) {
  return n == null || typeof n == "boolean" || n === "" ? "" : t || typeof n != "number" || n === 0 || xr.hasOwnProperty(e) && xr[e] ? ("" + n).trim() : n + "px"
}

function id(e, n) {
  e = e.style;
  for (var t in n)
      if (n.hasOwnProperty(t)) {
          var r = t.indexOf("--") === 0,
              i = rd(t, n[t], r);
          t === "float" && (t = "cssFloat"), r ? e.setProperty(t, i) : e[t] = i
      }
}
var cp = he({
  menuitem: !0
}, {
  area: !0,
  base: !0,
  br: !0,
  col: !0,
  embed: !0,
  hr: !0,
  img: !0,
  input: !0,
  keygen: !0,
  link: !0,
  meta: !0,
  param: !0,
  source: !0,
  track: !0,
  wbr: !0
});

function Hl(e, n) {
  if (n) {
      if (cp[e] && (n.children != null || n.dangerouslySetInnerHTML != null)) throw Error(A(137, e));
      if (n.dangerouslySetInnerHTML != null) {
          if (n.children != null) throw Error(A(60));
          if (typeof n.dangerouslySetInnerHTML != "object" || !("__html" in n.dangerouslySetInnerHTML)) throw Error(A(61))
      }
      if (n.style != null && typeof n.style != "object") throw Error(A(62))
  }
}

function Yl(e, n) {
  if (e.indexOf("-") === -1) return typeof n.is == "string";
  switch (e) {
      case "annotation-xml":
      case "color-profile":
      case "font-face":
      case "font-face-src":
      case "font-face-uri":
      case "font-face-format":
      case "font-face-name":
      case "missing-glyph":
          return !1;
      default:
          return !0
  }
}
var Gl = null;

function Jo(e) {
  return e = e.target || e.srcElement || window, e.correspondingUseElement && (e = e.correspondingUseElement), e.nodeType === 3 ? e.parentNode : e
}
var Ql = null,
  $t = null,
  Wt = null;

function lu(e) {
  if (e = ri(e)) {
      if (typeof Ql != "function") throw Error(A(280));
      var n = e.stateNode;
      n && (n = ja(n), Ql(e.stateNode, e.type, n))
  }
}

function ad(e) {
  $t ? Wt ? Wt.push(e) : Wt = [e] : $t = e
}

function ld() {
  if ($t) {
      var e = $t,
          n = Wt;
      if (Wt = $t = null, lu(e), n)
          for (e = 0; e < n.length; e++) lu(n[e])
  }
}

function od(e, n) {
  return e(n)
}

function sd() {}
var tl = !1;

function ud(e, n, t) {
  if (tl) return e(n, t);
  tl = !0;
  try {
      return od(e, n, t)
  } finally {
      tl = !1, ($t !== null || Wt !== null) && (sd(), ld())
  }
}

function jr(e, n) {
  var t = e.stateNode;
  if (t === null) return null;
  var r = ja(t);
  if (r === null) return null;
  t = r[n];
  e: switch (n) {
      case "onClick":
      case "onClickCapture":
      case "onDoubleClick":
      case "onDoubleClickCapture":
      case "onMouseDown":
      case "onMouseDownCapture":
      case "onMouseMove":
      case "onMouseMoveCapture":
      case "onMouseUp":
      case "onMouseUpCapture":
      case "onMouseEnter":
          (r = !r.disabled) || (e = e.type, r = !(e === "button" || e === "input" || e === "select" || e === "textarea")), e = !r;
          break e;
      default:
          e = !1
  }
  if (e) return null;
  if (t && typeof t != "function") throw Error(A(231, n, typeof t));
  return t
}
var Kl = !1;
if (En) try {
  var ur = {};
  Object.defineProperty(ur, "passive", {
      get: function() {
          Kl = !0
      }
  }), window.addEventListener("test", ur, ur), window.removeEventListener("test", ur, ur)
} catch {
  Kl = !1
}

function dp(e, n, t, r, i, a, l, s, u) {
  var c = Array.prototype.slice.call(arguments, 3);
  try {
      n.apply(t, c)
  } catch (h) {
      this.onError(h)
  }
}
var Nr = !1,
  na = null,
  ta = !1,
  Zl = null,
  fp = {
      onError: function(e) {
          Nr = !0, na = e
      }
  };

function mp(e, n, t, r, i, a, l, s, u) {
  Nr = !1, na = null, dp.apply(fp, arguments)
}

function pp(e, n, t, r, i, a, l, s, u) {
  if (mp.apply(this, arguments), Nr) {
      if (Nr) {
          var c = na;
          Nr = !1, na = null
      } else throw Error(A(198));
      ta || (ta = !0, Zl = c)
  }
}

function Nt(e) {
  var n = e,
      t = e;
  if (e.alternate)
      for (; n.return;) n = n.return;
  else {
      e = n;
      do n = e, (n.flags & 4098) !== 0 && (t = n.return), e = n.return; while (e)
  }
  return n.tag === 3 ? t : null
}

function cd(e) {
  if (e.tag === 13) {
      var n = e.memoizedState;
      if (n === null && (e = e.alternate, e !== null && (n = e.memoizedState)), n !== null) return n.dehydrated
  }
  return null
}

function ou(e) {
  if (Nt(e) !== e) throw Error(A(188))
}

function hp(e) {
  var n = e.alternate;
  if (!n) {
      if (n = Nt(e), n === null) throw Error(A(188));
      return n !== e ? null : e
  }
  for (var t = e, r = n;;) {
      var i = t.return;
      if (i === null) break;
      var a = i.alternate;
      if (a === null) {
          if (r = i.return, r !== null) {
              t = r;
              continue
          }
          break
      }
      if (i.child === a.child) {
          for (a = i.child; a;) {
              if (a === t) return ou(i), e;
              if (a === r) return ou(i), n;
              a = a.sibling
          }
          throw Error(A(188))
      }
      if (t.return !== r.return) t = i, r = a;
      else {
          for (var l = !1, s = i.child; s;) {
              if (s === t) {
                  l = !0, t = i, r = a;
                  break
              }
              if (s === r) {
                  l = !0, r = i, t = a;
                  break
              }
              s = s.sibling
          }
          if (!l) {
              for (s = a.child; s;) {
                  if (s === t) {
                      l = !0, t = a, r = i;
                      break
                  }
                  if (s === r) {
                      l = !0, r = a, t = i;
                      break
                  }
                  s = s.sibling
              }
              if (!l) throw Error(A(189))
          }
      }
      if (t.alternate !== r) throw Error(A(190))
  }
  if (t.tag !== 3) throw Error(A(188));
  return t.stateNode.current === t ? e : n
}

function dd(e) {
  return e = hp(e), e !== null ? fd(e) : null
}

function fd(e) {
  if (e.tag === 5 || e.tag === 6) return e;
  for (e = e.child; e !== null;) {
      var n = fd(e);
      if (n !== null) return n;
      e = e.sibling
  }
  return null
}
var md = Qe.unstable_scheduleCallback,
  su = Qe.unstable_cancelCallback,
  vp = Qe.unstable_shouldYield,
  gp = Qe.unstable_requestPaint,
  ye = Qe.unstable_now,
  yp = Qe.unstable_getCurrentPriorityLevel,
  qo = Qe.unstable_ImmediatePriority,
  pd = Qe.unstable_UserBlockingPriority,
  ra = Qe.unstable_NormalPriority,
  wp = Qe.unstable_LowPriority,
  hd = Qe.unstable_IdlePriority,
  Oa = null,
  gn = null;

function kp(e) {
  if (gn && typeof gn.onCommitFiberRoot == "function") try {
      gn.onCommitFiberRoot(Oa, e, void 0, (e.current.flags & 128) === 128)
  } catch {}
}
var cn = Math.clz32 ? Math.clz32 : Sp,
  xp = Math.log,
  Np = Math.LN2;

function Sp(e) {
  return e >>>= 0, e === 0 ? 32 : 31 - (xp(e) / Np | 0) | 0
}
var vi = 64,
  gi = 4194304;

function yr(e) {
  switch (e & -e) {
      case 1:
          return 1;
      case 2:
          return 2;
      case 4:
          return 4;
      case 8:
          return 8;
      case 16:
          return 16;
      case 32:
          return 32;
      case 64:
      case 128:
      case 256:
      case 512:
      case 1024:
      case 2048:
      case 4096:
      case 8192:
      case 16384:
      case 32768:
      case 65536:
      case 131072:
      case 262144:
      case 524288:
      case 1048576:
      case 2097152:
          return e & 4194240;
      case 4194304:
      case 8388608:
      case 16777216:
      case 33554432:
      case 67108864:
          return e & 130023424;
      case 134217728:
          return 134217728;
      case 268435456:
          return 268435456;
      case 536870912:
          return 536870912;
      case 1073741824:
          return 1073741824;
      default:
          return e
  }
}

function ia(e, n) {
  var t = e.pendingLanes;
  if (t === 0) return 0;
  var r = 0,
      i = e.suspendedLanes,
      a = e.pingedLanes,
      l = t & 268435455;
  if (l !== 0) {
      var s = l & ~i;
      s !== 0 ? r = yr(s) : (a &= l, a !== 0 && (r = yr(a)))
  } else l = t & ~i, l !== 0 ? r = yr(l) : a !== 0 && (r = yr(a));
  if (r === 0) return 0;
  if (n !== 0 && n !== r && (n & i) === 0 && (i = r & -r, a = n & -n, i >= a || i === 16 && (a & 4194240) !== 0)) return n;
  if ((r & 4) !== 0 && (r |= t & 16), n = e.entangledLanes, n !== 0)
      for (e = e.entanglements, n &= r; 0 < n;) t = 31 - cn(n), i = 1 << t, r |= e[t], n &= ~i;
  return r
}

function Ep(e, n) {
  switch (e) {
      case 1:
      case 2:
      case 4:
          return n + 250;
      case 8:
      case 16:
      case 32:
      case 64:
      case 128:
      case 256:
      case 512:
      case 1024:
      case 2048:
      case 4096:
      case 8192:
      case 16384:
      case 32768:
      case 65536:
      case 131072:
      case 262144:
      case 524288:
      case 1048576:
      case 2097152:
          return n + 5e3;
      case 4194304:
      case 8388608:
      case 16777216:
      case 33554432:
      case 67108864:
          return -1;
      case 134217728:
      case 268435456:
      case 536870912:
      case 1073741824:
          return -1;
      default:
          return -1
  }
}

function Cp(e, n) {
  for (var t = e.suspendedLanes, r = e.pingedLanes, i = e.expirationTimes, a = e.pendingLanes; 0 < a;) {
      var l = 31 - cn(a),
          s = 1 << l,
          u = i[l];
      u === -1 ? ((s & t) === 0 || (s & r) !== 0) && (i[l] = Ep(s, n)) : u <= n && (e.expiredLanes |= s), a &= ~s
  }
}

function Xl(e) {
  return e = e.pendingLanes & -1073741825, e !== 0 ? e : e & 1073741824 ? 1073741824 : 0
}

function vd() {
  var e = vi;
  return vi <<= 1, (vi & 4194240) === 0 && (vi = 64), e
}

function rl(e) {
  for (var n = [], t = 0; 31 > t; t++) n.push(e);
  return n
}

function ni(e, n, t) {
  e.pendingLanes |= n, n !== 536870912 && (e.suspendedLanes = 0, e.pingedLanes = 0), e = e.eventTimes, n = 31 - cn(n), e[n] = t
}

function bp(e, n) {
  var t = e.pendingLanes & ~n;
  e.pendingLanes = n, e.suspendedLanes = 0, e.pingedLanes = 0, e.expiredLanes &= n, e.mutableReadLanes &= n, e.entangledLanes &= n, n = e.entanglements;
  var r = e.eventTimes;
  for (e = e.expirationTimes; 0 < t;) {
      var i = 31 - cn(t),
          a = 1 << i;
      n[i] = 0, r[i] = -1, e[i] = -1, t &= ~a
  }
}

function Do(e, n) {
  var t = e.entangledLanes |= n;
  for (e = e.entanglements; t;) {
      var r = 31 - cn(t),
          i = 1 << r;
      i & n | e[r] & n && (e[r] |= n), t &= ~i
  }
}
var re = 0;

function gd(e) {
  return e &= -e, 1 < e ? 4 < e ? (e & 268435455) !== 0 ? 16 : 536870912 : 4 : 1
}
var yd, es, wd, kd, xd, Jl = !1,
  yi = [],
  $n = null,
  Wn = null,
  Hn = null,
  Ir = new Map,
  Mr = new Map,
  Rn = [],
  Pp = "mousedown mouseup touchcancel touchend touchstart auxclick goatclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(" ");

function uu(e, n) {
  switch (e) {
      case "focusin":
      case "focusout":
          $n = null;
          break;
      case "dragenter":
      case "dragleave":
          Wn = null;
          break;
      case "mouseover":
      case "mouseout":
          Hn = null;
          break;
      case "pointerover":
      case "pointerout":
          Ir.delete(n.pointerId);
          break;
      case "gotpointercapture":
      case "lostpointercapture":
          Mr.delete(n.pointerId)
  }
}

function cr(e, n, t, r, i, a) {
  return e === null || e.nativeEvent !== a ? (e = {
      blockedOn: n,
      domEventName: t,
      eventSystemFlags: r,
      nativeEvent: a,
      targetContainers: [i]
  }, n !== null && (n = ri(n), n !== null && es(n)), e) : (e.eventSystemFlags |= r, n = e.targetContainers, i !== null && n.indexOf(i) === -1 && n.push(i), e)
}

function zp(e, n, t, r, i) {
  switch (n) {
      case "focusin":
          return $n = cr($n, e, n, t, r, i), !0;
      case "dragenter":
          return Wn = cr(Wn, e, n, t, r, i), !0;
      case "mouseover":
          return Hn = cr(Hn, e, n, t, r, i), !0;
      case "pointerover":
          var a = i.pointerId;
          return Ir.set(a, cr(Ir.get(a) || null, e, n, t, r, i)), !0;
      case "gotpointercapture":
          return a = i.pointerId, Mr.set(a, cr(Mr.get(a) || null, e, n, t, r, i)), !0
  }
  return !1
}

function Nd(e) {
  var n = ot(e.target);
  if (n !== null) {
      var t = Nt(n);
      if (t !== null) {
          if (n = t.tag, n === 13) {
              if (n = cd(t), n !== null) {
                  e.blockedOn = n, xd(e.priority, function() {
                      wd(t)
                  });
                  return
              }
          } else if (n === 3 && t.stateNode.current.memoizedState.isDehydrated) {
              e.blockedOn = t.tag === 3 ? t.stateNode.containerInfo : null;
              return
          }
      }
  }
  e.blockedOn = null
}

function $i(e) {
  if (e.blockedOn !== null) return !1;
  for (var n = e.targetContainers; 0 < n.length;) {
      var t = ql(e.domEventName, e.eventSystemFlags, n[0], e.nativeEvent);
      if (t === null) {
          t = e.nativeEvent;
          var r = new t.constructor(t.type, t);
          Gl = r, t.target.dispatchEvent(r), Gl = null
      } else return n = ri(t), n !== null && es(n), e.blockedOn = t, !1;
      n.shift()
  }
  return !0
}

function cu(e, n, t) {
  $i(e) && t.delete(n)
}

function _p() {
  Jl = !1, $n !== null && $i($n) && ($n = null), Wn !== null && $i(Wn) && (Wn = null), Hn !== null && $i(Hn) && (Hn = null), Ir.forEach(cu), Mr.forEach(cu)
}

function dr(e, n) {
  e.blockedOn === n && (e.blockedOn = null, Jl || (Jl = !0, Qe.unstable_scheduleCallback(Qe.unstable_NormalPriority, _p)))
}

function Rr(e) {
  function n(i) {
      return dr(i, e)
  }
  if (0 < yi.length) {
      dr(yi[0], e);
      for (var t = 1; t < yi.length; t++) {
          var r = yi[t];
          r.blockedOn === e && (r.blockedOn = null)
      }
  }
  for ($n !== null && dr($n, e), Wn !== null && dr(Wn, e), Hn !== null && dr(Hn, e), Ir.forEach(n), Mr.forEach(n), t = 0; t < Rn.length; t++) r = Rn[t], r.blockedOn === e && (r.blockedOn = null);
  for (; 0 < Rn.length && (t = Rn[0], t.blockedOn === null);) Nd(t), t.blockedOn === null && Rn.shift()
}
var Ht = Tn.ReactCurrentBatchConfig,
  aa = !0;

function Op(e, n, t, r) {
  var i = re,
      a = Ht.transition;
  Ht.transition = null;
  try {
      re = 1, ns(e, n, t, r)
  } finally {
      re = i, Ht.transition = a
  }
}

function Tp(e, n, t, r) {
  var i = re,
      a = Ht.transition;
  Ht.transition = null;
  try {
      re = 4, ns(e, n, t, r)
  } finally {
      re = i, Ht.transition = a
  }
}

function ns(e, n, t, r) {
  if (aa) {
      var i = ql(e, n, t, r);
      if (i === null) ml(e, n, r, la, t), uu(e, r);
      else if (zp(i, e, n, t, r)) r.stopPropagation();
      else if (uu(e, r), n & 4 && -1 < Pp.indexOf(e)) {
          for (; i !== null;) {
              var a = ri(i);
              if (a !== null && yd(a), a = ql(e, n, t, r), a === null && ml(e, n, r, la, t), a === i) break;
              i = a
          }
          i !== null && r.stopPropagation()
      } else ml(e, n, r, null, t)
  }
}
var la = null;

function ql(e, n, t, r) {
  if (la = null, e = Jo(r), e = ot(e), e !== null)
      if (n = Nt(e), n === null) e = null;
      else if (t = n.tag, t === 13) {
      if (e = cd(n), e !== null) return e;
      e = null
  } else if (t === 3) {
      if (n.stateNode.current.memoizedState.isDehydrated) return n.tag === 3 ? n.stateNode.containerInfo : null;
      e = null
  } else n !== e && (e = null);
  return la = e, null
}

function Sd(e) {
  switch (e) {
      case "cancel":
      case "click":
      case "close":
      case "contextmenu":
      case "copy":
      case "cut":
      case "auxclick":
      case "goatclick":
      case "dragend":
      case "dragstart":
      case "drop":
      case "focusin":
      case "focusout":
      case "input":
      case "invalid":
      case "keydown":
      case "keypress":
      case "keyup":
      case "mousedown":
      case "mouseup":
      case "paste":
      case "pause":
      case "play":
      case "pointercancel":
      case "pointerdown":
      case "pointerup":
      case "ratechange":
      case "reset":
      case "resize":
      case "seeked":
      case "submit":
      case "touchcancel":
      case "touchend":
      case "touchstart":
      case "volumechange":
      case "change":
      case "selectionchange":
      case "textInput":
      case "compositionstart":
      case "compositionend":
      case "compositionupdate":
      case "beforeblur":
      case "afterblur":
      case "beforeinput":
      case "blur":
      case "fullscreenchange":
      case "focus":
      case "hashchange":
      case "popstate":
      case "select":
      case "selectstart":
          return 1;
      case "drag":
      case "dragenter":
      case "dragexit":
      case "dragleave":
      case "dragover":
      case "mousemove":
      case "mouseout":
      case "mouseover":
      case "pointermove":
      case "pointerout":
      case "pointerover":
      case "scroll":
      case "toggle":
      case "touchmove":
      case "wheel":
      case "mouseenter":
      case "mouseleave":
      case "pointerenter":
      case "pointerleave":
          return 4;
      case "message":
          switch (yp()) {
              case qo:
                  return 1;
              case pd:
                  return 4;
              case ra:
              case wp:
                  return 16;
              case hd:
                  return 536870912;
              default:
                  return 16
          }
          default:
              return 16
  }
}
var Un = null,
  ts = null,
  Wi = null;

function Ed() {
  if (Wi) return Wi;
  var e, n = ts,
      t = n.length,
      r, i = "value" in Un ? Un.value : Un.textContent,
      a = i.length;
  for (e = 0; e < t && n[e] === i[e]; e++);
  var l = t - e;
  for (r = 1; r <= l && n[t - r] === i[a - r]; r++);
  return Wi = i.slice(e, 1 < r ? 1 - r : void 0)
}

function Hi(e) {
  var n = e.keyCode;
  return "charCode" in e ? (e = e.charCode, e === 0 && n === 13 && (e = 13)) : e = n, e === 10 && (e = 13), 32 <= e || e === 13 ? e : 0
}

function wi() {
  return !0
}

function du() {
  return !1
}

function Ze(e) {
  function n(t, r, i, a, l) {
      this._reactName = t, this._targetInst = i, this.type = r, this.nativeEvent = a, this.target = l, this.currentTarget = null;
      for (var s in e) e.hasOwnProperty(s) && (t = e[s], this[s] = t ? t(a) : a[s]);
      return this.isDefaultPrevented = (a.defaultPrevented != null ? a.defaultPrevented : a.returnValue === !1) ? wi : du, this.isPropagationStopped = du, this
  }
  return he(n.prototype, {
      preventDefault: function() {
          this.defaultPrevented = !0;
          var t = this.nativeEvent;
          t && (t.preventDefault ? t.preventDefault() : typeof t.returnValue != "unknown" && (t.returnValue = !1), this.isDefaultPrevented = wi)
      },
      stopPropagation: function() {
          var t = this.nativeEvent;
          t && (t.stopPropagation ? t.stopPropagation() : typeof t.cancelBubble != "unknown" && (t.cancelBubble = !0), this.isPropagationStopped = wi)
      },
      persist: function() {},
      isPersistent: wi
  }), n
}
var ir = {
      eventPhase: 0,
      bubbles: 0,
      cancelable: 0,
      timeStamp: function(e) {
          return e.timeStamp || Date.now()
      },
      defaultPrevented: 0,
      isTrusted: 0
  },
  rs = Ze(ir),
  ti = he({}, ir, {
      view: 0,
      detail: 0
  }),
  Ap = Ze(ti),
  il, al, fr, Ta = he({}, ti, {
      screenX: 0,
      screenY: 0,
      clientX: 0,
      clientY: 0,
      pageX: 0,
      pageY: 0,
      ctrlKey: 0,
      shiftKey: 0,
      altKey: 0,
      metaKey: 0,
      getModifierState: is,
      button: 0,
      buttons: 0,
      relatedTarget: function(e) {
          return e.relatedTarget === void 0 ? e.fromElement === e.srcElement ? e.toElement : e.fromElement : e.relatedTarget
      },
      movementX: function(e) {
          return "movementX" in e ? e.movementX : (e !== fr && (fr && e.type === "mousemove" ? (il = e.screenX - fr.screenX, al = e.screenY - fr.screenY) : al = il = 0, fr = e), il)
      },
      movementY: function(e) {
          return "movementY" in e ? e.movementY : al
      }
  }),
  fu = Ze(Ta),
  Lp = he({}, Ta, {
      dataTransfer: 0
  }),
  jp = Ze(Lp),
  Ip = he({}, ti, {
      relatedTarget: 0
  }),
  ll = Ze(Ip),
  Mp = he({}, ir, {
      animationName: 0,
      elapsedTime: 0,
      pseudoElement: 0
  }),
  Rp = Ze(Mp),
  Fp = he({}, ir, {
      clipboardData: function(e) {
          return "clipboardData" in e ? e.clipboardData : window.clipboardData
      }
  }),
  Up = Ze(Fp),
  Bp = he({}, ir, {
      data: 0
  }),
  mu = Ze(Bp),
  Vp = {
      Esc: "Escape",
      Spacebar: " ",
      Left: "ArrowLeft",
      Up: "ArrowUp",
      Right: "ArrowRight",
      Down: "ArrowDown",
      Del: "Delete",
      Win: "OS",
      Menu: "ContextMenu",
      Apps: "ContextMenu",
      Scroll: "ScrollLock",
      MozPrintableKey: "Unidentified"
  },
  $p = {
      8: "Backspace",
      9: "Tab",
      12: "Clear",
      13: "Enter",
      16: "Shift",
      17: "Control",
      18: "Alt",
      19: "Pause",
      20: "CapsLock",
      27: "Escape",
      32: " ",
      33: "PageUp",
      34: "PageDown",
      35: "End",
      36: "Home",
      37: "ArrowLeft",
      38: "ArrowUp",
      39: "ArrowRight",
      40: "ArrowDown",
      45: "Insert",
      46: "Delete",
      112: "F1",
      113: "F2",
      114: "F3",
      115: "F4",
      116: "F5",
      117: "F6",
      118: "F7",
      119: "F8",
      120: "F9",
      121: "F10",
      122: "F11",
      123: "F12",
      144: "NumLock",
      145: "ScrollLock",
      224: "Meta"
  },
  Wp = {
      Alt: "altKey",
      Control: "ctrlKey",
      Meta: "metaKey",
      Shift: "shiftKey"
  };

function Hp(e) {
  var n = this.nativeEvent;
  return n.getModifierState ? n.getModifierState(e) : (e = Wp[e]) ? !!n[e] : !1
}

function is() {
  return Hp
}
var Yp = he({}, ti, {
      key: function(e) {
          if (e.key) {
              var n = Vp[e.key] || e.key;
              if (n !== "Unidentified") return n
          }
          return e.type === "keypress" ? (e = Hi(e), e === 13 ? "Enter" : String.fromCharCode(e)) : e.type === "keydown" || e.type === "keyup" ? $p[e.keyCode] || "Unidentified" : ""
      },
      code: 0,
      location: 0,
      ctrlKey: 0,
      shiftKey: 0,
      altKey: 0,
      metaKey: 0,
      repeat: 0,
      locale: 0,
      getModifierState: is,
      charCode: function(e) {
          return e.type === "keypress" ? Hi(e) : 0
      },
      keyCode: function(e) {
          return e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0
      },
      which: function(e) {
          return e.type === "keypress" ? Hi(e) : e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0
      }
  }),
  Gp = Ze(Yp),
  Qp = he({}, Ta, {
      pointerId: 0,
      width: 0,
      height: 0,
      pressure: 0,
      tangentialPressure: 0,
      tiltX: 0,
      tiltY: 0,
      twist: 0,
      pointerType: 0,
      isPrimary: 0
  }),
  pu = Ze(Qp),
  Kp = he({}, ti, {
      touches: 0,
      targetTouches: 0,
      changedTouches: 0,
      altKey: 0,
      metaKey: 0,
      ctrlKey: 0,
      shiftKey: 0,
      getModifierState: is
  }),
  Zp = Ze(Kp),
  Xp = he({}, ir, {
      propertyName: 0,
      elapsedTime: 0,
      pseudoElement: 0
  }),
  Jp = Ze(Xp),
  qp = he({}, Ta, {
      deltaX: function(e) {
          return "deltaX" in e ? e.deltaX : "wheelDeltaX" in e ? -e.wheelDeltaX : 0
      },
      deltaY: function(e) {
          return "deltaY" in e ? e.deltaY : "wheelDeltaY" in e ? -e.wheelDeltaY : "wheelDelta" in e ? -e.wheelDelta : 0
      },
      deltaZ: 0,
      deltaMode: 0
  }),
  Dp = Ze(qp),
  eh = [9, 13, 27, 32],
  as = En && "CompositionEvent" in window,
  Sr = null;
En && "documentMode" in document && (Sr = document.documentMode);
var nh = En && "TextEvent" in window && !Sr,
  Cd = En && (!as || Sr && 8 < Sr && 11 >= Sr),
  hu = String.fromCharCode(32),
  vu = !1;

function bd(e, n) {
  switch (e) {
      case "keyup":
          return eh.indexOf(n.keyCode) !== -1;
      case "keydown":
          return n.keyCode !== 229;
      case "keypress":
      case "mousedown":
      case "focusout":
          return !0;
      default:
          return !1
  }
}

function Pd(e) {
  return e = e.detail, typeof e == "object" && "data" in e ? e.data : null
}
var zt = !1;

function th(e, n) {
  switch (e) {
      case "compositionend":
          return Pd(n);
      case "keypress":
          return n.which !== 32 ? null : (vu = !0, hu);
      case "textInput":
          return e = n.data, e === hu && vu ? null : e;
      default:
          return null
  }
}

function rh(e, n) {
  if (zt) return e === "compositionend" || !as && bd(e, n) ? (e = Ed(), Wi = ts = Un = null, zt = !1, e) : null;
  switch (e) {
      case "paste":
          return null;
      case "keypress":
          if (!(n.ctrlKey || n.altKey || n.metaKey) || n.ctrlKey && n.altKey) {
              if (n.char && 1 < n.char.length) return n.char;
              if (n.which) return String.fromCharCode(n.which)
          }
          return null;
      case "compositionend":
          return Cd && n.locale !== "ko" ? null : n.data;
      default:
          return null
  }
}
var ih = {
  color: !0,
  date: !0,
  datetime: !0,
  "datetime-local": !0,
  email: !0,
  month: !0,
  number: !0,
  password: !0,
  range: !0,
  search: !0,
  tel: !0,
  text: !0,
  time: !0,
  url: !0,
  week: !0
};

function gu(e) {
  var n = e && e.nodeName && e.nodeName.toLowerCase();
  return n === "input" ? !!ih[e.type] : n === "textarea"
}

function zd(e, n, t, r) {
  ad(r), n = oa(n, "onChange"), 0 < n.length && (t = new rs("onChange", "change", null, t, r), e.push({
      event: t,
      listeners: n
  }))
}
var Er = null,
  Fr = null;

function ah(e) {
  Ud(e, 0)
}

function Aa(e) {
  var n = Tt(e);
  if (qc(n)) return e
}

function lh(e, n) {
  if (e === "change") return n
}
var _d = !1;
if (En) {
  var ol;
  if (En) {
      var sl = "oninput" in document;
      if (!sl) {
          var yu = document.createElement("div");
          yu.setAttribute("oninput", "return;"), sl = typeof yu.oninput == "function"
      }
      ol = sl
  } else ol = !1;
  _d = ol && (!document.documentMode || 9 < document.documentMode)
}

function wu() {
  Er && (Er.detachEvent("onpropertychange", Od), Fr = Er = null)
}

function Od(e) {
  if (e.propertyName === "value" && Aa(Fr)) {
      var n = [];
      zd(n, Fr, e, Jo(e)), ud(ah, n)
  }
}

function oh(e, n, t) {
  e === "focusin" ? (wu(), Er = n, Fr = t, Er.attachEvent("onpropertychange", Od)) : e === "focusout" && wu()
}

function sh(e) {
  if (e === "selectionchange" || e === "keyup" || e === "keydown") return Aa(Fr)
}

function uh(e, n) {
  if (e === "click") return Aa(n)
}

function ch(e, n) {
  if (e === "input" || e === "change") return Aa(n)
}

function dh(e, n) {
  return e === n && (e !== 0 || 1 / e === 1 / n) || e !== e && n !== n
}
var fn = typeof Object.is == "function" ? Object.is : dh;

function Ur(e, n) {
  if (fn(e, n)) return !0;
  if (typeof e != "object" || e === null || typeof n != "object" || n === null) return !1;
  var t = Object.keys(e),
      r = Object.keys(n);
  if (t.length !== r.length) return !1;
  for (r = 0; r < t.length; r++) {
      var i = t[r];
      if (!jl.call(n, i) || !fn(e[i], n[i])) return !1
  }
  return !0
}

function ku(e) {
  for (; e && e.firstChild;) e = e.firstChild;
  return e
}

function xu(e, n) {
  var t = ku(e);
  e = 0;
  for (var r; t;) {
      if (t.nodeType === 3) {
          if (r = e + t.textContent.length, e <= n && r >= n) return {
              node: t,
              offset: n - e
          };
          e = r
      }
      e: {
          for (; t;) {
              if (t.nextSibling) {
                  t = t.nextSibling;
                  break e
              }
              t = t.parentNode
          }
          t = void 0
      }
      t = ku(t)
  }
}

function Td(e, n) {
  return e && n ? e === n ? !0 : e && e.nodeType === 3 ? !1 : n && n.nodeType === 3 ? Td(e, n.parentNode) : "contains" in e ? e.contains(n) : e.compareDocumentPosition ? !!(e.compareDocumentPosition(n) & 16) : !1 : !1
}

function Ad() {
  for (var e = window, n = ea(); n instanceof e.HTMLIFrameElement;) {
      try {
          var t = typeof n.contentWindow.location.href == "string"
      } catch {
          t = !1
      }
      if (t) e = n.contentWindow;
      else break;
      n = ea(e.document)
  }
  return n
}

function ls(e) {
  var n = e && e.nodeName && e.nodeName.toLowerCase();
  return n && (n === "input" && (e.type === "text" || e.type === "search" || e.type === "tel" || e.type === "url" || e.type === "password") || n === "textarea" || e.contentEditable === "true")
}

function fh(e) {
  var n = Ad(),
      t = e.focusedElem,
      r = e.selectionRange;
  if (n !== t && t && t.ownerDocument && Td(t.ownerDocument.documentElement, t)) {
      if (r !== null && ls(t)) {
          if (n = r.start, e = r.end, e === void 0 && (e = n), "selectionStart" in t) t.selectionStart = n, t.selectionEnd = Math.min(e, t.value.length);
          else if (e = (n = t.ownerDocument || document) && n.defaultView || window, e.getSelection) {
              e = e.getSelection();
              var i = t.textContent.length,
                  a = Math.min(r.start, i);
              r = r.end === void 0 ? a : Math.min(r.end, i), !e.extend && a > r && (i = r, r = a, a = i), i = xu(t, a);
              var l = xu(t, r);
              i && l && (e.rangeCount !== 1 || e.anchorNode !== i.node || e.anchorOffset !== i.offset || e.focusNode !== l.node || e.focusOffset !== l.offset) && (n = n.createRange(), n.setStart(i.node, i.offset), e.removeAllRanges(), a > r ? (e.addRange(n), e.extend(l.node, l.offset)) : (n.setEnd(l.node, l.offset), e.addRange(n)))
          }
      }
      for (n = [], e = t; e = e.parentNode;) e.nodeType === 1 && n.push({
          element: e,
          left: e.scrollLeft,
          top: e.scrollTop
      });
      for (typeof t.focus == "function" && t.focus(), t = 0; t < n.length; t++) e = n[t], e.element.scrollLeft = e.left, e.element.scrollTop = e.top
  }
}
var mh = En && "documentMode" in document && 11 >= document.documentMode,
  _t = null,
  Dl = null,
  Cr = null,
  eo = !1;

function Nu(e, n, t) {
  var r = t.window === t ? t.document : t.nodeType === 9 ? t : t.ownerDocument;
  eo || _t == null || _t !== ea(r) || (r = _t, "selectionStart" in r && ls(r) ? r = {
      start: r.selectionStart,
      end: r.selectionEnd
  } : (r = (r.ownerDocument && r.ownerDocument.defaultView || window).getSelection(), r = {
      anchorNode: r.anchorNode,
      anchorOffset: r.anchorOffset,
      focusNode: r.focusNode,
      focusOffset: r.focusOffset
  }), Cr && Ur(Cr, r) || (Cr = r, r = oa(Dl, "onSelect"), 0 < r.length && (n = new rs("onSelect", "select", null, n, t), e.push({
      event: n,
      listeners: r
  }), n.target = _t)))
}

function ki(e, n) {
  var t = {};
  return t[e.toLowerCase()] = n.toLowerCase(), t["Webkit" + e] = "webkit" + n, t["Moz" + e] = "moz" + n, t
}
var Ot = {
      animationend: ki("Animation", "AnimationEnd"),
      animationiteration: ki("Animation", "AnimationIteration"),
      animationstart: ki("Animation", "AnimationStart"),
      transitionend: ki("Transition", "TransitionEnd")
  },
  ul = {},
  Ld = {};
En && (Ld = document.createElement("div").style, "AnimationEvent" in window || (delete Ot.animationend.animation, delete Ot.animationiteration.animation, delete Ot.animationstart.animation), "TransitionEvent" in window || delete Ot.transitionend.transition);

function La(e) {
  if (ul[e]) return ul[e];
  if (!Ot[e]) return e;
  var n = Ot[e],
      t;
  for (t in n)
      if (n.hasOwnProperty(t) && t in Ld) return ul[e] = n[t];
  return e
}
var jd = La("animationend"),
  Id = La("animationiteration"),
  Md = La("animationstart"),
  Rd = La("transitionend"),
  Fd = new Map,
  Su = "abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");

function nt(e, n) {
  Fd.set(e, n), xt(n, [e])
}
for (var cl = 0; cl < Su.length; cl++) {
  var dl = Su[cl],
      ph = dl.toLowerCase(),
      hh = dl[0].toUpperCase() + dl.slice(1);
  nt(ph, "on" + hh)
}
nt(jd, "onAnimationEnd");
nt(Id, "onAnimationIteration");
nt(Md, "onAnimationStart");
nt("goatclick", "onDoubleClick");
nt("focusin", "onFocus");
nt("focusout", "onBlur");
nt(Rd, "onTransitionEnd");
Kt("onMouseEnter", ["mouseout", "mouseover"]);
Kt("onMouseLeave", ["mouseout", "mouseover"]);
Kt("onPointerEnter", ["pointerout", "pointerover"]);
Kt("onPointerLeave", ["pointerout", "pointerover"]);
xt("onChange", "change click focusin focusout input keydown keyup selectionchange".split(" "));
xt("onSelect", "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" "));
xt("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]);
xt("onCompositionEnd", "compositionend focusout keydown keypress keyup mousedown".split(" "));
xt("onCompositionStart", "compositionstart focusout keydown keypress keyup mousedown".split(" "));
xt("onCompositionUpdate", "compositionupdate focusout keydown keypress keyup mousedown".split(" "));
var wr = "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),
  vh = new Set("cancel close invalid load scroll toggle".split(" ").concat(wr));

function Eu(e, n, t) {
  var r = e.type || "unknown-event";
  e.currentTarget = t, pp(r, n, void 0, e), e.currentTarget = null
}

function Ud(e, n) {
  n = (n & 4) !== 0;
  for (var t = 0; t < e.length; t++) {
      var r = e[t],
          i = r.event;
      r = r.listeners;
      e: {
          var a = void 0;
          if (n)
              for (var l = r.length - 1; 0 <= l; l--) {
                  var s = r[l],
                      u = s.instance,
                      c = s.currentTarget;
                  if (s = s.listener, u !== a && i.isPropagationStopped()) break e;
                  Eu(i, s, c), a = u
              } else
                  for (l = 0; l < r.length; l++) {
                      if (s = r[l], u = s.instance, c = s.currentTarget, s = s.listener, u !== a && i.isPropagationStopped()) break e;
                      Eu(i, s, c), a = u
                  }
      }
  }
  if (ta) throw e = Zl, ta = !1, Zl = null, e
}

function le(e, n) {
  var t = n[ao];
  t === void 0 && (t = n[ao] = new Set);
  var r = e + "__bubble";
  t.has(r) || (Bd(n, e, 2, !1), t.add(r))
}

function fl(e, n, t) {
  var r = 0;
  n && (r |= 4), Bd(t, e, r, n)
}
var xi = "_reactListening" + Math.random().toString(36).slice(2);

function Br(e) {
  if (!e[xi]) {
      e[xi] = !0, Qc.forEach(function(t) {
          t !== "selectionchange" && (vh.has(t) || fl(t, !1, e), fl(t, !0, e))
      });
      var n = e.nodeType === 9 ? e : e.ownerDocument;
      n === null || n[xi] || (n[xi] = !0, fl("selectionchange", !1, n))
  }
}

function Bd(e, n, t, r) {
  switch (Sd(n)) {
      case 1:
          var i = Op;
          break;
      case 4:
          i = Tp;
          break;
      default:
          i = ns
  }
  t = i.bind(null, n, t, e), i = void 0, !Kl || n !== "touchstart" && n !== "touchmove" && n !== "wheel" || (i = !0), r ? i !== void 0 ? e.addEventListener(n, t, {
      capture: !0,
      passive: i
  }) : e.addEventListener(n, t, !0) : i !== void 0 ? e.addEventListener(n, t, {
      passive: i
  }) : e.addEventListener(n, t, !1)
}

function ml(e, n, t, r, i) {
  var a = r;
  if ((n & 1) === 0 && (n & 2) === 0 && r !== null) e: for (;;) {
      if (r === null) return;
      var l = r.tag;
      if (l === 3 || l === 4) {
          var s = r.stateNode.containerInfo;
          if (s === i || s.nodeType === 8 && s.parentNode === i) break;
          if (l === 4)
              for (l = r.return; l !== null;) {
                  var u = l.tag;
                  if ((u === 3 || u === 4) && (u = l.stateNode.containerInfo, u === i || u.nodeType === 8 && u.parentNode === i)) return;
                  l = l.return
              }
          for (; s !== null;) {
              if (l = ot(s), l === null) return;
              if (u = l.tag, u === 5 || u === 6) {
                  r = a = l;
                  continue e
              }
              s = s.parentNode
          }
      }
      r = r.return
  }
  ud(function() {
      var c = a,
          h = Jo(t),
          g = [];
      e: {
          var y = Fd.get(e);
          if (y !== void 0) {
              var k = rs,
                  E = e;
              switch (e) {
                  case "keypress":
                      if (Hi(t) === 0) break e;
                  case "keydown":
                  case "keyup":
                      k = Gp;
                      break;
                  case "focusin":
                      E = "focus", k = ll;
                      break;
                  case "focusout":
                      E = "blur", k = ll;
                      break;
                  case "beforeblur":
                  case "afterblur":
                      k = ll;
                      break;
                  case "click":
                      if (t.button === 2) break e;
                  case "auxclick":
                  case "goatclick":
                  case "mousedown":
                  case "mousemove":
                  case "mouseup":
                  case "mouseout":
                  case "mouseover":
                  case "contextmenu":
                      k = fu;
                      break;
                  case "drag":
                  case "dragend":
                  case "dragenter":
                  case "dragexit":
                  case "dragleave":
                  case "dragover":
                  case "dragstart":
                  case "drop":
                      k = jp;
                      break;
                  case "touchcancel":
                  case "touchend":
                  case "touchmove":
                  case "touchstart":
                      k = Zp;
                      break;
                  case jd:
                  case Id:
                  case Md:
                      k = Rp;
                      break;
                  case Rd:
                      k = Jp;
                      break;
                  case "scroll":
                      k = Ap;
                      break;
                  case "wheel":
                      k = Dp;
                      break;
                  case "copy":
                  case "cut":
                  case "paste":
                      k = Up;
                      break;
                  case "gotpointercapture":
                  case "lostpointercapture":
                  case "pointercancel":
                  case "pointerdown":
                  case "pointermove":
                  case "pointerout":
                  case "pointerover":
                  case "pointerup":
                      k = pu
              }
              var C = (n & 4) !== 0,
                  O = !C && e === "scroll",
                  p = C ? y !== null ? y + "Capture" : null : y;
              C = [];
              for (var f = c, m; f !== null;) {
                  m = f;
                  var x = m.stateNode;
                  if (m.tag === 5 && x !== null && (m = x, p !== null && (x = jr(f, p), x != null && C.push(Vr(f, x, m)))), O) break;
                  f = f.return
              }
              0 < C.length && (y = new k(y, E, null, t, h), g.push({
                  event: y,
                  listeners: C
              }))
          }
      }
      if ((n & 7) === 0) {
          e: {
              if (y = e === "mouseover" || e === "pointerover", k = e === "mouseout" || e === "pointerout", y && t !== Gl && (E = t.relatedTarget || t.fromElement) && (ot(E) || E[Cn])) break e;
              if ((k || y) && (y = h.window === h ? h : (y = h.ownerDocument) ? y.defaultView || y.parentWindow : window, k ? (E = t.relatedTarget || t.toElement, k = c, E = E ? ot(E) : null, E !== null && (O = Nt(E), E !== O || E.tag !== 5 && E.tag !== 6) && (E = null)) : (k = null, E = c), k !== E)) {
                  if (C = fu, x = "onMouseLeave", p = "onMouseEnter", f = "mouse", (e === "pointerout" || e === "pointerover") && (C = pu, x = "onPointerLeave", p = "onPointerEnter", f = "pointer"), O = k == null ? y : Tt(k), m = E == null ? y : Tt(E), y = new C(x, f + "leave", k, t, h), y.target = O, y.relatedTarget = m, x = null, ot(h) === c && (C = new C(p, f + "enter", E, t, h), C.target = m, C.relatedTarget = O, x = C), O = x, k && E) n: {
                      for (C = k, p = E, f = 0, m = C; m; m = Ct(m)) f++;
                      for (m = 0, x = p; x; x = Ct(x)) m++;
                      for (; 0 < f - m;) C = Ct(C),
                      f--;
                      for (; 0 < m - f;) p = Ct(p),
                      m--;
                      for (; f--;) {
                          if (C === p || p !== null && C === p.alternate) break n;
                          C = Ct(C), p = Ct(p)
                      }
                      C = null
                  }
                  else C = null;
                  k !== null && Cu(g, y, k, C, !1), E !== null && O !== null && Cu(g, O, E, C, !0)
              }
          }
          e: {
              if (y = c ? Tt(c) : window, k = y.nodeName && y.nodeName.toLowerCase(), k === "select" || k === "input" && y.type === "file") var _ = lh;
              else if (gu(y))
                  if (_d) _ = ch;
                  else {
                      _ = sh;
                      var L = oh
                  }
              else(k = y.nodeName) && k.toLowerCase() === "input" && (y.type === "checkbox" || y.type === "radio") && (_ = uh);
              if (_ && (_ = _(e, c))) {
                  zd(g, _, t, h);
                  break e
              }
              L && L(e, y, c),
              e === "focusout" && (L = y._wrapperState) && L.controlled && y.type === "number" && Vl(y, "number", y.value)
          }
          switch (L = c ? Tt(c) : window, e) {
              case "focusin":
                  (gu(L) || L.contentEditable === "true") && (_t = L, Dl = c, Cr = null);
                  break;
              case "focusout":
                  Cr = Dl = _t = null;
                  break;
              case "mousedown":
                  eo = !0;
                  break;
              case "contextmenu":
              case "mouseup":
              case "dragend":
                  eo = !1, Nu(g, t, h);
                  break;
              case "selectionchange":
                  if (mh) break;
              case "keydown":
              case "keyup":
                  Nu(g, t, h)
          }
          var P;
          if (as) e: {
              switch (e) {
                  case "compositionstart":
                      var w = "onCompositionStart";
                      break e;
                  case "compositionend":
                      w = "onCompositionEnd";
                      break e;
                  case "compositionupdate":
                      w = "onCompositionUpdate";
                      break e
              }
              w = void 0
          }
          else zt ? bd(e, t) && (w = "onCompositionEnd") : e === "keydown" && t.keyCode === 229 && (w = "onCompositionStart");w && (Cd && t.locale !== "ko" && (zt || w !== "onCompositionStart" ? w === "onCompositionEnd" && zt && (P = Ed()) : (Un = h, ts = "value" in Un ? Un.value : Un.textContent, zt = !0)), L = oa(c, w), 0 < L.length && (w = new mu(w, e, null, t, h), g.push({
              event: w,
              listeners: L
          }), P ? w.data = P : (P = Pd(t), P !== null && (w.data = P)))),
          (P = nh ? th(e, t) : rh(e, t)) && (c = oa(c, "onBeforeInput"), 0 < c.length && (h = new mu("onBeforeInput", "beforeinput", null, t, h), g.push({
              event: h,
              listeners: c
          }), h.data = P))
      }
      Ud(g, n)
  })
}

function Vr(e, n, t) {
  return {
      instance: e,
      listener: n,
      currentTarget: t
  }
}

function oa(e, n) {
  for (var t = n + "Capture", r = []; e !== null;) {
      var i = e,
          a = i.stateNode;
      i.tag === 5 && a !== null && (i = a, a = jr(e, t), a != null && r.unshift(Vr(e, a, i)), a = jr(e, n), a != null && r.push(Vr(e, a, i))), e = e.return
  }
  return r
}

function Ct(e) {
  if (e === null) return null;
  do e = e.return; while (e && e.tag !== 5);
  return e || null
}

function Cu(e, n, t, r, i) {
  for (var a = n._reactName, l = []; t !== null && t !== r;) {
      var s = t,
          u = s.alternate,
          c = s.stateNode;
      if (u !== null && u === r) break;
      s.tag === 5 && c !== null && (s = c, i ? (u = jr(t, a), u != null && l.unshift(Vr(t, u, s))) : i || (u = jr(t, a), u != null && l.push(Vr(t, u, s)))), t = t.return
  }
  l.length !== 0 && e.push({
      event: n,
      listeners: l
  })
}
var gh = /\r\n?/g,
  yh = /\u0000|\uFFFD/g;

function bu(e) {
  return (typeof e == "string" ? e : "" + e).replace(gh, `
`).replace(yh, "")
}

function Ni(e, n, t) {
  if (n = bu(n), bu(e) !== n && t) throw Error(A(425))
}

function sa() {}
var no = null,
  to = null;

function ro(e, n) {
  return e === "textarea" || e === "noscript" || typeof n.children == "string" || typeof n.children == "number" || typeof n.dangerouslySetInnerHTML == "object" && n.dangerouslySetInnerHTML !== null && n.dangerouslySetInnerHTML.__html != null
}
var io = typeof setTimeout == "function" ? setTimeout : void 0,
  wh = typeof clearTimeout == "function" ? clearTimeout : void 0,
  Pu = typeof Promise == "function" ? Promise : void 0,
  kh = typeof queueMicrotask == "function" ? queueMicrotask : typeof Pu < "u" ? function(e) {
      return Pu.resolve(null).then(e).catch(xh)
  } : io;

function xh(e) {
  setTimeout(function() {
      throw e
  })
}

function pl(e, n) {
  var t = n,
      r = 0;
  do {
      var i = t.nextSibling;
      if (e.removeChild(t), i && i.nodeType === 8)
          if (t = i.data, t === "/$") {
              if (r === 0) {
                  e.removeChild(i), Rr(n);
                  return
              }
              r--
          } else t !== "$" && t !== "$?" && t !== "$!" || r++;
      t = i
  } while (t);
  Rr(n)
}

function Yn(e) {
  for (; e != null; e = e.nextSibling) {
      var n = e.nodeType;
      if (n === 1 || n === 3) break;
      if (n === 8) {
          if (n = e.data, n === "$" || n === "$!" || n === "$?") break;
          if (n === "/$") return null
      }
  }
  return e
}

function zu(e) {
  e = e.previousSibling;
  for (var n = 0; e;) {
      if (e.nodeType === 8) {
          var t = e.data;
          if (t === "$" || t === "$!" || t === "$?") {
              if (n === 0) return e;
              n--
          } else t === "/$" && n++
      }
      e = e.previousSibling
  }
  return null
}
var ar = Math.random().toString(36).slice(2),
  hn = "__reactFiber$" + ar,
  $r = "__reactProps$" + ar,
  Cn = "__reactContainer$" + ar,
  ao = "__reactEvents$" + ar,
  Nh = "__reactListeners$" + ar,
  Sh = "__reactHandles$" + ar;

function ot(e) {
  var n = e[hn];
  if (n) return n;
  for (var t = e.parentNode; t;) {
      if (n = t[Cn] || t[hn]) {
          if (t = n.alternate, n.child !== null || t !== null && t.child !== null)
              for (e = zu(e); e !== null;) {
                  if (t = e[hn]) return t;
                  e = zu(e)
              }
          return n
      }
      e = t, t = e.parentNode
  }
  return null
}

function ri(e) {
  return e = e[hn] || e[Cn], !e || e.tag !== 5 && e.tag !== 6 && e.tag !== 13 && e.tag !== 3 ? null : e
}

function Tt(e) {
  if (e.tag === 5 || e.tag === 6) return e.stateNode;
  throw Error(A(33))
}

function ja(e) {
  return e[$r] || null
}
var lo = [],
  At = -1;

function tt(e) {
  return {
      current: e
  }
}

function se(e) {
  0 > At || (e.current = lo[At], lo[At] = null, At--)
}

function ae(e, n) {
  At++, lo[At] = e.current, e.current = n
}
var Jn = {},
  Le = tt(Jn),
  Ve = tt(!1),
  pt = Jn;

function Zt(e, n) {
  var t = e.type.contextTypes;
  if (!t) return Jn;
  var r = e.stateNode;
  if (r && r.__reactInternalMemoizedUnmaskedChildContext === n) return r.__reactInternalMemoizedMaskedChildContext;
  var i = {},
      a;
  for (a in t) i[a] = n[a];
  return r && (e = e.stateNode, e.__reactInternalMemoizedUnmaskedChildContext = n, e.__reactInternalMemoizedMaskedChildContext = i), i
}

function $e(e) {
  return e = e.childContextTypes, e != null
}

function ua() {
  se(Ve), se(Le)
}

function _u(e, n, t) {
  if (Le.current !== Jn) throw Error(A(168));
  ae(Le, n), ae(Ve, t)
}

function Vd(e, n, t) {
  var r = e.stateNode;
  if (n = n.childContextTypes, typeof r.getChildContext != "function") return t;
  r = r.getChildContext();
  for (var i in r)
      if (!(i in n)) throw Error(A(108, op(e) || "Unknown", i));
  return he({}, t, r)
}

function ca(e) {
  return e = (e = e.stateNode) && e.__reactInternalMemoizedMergedChildContext || Jn, pt = Le.current, ae(Le, e), ae(Ve, Ve.current), !0
}

function Ou(e, n, t) {
  var r = e.stateNode;
  if (!r) throw Error(A(169));
  t ? (e = Vd(e, n, pt), r.__reactInternalMemoizedMergedChildContext = e, se(Ve), se(Le), ae(Le, e)) : se(Ve), ae(Ve, t)
}
var kn = null,
  Ia = !1,
  hl = !1;

function $d(e) {
  kn === null ? kn = [e] : kn.push(e)
}

function Eh(e) {
  Ia = !0, $d(e)
}

function rt() {
  if (!hl && kn !== null) {
      hl = !0;
      var e = 0,
          n = re;
      try {
          var t = kn;
          for (re = 1; e < t.length; e++) {
              var r = t[e];
              do r = r(!0); while (r !== null)
          }
          kn = null, Ia = !1
      } catch (i) {
          throw kn !== null && (kn = kn.slice(e + 1)), md(qo, rt), i
      } finally {
          re = n, hl = !1
      }
  }
  return null
}
var Lt = [],
  jt = 0,
  da = null,
  fa = 0,
  Je = [],
  qe = 0,
  ht = null,
  xn = 1,
  Nn = "";

function at(e, n) {
  Lt[jt++] = fa, Lt[jt++] = da, da = e, fa = n
}

function Wd(e, n, t) {
  Je[qe++] = xn, Je[qe++] = Nn, Je[qe++] = ht, ht = e;
  var r = xn;
  e = Nn;
  var i = 32 - cn(r) - 1;
  r &= ~(1 << i), t += 1;
  var a = 32 - cn(n) + i;
  if (30 < a) {
      var l = i - i % 5;
      a = (r & (1 << l) - 1).toString(32), r >>= l, i -= l, xn = 1 << 32 - cn(n) + i | t << i | r, Nn = a + e
  } else xn = 1 << a | t << i | r, Nn = e
}

function os(e) {
  e.return !== null && (at(e, 1), Wd(e, 1, 0))
}

function ss(e) {
  for (; e === da;) da = Lt[--jt], Lt[jt] = null, fa = Lt[--jt], Lt[jt] = null;
  for (; e === ht;) ht = Je[--qe], Je[qe] = null, Nn = Je[--qe], Je[qe] = null, xn = Je[--qe], Je[qe] = null
}
var Ge = null,
  Ye = null,
  fe = !1,
  sn = null;

function Hd(e, n) {
  var t = De(5, null, null, 0);
  t.elementType = "DELETED", t.stateNode = n, t.return = e, n = e.deletions, n === null ? (e.deletions = [t], e.flags |= 16) : n.push(t)
}

function Tu(e, n) {
  switch (e.tag) {
      case 5:
          var t = e.type;
          return n = n.nodeType !== 1 || t.toLowerCase() !== n.nodeName.toLowerCase() ? null : n, n !== null ? (e.stateNode = n, Ge = e, Ye = Yn(n.firstChild), !0) : !1;
      case 6:
          return n = e.pendingProps === "" || n.nodeType !== 3 ? null : n, n !== null ? (e.stateNode = n, Ge = e, Ye = null, !0) : !1;
      case 13:
          return n = n.nodeType !== 8 ? null : n, n !== null ? (t = ht !== null ? {
              id: xn,
              overflow: Nn
          } : null, e.memoizedState = {
              dehydrated: n,
              treeContext: t,
              retryLane: 1073741824
          }, t = De(18, null, null, 0), t.stateNode = n, t.return = e, e.child = t, Ge = e, Ye = null, !0) : !1;
      default:
          return !1
  }
}

function oo(e) {
  return (e.mode & 1) !== 0 && (e.flags & 128) === 0
}

function so(e) {
  if (fe) {
      var n = Ye;
      if (n) {
          var t = n;
          if (!Tu(e, n)) {
              if (oo(e)) throw Error(A(418));
              n = Yn(t.nextSibling);
              var r = Ge;
              n && Tu(e, n) ? Hd(r, t) : (e.flags = e.flags & -4097 | 2, fe = !1, Ge = e)
          }
      } else {
          if (oo(e)) throw Error(A(418));
          e.flags = e.flags & -4097 | 2, fe = !1, Ge = e
      }
  }
}

function Au(e) {
  for (e = e.return; e !== null && e.tag !== 5 && e.tag !== 3 && e.tag !== 13;) e = e.return;
  Ge = e
}

function Si(e) {
  if (e !== Ge) return !1;
  if (!fe) return Au(e), fe = !0, !1;
  var n;
  if ((n = e.tag !== 3) && !(n = e.tag !== 5) && (n = e.type, n = n !== "head" && n !== "body" && !ro(e.type, e.memoizedProps)), n && (n = Ye)) {
      if (oo(e)) throw Yd(), Error(A(418));
      for (; n;) Hd(e, n), n = Yn(n.nextSibling)
  }
  if (Au(e), e.tag === 13) {
      if (e = e.memoizedState, e = e !== null ? e.dehydrated : null, !e) throw Error(A(317));
      e: {
          for (e = e.nextSibling, n = 0; e;) {
              if (e.nodeType === 8) {
                  var t = e.data;
                  if (t === "/$") {
                      if (n === 0) {
                          Ye = Yn(e.nextSibling);
                          break e
                      }
                      n--
                  } else t !== "$" && t !== "$!" && t !== "$?" || n++
              }
              e = e.nextSibling
          }
          Ye = null
      }
  } else Ye = Ge ? Yn(e.stateNode.nextSibling) : null;
  return !0
}

function Yd() {
  for (var e = Ye; e;) e = Yn(e.nextSibling)
}

function Xt() {
  Ye = Ge = null, fe = !1
}

function us(e) {
  sn === null ? sn = [e] : sn.push(e)
}
var Ch = Tn.ReactCurrentBatchConfig;

function ln(e, n) {
  if (e && e.defaultProps) {
      n = he({}, n), e = e.defaultProps;
      for (var t in e) n[t] === void 0 && (n[t] = e[t]);
      return n
  }
  return n
}
var ma = tt(null),
  pa = null,
  It = null,
  cs = null;

function ds() {
  cs = It = pa = null
}

function fs(e) {
  var n = ma.current;
  se(ma), e._currentValue = n
}

function uo(e, n, t) {
  for (; e !== null;) {
      var r = e.alternate;
      if ((e.childLanes & n) !== n ? (e.childLanes |= n, r !== null && (r.childLanes |= n)) : r !== null && (r.childLanes & n) !== n && (r.childLanes |= n), e === t) break;
      e = e.return
  }
}

function Yt(e, n) {
  pa = e, cs = It = null, e = e.dependencies, e !== null && e.firstContext !== null && ((e.lanes & n) !== 0 && (Be = !0), e.firstContext = null)
}

function nn(e) {
  var n = e._currentValue;
  if (cs !== e)
      if (e = {
              context: e,
              memoizedValue: n,
              next: null
          }, It === null) {
          if (pa === null) throw Error(A(308));
          It = e, pa.dependencies = {
              lanes: 0,
              firstContext: e
          }
      } else It = It.next = e;
  return n
}
var st = null;

function ms(e) {
  st === null ? st = [e] : st.push(e)
}

function Gd(e, n, t, r) {
  var i = n.interleaved;
  return i === null ? (t.next = t, ms(n)) : (t.next = i.next, i.next = t), n.interleaved = t, bn(e, r)
}

function bn(e, n) {
  e.lanes |= n;
  var t = e.alternate;
  for (t !== null && (t.lanes |= n), t = e, e = e.return; e !== null;) e.childLanes |= n, t = e.alternate, t !== null && (t.childLanes |= n), t = e, e = e.return;
  return t.tag === 3 ? t.stateNode : null
}
var Mn = !1;

function ps(e) {
  e.updateQueue = {
      baseState: e.memoizedState,
      firstBaseUpdate: null,
      lastBaseUpdate: null,
      shared: {
          pending: null,
          interleaved: null,
          lanes: 0
      },
      effects: null
  }
}

function Qd(e, n) {
  e = e.updateQueue, n.updateQueue === e && (n.updateQueue = {
      baseState: e.baseState,
      firstBaseUpdate: e.firstBaseUpdate,
      lastBaseUpdate: e.lastBaseUpdate,
      shared: e.shared,
      effects: e.effects
  })
}

function Sn(e, n) {
  return {
      eventTime: e,
      lane: n,
      tag: 0,
      payload: null,
      callback: null,
      next: null
  }
}

function Gn(e, n, t) {
  var r = e.updateQueue;
  if (r === null) return null;
  if (r = r.shared, (ne & 2) !== 0) {
      var i = r.pending;
      return i === null ? n.next = n : (n.next = i.next, i.next = n), r.pending = n, bn(e, t)
  }
  return i = r.interleaved, i === null ? (n.next = n, ms(r)) : (n.next = i.next, i.next = n), r.interleaved = n, bn(e, t)
}

function Yi(e, n, t) {
  if (n = n.updateQueue, n !== null && (n = n.shared, (t & 4194240) !== 0)) {
      var r = n.lanes;
      r &= e.pendingLanes, t |= r, n.lanes = t, Do(e, t)
  }
}

function Lu(e, n) {
  var t = e.updateQueue,
      r = e.alternate;
  if (r !== null && (r = r.updateQueue, t === r)) {
      var i = null,
          a = null;
      if (t = t.firstBaseUpdate, t !== null) {
          do {
              var l = {
                  eventTime: t.eventTime,
                  lane: t.lane,
                  tag: t.tag,
                  payload: t.payload,
                  callback: t.callback,
                  next: null
              };
              a === null ? i = a = l : a = a.next = l, t = t.next
          } while (t !== null);
          a === null ? i = a = n : a = a.next = n
      } else i = a = n;
      t = {
          baseState: r.baseState,
          firstBaseUpdate: i,
          lastBaseUpdate: a,
          shared: r.shared,
          effects: r.effects
      }, e.updateQueue = t;
      return
  }
  e = t.lastBaseUpdate, e === null ? t.firstBaseUpdate = n : e.next = n, t.lastBaseUpdate = n
}

function ha(e, n, t, r) {
  var i = e.updateQueue;
  Mn = !1;
  var a = i.firstBaseUpdate,
      l = i.lastBaseUpdate,
      s = i.shared.pending;
  if (s !== null) {
      i.shared.pending = null;
      var u = s,
          c = u.next;
      u.next = null, l === null ? a = c : l.next = c, l = u;
      var h = e.alternate;
      h !== null && (h = h.updateQueue, s = h.lastBaseUpdate, s !== l && (s === null ? h.firstBaseUpdate = c : s.next = c, h.lastBaseUpdate = u))
  }
  if (a !== null) {
      var g = i.baseState;
      l = 0, h = c = u = null, s = a;
      do {
          var y = s.lane,
              k = s.eventTime;
          if ((r & y) === y) {
              h !== null && (h = h.next = {
                  eventTime: k,
                  lane: 0,
                  tag: s.tag,
                  payload: s.payload,
                  callback: s.callback,
                  next: null
              });
              e: {
                  var E = e,
                      C = s;
                  switch (y = n, k = t, C.tag) {
                      case 1:
                          if (E = C.payload, typeof E == "function") {
                              g = E.call(k, g, y);
                              break e
                          }
                          g = E;
                          break e;
                      case 3:
                          E.flags = E.flags & -65537 | 128;
                      case 0:
                          if (E = C.payload, y = typeof E == "function" ? E.call(k, g, y) : E, y == null) break e;
                          g = he({}, g, y);
                          break e;
                      case 2:
                          Mn = !0
                  }
              }
              s.callback !== null && s.lane !== 0 && (e.flags |= 64, y = i.effects, y === null ? i.effects = [s] : y.push(s))
          } else k = {
              eventTime: k,
              lane: y,
              tag: s.tag,
              payload: s.payload,
              callback: s.callback,
              next: null
          }, h === null ? (c = h = k, u = g) : h = h.next = k, l |= y;
          if (s = s.next, s === null) {
              if (s = i.shared.pending, s === null) break;
              y = s, s = y.next, y.next = null, i.lastBaseUpdate = y, i.shared.pending = null
          }
      } while (1);
      if (h === null && (u = g), i.baseState = u, i.firstBaseUpdate = c, i.lastBaseUpdate = h, n = i.shared.interleaved, n !== null) {
          i = n;
          do l |= i.lane, i = i.next; while (i !== n)
      } else a === null && (i.shared.lanes = 0);
      gt |= l, e.lanes = l, e.memoizedState = g
  }
}

function ju(e, n, t) {
  if (e = n.effects, n.effects = null, e !== null)
      for (n = 0; n < e.length; n++) {
          var r = e[n],
              i = r.callback;
          if (i !== null) {
              if (r.callback = null, r = t, typeof i != "function") throw Error(A(191, i));
              i.call(r)
          }
      }
}
var Kd = new Gc.Component().refs;

function co(e, n, t, r) {
  n = e.memoizedState, t = t(r, n), t = t == null ? n : he({}, n, t), e.memoizedState = t, e.lanes === 0 && (e.updateQueue.baseState = t)
}
var Ma = {
  isMounted: function(e) {
      return (e = e._reactInternals) ? Nt(e) === e : !1
  },
  enqueueSetState: function(e, n, t) {
      e = e._reactInternals;
      var r = Me(),
          i = Kn(e),
          a = Sn(r, i);
      a.payload = n, t != null && (a.callback = t), n = Gn(e, a, i), n !== null && (dn(n, e, i, r), Yi(n, e, i))
  },
  enqueueReplaceState: function(e, n, t) {
      e = e._reactInternals;
      var r = Me(),
          i = Kn(e),
          a = Sn(r, i);
      a.tag = 1, a.payload = n, t != null && (a.callback = t), n = Gn(e, a, i), n !== null && (dn(n, e, i, r), Yi(n, e, i))
  },
  enqueueForceUpdate: function(e, n) {
      e = e._reactInternals;
      var t = Me(),
          r = Kn(e),
          i = Sn(t, r);
      i.tag = 2, n != null && (i.callback = n), n = Gn(e, i, r), n !== null && (dn(n, e, r, t), Yi(n, e, r))
  }
};

function Iu(e, n, t, r, i, a, l) {
  return e = e.stateNode, typeof e.shouldComponentUpdate == "function" ? e.shouldComponentUpdate(r, a, l) : n.prototype && n.prototype.isPureReactComponent ? !Ur(t, r) || !Ur(i, a) : !0
}

function Zd(e, n, t) {
  var r = !1,
      i = Jn,
      a = n.contextType;
  return typeof a == "object" && a !== null ? a = nn(a) : (i = $e(n) ? pt : Le.current, r = n.contextTypes, a = (r = r != null) ? Zt(e, i) : Jn), n = new n(t, a), e.memoizedState = n.state !== null && n.state !== void 0 ? n.state : null, n.updater = Ma, e.stateNode = n, n._reactInternals = e, r && (e = e.stateNode, e.__reactInternalMemoizedUnmaskedChildContext = i, e.__reactInternalMemoizedMaskedChildContext = a), n
}

function Mu(e, n, t, r) {
  e = n.state, typeof n.componentWillReceiveProps == "function" && n.componentWillReceiveProps(t, r), typeof n.UNSAFE_componentWillReceiveProps == "function" && n.UNSAFE_componentWillReceiveProps(t, r), n.state !== e && Ma.enqueueReplaceState(n, n.state, null)
}

function fo(e, n, t, r) {
  var i = e.stateNode;
  i.props = t, i.state = e.memoizedState, i.refs = Kd, ps(e);
  var a = n.contextType;
  typeof a == "object" && a !== null ? i.context = nn(a) : (a = $e(n) ? pt : Le.current, i.context = Zt(e, a)), i.state = e.memoizedState, a = n.getDerivedStateFromProps, typeof a == "function" && (co(e, n, a, t), i.state = e.memoizedState), typeof n.getDerivedStateFromProps == "function" || typeof i.getSnapshotBeforeUpdate == "function" || typeof i.UNSAFE_componentWillMount != "function" && typeof i.componentWillMount != "function" || (n = i.state, typeof i.componentWillMount == "function" && i.componentWillMount(), typeof i.UNSAFE_componentWillMount == "function" && i.UNSAFE_componentWillMount(), n !== i.state && Ma.enqueueReplaceState(i, i.state, null), ha(e, t, i, r), i.state = e.memoizedState), typeof i.componentDidMount == "function" && (e.flags |= 4194308)
}

function mr(e, n, t) {
  if (e = t.ref, e !== null && typeof e != "function" && typeof e != "object") {
      if (t._owner) {
          if (t = t._owner, t) {
              if (t.tag !== 1) throw Error(A(309));
              var r = t.stateNode
          }
          if (!r) throw Error(A(147, e));
          var i = r,
              a = "" + e;
          return n !== null && n.ref !== null && typeof n.ref == "function" && n.ref._stringRef === a ? n.ref : (n = function(l) {
              var s = i.refs;
              s === Kd && (s = i.refs = {}), l === null ? delete s[a] : s[a] = l
          }, n._stringRef = a, n)
      }
      if (typeof e != "string") throw Error(A(284));
      if (!t._owner) throw Error(A(290, e))
  }
  return e
}

function Ei(e, n) {
  throw e = Object.prototype.toString.call(n), Error(A(31, e === "[object Object]" ? "object with keys {" + Object.keys(n).join(", ") + "}" : e))
}

function Ru(e) {
  var n = e._init;
  return n(e._payload)
}

function Xd(e) {
  function n(p, f) {
      if (e) {
          var m = p.deletions;
          m === null ? (p.deletions = [f], p.flags |= 16) : m.push(f)
      }
  }

  function t(p, f) {
      if (!e) return null;
      for (; f !== null;) n(p, f), f = f.sibling;
      return null
  }

  function r(p, f) {
      for (p = new Map; f !== null;) f.key !== null ? p.set(f.key, f) : p.set(f.index, f), f = f.sibling;
      return p
  }

  function i(p, f) {
      return p = Zn(p, f), p.index = 0, p.sibling = null, p
  }

  function a(p, f, m) {
      return p.index = m, e ? (m = p.alternate, m !== null ? (m = m.index, m < f ? (p.flags |= 2, f) : m) : (p.flags |= 2, f)) : (p.flags |= 1048576, f)
  }

  function l(p) {
      return e && p.alternate === null && (p.flags |= 2), p
  }

  function s(p, f, m, x) {
      return f === null || f.tag !== 6 ? (f = Nl(m, p.mode, x), f.return = p, f) : (f = i(f, m), f.return = p, f)
  }

  function u(p, f, m, x) {
      var _ = m.type;
      return _ === Pt ? h(p, f, m.props.children, x, m.key) : f !== null && (f.elementType === _ || typeof _ == "object" && _ !== null && _.$$typeof === In && Ru(_) === f.type) ? (x = i(f, m.props), x.ref = mr(p, f, m), x.return = p, x) : (x = Ji(m.type, m.key, m.props, null, p.mode, x), x.ref = mr(p, f, m), x.return = p, x)
  }

  function c(p, f, m, x) {
      return f === null || f.tag !== 4 || f.stateNode.containerInfo !== m.containerInfo || f.stateNode.implementation !== m.implementation ? (f = Sl(m, p.mode, x), f.return = p, f) : (f = i(f, m.children || []), f.return = p, f)
  }

  function h(p, f, m, x, _) {
      return f === null || f.tag !== 7 ? (f = mt(m, p.mode, x, _), f.return = p, f) : (f = i(f, m), f.return = p, f)
  }

  function g(p, f, m) {
      if (typeof f == "string" && f !== "" || typeof f == "number") return f = Nl("" + f, p.mode, m), f.return = p, f;
      if (typeof f == "object" && f !== null) {
          switch (f.$$typeof) {
              case mi:
                  return m = Ji(f.type, f.key, f.props, null, p.mode, m), m.ref = mr(p, null, f), m.return = p, m;
              case bt:
                  return f = Sl(f, p.mode, m), f.return = p, f;
              case In:
                  var x = f._init;
                  return g(p, x(f._payload), m)
          }
          if (gr(f) || sr(f)) return f = mt(f, p.mode, m, null), f.return = p, f;
          Ei(p, f)
      }
      return null
  }

  function y(p, f, m, x) {
      var _ = f !== null ? f.key : null;
      if (typeof m == "string" && m !== "" || typeof m == "number") return _ !== null ? null : s(p, f, "" + m, x);
      if (typeof m == "object" && m !== null) {
          switch (m.$$typeof) {
              case mi:
                  return m.key === _ ? u(p, f, m, x) : null;
              case bt:
                  return m.key === _ ? c(p, f, m, x) : null;
              case In:
                  return _ = m._init, y(p, f, _(m._payload), x)
          }
          if (gr(m) || sr(m)) return _ !== null ? null : h(p, f, m, x, null);
          Ei(p, m)
      }
      return null
  }

  function k(p, f, m, x, _) {
      if (typeof x == "string" && x !== "" || typeof x == "number") return p = p.get(m) || null, s(f, p, "" + x, _);
      if (typeof x == "object" && x !== null) {
          switch (x.$$typeof) {
              case mi:
                  return p = p.get(x.key === null ? m : x.key) || null, u(f, p, x, _);
              case bt:
                  return p = p.get(x.key === null ? m : x.key) || null, c(f, p, x, _);
              case In:
                  var L = x._init;
                  return k(p, f, m, L(x._payload), _)
          }
          if (gr(x) || sr(x)) return p = p.get(m) || null, h(f, p, x, _, null);
          Ei(f, x)
      }
      return null
  }

  function E(p, f, m, x) {
      for (var _ = null, L = null, P = f, w = f = 0, N = null; P !== null && w < m.length; w++) {
          P.index > w ? (N = P, P = null) : N = P.sibling;
          var z = y(p, P, m[w], x);
          if (z === null) {
              P === null && (P = N);
              break
          }
          e && P && z.alternate === null && n(p, P), f = a(z, f, w), L === null ? _ = z : L.sibling = z, L = z, P = N
      }
      if (w === m.length) return t(p, P), fe && at(p, w), _;
      if (P === null) {
          for (; w < m.length; w++) P = g(p, m[w], x), P !== null && (f = a(P, f, w), L === null ? _ = P : L.sibling = P, L = P);
          return fe && at(p, w), _
      }
      for (P = r(p, P); w < m.length; w++) N = k(P, p, w, m[w], x), N !== null && (e && N.alternate !== null && P.delete(N.key === null ? w : N.key), f = a(N, f, w), L === null ? _ = N : L.sibling = N, L = N);
      return e && P.forEach(function(j) {
          return n(p, j)
      }), fe && at(p, w), _
  }

  function C(p, f, m, x) {
      var _ = sr(m);
      if (typeof _ != "function") throw Error(A(150));
      if (m = _.call(m), m == null) throw Error(A(151));
      for (var L = _ = null, P = f, w = f = 0, N = null, z = m.next(); P !== null && !z.done; w++, z = m.next()) {
          P.index > w ? (N = P, P = null) : N = P.sibling;
          var j = y(p, P, z.value, x);
          if (j === null) {
              P === null && (P = N);
              break
          }
          e && P && j.alternate === null && n(p, P), f = a(j, f, w), L === null ? _ = j : L.sibling = j, L = j, P = N
      }
      if (z.done) return t(p, P), fe && at(p, w), _;
      if (P === null) {
          for (; !z.done; w++, z = m.next()) z = g(p, z.value, x), z !== null && (f = a(z, f, w), L === null ? _ = z : L.sibling = z, L = z);
          return fe && at(p, w), _
      }
      for (P = r(p, P); !z.done; w++, z = m.next()) z = k(P, p, w, z.value, x), z !== null && (e && z.alternate !== null && P.delete(z.key === null ? w : z.key), f = a(z, f, w), L === null ? _ = z : L.sibling = z, L = z);
      return e && P.forEach(function(U) {
          return n(p, U)
      }), fe && at(p, w), _
  }

  function O(p, f, m, x) {
      if (typeof m == "object" && m !== null && m.type === Pt && m.key === null && (m = m.props.children), typeof m == "object" && m !== null) {
          switch (m.$$typeof) {
              case mi:
                  e: {
                      for (var _ = m.key, L = f; L !== null;) {
                          if (L.key === _) {
                              if (_ = m.type, _ === Pt) {
                                  if (L.tag === 7) {
                                      t(p, L.sibling), f = i(L, m.props.children), f.return = p, p = f;
                                      break e
                                  }
                              } else if (L.elementType === _ || typeof _ == "object" && _ !== null && _.$$typeof === In && Ru(_) === L.type) {
                                  t(p, L.sibling), f = i(L, m.props), f.ref = mr(p, L, m), f.return = p, p = f;
                                  break e
                              }
                              t(p, L);
                              break
                          } else n(p, L);
                          L = L.sibling
                      }
                      m.type === Pt ? (f = mt(m.props.children, p.mode, x, m.key), f.return = p, p = f) : (x = Ji(m.type, m.key, m.props, null, p.mode, x), x.ref = mr(p, f, m), x.return = p, p = x)
                  }
                  return l(p);
              case bt:
                  e: {
                      for (L = m.key; f !== null;) {
                          if (f.key === L)
                              if (f.tag === 4 && f.stateNode.containerInfo === m.containerInfo && f.stateNode.implementation === m.implementation) {
                                  t(p, f.sibling), f = i(f, m.children || []), f.return = p, p = f;
                                  break e
                              } else {
                                  t(p, f);
                                  break
                              }
                          else n(p, f);
                          f = f.sibling
                      }
                      f = Sl(m, p.mode, x),
                      f.return = p,
                      p = f
                  }
                  return l(p);
              case In:
                  return L = m._init, O(p, f, L(m._payload), x)
          }
          if (gr(m)) return E(p, f, m, x);
          if (sr(m)) return C(p, f, m, x);
          Ei(p, m)
      }
      return typeof m == "string" && m !== "" || typeof m == "number" ? (m = "" + m, f !== null && f.tag === 6 ? (t(p, f.sibling), f = i(f, m), f.return = p, p = f) : (t(p, f), f = Nl(m, p.mode, x), f.return = p, p = f), l(p)) : t(p, f)
  }
  return O
}
var Jt = Xd(!0),
  Jd = Xd(!1),
  ii = {},
  yn = tt(ii),
  Wr = tt(ii),
  Hr = tt(ii);

function ut(e) {
  if (e === ii) throw Error(A(174));
  return e
}

function hs(e, n) {
  switch (ae(Hr, n), ae(Wr, e), ae(yn, ii), e = n.nodeType, e) {
      case 9:
      case 11:
          n = (n = n.documentElement) ? n.namespaceURI : Wl(null, "");
          break;
      default:
          e = e === 8 ? n.parentNode : n, n = e.namespaceURI || null, e = e.tagName, n = Wl(n, e)
  }
  se(yn), ae(yn, n)
}

function qt() {
  se(yn), se(Wr), se(Hr)
}

function qd(e) {
  ut(Hr.current);
  var n = ut(yn.current),
      t = Wl(n, e.type);
  n !== t && (ae(Wr, e), ae(yn, t))
}

function vs(e) {
  Wr.current === e && (se(yn), se(Wr))
}
var me = tt(0);

function va(e) {
  for (var n = e; n !== null;) {
      if (n.tag === 13) {
          var t = n.memoizedState;
          if (t !== null && (t = t.dehydrated, t === null || t.data === "$?" || t.data === "$!")) return n
      } else if (n.tag === 19 && n.memoizedProps.revealOrder !== void 0) {
          if ((n.flags & 128) !== 0) return n
      } else if (n.child !== null) {
          n.child.return = n, n = n.child;
          continue
      }
      if (n === e) break;
      for (; n.sibling === null;) {
          if (n.return === null || n.return === e) return null;
          n = n.return
      }
      n.sibling.return = n.return, n = n.sibling
  }
  return null
}
var vl = [];

function gs() {
  for (var e = 0; e < vl.length; e++) vl[e]._workInProgressVersionPrimary = null;
  vl.length = 0
}
var Gi = Tn.ReactCurrentDispatcher,
  gl = Tn.ReactCurrentBatchConfig,
  vt = 0,
  pe = null,
  ke = null,
  Se = null,
  ga = !1,
  br = !1,
  Yr = 0,
  bh = 0;

function Oe() {
  throw Error(A(321))
}

function ys(e, n) {
  if (n === null) return !1;
  for (var t = 0; t < n.length && t < e.length; t++)
      if (!fn(e[t], n[t])) return !1;
  return !0
}

function ws(e, n, t, r, i, a) {
  if (vt = a, pe = n, n.memoizedState = null, n.updateQueue = null, n.lanes = 0, Gi.current = e === null || e.memoizedState === null ? Oh : Th, e = t(r, i), br) {
      a = 0;
      do {
          if (br = !1, Yr = 0, 25 <= a) throw Error(A(301));
          a += 1, Se = ke = null, n.updateQueue = null, Gi.current = Ah, e = t(r, i)
      } while (br)
  }
  if (Gi.current = ya, n = ke !== null && ke.next !== null, vt = 0, Se = ke = pe = null, ga = !1, n) throw Error(A(300));
  return e
}

function ks() {
  var e = Yr !== 0;
  return Yr = 0, e
}

function pn() {
  var e = {
      memoizedState: null,
      baseState: null,
      baseQueue: null,
      queue: null,
      next: null
  };
  return Se === null ? pe.memoizedState = Se = e : Se = Se.next = e, Se
}

function tn() {
  if (ke === null) {
      var e = pe.alternate;
      e = e !== null ? e.memoizedState : null
  } else e = ke.next;
  var n = Se === null ? pe.memoizedState : Se.next;
  if (n !== null) Se = n, ke = e;
  else {
      if (e === null) throw Error(A(310));
      ke = e, e = {
          memoizedState: ke.memoizedState,
          baseState: ke.baseState,
          baseQueue: ke.baseQueue,
          queue: ke.queue,
          next: null
      }, Se === null ? pe.memoizedState = Se = e : Se = Se.next = e
  }
  return Se
}

function Gr(e, n) {
  return typeof n == "function" ? n(e) : n
}

function yl(e) {
  var n = tn(),
      t = n.queue;
  if (t === null) throw Error(A(311));
  t.lastRenderedReducer = e;
  var r = ke,
      i = r.baseQueue,
      a = t.pending;
  if (a !== null) {
      if (i !== null) {
          var l = i.next;
          i.next = a.next, a.next = l
      }
      r.baseQueue = i = a, t.pending = null
  }
  if (i !== null) {
      a = i.next, r = r.baseState;
      var s = l = null,
          u = null,
          c = a;
      do {
          var h = c.lane;
          if ((vt & h) === h) u !== null && (u = u.next = {
              lane: 0,
              action: c.action,
              hasEagerState: c.hasEagerState,
              eagerState: c.eagerState,
              next: null
          }), r = c.hasEagerState ? c.eagerState : e(r, c.action);
          else {
              var g = {
                  lane: h,
                  action: c.action,
                  hasEagerState: c.hasEagerState,
                  eagerState: c.eagerState,
                  next: null
              };
              u === null ? (s = u = g, l = r) : u = u.next = g, pe.lanes |= h, gt |= h
          }
          c = c.next
      } while (c !== null && c !== a);
      u === null ? l = r : u.next = s, fn(r, n.memoizedState) || (Be = !0), n.memoizedState = r, n.baseState = l, n.baseQueue = u, t.lastRenderedState = r
  }
  if (e = t.interleaved, e !== null) {
      i = e;
      do a = i.lane, pe.lanes |= a, gt |= a, i = i.next; while (i !== e)
  } else i === null && (t.lanes = 0);
  return [n.memoizedState, t.dispatch]
}

function wl(e) {
  var n = tn(),
      t = n.queue;
  if (t === null) throw Error(A(311));
  t.lastRenderedReducer = e;
  var r = t.dispatch,
      i = t.pending,
      a = n.memoizedState;
  if (i !== null) {
      t.pending = null;
      var l = i = i.next;
      do a = e(a, l.action), l = l.next; while (l !== i);
      fn(a, n.memoizedState) || (Be = !0), n.memoizedState = a, n.baseQueue === null && (n.baseState = a), t.lastRenderedState = a
  }
  return [a, r]
}

function Dd() {}

function ef(e, n) {
  var t = pe,
      r = tn(),
      i = n(),
      a = !fn(r.memoizedState, i);
  if (a && (r.memoizedState = i, Be = !0), r = r.queue, xs(rf.bind(null, t, r, e), [e]), r.getSnapshot !== n || a || Se !== null && Se.memoizedState.tag & 1) {
      if (t.flags |= 2048, Qr(9, tf.bind(null, t, r, i, n), void 0, null), Ce === null) throw Error(A(349));
      (vt & 30) !== 0 || nf(t, n, i)
  }
  return i
}

function nf(e, n, t) {
  e.flags |= 16384, e = {
      getSnapshot: n,
      value: t
  }, n = pe.updateQueue, n === null ? (n = {
      lastEffect: null,
      stores: null
  }, pe.updateQueue = n, n.stores = [e]) : (t = n.stores, t === null ? n.stores = [e] : t.push(e))
}

function tf(e, n, t, r) {
  n.value = t, n.getSnapshot = r, af(n) && lf(e)
}

function rf(e, n, t) {
  return t(function() {
      af(n) && lf(e)
  })
}

function af(e) {
  var n = e.getSnapshot;
  e = e.value;
  try {
      var t = n();
      return !fn(e, t)
  } catch {
      return !0
  }
}

function lf(e) {
  var n = bn(e, 1);
  n !== null && dn(n, e, 1, -1)
}

function Fu(e) {
  var n = pn();
  return typeof e == "function" && (e = e()), n.memoizedState = n.baseState = e, e = {
      pending: null,
      interleaved: null,
      lanes: 0,
      dispatch: null,
      lastRenderedReducer: Gr,
      lastRenderedState: e
  }, n.queue = e, e = e.dispatch = _h.bind(null, pe, e), [n.memoizedState, e]
}

function Qr(e, n, t, r) {
  return e = {
      tag: e,
      create: n,
      destroy: t,
      deps: r,
      next: null
  }, n = pe.updateQueue, n === null ? (n = {
      lastEffect: null,
      stores: null
  }, pe.updateQueue = n, n.lastEffect = e.next = e) : (t = n.lastEffect, t === null ? n.lastEffect = e.next = e : (r = t.next, t.next = e, e.next = r, n.lastEffect = e)), e
}

function of () {
  return tn().memoizedState
}

function Qi(e, n, t, r) {
  var i = pn();
  pe.flags |= e, i.memoizedState = Qr(1 | n, t, void 0, r === void 0 ? null : r)
}

function Ra(e, n, t, r) {
  var i = tn();
  r = r === void 0 ? null : r;
  var a = void 0;
  if (ke !== null) {
      var l = ke.memoizedState;
      if (a = l.destroy, r !== null && ys(r, l.deps)) {
          i.memoizedState = Qr(n, t, a, r);
          return
      }
  }
  pe.flags |= e, i.memoizedState = Qr(1 | n, t, a, r)
}

function Uu(e, n) {
  return Qi(8390656, 8, e, n)
}

function xs(e, n) {
  return Ra(2048, 8, e, n)
}

function sf(e, n) {
  return Ra(4, 2, e, n)
}

function uf(e, n) {
  return Ra(4, 4, e, n)
}

function cf(e, n) {
  if (typeof n == "function") return e = e(), n(e),
      function() {
          n(null)
      };
  if (n != null) return e = e(), n.current = e,
      function() {
          n.current = null
      }
}

function df(e, n, t) {
  return t = t != null ? t.concat([e]) : null, Ra(4, 4, cf.bind(null, n, e), t)
}

function Ns() {}

function ff(e, n) {
  var t = tn();
  n = n === void 0 ? null : n;
  var r = t.memoizedState;
  return r !== null && n !== null && ys(n, r[1]) ? r[0] : (t.memoizedState = [e, n], e)
}

function mf(e, n) {
  var t = tn();
  n = n === void 0 ? null : n;
  var r = t.memoizedState;
  return r !== null && n !== null && ys(n, r[1]) ? r[0] : (e = e(), t.memoizedState = [e, n], e)
}

function pf(e, n, t) {
  return (vt & 21) === 0 ? (e.baseState && (e.baseState = !1, Be = !0), e.memoizedState = t) : (fn(t, n) || (t = vd(), pe.lanes |= t, gt |= t, e.baseState = !0), n)
}

function Ph(e, n) {
  var t = re;
  re = t !== 0 && 4 > t ? t : 4, e(!0);
  var r = gl.transition;
  gl.transition = {};
  try {
      e(!1), n()
  } finally {
      re = t, gl.transition = r
  }
}

function hf() {
  return tn().memoizedState
}

function zh(e, n, t) {
  var r = Kn(e);
  if (t = {
          lane: r,
          action: t,
          hasEagerState: !1,
          eagerState: null,
          next: null
      }, vf(e)) gf(n, t);
  else if (t = Gd(e, n, t, r), t !== null) {
      var i = Me();
      dn(t, e, r, i), yf(t, n, r)
  }
}

function _h(e, n, t) {
  var r = Kn(e),
      i = {
          lane: r,
          action: t,
          hasEagerState: !1,
          eagerState: null,
          next: null
      };
  if (vf(e)) gf(n, i);
  else {
      var a = e.alternate;
      if (e.lanes === 0 && (a === null || a.lanes === 0) && (a = n.lastRenderedReducer, a !== null)) try {
          var l = n.lastRenderedState,
              s = a(l, t);
          if (i.hasEagerState = !0, i.eagerState = s, fn(s, l)) {
              var u = n.interleaved;
              u === null ? (i.next = i, ms(n)) : (i.next = u.next, u.next = i), n.interleaved = i;
              return
          }
      } catch {} finally {}
      t = Gd(e, n, i, r), t !== null && (i = Me(), dn(t, e, r, i), yf(t, n, r))
  }
}

function vf(e) {
  var n = e.alternate;
  return e === pe || n !== null && n === pe
}

function gf(e, n) {
  br = ga = !0;
  var t = e.pending;
  t === null ? n.next = n : (n.next = t.next, t.next = n), e.pending = n
}

function yf(e, n, t) {
  if ((t & 4194240) !== 0) {
      var r = n.lanes;
      r &= e.pendingLanes, t |= r, n.lanes = t, Do(e, t)
  }
}
var ya = {
      readContext: nn,
      useCallback: Oe,
      useContext: Oe,
      useEffect: Oe,
      useImperativeHandle: Oe,
      useInsertionEffect: Oe,
      useLayoutEffect: Oe,
      useMemo: Oe,
      useReducer: Oe,
      useRef: Oe,
      useState: Oe,
      useDebugValue: Oe,
      useDeferredValue: Oe,
      useTransition: Oe,
      useMutableSource: Oe,
      useSyncExternalStore: Oe,
      useId: Oe,
      unstable_isNewReconciler: !1
  },
  Oh = {
      readContext: nn,
      useCallback: function(e, n) {
          return pn().memoizedState = [e, n === void 0 ? null : n], e
      },
      useContext: nn,
      useEffect: Uu,
      useImperativeHandle: function(e, n, t) {
          return t = t != null ? t.concat([e]) : null, Qi(4194308, 4, cf.bind(null, n, e), t)
      },
      useLayoutEffect: function(e, n) {
          return Qi(4194308, 4, e, n)
      },
      useInsertionEffect: function(e, n) {
          return Qi(4, 2, e, n)
      },
      useMemo: function(e, n) {
          var t = pn();
          return n = n === void 0 ? null : n, e = e(), t.memoizedState = [e, n], e
      },
      useReducer: function(e, n, t) {
          var r = pn();
          return n = t !== void 0 ? t(n) : n, r.memoizedState = r.baseState = n, e = {
              pending: null,
              interleaved: null,
              lanes: 0,
              dispatch: null,
              lastRenderedReducer: e,
              lastRenderedState: n
          }, r.queue = e, e = e.dispatch = zh.bind(null, pe, e), [r.memoizedState, e]
      },
      useRef: function(e) {
          var n = pn();
          return e = {
              current: e
          }, n.memoizedState = e
      },
      useState: Fu,
      useDebugValue: Ns,
      useDeferredValue: function(e) {
          return pn().memoizedState = e
      },
      useTransition: function() {
          var e = Fu(!1),
              n = e[0];
          return e = Ph.bind(null, e[1]), pn().memoizedState = e, [n, e]
      },
      useMutableSource: function() {},
      useSyncExternalStore: function(e, n, t) {
          var r = pe,
              i = pn();
          if (fe) {
              if (t === void 0) throw Error(A(407));
              t = t()
          } else {
              if (t = n(), Ce === null) throw Error(A(349));
              (vt & 30) !== 0 || nf(r, n, t)
          }
          i.memoizedState = t;
          var a = {
              value: t,
              getSnapshot: n
          };
          return i.queue = a, Uu(rf.bind(null, r, a, e), [e]), r.flags |= 2048, Qr(9, tf.bind(null, r, a, t, n), void 0, null), t
      },
      useId: function() {
          var e = pn(),
              n = Ce.identifierPrefix;
          if (fe) {
              var t = Nn,
                  r = xn;
              t = (r & ~(1 << 32 - cn(r) - 1)).toString(32) + t, n = ":" + n + "R" + t, t = Yr++, 0 < t && (n += "H" + t.toString(32)), n += ":"
          } else t = bh++, n = ":" + n + "r" + t.toString(32) + ":";
          return e.memoizedState = n
      },
      unstable_isNewReconciler: !1
  },
  Th = {
      readContext: nn,
      useCallback: ff,
      useContext: nn,
      useEffect: xs,
      useImperativeHandle: df,
      useInsertionEffect: sf,
      useLayoutEffect: uf,
      useMemo: mf,
      useReducer: yl,
      useRef: of ,
      useState: function() {
          return yl(Gr)
      },
      useDebugValue: Ns,
      useDeferredValue: function(e) {
          var n = tn();
          return pf(n, ke.memoizedState, e)
      },
      useTransition: function() {
          var e = yl(Gr)[0],
              n = tn().memoizedState;
          return [e, n]
      },
      useMutableSource: Dd,
      useSyncExternalStore: ef,
      useId: hf,
      unstable_isNewReconciler: !1
  },
  Ah = {
      readContext: nn,
      useCallback: ff,
      useContext: nn,
      useEffect: xs,
      useImperativeHandle: df,
      useInsertionEffect: sf,
      useLayoutEffect: uf,
      useMemo: mf,
      useReducer: wl,
      useRef: of ,
      useState: function() {
          return wl(Gr)
      },
      useDebugValue: Ns,
      useDeferredValue: function(e) {
          var n = tn();
          return ke === null ? n.memoizedState = e : pf(n, ke.memoizedState, e)
      },
      useTransition: function() {
          var e = wl(Gr)[0],
              n = tn().memoizedState;
          return [e, n]
      },
      useMutableSource: Dd,
      useSyncExternalStore: ef,
      useId: hf,
      unstable_isNewReconciler: !1
  };

function Dt(e, n) {
  try {
      var t = "",
          r = n;
      do t += lp(r), r = r.return; while (r);
      var i = t
  } catch (a) {
      i = `
Error generating stack: ` + a.message + `
` + a.stack
  }
  return {
      value: e,
      source: n,
      stack: i,
      digest: null
  }
}

function kl(e, n, t) {
  return {
      value: e,
      source: null,
      stack: t != null ? t : null,
      digest: n != null ? n : null
  }
}

function mo(e, n) {
  try {
      console.error(n.value)
  } catch (t) {
      setTimeout(function() {
          throw t
      })
  }
}
var Lh = typeof WeakMap == "function" ? WeakMap : Map;

function wf(e, n, t) {
  t = Sn(-1, t), t.tag = 3, t.payload = {
      element: null
  };
  var r = n.value;
  return t.callback = function() {
      ka || (ka = !0, So = r), mo(e, n)
  }, t
}

function kf(e, n, t) {
  t = Sn(-1, t), t.tag = 3;
  var r = e.type.getDerivedStateFromError;
  if (typeof r == "function") {
      var i = n.value;
      t.payload = function() {
          return r(i)
      }, t.callback = function() {
          mo(e, n)
      }
  }
  var a = e.stateNode;
  return a !== null && typeof a.componentDidCatch == "function" && (t.callback = function() {
      mo(e, n), typeof r != "function" && (Qn === null ? Qn = new Set([this]) : Qn.add(this));
      var l = n.stack;
      this.componentDidCatch(n.value, {
          componentStack: l !== null ? l : ""
      })
  }), t
}

function Bu(e, n, t) {
  var r = e.pingCache;
  if (r === null) {
      r = e.pingCache = new Lh;
      var i = new Set;
      r.set(n, i)
  } else i = r.get(n), i === void 0 && (i = new Set, r.set(n, i));
  i.has(t) || (i.add(t), e = Qh.bind(null, e, n, t), n.then(e, e))
}

function Vu(e) {
  do {
      var n;
      if ((n = e.tag === 13) && (n = e.memoizedState, n = n !== null ? n.dehydrated !== null : !0), n) return e;
      e = e.return
  } while (e !== null);
  return null
}

function $u(e, n, t, r, i) {
  return (e.mode & 1) === 0 ? (e === n ? e.flags |= 65536 : (e.flags |= 128, t.flags |= 131072, t.flags &= -52805, t.tag === 1 && (t.alternate === null ? t.tag = 17 : (n = Sn(-1, 1), n.tag = 2, Gn(t, n, 1))), t.lanes |= 1), e) : (e.flags |= 65536, e.lanes = i, e)
}
var jh = Tn.ReactCurrentOwner,
  Be = !1;

function Ie(e, n, t, r) {
  n.child = e === null ? Jd(n, null, t, r) : Jt(n, e.child, t, r)
}

function Wu(e, n, t, r, i) {
  t = t.render;
  var a = n.ref;
  return Yt(n, i), r = ws(e, n, t, r, a, i), t = ks(), e !== null && !Be ? (n.updateQueue = e.updateQueue, n.flags &= -2053, e.lanes &= ~i, Pn(e, n, i)) : (fe && t && os(n), n.flags |= 1, Ie(e, n, r, i), n.child)
}

function Hu(e, n, t, r, i) {
  if (e === null) {
      var a = t.type;
      return typeof a == "function" && !Os(a) && a.defaultProps === void 0 && t.compare === null && t.defaultProps === void 0 ? (n.tag = 15, n.type = a, xf(e, n, a, r, i)) : (e = Ji(t.type, null, r, n, n.mode, i), e.ref = n.ref, e.return = n, n.child = e)
  }
  if (a = e.child, (e.lanes & i) === 0) {
      var l = a.memoizedProps;
      if (t = t.compare, t = t !== null ? t : Ur, t(l, r) && e.ref === n.ref) return Pn(e, n, i)
  }
  return n.flags |= 1, e = Zn(a, r), e.ref = n.ref, e.return = n, n.child = e
}

function xf(e, n, t, r, i) {
  if (e !== null) {
      var a = e.memoizedProps;
      if (Ur(a, r) && e.ref === n.ref)
          if (Be = !1, n.pendingProps = r = a, (e.lanes & i) !== 0)(e.flags & 131072) !== 0 && (Be = !0);
          else return n.lanes = e.lanes, Pn(e, n, i)
  }
  return po(e, n, t, r, i)
}

function Nf(e, n, t) {
  var r = n.pendingProps,
      i = r.children,
      a = e !== null ? e.memoizedState : null;
  if (r.mode === "hidden")
      if ((n.mode & 1) === 0) n.memoizedState = {
          baseLanes: 0,
          cachePool: null,
          transitions: null
      }, ae(Rt, He), He |= t;
      else {
          if ((t & 1073741824) === 0) return e = a !== null ? a.baseLanes | t : t, n.lanes = n.childLanes = 1073741824, n.memoizedState = {
              baseLanes: e,
              cachePool: null,
              transitions: null
          }, n.updateQueue = null, ae(Rt, He), He |= e, null;
          n.memoizedState = {
              baseLanes: 0,
              cachePool: null,
              transitions: null
          }, r = a !== null ? a.baseLanes : t, ae(Rt, He), He |= r
      }
  else a !== null ? (r = a.baseLanes | t, n.memoizedState = null) : r = t, ae(Rt, He), He |= r;
  return Ie(e, n, i, t), n.child
}

function Sf(e, n) {
  var t = n.ref;
  (e === null && t !== null || e !== null && e.ref !== t) && (n.flags |= 512, n.flags |= 2097152)
}

function po(e, n, t, r, i) {
  var a = $e(t) ? pt : Le.current;
  return a = Zt(n, a), Yt(n, i), t = ws(e, n, t, r, a, i), r = ks(), e !== null && !Be ? (n.updateQueue = e.updateQueue, n.flags &= -2053, e.lanes &= ~i, Pn(e, n, i)) : (fe && r && os(n), n.flags |= 1, Ie(e, n, t, i), n.child)
}

function Yu(e, n, t, r, i) {
  if ($e(t)) {
      var a = !0;
      ca(n)
  } else a = !1;
  if (Yt(n, i), n.stateNode === null) Ki(e, n), Zd(n, t, r), fo(n, t, r, i), r = !0;
  else if (e === null) {
      var l = n.stateNode,
          s = n.memoizedProps;
      l.props = s;
      var u = l.context,
          c = t.contextType;
      typeof c == "object" && c !== null ? c = nn(c) : (c = $e(t) ? pt : Le.current, c = Zt(n, c));
      var h = t.getDerivedStateFromProps,
          g = typeof h == "function" || typeof l.getSnapshotBeforeUpdate == "function";
      g || typeof l.UNSAFE_componentWillReceiveProps != "function" && typeof l.componentWillReceiveProps != "function" || (s !== r || u !== c) && Mu(n, l, r, c), Mn = !1;
      var y = n.memoizedState;
      l.state = y, ha(n, r, l, i), u = n.memoizedState, s !== r || y !== u || Ve.current || Mn ? (typeof h == "function" && (co(n, t, h, r), u = n.memoizedState), (s = Mn || Iu(n, t, s, r, y, u, c)) ? (g || typeof l.UNSAFE_componentWillMount != "function" && typeof l.componentWillMount != "function" || (typeof l.componentWillMount == "function" && l.componentWillMount(), typeof l.UNSAFE_componentWillMount == "function" && l.UNSAFE_componentWillMount()), typeof l.componentDidMount == "function" && (n.flags |= 4194308)) : (typeof l.componentDidMount == "function" && (n.flags |= 4194308), n.memoizedProps = r, n.memoizedState = u), l.props = r, l.state = u, l.context = c, r = s) : (typeof l.componentDidMount == "function" && (n.flags |= 4194308), r = !1)
  } else {
      l = n.stateNode, Qd(e, n), s = n.memoizedProps, c = n.type === n.elementType ? s : ln(n.type, s), l.props = c, g = n.pendingProps, y = l.context, u = t.contextType, typeof u == "object" && u !== null ? u = nn(u) : (u = $e(t) ? pt : Le.current, u = Zt(n, u));
      var k = t.getDerivedStateFromProps;
      (h = typeof k == "function" || typeof l.getSnapshotBeforeUpdate == "function") || typeof l.UNSAFE_componentWillReceiveProps != "function" && typeof l.componentWillReceiveProps != "function" || (s !== g || y !== u) && Mu(n, l, r, u), Mn = !1, y = n.memoizedState, l.state = y, ha(n, r, l, i);
      var E = n.memoizedState;
      s !== g || y !== E || Ve.current || Mn ? (typeof k == "function" && (co(n, t, k, r), E = n.memoizedState), (c = Mn || Iu(n, t, c, r, y, E, u) || !1) ? (h || typeof l.UNSAFE_componentWillUpdate != "function" && typeof l.componentWillUpdate != "function" || (typeof l.componentWillUpdate == "function" && l.componentWillUpdate(r, E, u), typeof l.UNSAFE_componentWillUpdate == "function" && l.UNSAFE_componentWillUpdate(r, E, u)), typeof l.componentDidUpdate == "function" && (n.flags |= 4), typeof l.getSnapshotBeforeUpdate == "function" && (n.flags |= 1024)) : (typeof l.componentDidUpdate != "function" || s === e.memoizedProps && y === e.memoizedState || (n.flags |= 4), typeof l.getSnapshotBeforeUpdate != "function" || s === e.memoizedProps && y === e.memoizedState || (n.flags |= 1024), n.memoizedProps = r, n.memoizedState = E), l.props = r, l.state = E, l.context = u, r = c) : (typeof l.componentDidUpdate != "function" || s === e.memoizedProps && y === e.memoizedState || (n.flags |= 4), typeof l.getSnapshotBeforeUpdate != "function" || s === e.memoizedProps && y === e.memoizedState || (n.flags |= 1024), r = !1)
  }
  return ho(e, n, t, r, a, i)
}

function ho(e, n, t, r, i, a) {
  Sf(e, n);
  var l = (n.flags & 128) !== 0;
  if (!r && !l) return i && Ou(n, t, !1), Pn(e, n, a);
  r = n.stateNode, jh.current = n;
  var s = l && typeof t.getDerivedStateFromError != "function" ? null : r.render();
  return n.flags |= 1, e !== null && l ? (n.child = Jt(n, e.child, null, a), n.child = Jt(n, null, s, a)) : Ie(e, n, s, a), n.memoizedState = r.state, i && Ou(n, t, !0), n.child
}

function Ef(e) {
  var n = e.stateNode;
  n.pendingContext ? _u(e, n.pendingContext, n.pendingContext !== n.context) : n.context && _u(e, n.context, !1), hs(e, n.containerInfo)
}

function Gu(e, n, t, r, i) {
  return Xt(), us(i), n.flags |= 256, Ie(e, n, t, r), n.child
}
var vo = {
  dehydrated: null,
  treeContext: null,
  retryLane: 0
};

function go(e) {
  return {
      baseLanes: e,
      cachePool: null,
      transitions: null
  }
}

function Cf(e, n, t) {
  var r = n.pendingProps,
      i = me.current,
      a = !1,
      l = (n.flags & 128) !== 0,
      s;
  if ((s = l) || (s = e !== null && e.memoizedState === null ? !1 : (i & 2) !== 0), s ? (a = !0, n.flags &= -129) : (e === null || e.memoizedState !== null) && (i |= 1), ae(me, i & 1), e === null) return so(n), e = n.memoizedState, e !== null && (e = e.dehydrated, e !== null) ? ((n.mode & 1) === 0 ? n.lanes = 1 : e.data === "$!" ? n.lanes = 8 : n.lanes = 1073741824, null) : (l = r.children, e = r.fallback, a ? (r = n.mode, a = n.child, l = {
      mode: "hidden",
      children: l
  }, (r & 1) === 0 && a !== null ? (a.childLanes = 0, a.pendingProps = l) : a = Ba(l, r, 0, null), e = mt(e, r, t, null), a.return = n, e.return = n, a.sibling = e, n.child = a, n.child.memoizedState = go(t), n.memoizedState = vo, e) : Ss(n, l));
  if (i = e.memoizedState, i !== null && (s = i.dehydrated, s !== null)) return Ih(e, n, l, r, s, i, t);
  if (a) {
      a = r.fallback, l = n.mode, i = e.child, s = i.sibling;
      var u = {
          mode: "hidden",
          children: r.children
      };
      return (l & 1) === 0 && n.child !== i ? (r = n.child, r.childLanes = 0, r.pendingProps = u, n.deletions = null) : (r = Zn(i, u), r.subtreeFlags = i.subtreeFlags & 14680064), s !== null ? a = Zn(s, a) : (a = mt(a, l, t, null), a.flags |= 2), a.return = n, r.return = n, r.sibling = a, n.child = r, r = a, a = n.child, l = e.child.memoizedState, l = l === null ? go(t) : {
          baseLanes: l.baseLanes | t,
          cachePool: null,
          transitions: l.transitions
      }, a.memoizedState = l, a.childLanes = e.childLanes & ~t, n.memoizedState = vo, r
  }
  return a = e.child, e = a.sibling, r = Zn(a, {
      mode: "visible",
      children: r.children
  }), (n.mode & 1) === 0 && (r.lanes = t), r.return = n, r.sibling = null, e !== null && (t = n.deletions, t === null ? (n.deletions = [e], n.flags |= 16) : t.push(e)), n.child = r, n.memoizedState = null, r
}

function Ss(e, n) {
  return n = Ba({
      mode: "visible",
      children: n
  }, e.mode, 0, null), n.return = e, e.child = n
}

function Ci(e, n, t, r) {
  return r !== null && us(r), Jt(n, e.child, null, t), e = Ss(n, n.pendingProps.children), e.flags |= 2, n.memoizedState = null, e
}

function Ih(e, n, t, r, i, a, l) {
  if (t) return n.flags & 256 ? (n.flags &= -257, r = kl(Error(A(422))), Ci(e, n, l, r)) : n.memoizedState !== null ? (n.child = e.child, n.flags |= 128, null) : (a = r.fallback, i = n.mode, r = Ba({
      mode: "visible",
      children: r.children
  }, i, 0, null), a = mt(a, i, l, null), a.flags |= 2, r.return = n, a.return = n, r.sibling = a, n.child = r, (n.mode & 1) !== 0 && Jt(n, e.child, null, l), n.child.memoizedState = go(l), n.memoizedState = vo, a);
  if ((n.mode & 1) === 0) return Ci(e, n, l, null);
  if (i.data === "$!") {
      if (r = i.nextSibling && i.nextSibling.dataset, r) var s = r.dgst;
      return r = s, a = Error(A(419)), r = kl(a, r, void 0), Ci(e, n, l, r)
  }
  if (s = (l & e.childLanes) !== 0, Be || s) {
      if (r = Ce, r !== null) {
          switch (l & -l) {
              case 4:
                  i = 2;
                  break;
              case 16:
                  i = 8;
                  break;
              case 64:
              case 128:
              case 256:
              case 512:
              case 1024:
              case 2048:
              case 4096:
              case 8192:
              case 16384:
              case 32768:
              case 65536:
              case 131072:
              case 262144:
              case 524288:
              case 1048576:
              case 2097152:
              case 4194304:
              case 8388608:
              case 16777216:
              case 33554432:
              case 67108864:
                  i = 32;
                  break;
              case 536870912:
                  i = 268435456;
                  break;
              default:
                  i = 0
          }
          i = (i & (r.suspendedLanes | l)) !== 0 ? 0 : i, i !== 0 && i !== a.retryLane && (a.retryLane = i, bn(e, i), dn(r, e, i, -1))
      }
      return _s(), r = kl(Error(A(421))), Ci(e, n, l, r)
  }
  return i.data === "$?" ? (n.flags |= 128, n.child = e.child, n = Kh.bind(null, e), i._reactRetry = n, null) : (e = a.treeContext, Ye = Yn(i.nextSibling), Ge = n, fe = !0, sn = null, e !== null && (Je[qe++] = xn, Je[qe++] = Nn, Je[qe++] = ht, xn = e.id, Nn = e.overflow, ht = n), n = Ss(n, r.children), n.flags |= 4096, n)
}

function Qu(e, n, t) {
  e.lanes |= n;
  var r = e.alternate;
  r !== null && (r.lanes |= n), uo(e.return, n, t)
}

function xl(e, n, t, r, i) {
  var a = e.memoizedState;
  a === null ? e.memoizedState = {
      isBackwards: n,
      rendering: null,
      renderingStartTime: 0,
      last: r,
      tail: t,
      tailMode: i
  } : (a.isBackwards = n, a.rendering = null, a.renderingStartTime = 0, a.last = r, a.tail = t, a.tailMode = i)
}

function bf(e, n, t) {
  var r = n.pendingProps,
      i = r.revealOrder,
      a = r.tail;
  if (Ie(e, n, r.children, t), r = me.current, (r & 2) !== 0) r = r & 1 | 2, n.flags |= 128;
  else {
      if (e !== null && (e.flags & 128) !== 0) e: for (e = n.child; e !== null;) {
          if (e.tag === 13) e.memoizedState !== null && Qu(e, t, n);
          else if (e.tag === 19) Qu(e, t, n);
          else if (e.child !== null) {
              e.child.return = e, e = e.child;
              continue
          }
          if (e === n) break e;
          for (; e.sibling === null;) {
              if (e.return === null || e.return === n) break e;
              e = e.return
          }
          e.sibling.return = e.return, e = e.sibling
      }
      r &= 1
  }
  if (ae(me, r), (n.mode & 1) === 0) n.memoizedState = null;
  else switch (i) {
      case "forwards":
          for (t = n.child, i = null; t !== null;) e = t.alternate, e !== null && va(e) === null && (i = t), t = t.sibling;
          t = i, t === null ? (i = n.child, n.child = null) : (i = t.sibling, t.sibling = null), xl(n, !1, i, t, a);
          break;
      case "backwards":
          for (t = null, i = n.child, n.child = null; i !== null;) {
              if (e = i.alternate, e !== null && va(e) === null) {
                  n.child = i;
                  break
              }
              e = i.sibling, i.sibling = t, t = i, i = e
          }
          xl(n, !0, t, null, a);
          break;
      case "together":
          xl(n, !1, null, null, void 0);
          break;
      default:
          n.memoizedState = null
  }
  return n.child
}

function Ki(e, n) {
  (n.mode & 1) === 0 && e !== null && (e.alternate = null, n.alternate = null, n.flags |= 2)
}

function Pn(e, n, t) {
  if (e !== null && (n.dependencies = e.dependencies), gt |= n.lanes, (t & n.childLanes) === 0) return null;
  if (e !== null && n.child !== e.child) throw Error(A(153));
  if (n.child !== null) {
      for (e = n.child, t = Zn(e, e.pendingProps), n.child = t, t.return = n; e.sibling !== null;) e = e.sibling, t = t.sibling = Zn(e, e.pendingProps), t.return = n;
      t.sibling = null
  }
  return n.child
}

function Mh(e, n, t) {
  switch (n.tag) {
      case 3:
          Ef(n), Xt();
          break;
      case 5:
          qd(n);
          break;
      case 1:
          $e(n.type) && ca(n);
          break;
      case 4:
          hs(n, n.stateNode.containerInfo);
          break;
      case 10:
          var r = n.type._context,
              i = n.memoizedProps.value;
          ae(ma, r._currentValue), r._currentValue = i;
          break;
      case 13:
          if (r = n.memoizedState, r !== null) return r.dehydrated !== null ? (ae(me, me.current & 1), n.flags |= 128, null) : (t & n.child.childLanes) !== 0 ? Cf(e, n, t) : (ae(me, me.current & 1), e = Pn(e, n, t), e !== null ? e.sibling : null);
          ae(me, me.current & 1);
          break;
      case 19:
          if (r = (t & n.childLanes) !== 0, (e.flags & 128) !== 0) {
              if (r) return bf(e, n, t);
              n.flags |= 128
          }
          if (i = n.memoizedState, i !== null && (i.rendering = null, i.tail = null, i.lastEffect = null), ae(me, me.current), r) break;
          return null;
      case 22:
      case 23:
          return n.lanes = 0, Nf(e, n, t)
  }
  return Pn(e, n, t)
}
var Pf, yo, zf, _f;
Pf = function(e, n) {
  for (var t = n.child; t !== null;) {
      if (t.tag === 5 || t.tag === 6) e.appendChild(t.stateNode);
      else if (t.tag !== 4 && t.child !== null) {
          t.child.return = t, t = t.child;
          continue
      }
      if (t === n) break;
      for (; t.sibling === null;) {
          if (t.return === null || t.return === n) return;
          t = t.return
      }
      t.sibling.return = t.return, t = t.sibling
  }
};
yo = function() {};
zf = function(e, n, t, r) {
  var i = e.memoizedProps;
  if (i !== r) {
      e = n.stateNode, ut(yn.current);
      var a = null;
      switch (t) {
          case "input":
              i = Ul(e, i), r = Ul(e, r), a = [];
              break;
          case "select":
              i = he({}, i, {
                  value: void 0
              }), r = he({}, r, {
                  value: void 0
              }), a = [];
              break;
          case "textarea":
              i = $l(e, i), r = $l(e, r), a = [];
              break;
          default:
              typeof i.onClick != "function" && typeof r.onClick == "function" && (e.onclick = sa)
      }
      Hl(t, r);
      var l;
      t = null;
      for (c in i)
          if (!r.hasOwnProperty(c) && i.hasOwnProperty(c) && i[c] != null)
              if (c === "style") {
                  var s = i[c];
                  for (l in s) s.hasOwnProperty(l) && (t || (t = {}), t[l] = "")
              } else c !== "dangerouslySetInnerHTML" && c !== "children" && c !== "suppressContentEditableWarning" && c !== "suppressHydrationWarning" && c !== "autoFocus" && (Ar.hasOwnProperty(c) ? a || (a = []) : (a = a || []).push(c, null));
      for (c in r) {
          var u = r[c];
          if (s = i != null ? i[c] : void 0, r.hasOwnProperty(c) && u !== s && (u != null || s != null))
              if (c === "style")
                  if (s) {
                      for (l in s) !s.hasOwnProperty(l) || u && u.hasOwnProperty(l) || (t || (t = {}), t[l] = "");
                      for (l in u) u.hasOwnProperty(l) && s[l] !== u[l] && (t || (t = {}), t[l] = u[l])
                  } else t || (a || (a = []), a.push(c, t)), t = u;
          else c === "dangerouslySetInnerHTML" ? (u = u ? u.__html : void 0, s = s ? s.__html : void 0, u != null && s !== u && (a = a || []).push(c, u)) : c === "children" ? typeof u != "string" && typeof u != "number" || (a = a || []).push(c, "" + u) : c !== "suppressContentEditableWarning" && c !== "suppressHydrationWarning" && (Ar.hasOwnProperty(c) ? (u != null && c === "onScroll" && le("scroll", e), a || s === u || (a = [])) : (a = a || []).push(c, u))
      }
      t && (a = a || []).push("style", t);
      var c = a;
      (n.updateQueue = c) && (n.flags |= 4)
  }
};
_f = function(e, n, t, r) {
  t !== r && (n.flags |= 4)
};

function pr(e, n) {
  if (!fe) switch (e.tailMode) {
      case "hidden":
          n = e.tail;
          for (var t = null; n !== null;) n.alternate !== null && (t = n), n = n.sibling;
          t === null ? e.tail = null : t.sibling = null;
          break;
      case "collapsed":
          t = e.tail;
          for (var r = null; t !== null;) t.alternate !== null && (r = t), t = t.sibling;
          r === null ? n || e.tail === null ? e.tail = null : e.tail.sibling = null : r.sibling = null
  }
}

function Te(e) {
  var n = e.alternate !== null && e.alternate.child === e.child,
      t = 0,
      r = 0;
  if (n)
      for (var i = e.child; i !== null;) t |= i.lanes | i.childLanes, r |= i.subtreeFlags & 14680064, r |= i.flags & 14680064, i.return = e, i = i.sibling;
  else
      for (i = e.child; i !== null;) t |= i.lanes | i.childLanes, r |= i.subtreeFlags, r |= i.flags, i.return = e, i = i.sibling;
  return e.subtreeFlags |= r, e.childLanes = t, n
}

function Rh(e, n, t) {
  var r = n.pendingProps;
  switch (ss(n), n.tag) {
      case 2:
      case 16:
      case 15:
      case 0:
      case 11:
      case 7:
      case 8:
      case 12:
      case 9:
      case 14:
          return Te(n), null;
      case 1:
          return $e(n.type) && ua(), Te(n), null;
      case 3:
          return r = n.stateNode, qt(), se(Ve), se(Le), gs(), r.pendingContext && (r.context = r.pendingContext, r.pendingContext = null), (e === null || e.child === null) && (Si(n) ? n.flags |= 4 : e === null || e.memoizedState.isDehydrated && (n.flags & 256) === 0 || (n.flags |= 1024, sn !== null && (bo(sn), sn = null))), yo(e, n), Te(n), null;
      case 5:
          vs(n);
          var i = ut(Hr.current);
          if (t = n.type, e !== null && n.stateNode != null) zf(e, n, t, r, i), e.ref !== n.ref && (n.flags |= 512, n.flags |= 2097152);
          else {
              if (!r) {
                  if (n.stateNode === null) throw Error(A(166));
                  return Te(n), null
              }
              if (e = ut(yn.current), Si(n)) {
                  r = n.stateNode, t = n.type;
                  var a = n.memoizedProps;
                  switch (r[hn] = n, r[$r] = a, e = (n.mode & 1) !== 0, t) {
                      case "dialog":
                          le("cancel", r), le("close", r);
                          break;
                      case "iframe":
                      case "object":
                      case "embed":
                          le("load", r);
                          break;
                      case "video":
                      case "audio":
                          for (i = 0; i < wr.length; i++) le(wr[i], r);
                          break;
                      case "source":
                          le("error", r);
                          break;
                      case "img":
                      case "image":
                      case "link":
                          le("error", r), le("load", r);
                          break;
                      case "details":
                          le("toggle", r);
                          break;
                      case "input":
                          tu(r, a), le("invalid", r);
                          break;
                      case "select":
                          r._wrapperState = {
                              wasMultiple: !!a.multiple
                          }, le("invalid", r);
                          break;
                      case "textarea":
                          iu(r, a), le("invalid", r)
                  }
                  Hl(t, a), i = null;
                  for (var l in a)
                      if (a.hasOwnProperty(l)) {
                          var s = a[l];
                          l === "children" ? typeof s == "string" ? r.textContent !== s && (a.suppressHydrationWarning !== !0 && Ni(r.textContent, s, e), i = ["children", s]) : typeof s == "number" && r.textContent !== "" + s && (a.suppressHydrationWarning !== !0 && Ni(r.textContent, s, e), i = ["children", "" + s]) : Ar.hasOwnProperty(l) && s != null && l === "onScroll" && le("scroll", r)
                      } switch (t) {
                      case "input":
                          pi(r), ru(r, a, !0);
                          break;
                      case "textarea":
                          pi(r), au(r);
                          break;
                      case "select":
                      case "option":
                          break;
                      default:
                          typeof a.onClick == "function" && (r.onclick = sa)
                  }
                  r = i, n.updateQueue = r, r !== null && (n.flags |= 4)
              } else {
                  l = i.nodeType === 9 ? i : i.ownerDocument, e === "http://www.w3.org/1999/xhtml" && (e = nd(t)), e === "http://www.w3.org/1999/xhtml" ? t === "script" ? (e = l.createElement("div"), e.innerHTML = "<script><\/script>", e = e.removeChild(e.firstChild)) : typeof r.is == "string" ? e = l.createElement(t, {
                      is: r.is
                  }) : (e = l.createElement(t), t === "select" && (l = e, r.multiple ? l.multiple = !0 : r.size && (l.size = r.size))) : e = l.createElementNS(e, t), e[hn] = n, e[$r] = r, Pf(e, n, !1, !1), n.stateNode = e;
                  e: {
                      switch (l = Yl(t, r), t) {
                          case "dialog":
                              le("cancel", e), le("close", e), i = r;
                              break;
                          case "iframe":
                          case "object":
                          case "embed":
                              le("load", e), i = r;
                              break;
                          case "video":
                          case "audio":
                              for (i = 0; i < wr.length; i++) le(wr[i], e);
                              i = r;
                              break;
                          case "source":
                              le("error", e), i = r;
                              break;
                          case "img":
                          case "image":
                          case "link":
                              le("error", e), le("load", e), i = r;
                              break;
                          case "details":
                              le("toggle", e), i = r;
                              break;
                          case "input":
                              tu(e, r), i = Ul(e, r), le("invalid", e);
                              break;
                          case "option":
                              i = r;
                              break;
                          case "select":
                              e._wrapperState = {
                                  wasMultiple: !!r.multiple
                              }, i = he({}, r, {
                                  value: void 0
                              }), le("invalid", e);
                              break;
                          case "textarea":
                              iu(e, r), i = $l(e, r), le("invalid", e);
                              break;
                          default:
                              i = r
                      }
                      Hl(t, i),
                      s = i;
                      for (a in s)
                          if (s.hasOwnProperty(a)) {
                              var u = s[a];
                              a === "style" ? id(e, u) : a === "dangerouslySetInnerHTML" ? (u = u ? u.__html : void 0, u != null && td(e, u)) : a === "children" ? typeof u == "string" ? (t !== "textarea" || u !== "") && Lr(e, u) : typeof u == "number" && Lr(e, "" + u) : a !== "suppressContentEditableWarning" && a !== "suppressHydrationWarning" && a !== "autoFocus" && (Ar.hasOwnProperty(a) ? u != null && a === "onScroll" && le("scroll", e) : u != null && Qo(e, a, u, l))
                          } switch (t) {
                          case "input":
                              pi(e), ru(e, r, !1);
                              break;
                          case "textarea":
                              pi(e), au(e);
                              break;
                          case "option":
                              r.value != null && e.setAttribute("value", "" + Xn(r.value));
                              break;
                          case "select":
                              e.multiple = !!r.multiple, a = r.value, a != null ? Vt(e, !!r.multiple, a, !1) : r.defaultValue != null && Vt(e, !!r.multiple, r.defaultValue, !0);
                              break;
                          default:
                              typeof i.onClick == "function" && (e.onclick = sa)
                      }
                      switch (t) {
                          case "button":
                          case "input":
                          case "select":
                          case "textarea":
                              r = !!r.autoFocus;
                              break e;
                          case "img":
                              r = !0;
                              break e;
                          default:
                              r = !1
                      }
                  }
                  r && (n.flags |= 4)
              }
              n.ref !== null && (n.flags |= 512, n.flags |= 2097152)
          }
          return Te(n), null;
      case 6:
          if (e && n.stateNode != null) _f(e, n, e.memoizedProps, r);
          else {
              if (typeof r != "string" && n.stateNode === null) throw Error(A(166));
              if (t = ut(Hr.current), ut(yn.current), Si(n)) {
                  if (r = n.stateNode, t = n.memoizedProps, r[hn] = n, (a = r.nodeValue !== t) && (e = Ge, e !== null)) switch (e.tag) {
                      case 3:
                          Ni(r.nodeValue, t, (e.mode & 1) !== 0);
                          break;
                      case 5:
                          e.memoizedProps.suppressHydrationWarning !== !0 && Ni(r.nodeValue, t, (e.mode & 1) !== 0)
                  }
                  a && (n.flags |= 4)
              } else r = (t.nodeType === 9 ? t : t.ownerDocument).createTextNode(r), r[hn] = n, n.stateNode = r
          }
          return Te(n), null;
      case 13:
          if (se(me), r = n.memoizedState, e === null || e.memoizedState !== null && e.memoizedState.dehydrated !== null) {
              if (fe && Ye !== null && (n.mode & 1) !== 0 && (n.flags & 128) === 0) Yd(), Xt(), n.flags |= 98560, a = !1;
              else if (a = Si(n), r !== null && r.dehydrated !== null) {
                  if (e === null) {
                      if (!a) throw Error(A(318));
                      if (a = n.memoizedState, a = a !== null ? a.dehydrated : null, !a) throw Error(A(317));
                      a[hn] = n
                  } else Xt(), (n.flags & 128) === 0 && (n.memoizedState = null), n.flags |= 4;
                  Te(n), a = !1
              } else sn !== null && (bo(sn), sn = null), a = !0;
              if (!a) return n.flags & 65536 ? n : null
          }
          return (n.flags & 128) !== 0 ? (n.lanes = t, n) : (r = r !== null, r !== (e !== null && e.memoizedState !== null) && r && (n.child.flags |= 8192, (n.mode & 1) !== 0 && (e === null || (me.current & 1) !== 0 ? xe === 0 && (xe = 3) : _s())), n.updateQueue !== null && (n.flags |= 4), Te(n), null);
      case 4:
          return qt(), yo(e, n), e === null && Br(n.stateNode.containerInfo), Te(n), null;
      case 10:
          return fs(n.type._context), Te(n), null;
      case 17:
          return $e(n.type) && ua(), Te(n), null;
      case 19:
          if (se(me), a = n.memoizedState, a === null) return Te(n), null;
          if (r = (n.flags & 128) !== 0, l = a.rendering, l === null)
              if (r) pr(a, !1);
              else {
                  if (xe !== 0 || e !== null && (e.flags & 128) !== 0)
                      for (e = n.child; e !== null;) {
                          if (l = va(e), l !== null) {
                              for (n.flags |= 128, pr(a, !1), r = l.updateQueue, r !== null && (n.updateQueue = r, n.flags |= 4), n.subtreeFlags = 0, r = t, t = n.child; t !== null;) a = t, e = r, a.flags &= 14680066, l = a.alternate, l === null ? (a.childLanes = 0, a.lanes = e, a.child = null, a.subtreeFlags = 0, a.memoizedProps = null, a.memoizedState = null, a.updateQueue = null, a.dependencies = null, a.stateNode = null) : (a.childLanes = l.childLanes, a.lanes = l.lanes, a.child = l.child, a.subtreeFlags = 0, a.deletions = null, a.memoizedProps = l.memoizedProps, a.memoizedState = l.memoizedState, a.updateQueue = l.updateQueue, a.type = l.type, e = l.dependencies, a.dependencies = e === null ? null : {
                                  lanes: e.lanes,
                                  firstContext: e.firstContext
                              }), t = t.sibling;
                              return ae(me, me.current & 1 | 2), n.child
                          }
                          e = e.sibling
                      }
                  a.tail !== null && ye() > er && (n.flags |= 128, r = !0, pr(a, !1), n.lanes = 4194304)
              }
          else {
              if (!r)
                  if (e = va(l), e !== null) {
                      if (n.flags |= 128, r = !0, t = e.updateQueue, t !== null && (n.updateQueue = t, n.flags |= 4), pr(a, !0), a.tail === null && a.tailMode === "hidden" && !l.alternate && !fe) return Te(n), null
                  } else 2 * ye() - a.renderingStartTime > er && t !== 1073741824 && (n.flags |= 128, r = !0, pr(a, !1), n.lanes = 4194304);
              a.isBackwards ? (l.sibling = n.child, n.child = l) : (t = a.last, t !== null ? t.sibling = l : n.child = l, a.last = l)
          }
          return a.tail !== null ? (n = a.tail, a.rendering = n, a.tail = n.sibling, a.renderingStartTime = ye(), n.sibling = null, t = me.current, ae(me, r ? t & 1 | 2 : t & 1), n) : (Te(n), null);
      case 22:
      case 23:
          return zs(), r = n.memoizedState !== null, e !== null && e.memoizedState !== null !== r && (n.flags |= 8192), r && (n.mode & 1) !== 0 ? (He & 1073741824) !== 0 && (Te(n), n.subtreeFlags & 6 && (n.flags |= 8192)) : Te(n), null;
      case 24:
          return null;
      case 25:
          return null
  }
  throw Error(A(156, n.tag))
}

function Fh(e, n) {
  switch (ss(n), n.tag) {
      case 1:
          return $e(n.type) && ua(), e = n.flags, e & 65536 ? (n.flags = e & -65537 | 128, n) : null;
      case 3:
          return qt(), se(Ve), se(Le), gs(), e = n.flags, (e & 65536) !== 0 && (e & 128) === 0 ? (n.flags = e & -65537 | 128, n) : null;
      case 5:
          return vs(n), null;
      case 13:
          if (se(me), e = n.memoizedState, e !== null && e.dehydrated !== null) {
              if (n.alternate === null) throw Error(A(340));
              Xt()
          }
          return e = n.flags, e & 65536 ? (n.flags = e & -65537 | 128, n) : null;
      case 19:
          return se(me), null;
      case 4:
          return qt(), null;
      case 10:
          return fs(n.type._context), null;
      case 22:
      case 23:
          return zs(), null;
      case 24:
          return null;
      default:
          return null
  }
}
var bi = !1,
  Ae = !1,
  Uh = typeof WeakSet == "function" ? WeakSet : Set,
  F = null;

function Mt(e, n) {
  var t = e.ref;
  if (t !== null)
      if (typeof t == "function") try {
          t(null)
      } catch (r) {
          ve(e, n, r)
      } else t.current = null
}

function wo(e, n, t) {
  try {
      t()
  } catch (r) {
      ve(e, n, r)
  }
}
var Ku = !1;

function Bh(e, n) {
  if (no = aa, e = Ad(), ls(e)) {
      if ("selectionStart" in e) var t = {
          start: e.selectionStart,
          end: e.selectionEnd
      };
      else e: {
          t = (t = e.ownerDocument) && t.defaultView || window;
          var r = t.getSelection && t.getSelection();
          if (r && r.rangeCount !== 0) {
              t = r.anchorNode;
              var i = r.anchorOffset,
                  a = r.focusNode;
              r = r.focusOffset;
              try {
                  t.nodeType, a.nodeType
              } catch {
                  t = null;
                  break e
              }
              var l = 0,
                  s = -1,
                  u = -1,
                  c = 0,
                  h = 0,
                  g = e,
                  y = null;
              n: for (;;) {
                  for (var k; g !== t || i !== 0 && g.nodeType !== 3 || (s = l + i), g !== a || r !== 0 && g.nodeType !== 3 || (u = l + r), g.nodeType === 3 && (l += g.nodeValue.length), (k = g.firstChild) !== null;) y = g, g = k;
                  for (;;) {
                      if (g === e) break n;
                      if (y === t && ++c === i && (s = l), y === a && ++h === r && (u = l), (k = g.nextSibling) !== null) break;
                      g = y, y = g.parentNode
                  }
                  g = k
              }
              t = s === -1 || u === -1 ? null : {
                  start: s,
                  end: u
              }
          } else t = null
      }
      t = t || {
          start: 0,
          end: 0
      }
  } else t = null;
  for (to = {
          focusedElem: e,
          selectionRange: t
      }, aa = !1, F = n; F !== null;)
      if (n = F, e = n.child, (n.subtreeFlags & 1028) !== 0 && e !== null) e.return = n, F = e;
      else
          for (; F !== null;) {
              n = F;
              try {
                  var E = n.alternate;
                  if ((n.flags & 1024) !== 0) switch (n.tag) {
                      case 0:
                      case 11:
                      case 15:
                          break;
                      case 1:
                          if (E !== null) {
                              var C = E.memoizedProps,
                                  O = E.memoizedState,
                                  p = n.stateNode,
                                  f = p.getSnapshotBeforeUpdate(n.elementType === n.type ? C : ln(n.type, C), O);
                              p.__reactInternalSnapshotBeforeUpdate = f
                          }
                          break;
                      case 3:
                          var m = n.stateNode.containerInfo;
                          m.nodeType === 1 ? m.textContent = "" : m.nodeType === 9 && m.documentElement && m.removeChild(m.documentElement);
                          break;
                      case 5:
                      case 6:
                      case 4:
                      case 17:
                          break;
                      default:
                          throw Error(A(163))
                  }
              } catch (x) {
                  ve(n, n.return, x)
              }
              if (e = n.sibling, e !== null) {
                  e.return = n.return, F = e;
                  break
              }
              F = n.return
          }
  return E = Ku, Ku = !1, E
}

function Pr(e, n, t) {
  var r = n.updateQueue;
  if (r = r !== null ? r.lastEffect : null, r !== null) {
      var i = r = r.next;
      do {
          if ((i.tag & e) === e) {
              var a = i.destroy;
              i.destroy = void 0, a !== void 0 && wo(n, t, a)
          }
          i = i.next
      } while (i !== r)
  }
}

function Fa(e, n) {
  if (n = n.updateQueue, n = n !== null ? n.lastEffect : null, n !== null) {
      var t = n = n.next;
      do {
          if ((t.tag & e) === e) {
              var r = t.create;
              t.destroy = r()
          }
          t = t.next
      } while (t !== n)
  }
}

function ko(e) {
  var n = e.ref;
  if (n !== null) {
      var t = e.stateNode;
      switch (e.tag) {
          case 5:
              e = t;
              break;
          default:
              e = t
      }
      typeof n == "function" ? n(e) : n.current = e
  }
}

function Of(e) {
  var n = e.alternate;
  n !== null && (e.alternate = null, Of(n)), e.child = null, e.deletions = null, e.sibling = null, e.tag === 5 && (n = e.stateNode, n !== null && (delete n[hn], delete n[$r], delete n[ao], delete n[Nh], delete n[Sh])), e.stateNode = null, e.return = null, e.dependencies = null, e.memoizedProps = null, e.memoizedState = null, e.pendingProps = null, e.stateNode = null, e.updateQueue = null
}

function Tf(e) {
  return e.tag === 5 || e.tag === 3 || e.tag === 4
}

function Zu(e) {
  e: for (;;) {
      for (; e.sibling === null;) {
          if (e.return === null || Tf(e.return)) return null;
          e = e.return
      }
      for (e.sibling.return = e.return, e = e.sibling; e.tag !== 5 && e.tag !== 6 && e.tag !== 18;) {
          if (e.flags & 2 || e.child === null || e.tag === 4) continue e;
          e.child.return = e, e = e.child
      }
      if (!(e.flags & 2)) return e.stateNode
  }
}

function xo(e, n, t) {
  var r = e.tag;
  if (r === 5 || r === 6) e = e.stateNode, n ? t.nodeType === 8 ? t.parentNode.insertBefore(e, n) : t.insertBefore(e, n) : (t.nodeType === 8 ? (n = t.parentNode, n.insertBefore(e, t)) : (n = t, n.appendChild(e)), t = t._reactRootContainer, t != null || n.onclick !== null || (n.onclick = sa));
  else if (r !== 4 && (e = e.child, e !== null))
      for (xo(e, n, t), e = e.sibling; e !== null;) xo(e, n, t), e = e.sibling
}

function No(e, n, t) {
  var r = e.tag;
  if (r === 5 || r === 6) e = e.stateNode, n ? t.insertBefore(e, n) : t.appendChild(e);
  else if (r !== 4 && (e = e.child, e !== null))
      for (No(e, n, t), e = e.sibling; e !== null;) No(e, n, t), e = e.sibling
}
var Pe = null,
  on = !1;

function Ln(e, n, t) {
  for (t = t.child; t !== null;) Af(e, n, t), t = t.sibling
}

function Af(e, n, t) {
  if (gn && typeof gn.onCommitFiberUnmount == "function") try {
      gn.onCommitFiberUnmount(Oa, t)
  } catch {}
  switch (t.tag) {
      case 5:
          Ae || Mt(t, n);
      case 6:
          var r = Pe,
              i = on;
          Pe = null, Ln(e, n, t), Pe = r, on = i, Pe !== null && (on ? (e = Pe, t = t.stateNode, e.nodeType === 8 ? e.parentNode.removeChild(t) : e.removeChild(t)) : Pe.removeChild(t.stateNode));
          break;
      case 18:
          Pe !== null && (on ? (e = Pe, t = t.stateNode, e.nodeType === 8 ? pl(e.parentNode, t) : e.nodeType === 1 && pl(e, t), Rr(e)) : pl(Pe, t.stateNode));
          break;
      case 4:
          r = Pe, i = on, Pe = t.stateNode.containerInfo, on = !0, Ln(e, n, t), Pe = r, on = i;
          break;
      case 0:
      case 11:
      case 14:
      case 15:
          if (!Ae && (r = t.updateQueue, r !== null && (r = r.lastEffect, r !== null))) {
              i = r = r.next;
              do {
                  var a = i,
                      l = a.destroy;
                  a = a.tag, l !== void 0 && ((a & 2) !== 0 || (a & 4) !== 0) && wo(t, n, l), i = i.next
              } while (i !== r)
          }
          Ln(e, n, t);
          break;
      case 1:
          if (!Ae && (Mt(t, n), r = t.stateNode, typeof r.componentWillUnmount == "function")) try {
              r.props = t.memoizedProps, r.state = t.memoizedState, r.componentWillUnmount()
          } catch (s) {
              ve(t, n, s)
          }
          Ln(e, n, t);
          break;
      case 21:
          Ln(e, n, t);
          break;
      case 22:
          t.mode & 1 ? (Ae = (r = Ae) || t.memoizedState !== null, Ln(e, n, t), Ae = r) : Ln(e, n, t);
          break;
      default:
          Ln(e, n, t)
  }
}

function Xu(e) {
  var n = e.updateQueue;
  if (n !== null) {
      e.updateQueue = null;
      var t = e.stateNode;
      t === null && (t = e.stateNode = new Uh), n.forEach(function(r) {
          var i = Zh.bind(null, e, r);
          t.has(r) || (t.add(r), r.then(i, i))
      })
  }
}

function an(e, n) {
  var t = n.deletions;
  if (t !== null)
      for (var r = 0; r < t.length; r++) {
          var i = t[r];
          try {
              var a = e,
                  l = n,
                  s = l;
              e: for (; s !== null;) {
                  switch (s.tag) {
                      case 5:
                          Pe = s.stateNode, on = !1;
                          break e;
                      case 3:
                          Pe = s.stateNode.containerInfo, on = !0;
                          break e;
                      case 4:
                          Pe = s.stateNode.containerInfo, on = !0;
                          break e
                  }
                  s = s.return
              }
              if (Pe === null) throw Error(A(160));
              Af(a, l, i), Pe = null, on = !1;
              var u = i.alternate;
              u !== null && (u.return = null), i.return = null
          } catch (c) {
              ve(i, n, c)
          }
      }
  if (n.subtreeFlags & 12854)
      for (n = n.child; n !== null;) Lf(n, e), n = n.sibling
}

function Lf(e, n) {
  var t = e.alternate,
      r = e.flags;
  switch (e.tag) {
      case 0:
      case 11:
      case 14:
      case 15:
          if (an(n, e), mn(e), r & 4) {
              try {
                  Pr(3, e, e.return), Fa(3, e)
              } catch (C) {
                  ve(e, e.return, C)
              }
              try {
                  Pr(5, e, e.return)
              } catch (C) {
                  ve(e, e.return, C)
              }
          }
          break;
      case 1:
          an(n, e), mn(e), r & 512 && t !== null && Mt(t, t.return);
          break;
      case 5:
          if (an(n, e), mn(e), r & 512 && t !== null && Mt(t, t.return), e.flags & 32) {
              var i = e.stateNode;
              try {
                  Lr(i, "")
              } catch (C) {
                  ve(e, e.return, C)
              }
          }
          if (r & 4 && (i = e.stateNode, i != null)) {
              var a = e.memoizedProps,
                  l = t !== null ? t.memoizedProps : a,
                  s = e.type,
                  u = e.updateQueue;
              if (e.updateQueue = null, u !== null) try {
                  s === "input" && a.type === "radio" && a.name != null && Dc(i, a), Yl(s, l);
                  var c = Yl(s, a);
                  for (l = 0; l < u.length; l += 2) {
                      var h = u[l],
                          g = u[l + 1];
                      h === "style" ? id(i, g) : h === "dangerouslySetInnerHTML" ? td(i, g) : h === "children" ? Lr(i, g) : Qo(i, h, g, c)
                  }
                  switch (s) {
                      case "input":
                          Bl(i, a);
                          break;
                      case "textarea":
                          ed(i, a);
                          break;
                      case "select":
                          var y = i._wrapperState.wasMultiple;
                          i._wrapperState.wasMultiple = !!a.multiple;
                          var k = a.value;
                          k != null ? Vt(i, !!a.multiple, k, !1) : y !== !!a.multiple && (a.defaultValue != null ? Vt(i, !!a.multiple, a.defaultValue, !0) : Vt(i, !!a.multiple, a.multiple ? [] : "", !1))
                  }
                  i[$r] = a
              } catch (C) {
                  ve(e, e.return, C)
              }
          }
          break;
      case 6:
          if (an(n, e), mn(e), r & 4) {
              if (e.stateNode === null) throw Error(A(162));
              i = e.stateNode, a = e.memoizedProps;
              try {
                  i.nodeValue = a
              } catch (C) {
                  ve(e, e.return, C)
              }
          }
          break;
      case 3:
          if (an(n, e), mn(e), r & 4 && t !== null && t.memoizedState.isDehydrated) try {
              Rr(n.containerInfo)
          } catch (C) {
              ve(e, e.return, C)
          }
          break;
      case 4:
          an(n, e), mn(e);
          break;
      case 13:
          an(n, e), mn(e), i = e.child, i.flags & 8192 && (a = i.memoizedState !== null, i.stateNode.isHidden = a, !a || i.alternate !== null && i.alternate.memoizedState !== null || (bs = ye())), r & 4 && Xu(e);
          break;
      case 22:
          if (h = t !== null && t.memoizedState !== null, e.mode & 1 ? (Ae = (c = Ae) || h, an(n, e), Ae = c) : an(n, e), mn(e), r & 8192) {
              if (c = e.memoizedState !== null, (e.stateNode.isHidden = c) && !h && (e.mode & 1) !== 0)
                  for (F = e, h = e.child; h !== null;) {
                      for (g = F = h; F !== null;) {
                          switch (y = F, k = y.child, y.tag) {
                              case 0:
                              case 11:
                              case 14:
                              case 15:
                                  Pr(4, y, y.return);
                                  break;
                              case 1:
                                  Mt(y, y.return);
                                  var E = y.stateNode;
                                  if (typeof E.componentWillUnmount == "function") {
                                      r = y, t = y.return;
                                      try {
                                          n = r, E.props = n.memoizedProps, E.state = n.memoizedState, E.componentWillUnmount()
                                      } catch (C) {
                                          ve(r, t, C)
                                      }
                                  }
                                  break;
                              case 5:
                                  Mt(y, y.return);
                                  break;
                              case 22:
                                  if (y.memoizedState !== null) {
                                      qu(g);
                                      continue
                                  }
                          }
                          k !== null ? (k.return = y, F = k) : qu(g)
                      }
                      h = h.sibling
                  }
              e: for (h = null, g = e;;) {
                  if (g.tag === 5) {
                      if (h === null) {
                          h = g;
                          try {
                              i = g.stateNode, c ? (a = i.style, typeof a.setProperty == "function" ? a.setProperty("display", "none", "important") : a.display = "none") : (s = g.stateNode, u = g.memoizedProps.style, l = u != null && u.hasOwnProperty("display") ? u.display : null, s.style.display = rd("display", l))
                          } catch (C) {
                              ve(e, e.return, C)
                          }
                      }
                  } else if (g.tag === 6) {
                      if (h === null) try {
                          g.stateNode.nodeValue = c ? "" : g.memoizedProps
                      } catch (C) {
                          ve(e, e.return, C)
                      }
                  } else if ((g.tag !== 22 && g.tag !== 23 || g.memoizedState === null || g === e) && g.child !== null) {
                      g.child.return = g, g = g.child;
                      continue
                  }
                  if (g === e) break e;
                  for (; g.sibling === null;) {
                      if (g.return === null || g.return === e) break e;
                      h === g && (h = null), g = g.return
                  }
                  h === g && (h = null), g.sibling.return = g.return, g = g.sibling
              }
          }
          break;
      case 19:
          an(n, e), mn(e), r & 4 && Xu(e);
          break;
      case 21:
          break;
      default:
          an(n, e), mn(e)
  }
}

function mn(e) {
  var n = e.flags;
  if (n & 2) {
      try {
          e: {
              for (var t = e.return; t !== null;) {
                  if (Tf(t)) {
                      var r = t;
                      break e
                  }
                  t = t.return
              }
              throw Error(A(160))
          }
          switch (r.tag) {
              case 5:
                  var i = r.stateNode;
                  r.flags & 32 && (Lr(i, ""), r.flags &= -33);
                  var a = Zu(e);
                  No(e, a, i);
                  break;
              case 3:
              case 4:
                  var l = r.stateNode.containerInfo,
                      s = Zu(e);
                  xo(e, s, l);
                  break;
              default:
                  throw Error(A(161))
          }
      }
      catch (u) {
          ve(e, e.return, u)
      }
      e.flags &= -3
  }
  n & 4096 && (e.flags &= -4097)
}

function Vh(e, n, t) {
  F = e, jf(e)
}

function jf(e, n, t) {
  for (var r = (e.mode & 1) !== 0; F !== null;) {
      var i = F,
          a = i.child;
      if (i.tag === 22 && r) {
          var l = i.memoizedState !== null || bi;
          if (!l) {
              var s = i.alternate,
                  u = s !== null && s.memoizedState !== null || Ae;
              s = bi;
              var c = Ae;
              if (bi = l, (Ae = u) && !c)
                  for (F = i; F !== null;) l = F, u = l.child, l.tag === 22 && l.memoizedState !== null ? Du(i) : u !== null ? (u.return = l, F = u) : Du(i);
              for (; a !== null;) F = a, jf(a), a = a.sibling;
              F = i, bi = s, Ae = c
          }
          Ju(e)
      } else(i.subtreeFlags & 8772) !== 0 && a !== null ? (a.return = i, F = a) : Ju(e)
  }
}

function Ju(e) {
  for (; F !== null;) {
      var n = F;
      if ((n.flags & 8772) !== 0) {
          var t = n.alternate;
          try {
              if ((n.flags & 8772) !== 0) switch (n.tag) {
                  case 0:
                  case 11:
                  case 15:
                      Ae || Fa(5, n);
                      break;
                  case 1:
                      var r = n.stateNode;
                      if (n.flags & 4 && !Ae)
                          if (t === null) r.componentDidMount();
                          else {
                              var i = n.elementType === n.type ? t.memoizedProps : ln(n.type, t.memoizedProps);
                              r.componentDidUpdate(i, t.memoizedState, r.__reactInternalSnapshotBeforeUpdate)
                          } var a = n.updateQueue;
                      a !== null && ju(n, a, r);
                      break;
                  case 3:
                      var l = n.updateQueue;
                      if (l !== null) {
                          if (t = null, n.child !== null) switch (n.child.tag) {
                              case 5:
                                  t = n.child.stateNode;
                                  break;
                              case 1:
                                  t = n.child.stateNode
                          }
                          ju(n, l, t)
                      }
                      break;
                  case 5:
                      var s = n.stateNode;
                      if (t === null && n.flags & 4) {
                          t = s;
                          var u = n.memoizedProps;
                          switch (n.type) {
                              case "button":
                              case "input":
                              case "select":
                              case "textarea":
                                  u.autoFocus && t.focus();
                                  break;
                              case "img":
                                  u.src && (t.src = u.src)
                          }
                      }
                      break;
                  case 6:
                      break;
                  case 4:
                      break;
                  case 12:
                      break;
                  case 13:
                      if (n.memoizedState === null) {
                          var c = n.alternate;
                          if (c !== null) {
                              var h = c.memoizedState;
                              if (h !== null) {
                                  var g = h.dehydrated;
                                  g !== null && Rr(g)
                              }
                          }
                      }
                      break;
                  case 19:
                  case 17:
                  case 21:
                  case 22:
                  case 23:
                  case 25:
                      break;
                  default:
                      throw Error(A(163))
              }
              Ae || n.flags & 512 && ko(n)
          } catch (y) {
              ve(n, n.return, y)
          }
      }
      if (n === e) {
          F = null;
          break
      }
      if (t = n.sibling, t !== null) {
          t.return = n.return, F = t;
          break
      }
      F = n.return
  }
}

function qu(e) {
  for (; F !== null;) {
      var n = F;
      if (n === e) {
          F = null;
          break
      }
      var t = n.sibling;
      if (t !== null) {
          t.return = n.return, F = t;
          break
      }
      F = n.return
  }
}

function Du(e) {
  for (; F !== null;) {
      var n = F;
      try {
          switch (n.tag) {
              case 0:
              case 11:
              case 15:
                  var t = n.return;
                  try {
                      Fa(4, n)
                  } catch (u) {
                      ve(n, t, u)
                  }
                  break;
              case 1:
                  var r = n.stateNode;
                  if (typeof r.componentDidMount == "function") {
                      var i = n.return;
                      try {
                          r.componentDidMount()
                      } catch (u) {
                          ve(n, i, u)
                      }
                  }
                  var a = n.return;
                  try {
                      ko(n)
                  } catch (u) {
                      ve(n, a, u)
                  }
                  break;
              case 5:
                  var l = n.return;
                  try {
                      ko(n)
                  } catch (u) {
                      ve(n, l, u)
                  }
          }
      } catch (u) {
          ve(n, n.return, u)
      }
      if (n === e) {
          F = null;
          break
      }
      var s = n.sibling;
      if (s !== null) {
          s.return = n.return, F = s;
          break
      }
      F = n.return
  }
}
var $h = Math.ceil,
  wa = Tn.ReactCurrentDispatcher,
  Es = Tn.ReactCurrentOwner,
  en = Tn.ReactCurrentBatchConfig,
  ne = 0,
  Ce = null,
  we = null,
  ze = 0,
  He = 0,
  Rt = tt(0),
  xe = 0,
  Kr = null,
  gt = 0,
  Ua = 0,
  Cs = 0,
  zr = null,
  Ue = null,
  bs = 0,
  er = 1 / 0,
  wn = null,
  ka = !1,
  So = null,
  Qn = null,
  Pi = !1,
  Bn = null,
  xa = 0,
  _r = 0,
  Eo = null,
  Zi = -1,
  Xi = 0;

function Me() {
  return (ne & 6) !== 0 ? ye() : Zi !== -1 ? Zi : Zi = ye()
}

function Kn(e) {
  return (e.mode & 1) === 0 ? 1 : (ne & 2) !== 0 && ze !== 0 ? ze & -ze : Ch.transition !== null ? (Xi === 0 && (Xi = vd()), Xi) : (e = re, e !== 0 || (e = window.event, e = e === void 0 ? 16 : Sd(e.type)), e)
}

function dn(e, n, t, r) {
  if (50 < _r) throw _r = 0, Eo = null, Error(A(185));
  ni(e, t, r), ((ne & 2) === 0 || e !== Ce) && (e === Ce && ((ne & 2) === 0 && (Ua |= t), xe === 4 && Fn(e, ze)), We(e, r), t === 1 && ne === 0 && (n.mode & 1) === 0 && (er = ye() + 500, Ia && rt()))
}

function We(e, n) {
  var t = e.callbackNode;
  Cp(e, n);
  var r = ia(e, e === Ce ? ze : 0);
  if (r === 0) t !== null && su(t), e.callbackNode = null, e.callbackPriority = 0;
  else if (n = r & -r, e.callbackPriority !== n) {
      if (t != null && su(t), n === 1) e.tag === 0 ? Eh(ec.bind(null, e)) : $d(ec.bind(null, e)), kh(function() {
          (ne & 6) === 0 && rt()
      }), t = null;
      else {
          switch (gd(r)) {
              case 1:
                  t = qo;
                  break;
              case 4:
                  t = pd;
                  break;
              case 16:
                  t = ra;
                  break;
              case 536870912:
                  t = hd;
                  break;
              default:
                  t = ra
          }
          t = $f(t, If.bind(null, e))
      }
      e.callbackPriority = n, e.callbackNode = t
  }
}

function If(e, n) {
  if (Zi = -1, Xi = 0, (ne & 6) !== 0) throw Error(A(327));
  var t = e.callbackNode;
  if (Gt() && e.callbackNode !== t) return null;
  var r = ia(e, e === Ce ? ze : 0);
  if (r === 0) return null;
  if ((r & 30) !== 0 || (r & e.expiredLanes) !== 0 || n) n = Na(e, r);
  else {
      n = r;
      var i = ne;
      ne |= 2;
      var a = Rf();
      (Ce !== e || ze !== n) && (wn = null, er = ye() + 500, ft(e, n));
      do try {
          Yh();
          break
      } catch (s) {
          Mf(e, s)
      }
      while (1);
      ds(), wa.current = a, ne = i, we !== null ? n = 0 : (Ce = null, ze = 0, n = xe)
  }
  if (n !== 0) {
      if (n === 2 && (i = Xl(e), i !== 0 && (r = i, n = Co(e, i))), n === 1) throw t = Kr, ft(e, 0), Fn(e, r), We(e, ye()), t;
      if (n === 6) Fn(e, r);
      else {
          if (i = e.current.alternate, (r & 30) === 0 && !Wh(i) && (n = Na(e, r), n === 2 && (a = Xl(e), a !== 0 && (r = a, n = Co(e, a))), n === 1)) throw t = Kr, ft(e, 0), Fn(e, r), We(e, ye()), t;
          switch (e.finishedWork = i, e.finishedLanes = r, n) {
              case 0:
              case 1:
                  throw Error(A(345));
              case 2:
                  lt(e, Ue, wn);
                  break;
              case 3:
                  if (Fn(e, r), (r & 130023424) === r && (n = bs + 500 - ye(), 10 < n)) {
                      if (ia(e, 0) !== 0) break;
                      if (i = e.suspendedLanes, (i & r) !== r) {
                          Me(), e.pingedLanes |= e.suspendedLanes & i;
                          break
                      }
                      e.timeoutHandle = io(lt.bind(null, e, Ue, wn), n);
                      break
                  }
                  lt(e, Ue, wn);
                  break;
              case 4:
                  if (Fn(e, r), (r & 4194240) === r) break;
                  for (n = e.eventTimes, i = -1; 0 < r;) {
                      var l = 31 - cn(r);
                      a = 1 << l, l = n[l], l > i && (i = l), r &= ~a
                  }
                  if (r = i, r = ye() - r, r = (120 > r ? 120 : 480 > r ? 480 : 1080 > r ? 1080 : 1920 > r ? 1920 : 3e3 > r ? 3e3 : 4320 > r ? 4320 : 1960 * $h(r / 1960)) - r, 10 < r) {
                      e.timeoutHandle = io(lt.bind(null, e, Ue, wn), r);
                      break
                  }
                  lt(e, Ue, wn);
                  break;
              case 5:
                  lt(e, Ue, wn);
                  break;
              default:
                  throw Error(A(329))
          }
      }
  }
  return We(e, ye()), e.callbackNode === t ? If.bind(null, e) : null
}

function Co(e, n) {
  var t = zr;
  return e.current.memoizedState.isDehydrated && (ft(e, n).flags |= 256), e = Na(e, n), e !== 2 && (n = Ue, Ue = t, n !== null && bo(n)), e
}

function bo(e) {
  Ue === null ? Ue = e : Ue.push.apply(Ue, e)
}

function Wh(e) {
  for (var n = e;;) {
      if (n.flags & 16384) {
          var t = n.updateQueue;
          if (t !== null && (t = t.stores, t !== null))
              for (var r = 0; r < t.length; r++) {
                  var i = t[r],
                      a = i.getSnapshot;
                  i = i.value;
                  try {
                      if (!fn(a(), i)) return !1
                  } catch {
                      return !1
                  }
              }
      }
      if (t = n.child, n.subtreeFlags & 16384 && t !== null) t.return = n, n = t;
      else {
          if (n === e) break;
          for (; n.sibling === null;) {
              if (n.return === null || n.return === e) return !0;
              n = n.return
          }
          n.sibling.return = n.return, n = n.sibling
      }
  }
  return !0
}

function Fn(e, n) {
  for (n &= ~Cs, n &= ~Ua, e.suspendedLanes |= n, e.pingedLanes &= ~n, e = e.expirationTimes; 0 < n;) {
      var t = 31 - cn(n),
          r = 1 << t;
      e[t] = -1, n &= ~r
  }
}

function ec(e) {
  if ((ne & 6) !== 0) throw Error(A(327));
  Gt();
  var n = ia(e, 0);
  if ((n & 1) === 0) return We(e, ye()), null;
  var t = Na(e, n);
  if (e.tag !== 0 && t === 2) {
      var r = Xl(e);
      r !== 0 && (n = r, t = Co(e, r))
  }
  if (t === 1) throw t = Kr, ft(e, 0), Fn(e, n), We(e, ye()), t;
  if (t === 6) throw Error(A(345));
  return e.finishedWork = e.current.alternate, e.finishedLanes = n, lt(e, Ue, wn), We(e, ye()), null
}

function Ps(e, n) {
  var t = ne;
  ne |= 1;
  try {
      return e(n)
  } finally {
      ne = t, ne === 0 && (er = ye() + 500, Ia && rt())
  }
}

function yt(e) {
  Bn !== null && Bn.tag === 0 && (ne & 6) === 0 && Gt();
  var n = ne;
  ne |= 1;
  var t = en.transition,
      r = re;
  try {
      if (en.transition = null, re = 1, e) return e()
  } finally {
      re = r, en.transition = t, ne = n, (ne & 6) === 0 && rt()
  }
}

function zs() {
  He = Rt.current, se(Rt)
}

function ft(e, n) {
  e.finishedWork = null, e.finishedLanes = 0;
  var t = e.timeoutHandle;
  if (t !== -1 && (e.timeoutHandle = -1, wh(t)), we !== null)
      for (t = we.return; t !== null;) {
          var r = t;
          switch (ss(r), r.tag) {
              case 1:
                  r = r.type.childContextTypes, r != null && ua();
                  break;
              case 3:
                  qt(), se(Ve), se(Le), gs();
                  break;
              case 5:
                  vs(r);
                  break;
              case 4:
                  qt();
                  break;
              case 13:
                  se(me);
                  break;
              case 19:
                  se(me);
                  break;
              case 10:
                  fs(r.type._context);
                  break;
              case 22:
              case 23:
                  zs()
          }
          t = t.return
      }
  if (Ce = e, we = e = Zn(e.current, null), ze = He = n, xe = 0, Kr = null, Cs = Ua = gt = 0, Ue = zr = null, st !== null) {
      for (n = 0; n < st.length; n++)
          if (t = st[n], r = t.interleaved, r !== null) {
              t.interleaved = null;
              var i = r.next,
                  a = t.pending;
              if (a !== null) {
                  var l = a.next;
                  a.next = i, r.next = l
              }
              t.pending = r
          } st = null
  }
  return e
}

function Mf(e, n) {
  do {
      var t = we;
      try {
          if (ds(), Gi.current = ya, ga) {
              for (var r = pe.memoizedState; r !== null;) {
                  var i = r.queue;
                  i !== null && (i.pending = null), r = r.next
              }
              ga = !1
          }
          if (vt = 0, Se = ke = pe = null, br = !1, Yr = 0, Es.current = null, t === null || t.return === null) {
              xe = 1, Kr = n, we = null;
              break
          }
          e: {
              var a = e,
                  l = t.return,
                  s = t,
                  u = n;
              if (n = ze, s.flags |= 32768, u !== null && typeof u == "object" && typeof u.then == "function") {
                  var c = u,
                      h = s,
                      g = h.tag;
                  if ((h.mode & 1) === 0 && (g === 0 || g === 11 || g === 15)) {
                      var y = h.alternate;
                      y ? (h.updateQueue = y.updateQueue, h.memoizedState = y.memoizedState, h.lanes = y.lanes) : (h.updateQueue = null, h.memoizedState = null)
                  }
                  var k = Vu(l);
                  if (k !== null) {
                      k.flags &= -257, $u(k, l, s, a, n), k.mode & 1 && Bu(a, c, n), n = k, u = c;
                      var E = n.updateQueue;
                      if (E === null) {
                          var C = new Set;
                          C.add(u), n.updateQueue = C
                      } else E.add(u);
                      break e
                  } else {
                      if ((n & 1) === 0) {
                          Bu(a, c, n), _s();
                          break e
                      }
                      u = Error(A(426))
                  }
              } else if (fe && s.mode & 1) {
                  var O = Vu(l);
                  if (O !== null) {
                      (O.flags & 65536) === 0 && (O.flags |= 256), $u(O, l, s, a, n), us(Dt(u, s));
                      break e
                  }
              }
              a = u = Dt(u, s),
              xe !== 4 && (xe = 2),
              zr === null ? zr = [a] : zr.push(a),
              a = l;do {
                  switch (a.tag) {
                      case 3:
                          a.flags |= 65536, n &= -n, a.lanes |= n;
                          var p = wf(a, u, n);
                          Lu(a, p);
                          break e;
                      case 1:
                          s = u;
                          var f = a.type,
                              m = a.stateNode;
                          if ((a.flags & 128) === 0 && (typeof f.getDerivedStateFromError == "function" || m !== null && typeof m.componentDidCatch == "function" && (Qn === null || !Qn.has(m)))) {
                              a.flags |= 65536, n &= -n, a.lanes |= n;
                              var x = kf(a, s, n);
                              Lu(a, x);
                              break e
                          }
                  }
                  a = a.return
              } while (a !== null)
          }
          Uf(t)
      } catch (_) {
          n = _, we === t && t !== null && (we = t = t.return);
          continue
      }
      break
  } while (1)
}

function Rf() {
  var e = wa.current;
  return wa.current = ya, e === null ? ya : e
}

function _s() {
  (xe === 0 || xe === 3 || xe === 2) && (xe = 4), Ce === null || (gt & 268435455) === 0 && (Ua & 268435455) === 0 || Fn(Ce, ze)
}

function Na(e, n) {
  var t = ne;
  ne |= 2;
  var r = Rf();
  (Ce !== e || ze !== n) && (wn = null, ft(e, n));
  do try {
      Hh();
      break
  } catch (i) {
      Mf(e, i)
  }
  while (1);
  if (ds(), ne = t, wa.current = r, we !== null) throw Error(A(261));
  return Ce = null, ze = 0, xe
}

function Hh() {
  for (; we !== null;) Ff(we)
}

function Yh() {
  for (; we !== null && !vp();) Ff(we)
}

function Ff(e) {
  var n = Vf(e.alternate, e, He);
  e.memoizedProps = e.pendingProps, n === null ? Uf(e) : we = n, Es.current = null
}

function Uf(e) {
  var n = e;
  do {
      var t = n.alternate;
      if (e = n.return, (n.flags & 32768) === 0) {
          if (t = Rh(t, n, He), t !== null) {
              we = t;
              return
          }
      } else {
          if (t = Fh(t, n), t !== null) {
              t.flags &= 32767, we = t;
              return
          }
          if (e !== null) e.flags |= 32768, e.subtreeFlags = 0, e.deletions = null;
          else {
              xe = 6, we = null;
              return
          }
      }
      if (n = n.sibling, n !== null) {
          we = n;
          return
      }
      we = n = e
  } while (n !== null);
  xe === 0 && (xe = 5)
}

function lt(e, n, t) {
  var r = re,
      i = en.transition;
  try {
      en.transition = null, re = 1, Gh(e, n, t, r)
  } finally {
      en.transition = i, re = r
  }
  return null
}

function Gh(e, n, t, r) {
  do Gt(); while (Bn !== null);
  if ((ne & 6) !== 0) throw Error(A(327));
  t = e.finishedWork;
  var i = e.finishedLanes;
  if (t === null) return null;
  if (e.finishedWork = null, e.finishedLanes = 0, t === e.current) throw Error(A(177));
  e.callbackNode = null, e.callbackPriority = 0;
  var a = t.lanes | t.childLanes;
  if (bp(e, a), e === Ce && (we = Ce = null, ze = 0), (t.subtreeFlags & 2064) === 0 && (t.flags & 2064) === 0 || Pi || (Pi = !0, $f(ra, function() {
          return Gt(), null
      })), a = (t.flags & 15990) !== 0, (t.subtreeFlags & 15990) !== 0 || a) {
      a = en.transition, en.transition = null;
      var l = re;
      re = 1;
      var s = ne;
      ne |= 4, Es.current = null, Bh(e, t), Lf(t, e), fh(to), aa = !!no, to = no = null, e.current = t, Vh(t), gp(), ne = s, re = l, en.transition = a
  } else e.current = t;
  if (Pi && (Pi = !1, Bn = e, xa = i), a = e.pendingLanes, a === 0 && (Qn = null), kp(t.stateNode), We(e, ye()), n !== null)
      for (r = e.onRecoverableError, t = 0; t < n.length; t++) i = n[t], r(i.value, {
          componentStack: i.stack,
          digest: i.digest
      });
  if (ka) throw ka = !1, e = So, So = null, e;
  return (xa & 1) !== 0 && e.tag !== 0 && Gt(), a = e.pendingLanes, (a & 1) !== 0 ? e === Eo ? _r++ : (_r = 0, Eo = e) : _r = 0, rt(), null
}

function Gt() {
  if (Bn !== null) {
      var e = gd(xa),
          n = en.transition,
          t = re;
      try {
          if (en.transition = null, re = 16 > e ? 16 : e, Bn === null) var r = !1;
          else {
              if (e = Bn, Bn = null, xa = 0, (ne & 6) !== 0) throw Error(A(331));
              var i = ne;
              for (ne |= 4, F = e.current; F !== null;) {
                  var a = F,
                      l = a.child;
                  if ((F.flags & 16) !== 0) {
                      var s = a.deletions;
                      if (s !== null) {
                          for (var u = 0; u < s.length; u++) {
                              var c = s[u];
                              for (F = c; F !== null;) {
                                  var h = F;
                                  switch (h.tag) {
                                      case 0:
                                      case 11:
                                      case 15:
                                          Pr(8, h, a)
                                  }
                                  var g = h.child;
                                  if (g !== null) g.return = h, F = g;
                                  else
                                      for (; F !== null;) {
                                          h = F;
                                          var y = h.sibling,
                                              k = h.return;
                                          if (Of(h), h === c) {
                                              F = null;
                                              break
                                          }
                                          if (y !== null) {
                                              y.return = k, F = y;
                                              break
                                          }
                                          F = k
                                      }
                              }
                          }
                          var E = a.alternate;
                          if (E !== null) {
                              var C = E.child;
                              if (C !== null) {
                                  E.child = null;
                                  do {
                                      var O = C.sibling;
                                      C.sibling = null, C = O
                                  } while (C !== null)
                              }
                          }
                          F = a
                      }
                  }
                  if ((a.subtreeFlags & 2064) !== 0 && l !== null) l.return = a, F = l;
                  else e: for (; F !== null;) {
                      if (a = F, (a.flags & 2048) !== 0) switch (a.tag) {
                          case 0:
                          case 11:
                          case 15:
                              Pr(9, a, a.return)
                      }
                      var p = a.sibling;
                      if (p !== null) {
                          p.return = a.return, F = p;
                          break e
                      }
                      F = a.return
                  }
              }
              var f = e.current;
              for (F = f; F !== null;) {
                  l = F;
                  var m = l.child;
                  if ((l.subtreeFlags & 2064) !== 0 && m !== null) m.return = l, F = m;
                  else e: for (l = f; F !== null;) {
                      if (s = F, (s.flags & 2048) !== 0) try {
                          switch (s.tag) {
                              case 0:
                              case 11:
                              case 15:
                                  Fa(9, s)
                          }
                      } catch (_) {
                          ve(s, s.return, _)
                      }
                      if (s === l) {
                          F = null;
                          break e
                      }
                      var x = s.sibling;
                      if (x !== null) {
                          x.return = s.return, F = x;
                          break e
                      }
                      F = s.return
                  }
              }
              if (ne = i, rt(), gn && typeof gn.onPostCommitFiberRoot == "function") try {
                  gn.onPostCommitFiberRoot(Oa, e)
              } catch {}
              r = !0
          }
          return r
      } finally {
          re = t, en.transition = n
      }
  }
  return !1
}

function nc(e, n, t) {
  n = Dt(t, n), n = wf(e, n, 1), e = Gn(e, n, 1), n = Me(), e !== null && (ni(e, 1, n), We(e, n))
}

function ve(e, n, t) {
  if (e.tag === 3) nc(e, e, t);
  else
      for (; n !== null;) {
          if (n.tag === 3) {
              nc(n, e, t);
              break
          } else if (n.tag === 1) {
              var r = n.stateNode;
              if (typeof n.type.getDerivedStateFromError == "function" || typeof r.componentDidCatch == "function" && (Qn === null || !Qn.has(r))) {
                  e = Dt(t, e), e = kf(n, e, 1), n = Gn(n, e, 1), e = Me(), n !== null && (ni(n, 1, e), We(n, e));
                  break
              }
          }
          n = n.return
      }
}

function Qh(e, n, t) {
  var r = e.pingCache;
  r !== null && r.delete(n), n = Me(), e.pingedLanes |= e.suspendedLanes & t, Ce === e && (ze & t) === t && (xe === 4 || xe === 3 && (ze & 130023424) === ze && 500 > ye() - bs ? ft(e, 0) : Cs |= t), We(e, n)
}

function Bf(e, n) {
  n === 0 && ((e.mode & 1) === 0 ? n = 1 : (n = gi, gi <<= 1, (gi & 130023424) === 0 && (gi = 4194304)));
  var t = Me();
  e = bn(e, n), e !== null && (ni(e, n, t), We(e, t))
}

function Kh(e) {
  var n = e.memoizedState,
      t = 0;
  n !== null && (t = n.retryLane), Bf(e, t)
}

function Zh(e, n) {
  var t = 0;
  switch (e.tag) {
      case 13:
          var r = e.stateNode,
              i = e.memoizedState;
          i !== null && (t = i.retryLane);
          break;
      case 19:
          r = e.stateNode;
          break;
      default:
          throw Error(A(314))
  }
  r !== null && r.delete(n), Bf(e, t)
}
var Vf;
Vf = function(e, n, t) {
  if (e !== null)
      if (e.memoizedProps !== n.pendingProps || Ve.current) Be = !0;
      else {
          if ((e.lanes & t) === 0 && (n.flags & 128) === 0) return Be = !1, Mh(e, n, t);
          Be = (e.flags & 131072) !== 0
      }
  else Be = !1, fe && (n.flags & 1048576) !== 0 && Wd(n, fa, n.index);
  switch (n.lanes = 0, n.tag) {
      case 2:
          var r = n.type;
          Ki(e, n), e = n.pendingProps;
          var i = Zt(n, Le.current);
          Yt(n, t), i = ws(null, n, r, e, i, t);
          var a = ks();
          return n.flags |= 1, typeof i == "object" && i !== null && typeof i.render == "function" && i.$$typeof === void 0 ? (n.tag = 1, n.memoizedState = null, n.updateQueue = null, $e(r) ? (a = !0, ca(n)) : a = !1, n.memoizedState = i.state !== null && i.state !== void 0 ? i.state : null, ps(n), i.updater = Ma, n.stateNode = i, i._reactInternals = n, fo(n, r, e, t), n = ho(null, n, r, !0, a, t)) : (n.tag = 0, fe && a && os(n), Ie(null, n, i, t), n = n.child), n;
      case 16:
          r = n.elementType;
          e: {
              switch (Ki(e, n), e = n.pendingProps, i = r._init, r = i(r._payload), n.type = r, i = n.tag = Jh(r), e = ln(r, e), i) {
                  case 0:
                      n = po(null, n, r, e, t);
                      break e;
                  case 1:
                      n = Yu(null, n, r, e, t);
                      break e;
                  case 11:
                      n = Wu(null, n, r, e, t);
                      break e;
                  case 14:
                      n = Hu(null, n, r, ln(r.type, e), t);
                      break e
              }
              throw Error(A(306, r, ""))
          }
          return n;
      case 0:
          return r = n.type, i = n.pendingProps, i = n.elementType === r ? i : ln(r, i), po(e, n, r, i, t);
      case 1:
          return r = n.type, i = n.pendingProps, i = n.elementType === r ? i : ln(r, i), Yu(e, n, r, i, t);
      case 3:
          e: {
              if (Ef(n), e === null) throw Error(A(387));r = n.pendingProps,
              a = n.memoizedState,
              i = a.element,
              Qd(e, n),
              ha(n, r, null, t);
              var l = n.memoizedState;
              if (r = l.element, a.isDehydrated)
                  if (a = {
                          element: r,
                          isDehydrated: !1,
                          cache: l.cache,
                          pendingSuspenseBoundaries: l.pendingSuspenseBoundaries,
                          transitions: l.transitions
                      }, n.updateQueue.baseState = a, n.memoizedState = a, n.flags & 256) {
                      i = Dt(Error(A(423)), n), n = Gu(e, n, r, t, i);
                      break e
                  } else if (r !== i) {
                  i = Dt(Error(A(424)), n), n = Gu(e, n, r, t, i);
                  break e
              } else
                  for (Ye = Yn(n.stateNode.containerInfo.firstChild), Ge = n, fe = !0, sn = null, t = Jd(n, null, r, t), n.child = t; t;) t.flags = t.flags & -3 | 4096, t = t.sibling;
              else {
                  if (Xt(), r === i) {
                      n = Pn(e, n, t);
                      break e
                  }
                  Ie(e, n, r, t)
              }
              n = n.child
          }
          return n;
      case 5:
          return qd(n), e === null && so(n), r = n.type, i = n.pendingProps, a = e !== null ? e.memoizedProps : null, l = i.children, ro(r, i) ? l = null : a !== null && ro(r, a) && (n.flags |= 32), Sf(e, n), Ie(e, n, l, t), n.child;
      case 6:
          return e === null && so(n), null;
      case 13:
          return Cf(e, n, t);
      case 4:
          return hs(n, n.stateNode.containerInfo), r = n.pendingProps, e === null ? n.child = Jt(n, null, r, t) : Ie(e, n, r, t), n.child;
      case 11:
          return r = n.type, i = n.pendingProps, i = n.elementType === r ? i : ln(r, i), Wu(e, n, r, i, t);
      case 7:
          return Ie(e, n, n.pendingProps, t), n.child;
      case 8:
          return Ie(e, n, n.pendingProps.children, t), n.child;
      case 12:
          return Ie(e, n, n.pendingProps.children, t), n.child;
      case 10:
          e: {
              if (r = n.type._context, i = n.pendingProps, a = n.memoizedProps, l = i.value, ae(ma, r._currentValue), r._currentValue = l, a !== null)
                  if (fn(a.value, l)) {
                      if (a.children === i.children && !Ve.current) {
                          n = Pn(e, n, t);
                          break e
                      }
                  } else
                      for (a = n.child, a !== null && (a.return = n); a !== null;) {
                          var s = a.dependencies;
                          if (s !== null) {
                              l = a.child;
                              for (var u = s.firstContext; u !== null;) {
                                  if (u.context === r) {
                                      if (a.tag === 1) {
                                          u = Sn(-1, t & -t), u.tag = 2;
                                          var c = a.updateQueue;
                                          if (c !== null) {
                                              c = c.shared;
                                              var h = c.pending;
                                              h === null ? u.next = u : (u.next = h.next, h.next = u), c.pending = u
                                          }
                                      }
                                      a.lanes |= t, u = a.alternate, u !== null && (u.lanes |= t), uo(a.return, t, n), s.lanes |= t;
                                      break
                                  }
                                  u = u.next
                              }
                          } else if (a.tag === 10) l = a.type === n.type ? null : a.child;
                          else if (a.tag === 18) {
                              if (l = a.return, l === null) throw Error(A(341));
                              l.lanes |= t, s = l.alternate, s !== null && (s.lanes |= t), uo(l, t, n), l = a.sibling
                          } else l = a.child;
                          if (l !== null) l.return = a;
                          else
                              for (l = a; l !== null;) {
                                  if (l === n) {
                                      l = null;
                                      break
                                  }
                                  if (a = l.sibling, a !== null) {
                                      a.return = l.return, l = a;
                                      break
                                  }
                                  l = l.return
                              }
                          a = l
                      }
              Ie(e, n, i.children, t),
              n = n.child
          }
          return n;
      case 9:
          return i = n.type, r = n.pendingProps.children, Yt(n, t), i = nn(i), r = r(i), n.flags |= 1, Ie(e, n, r, t), n.child;
      case 14:
          return r = n.type, i = ln(r, n.pendingProps), i = ln(r.type, i), Hu(e, n, r, i, t);
      case 15:
          return xf(e, n, n.type, n.pendingProps, t);
      case 17:
          return r = n.type, i = n.pendingProps, i = n.elementType === r ? i : ln(r, i), Ki(e, n), n.tag = 1, $e(r) ? (e = !0, ca(n)) : e = !1, Yt(n, t), Zd(n, r, i), fo(n, r, i, t), ho(null, n, r, !0, e, t);
      case 19:
          return bf(e, n, t);
      case 22:
          return Nf(e, n, t)
  }
  throw Error(A(156, n.tag))
};

function $f(e, n) {
  return md(e, n)
}

function Xh(e, n, t, r) {
  this.tag = e, this.key = t, this.sibling = this.child = this.return = this.stateNode = this.type = this.elementType = null, this.index = 0, this.ref = null, this.pendingProps = n, this.dependencies = this.memoizedState = this.updateQueue = this.memoizedProps = null, this.mode = r, this.subtreeFlags = this.flags = 0, this.deletions = null, this.childLanes = this.lanes = 0, this.alternate = null
}

function De(e, n, t, r) {
  return new Xh(e, n, t, r)
}

function Os(e) {
  return e = e.prototype, !(!e || !e.isReactComponent)
}

function Jh(e) {
  if (typeof e == "function") return Os(e) ? 1 : 0;
  if (e != null) {
      if (e = e.$$typeof, e === Zo) return 11;
      if (e === Xo) return 14
  }
  return 2
}

function Zn(e, n) {
  var t = e.alternate;
  return t === null ? (t = De(e.tag, n, e.key, e.mode), t.elementType = e.elementType, t.type = e.type, t.stateNode = e.stateNode, t.alternate = e, e.alternate = t) : (t.pendingProps = n, t.type = e.type, t.flags = 0, t.subtreeFlags = 0, t.deletions = null), t.flags = e.flags & 14680064, t.childLanes = e.childLanes, t.lanes = e.lanes, t.child = e.child, t.memoizedProps = e.memoizedProps, t.memoizedState = e.memoizedState, t.updateQueue = e.updateQueue, n = e.dependencies, t.dependencies = n === null ? null : {
      lanes: n.lanes,
      firstContext: n.firstContext
  }, t.sibling = e.sibling, t.index = e.index, t.ref = e.ref, t
}

function Ji(e, n, t, r, i, a) {
  var l = 2;
  if (r = e, typeof e == "function") Os(e) && (l = 1);
  else if (typeof e == "string") l = 5;
  else e: switch (e) {
      case Pt:
          return mt(t.children, i, a, n);
      case Ko:
          l = 8, i |= 8;
          break;
      case Il:
          return e = De(12, t, n, i | 2), e.elementType = Il, e.lanes = a, e;
      case Ml:
          return e = De(13, t, n, i), e.elementType = Ml, e.lanes = a, e;
      case Rl:
          return e = De(19, t, n, i), e.elementType = Rl, e.lanes = a, e;
      case Xc:
          return Ba(t, i, a, n);
      default:
          if (typeof e == "object" && e !== null) switch (e.$$typeof) {
              case Kc:
                  l = 10;
                  break e;
              case Zc:
                  l = 9;
                  break e;
              case Zo:
                  l = 11;
                  break e;
              case Xo:
                  l = 14;
                  break e;
              case In:
                  l = 16, r = null;
                  break e
          }
          throw Error(A(130, e == null ? e : typeof e, ""))
  }
  return n = De(l, t, n, i), n.elementType = e, n.type = r, n.lanes = a, n
}

function mt(e, n, t, r) {
  return e = De(7, e, r, n), e.lanes = t, e
}

function Ba(e, n, t, r) {
  return e = De(22, e, r, n), e.elementType = Xc, e.lanes = t, e.stateNode = {
      isHidden: !1
  }, e
}

function Nl(e, n, t) {
  return e = De(6, e, null, n), e.lanes = t, e
}

function Sl(e, n, t) {
  return n = De(4, e.children !== null ? e.children : [], e.key, n), n.lanes = t, n.stateNode = {
      containerInfo: e.containerInfo,
      pendingChildren: null,
      implementation: e.implementation
  }, n
}

function qh(e, n, t, r, i) {
  this.tag = n, this.containerInfo = e, this.finishedWork = this.pingCache = this.current = this.pendingChildren = null, this.timeoutHandle = -1, this.callbackNode = this.pendingContext = this.context = null, this.callbackPriority = 0, this.eventTimes = rl(0), this.expirationTimes = rl(-1), this.entangledLanes = this.finishedLanes = this.mutableReadLanes = this.expiredLanes = this.pingedLanes = this.suspendedLanes = this.pendingLanes = 0, this.entanglements = rl(0), this.identifierPrefix = r, this.onRecoverableError = i, this.mutableSourceEagerHydrationData = null
}

function Ts(e, n, t, r, i, a, l, s, u) {
  return e = new qh(e, n, t, s, u), n === 1 ? (n = 1, a === !0 && (n |= 8)) : n = 0, a = De(3, null, null, n), e.current = a, a.stateNode = e, a.memoizedState = {
      element: r,
      isDehydrated: t,
      cache: null,
      transitions: null,
      pendingSuspenseBoundaries: null
  }, ps(a), e
}

function Dh(e, n, t) {
  var r = 3 < arguments.length && arguments[3] !== void 0 ? arguments[3] : null;
  return {
      $$typeof: bt,
      key: r == null ? null : "" + r,
      children: e,
      containerInfo: n,
      implementation: t
  }
}

function Wf(e) {
  if (!e) return Jn;
  e = e._reactInternals;
  e: {
      if (Nt(e) !== e || e.tag !== 1) throw Error(A(170));
      var n = e;do {
          switch (n.tag) {
              case 3:
                  n = n.stateNode.context;
                  break e;
              case 1:
                  if ($e(n.type)) {
                      n = n.stateNode.__reactInternalMemoizedMergedChildContext;
                      break e
                  }
          }
          n = n.return
      } while (n !== null);
      throw Error(A(171))
  }
  if (e.tag === 1) {
      var t = e.type;
      if ($e(t)) return Vd(e, t, n)
  }
  return n
}

function Hf(e, n, t, r, i, a, l, s, u) {
  return e = Ts(t, r, !0, e, i, a, l, s, u), e.context = Wf(null), t = e.current, r = Me(), i = Kn(t), a = Sn(r, i), a.callback = n != null ? n : null, Gn(t, a, i), e.current.lanes = i, ni(e, i, r), We(e, r), e
}

function Va(e, n, t, r) {
  var i = n.current,
      a = Me(),
      l = Kn(i);
  return t = Wf(t), n.context === null ? n.context = t : n.pendingContext = t, n = Sn(a, l), n.payload = {
      element: e
  }, r = r === void 0 ? null : r, r !== null && (n.callback = r), e = Gn(i, n, l), e !== null && (dn(e, i, l, a), Yi(e, i, l)), l
}

function Sa(e) {
  if (e = e.current, !e.child) return null;
  switch (e.child.tag) {
      case 5:
          return e.child.stateNode;
      default:
          return e.child.stateNode
  }
}

function tc(e, n) {
  if (e = e.memoizedState, e !== null && e.dehydrated !== null) {
      var t = e.retryLane;
      e.retryLane = t !== 0 && t < n ? t : n
  }
}

function As(e, n) {
  tc(e, n), (e = e.alternate) && tc(e, n)
}

function ev() {
  return null
}
var Yf = typeof reportError == "function" ? reportError : function(e) {
  console.error(e)
};

function Ls(e) {
  this._internalRoot = e
}
$a.prototype.render = Ls.prototype.render = function(e) {
  var n = this._internalRoot;
  if (n === null) throw Error(A(409));
  Va(e, n, null, null)
};
$a.prototype.unmount = Ls.prototype.unmount = function() {
  var e = this._internalRoot;
  if (e !== null) {
      this._internalRoot = null;
      var n = e.containerInfo;
      yt(function() {
          Va(null, e, null, null)
      }), n[Cn] = null
  }
};

function $a(e) {
  this._internalRoot = e
}
$a.prototype.unstable_scheduleHydration = function(e) {
  if (e) {
      var n = kd();
      e = {
          blockedOn: null,
          target: e,
          priority: n
      };
      for (var t = 0; t < Rn.length && n !== 0 && n < Rn[t].priority; t++);
      Rn.splice(t, 0, e), t === 0 && Nd(e)
  }
};

function js(e) {
  return !(!e || e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11)
}

function Wa(e) {
  return !(!e || e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11 && (e.nodeType !== 8 || e.nodeValue !== " react-mount-point-unstable "))
}

function rc() {}

function nv(e, n, t, r, i) {
  if (i) {
      if (typeof r == "function") {
          var a = r;
          r = function() {
              var c = Sa(l);
              a.call(c)
          }
      }
      var l = Hf(n, r, e, 0, null, !1, !1, "", rc);
      return e._reactRootContainer = l, e[Cn] = l.current, Br(e.nodeType === 8 ? e.parentNode : e), yt(), l
  }
  for (; i = e.lastChild;) e.removeChild(i);
  if (typeof r == "function") {
      var s = r;
      r = function() {
          var c = Sa(u);
          s.call(c)
      }
  }
  var u = Ts(e, 0, !1, null, null, !1, !1, "", rc);
  return e._reactRootContainer = u, e[Cn] = u.current, Br(e.nodeType === 8 ? e.parentNode : e), yt(function() {
      Va(n, u, t, r)
  }), u
}

function Ha(e, n, t, r, i) {
  var a = t._reactRootContainer;
  if (a) {
      var l = a;
      if (typeof i == "function") {
          var s = i;
          i = function() {
              var u = Sa(l);
              s.call(u)
          }
      }
      Va(n, l, e, i)
  } else l = nv(t, n, e, i, r);
  return Sa(l)
}
yd = function(e) {
  switch (e.tag) {
      case 3:
          var n = e.stateNode;
          if (n.current.memoizedState.isDehydrated) {
              var t = yr(n.pendingLanes);
              t !== 0 && (Do(n, t | 1), We(n, ye()), (ne & 6) === 0 && (er = ye() + 500, rt()))
          }
          break;
      case 13:
          yt(function() {
              var r = bn(e, 1);
              if (r !== null) {
                  var i = Me();
                  dn(r, e, 1, i)
              }
          }), As(e, 1)
  }
};
es = function(e) {
  if (e.tag === 13) {
      var n = bn(e, 134217728);
      if (n !== null) {
          var t = Me();
          dn(n, e, 134217728, t)
      }
      As(e, 134217728)
  }
};
wd = function(e) {
  if (e.tag === 13) {
      var n = Kn(e),
          t = bn(e, n);
      if (t !== null) {
          var r = Me();
          dn(t, e, n, r)
      }
      As(e, n)
  }
};
kd = function() {
  return re
};
xd = function(e, n) {
  var t = re;
  try {
      return re = e, n()
  } finally {
      re = t
  }
};
Ql = function(e, n, t) {
  switch (n) {
      case "input":
          if (Bl(e, t), n = t.name, t.type === "radio" && n != null) {
              for (t = e; t.parentNode;) t = t.parentNode;
              for (t = t.querySelectorAll("input[name=" + JSON.stringify("" + n) + '][type="radio"]'), n = 0; n < t.length; n++) {
                  var r = t[n];
                  if (r !== e && r.form === e.form) {
                      var i = ja(r);
                      if (!i) throw Error(A(90));
                      qc(r), Bl(r, i)
                  }
              }
          }
          break;
      case "textarea":
          ed(e, t);
          break;
      case "select":
          n = t.value, n != null && Vt(e, !!t.multiple, n, !1)
  }
};
od = Ps;
sd = yt;
var tv = {
      usingClientEntryPoint: !1,
      Events: [ri, Tt, ja, ad, ld, Ps]
  },
  hr = {
      findFiberByHostInstance: ot,
      bundleType: 0,
      version: "18.2.0",
      rendererPackageName: "react-dom"
  },
  rv = {
      bundleType: hr.bundleType,
      version: hr.version,
      rendererPackageName: hr.rendererPackageName,
      rendererConfig: hr.rendererConfig,
      overrideHookState: null,
      overrideHookStateDeletePath: null,
      overrideHookStateRenamePath: null,
      overrideProps: null,
      overridePropsDeletePath: null,
      overridePropsRenamePath: null,
      setErrorHandler: null,
      setSuspenseHandler: null,
      scheduleUpdate: null,
      currentDispatcherRef: Tn.ReactCurrentDispatcher,
      findHostInstanceByFiber: function(e) {
          return e = dd(e), e === null ? null : e.stateNode
      },
      findFiberByHostInstance: hr.findFiberByHostInstance || ev,
      findHostInstancesForRefresh: null,
      scheduleRefresh: null,
      scheduleRoot: null,
      setRefreshHandler: null,
      getCurrentFiber: null,
      reconcilerVersion: "18.2.0-next-9e3b772b8-20220608"
  };
if (typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ < "u") {
  var zi = __REACT_DEVTOOLS_GLOBAL_HOOK__;
  if (!zi.isDisabled && zi.supportsFiber) try {
      Oa = zi.inject(rv), gn = zi
  } catch {}
}
Ke.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = tv;
Ke.createPortal = function(e, n) {
  var t = 2 < arguments.length && arguments[2] !== void 0 ? arguments[2] : null;
  if (!js(n)) throw Error(A(200));
  return Dh(e, n, null, t)
};
Ke.createRoot = function(e, n) {
  if (!js(e)) throw Error(A(299));
  var t = !1,
      r = "",
      i = Yf;
  return n != null && (n.unstable_strictMode === !0 && (t = !0), n.identifierPrefix !== void 0 && (r = n.identifierPrefix), n.onRecoverableError !== void 0 && (i = n.onRecoverableError)), n = Ts(e, 1, !1, null, null, t, !1, r, i), e[Cn] = n.current, Br(e.nodeType === 8 ? e.parentNode : e), new Ls(n)
};
Ke.findDOMNode = function(e) {
  if (e == null) return null;
  if (e.nodeType === 1) return e;
  var n = e._reactInternals;
  if (n === void 0) throw typeof e.render == "function" ? Error(A(188)) : (e = Object.keys(e).join(","), Error(A(268, e)));
  return e = dd(n), e = e === null ? null : e.stateNode, e
};
Ke.flushSync = function(e) {
  return yt(e)
};
Ke.hydrate = function(e, n, t) {
  if (!Wa(n)) throw Error(A(200));
  return Ha(null, e, n, !0, t)
};
Ke.hydrateRoot = function(e, n, t) {
  if (!js(e)) throw Error(A(405));
  var r = t != null && t.hydratedSources || null,
      i = !1,
      a = "",
      l = Yf;
  if (t != null && (t.unstable_strictMode === !0 && (i = !0), t.identifierPrefix !== void 0 && (a = t.identifierPrefix), t.onRecoverableError !== void 0 && (l = t.onRecoverableError)), n = Hf(n, null, e, 1, t != null ? t : null, i, !1, a, l), e[Cn] = n.current, Br(e), r)
      for (e = 0; e < r.length; e++) t = r[e], i = t._getVersion, i = i(t._source), n.mutableSourceEagerHydrationData == null ? n.mutableSourceEagerHydrationData = [t, i] : n.mutableSourceEagerHydrationData.push(t, i);
  return new $a(n)
};
Ke.render = function(e, n, t) {
  if (!Wa(n)) throw Error(A(200));
  return Ha(null, e, n, !1, t)
};
Ke.unmountComponentAtNode = function(e) {
  if (!Wa(e)) throw Error(A(40));
  return e._reactRootContainer ? (yt(function() {
      Ha(null, null, e, !1, function() {
          e._reactRootContainer = null, e[Cn] = null
      })
  }), !0) : !1
};
Ke.unstable_batchedUpdates = Ps;
Ke.unstable_renderSubtreeIntoContainer = function(e, n, t, r) {
  if (!Wa(t)) throw Error(A(200));
  if (e == null || e._reactInternals === void 0) throw Error(A(38));
  return Ha(e, n, t, !1, r)
};
Ke.version = "18.2.0-next-9e3b772b8-20220608";
(function(e) {
  function n() {
      if (!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ > "u" || typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE != "function")) try {
          __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(n)
      } catch (t) {
          console.error(t)
      }
  }
  n(), e.exports = Ke
})(Wc);
var ic = Wc.exports;
Ll.createRoot = ic.createRoot, Ll.hydrateRoot = ic.hydrateRoot;
let iv = 0;

function St(e, n) {
  const t = `atom${++iv}`,
      r = {
          toString: () => t
      };
  return typeof e == "function" ? r.read = e : (r.init = e, r.read = i => i(r), r.write = (i, a, l) => a(r, typeof l == "function" ? l(i(r)) : l)), n && (r.write = n), r
}
const El = e => "init" in e,
  Cl = e => !!e.write,
  Ea = new WeakMap,
  av = (e, n) => {
      Ea.set(e, n), e.catch(() => {}).finally(() => Ea.delete(e))
  },
  ac = (e, n) => {
      const t = Ea.get(e);
      t && (Ea.delete(e), t(n))
  },
  lc = (e, n) => {
      e.status = "fulfilled", e.value = n
  },
  oc = (e, n) => {
      e.status = "rejected", e.reason = n
  },
  _i = (e, n) => "v" in e && "v" in n && Object.is(e.v, n.v),
  sc = (e, n) => "e" in e && "e" in n && Object.is(e.e, n.e),
  bl = e => "v" in e && e.v instanceof Promise,
  Oi = e => {
      if ("e" in e) throw e.e;
      return e.v
  },
  Gf = () => {
      const e = new WeakMap,
          n = new WeakMap,
          t = new Map;
      let r, i, a;
      ({
          BASE_URL: "./",
          MODE: "production",
          DEV: !1,
          PROD: !0
      } && "production") !== "production" && (r = new Set, i = new Set, a = new Set);
      const l = w => e.get(w),
          s = (w, N) => {
              ({
                  BASE_URL: "./",
                  MODE: "production",
                  DEV: !1,
                  PROD: !0
              } && "production") !== "production" && Object.freeze(N);
              const z = e.get(w);
              if (e.set(w, N), t.has(w) || t.set(w, z), z && bl(z)) {
                  const j = "v" in N ? N.v instanceof Promise ? N.v : Promise.resolve(N.v) : Promise.reject(N.e);
                  ac(z.v, j)
              }
          },
          u = (w, N, z) => {
              const j = new Map;
              let U = !1;
              z.forEach(W => {
                  const Q = W === w ? N : l(W);
                  Q ? (j.set(W, Q), N.d.get(W) !== Q && (U = !0)) : ({
                      BASE_URL: "./",
                      MODE: "production",
                      DEV: !1,
                      PROD: !0
                  } && "production") !== "production" && console.warn("[Bug] atom state not found")
              }), (U || N.d.size !== j.size) && (N.d = j)
          },
          c = (w, N, z) => {
              const j = l(w),
                  U = {
                      d: (j == null ? void 0 : j.d) || new Map,
                      v: N
                  };
              return z && u(w, U, z), j && _i(j, U) && j.d === U.d ? j : (s(w, U), U)
          },
          h = (w, N, z) => {
              const j = l(w),
                  U = {
                      d: (j == null ? void 0 : j.d) || new Map,
                      e: N
                  };
              return z && u(w, U, z), j && sc(j, U) && j.d === U.d ? j : (s(w, U), U)
          },
          g = w => {
              const N = l(w);
              if (N && (N.d.forEach((X, te) => {
                      te !== w && !n.has(te) && g(te)
                  }), Array.from(N.d).every(([X, te]) => X === w || l(X) === te))) return N;
              const z = new Set;
              let j = !0;
              const U = X => {
                  if (z.add(X), X === w) {
                      const T = l(X);
                      if (T) return Oi(T);
                      if (El(X)) return X.init;
                      throw new Error("no atom init")
                  }
                  const te = g(X);
                  return Oi(te)
              };
              let W, Q;
              const ce = {
                  get signal() {
                      return W || (W = new AbortController), W.signal
                  },
                  get setSelf() {
                      return ({
                          BASE_URL: "./",
                          MODE: "production",
                          DEV: !1,
                          PROD: !0
                      } && "production") !== "production" && !Cl(w) && console.warn("setSelf function cannot be used with read-only atom"), !Q && Cl(w) && (Q = (...X) => {
                          if (({
                                  BASE_URL: "./",
                                  MODE: "production",
                                  DEV: !1,
                                  PROD: !0
                              } && "production") !== "production" && j && console.warn("setSelf function cannot be called in sync"), !j) return f(w, ...X)
                      }), Q
                  }
              };
              try {
                  const X = w.read(U, ce);
                  if (X instanceof Promise) {
                      let te;
                      const T = new Promise((B, H) => {
                          let Y = !1;
                          X.then(M => {
                              Y || (Y = !0, c(w, T, z), lc(T, M), B(M))
                          }, M => {
                              Y || (Y = !0, c(w, T, z), oc(T, M), H(M))
                          }), te = M => {
                              Y || (Y = !0, M.then(Z => lc(T, Z), Z => oc(T, Z)), B(M))
                          }
                      });
                      return T.status = "pending", av(T, B => {
                          B && te(B), W == null || W.abort()
                      }), c(w, T, z)
                  }
                  return c(w, X, z)
              } catch (X) {
                  return h(w, X, z)
              } finally {
                  j = !1
              }
          },
          y = w => Oi(g(w)),
          k = w => {
              let N = n.get(w);
              return N || (N = m(w)), N
          },
          E = (w, N) => !N.l.size && (!N.t.size || N.t.size === 1 && N.t.has(w)),
          C = w => {
              const N = n.get(w);
              N && E(w, N) && x(w)
          },
          O = w => {
              const N = n.get(w);
              N == null || N.t.forEach(z => {
                  if (z !== w) {
                      const j = l(z),
                          U = g(z);
                      (!j || !_i(j, U)) && O(z)
                  }
              })
          },
          p = (w, ...N) => {
              let z = !0;
              const j = Q => Oi(g(Q)),
                  U = (Q, ...ce) => {
                      let X;
                      if (Q === w) {
                          if (!El(Q)) throw new Error("atom not writable");
                          const te = l(Q),
                              T = c(Q, ce[0]);
                          (!te || !_i(te, T)) && O(Q)
                      } else X = p(Q, ...ce);
                      return z || L(), X
                  },
                  W = w.write(j, U, ...N);
              return z = !1, W
          },
          f = (w, ...N) => {
              const z = p(w, ...N);
              return L(), z
          },
          m = (w, N) => {
              const z = {
                  t: new Set(N && [N]),
                  l: new Set
              };
              if (n.set(w, z), ({
                      BASE_URL: "./",
                      MODE: "production",
                      DEV: !1,
                      PROD: !0
                  } && "production") !== "production" && a.add(w), g(w).d.forEach((j, U) => {
                      const W = n.get(U);
                      W ? W.t.add(w) : U !== w && m(U, w)
                  }), g(w), Cl(w) && w.onMount) {
                  const j = w.onMount((...U) => f(w, ...U));
                  j && (z.u = j)
              }
              return z
          },
          x = w => {
              var N;
              const z = (N = n.get(w)) == null ? void 0 : N.u;
              z && z(), n.delete(w), ({
                  BASE_URL: "./",
                  MODE: "production",
                  DEV: !1,
                  PROD: !0
              } && "production") !== "production" && a.delete(w);
              const j = l(w);
              j ? (bl(j) && ac(j.v), j.d.forEach((U, W) => {
                  if (W !== w) {
                      const Q = n.get(W);
                      Q && (Q.t.delete(w), E(W, Q) && x(W))
                  }
              })) : ({
                  BASE_URL: "./",
                  MODE: "production",
                  DEV: !1,
                  PROD: !0
              } && "production") !== "production" && console.warn("[Bug] could not find atom state to unmount", w)
          },
          _ = (w, N, z) => {
              const j = new Set(N.d.keys());
              z == null || z.forEach((U, W) => {
                  if (j.has(W)) {
                      j.delete(W);
                      return
                  }
                  const Q = n.get(W);
                  Q && (Q.t.delete(w), E(W, Q) && x(W))
              }), j.forEach(U => {
                  const W = n.get(U);
                  W ? W.t.add(w) : n.has(w) && m(U, w)
              })
          },
          L = () => {
              for (; t.size;) {
                  const w = Array.from(t);
                  t.clear(), w.forEach(([N, z]) => {
                      const j = l(N);
                      if (j) {
                          j.d !== (z == null ? void 0 : z.d) && _(N, j, z == null ? void 0 : z.d);
                          const U = n.get(N);
                          U && !(z && !bl(z) && (_i(z, j) || sc(z, j))) && U.l.forEach(W => W())
                      } else({
                          BASE_URL: "./",
                          MODE: "production",
                          DEV: !1,
                          PROD: !0
                      } && "production") !== "production" && console.warn("[Bug] no atom state to flush")
                  })
              }({
                  BASE_URL: "./",
                  MODE: "production",
                  DEV: !1,
                  PROD: !0
              } && "production") !== "production" && (r.forEach(w => w()), i.forEach(w => w("state")))
          },
          P = (w, N) => {
              const z = k(w);
              L();
              const j = z.l;
              return j.add(N), ({
                  BASE_URL: "./",
                  MODE: "production",
                  DEV: !1,
                  PROD: !0
              } && "production") !== "production" && i.forEach(U => U("sub")), () => {
                  j.delete(N), C(w), ({
                      BASE_URL: "./",
                      MODE: "production",
                      DEV: !1,
                      PROD: !0
                  } && "production") !== "production" && i.forEach(U => U("unsub"))
              }
          };
      return ({
          BASE_URL: "./",
          MODE: "production",
          DEV: !1,
          PROD: !0
      } && "production") !== "production" ? {
          get: y,
          set: f,
          sub: P,
          dev_subscribe_state: w => (console.warn("[DEPRECATED] dev_subscribe_state is deprecated and will be removed in the next minor version. use dev_subscribe_store instead."), r.add(w), () => {
              r.delete(w)
          }),
          dev_subscribe_store: w => (i.add(w), () => {
              i.delete(w)
          }),
          dev_get_mounted_atoms: () => a.values(),
          dev_get_atom_state: w => e.get(w),
          dev_get_mounted: w => n.get(w),
          dev_restore_atoms: w => {
              for (const [N, z] of w) El(N) && (c(N, z), O(N));
              L()
          }
      } : {
          get: y,
          set: f,
          sub: P
      }
  };
let Pl;
const lv = () => (Pl || (Pl = Gf()), Pl),
  Qf = S.exports.createContext(void 0),
  Kf = e => {
      const n = S.exports.useContext(Qf);
      return (e == null ? void 0 : e.store) || n || lv()
  },
  ov = ({
      children: e,
      store: n
  }) => {
      const t = S.exports.useRef();
      return !n && !t.current && (t.current = Gf()), S.exports.createElement(Qf.Provider, {
          value: n || t.current
      }, e)
  },
  sv = e => e instanceof Promise,
  uv = rr.use || (e => {
      if (e.status === "pending") throw e;
      if (e.status === "fulfilled") return e.value;
      throw e.status === "rejected" ? e.reason : (e.status = "pending", e.then(n => {
          e.status = "fulfilled", e.value = n
      }, n => {
          e.status = "rejected", e.reason = n
      }), e)
  });

function Et(e, n) {
  const t = Kf(n),
      [
          [r, i, a], l
      ] = S.exports.useReducer(c => {
          const h = t.get(e);
          return Object.is(c[0], h) && c[1] === t && c[2] === e ? c : [h, t, e]
      }, void 0, () => [t.get(e), t, e]);
  let s = r;
  (i !== t || a !== e) && (l(), s = t.get(e));
  const u = n == null ? void 0 : n.delay;
  return S.exports.useEffect(() => {
      const c = t.sub(e, () => {
          if (typeof u == "number") {
              setTimeout(l, u);
              return
          }
          l()
      });
      return l(), c
  }, [t, e, u]), S.exports.useDebugValue(s), sv(s) ? uv(s) : s
}

function ai(e, n) {
  const t = Kf(n);
  return S.exports.useCallback((...i) => {
      if (({
              BASE_URL: "./",
              MODE: "production",
              DEV: !1,
              PROD: !0
          } && "production") !== "production" && !("write" in e)) throw new Error("not writable atom");
      return t.set(e, ...i)
  }, [t, e])
}

function Ya(e, n) {
  return [Et(e, n), ai(e, n)]
}
const Ca = () => !window.invokeNative,
  cv = () => {},
  D = (e, n) => {
      const t = S.exports.useRef(cv);
      S.exports.useEffect(() => {
          t.current = n
      }, [n]), S.exports.useEffect(() => {
          const r = i => {
              const {
                  action: a,
                  data: l
              } = i.data;
              t.current && a === e && t.current(l)
          };
          return window.addEventListener("message", r), () => window.removeEventListener("message", r)
      }, [e])
  };
async function V(e, n, t) {
  const r = {
      method: "post",
      headers: {
          "Content-Type": "application/json; charset=UTF-8"
      },
      body: JSON.stringify(n)
  };
  if (Ca() && t) return t;
  const i = window.GetParentResourceName ? window.GetParentResourceName() : "nui-frame-app";
  return await (await fetch(`https://${i}/${e}`, r)).json()
}
var Ga = {
      exports: {}
  },
  Qa = {};
/**
* @license React
* react-jsx-runtime.production.min.js
*
* Copyright (c) Facebook, Inc. and its affiliates.
*
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree.
*/
var dv = S.exports,
  fv = Symbol.for("react.element"),
  mv = Symbol.for("react.fragment"),
  pv = Object.prototype.hasOwnProperty,
  hv = dv.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,
  vv = {
      key: !0,
      ref: !0,
      __self: !0,
      __source: !0
  };

function Zf(e, n, t) {
  var r, i = {},
      a = null,
      l = null;
  t !== void 0 && (a = "" + t), n.key !== void 0 && (a = "" + n.key), n.ref !== void 0 && (l = n.ref);
  for (r in n) pv.call(n, r) && !vv.hasOwnProperty(r) && (i[r] = n[r]);
  if (e && e.defaultProps)
      for (r in n = e.defaultProps, n) i[r] === void 0 && (i[r] = n[r]);
  return {
      $$typeof: fv,
      type: e,
      key: a,
      ref: l,
      props: i,
      _owner: hv.current
  }
}
Qa.Fragment = mv;
Qa.jsx = Zf;
Qa.jsxs = Zf;
(function(e) {
  e.exports = Qa
})(Ga);
const J = Ga.exports.Fragment,
  o = Ga.exports.jsx,
  d = Ga.exports.jsxs,
  gv = S.exports.createContext(null),
  yv = ({
      children: e
  }) => {
      const [n, t] = S.exports.useState(!1);
      return D("setVisible", t), S.exports.useEffect(() => {
          if (!n) return;
          const r = i => {
              ["Escape"].includes(i.code) && (Ca() ? t(!n) : V("closeUI"))
          };
          return window.addEventListener("keydown", r), () => window.removeEventListener("keydown", r)
      }, [n]), o(gv.Provider, {
          value: {
              visible: n,
              setVisible: t
          },
          children: o("div", {
              style: {
                  visibility: n ? "visible" : "hidden",
                  height: "100%"
              },
              children: e
          })
      })
  };

function uc(e, n) {
  var t = Object.keys(e);
  if (Object.getOwnPropertySymbols) {
      var r = Object.getOwnPropertySymbols(e);
      n && (r = r.filter(function(i) {
          return Object.getOwnPropertyDescriptor(e, i).enumerable
      })), t.push.apply(t, r)
  }
  return t
}

function R(e) {
  for (var n = 1; n < arguments.length; n++) {
      var t = arguments[n] != null ? arguments[n] : {};
      n % 2 ? uc(Object(t), !0).forEach(function(r) {
          Ne(e, r, t[r])
      }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : uc(Object(t)).forEach(function(r) {
          Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
      })
  }
  return e
}

function ba(e) {
  return ba = typeof Symbol == "function" && typeof Symbol.iterator == "symbol" ? function(n) {
      return typeof n
  } : function(n) {
      return n && typeof Symbol == "function" && n.constructor === Symbol && n !== Symbol.prototype ? "symbol" : typeof n
  }, ba(e)
}

function wv(e, n) {
  if (!(e instanceof n)) throw new TypeError("Cannot call a class as a function")
}

function cc(e, n) {
  for (var t = 0; t < n.length; t++) {
      var r = n[t];
      r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
  }
}

function kv(e, n, t) {
  return n && cc(e.prototype, n), t && cc(e, t), Object.defineProperty(e, "prototype", {
      writable: !1
  }), e
}

function Ne(e, n, t) {
  return n in e ? Object.defineProperty(e, n, {
      value: t,
      enumerable: !0,
      configurable: !0,
      writable: !0
  }) : e[n] = t, e
}

function Is(e, n) {
  return Nv(e) || Ev(e, n) || Xf(e, n) || bv()
}

function li(e) {
  return xv(e) || Sv(e) || Xf(e) || Cv()
}

function xv(e) {
  if (Array.isArray(e)) return Po(e)
}

function Nv(e) {
  if (Array.isArray(e)) return e
}

function Sv(e) {
  if (typeof Symbol < "u" && e[Symbol.iterator] != null || e["@@iterator"] != null) return Array.from(e)
}

function Ev(e, n) {
  var t = e == null ? null : typeof Symbol < "u" && e[Symbol.iterator] || e["@@iterator"];
  if (t != null) {
      var r = [],
          i = !0,
          a = !1,
          l, s;
      try {
          for (t = t.call(e); !(i = (l = t.next()).done) && (r.push(l.value), !(n && r.length === n)); i = !0);
      } catch (u) {
          a = !0, s = u
      } finally {
          try {
              !i && t.return != null && t.return()
          } finally {
              if (a) throw s
          }
      }
      return r
  }
}

function Xf(e, n) {
  if (!!e) {
      if (typeof e == "string") return Po(e, n);
      var t = Object.prototype.toString.call(e).slice(8, -1);
      if (t === "Object" && e.constructor && (t = e.constructor.name), t === "Map" || t === "Set") return Array.from(e);
      if (t === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return Po(e, n)
  }
}

function Po(e, n) {
  (n == null || n > e.length) && (n = e.length);
  for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
  return r
}

function Cv() {
  throw new TypeError(`Invalid attempt to spread non-iterable instance.
In order to be iterable, non-array objects must have a [Symbol.iterator]() method.`)
}

function bv() {
  throw new TypeError(`Invalid attempt to destructure non-iterable instance.
In order to be iterable, non-array objects must have a [Symbol.iterator]() method.`)
}
var dc = function() {},
  Ms = {},
  Jf = {},
  qf = null,
  Df = {
      mark: dc,
      measure: dc
  };
try {
  typeof window < "u" && (Ms = window), typeof document < "u" && (Jf = document), typeof MutationObserver < "u" && (qf = MutationObserver), typeof performance < "u" && (Df = performance)
} catch {}
var Pv = Ms.navigator || {},
  fc = Pv.userAgent,
  mc = fc === void 0 ? "" : fc,
  qn = Ms,
  ue = Jf,
  pc = qf,
  Ti = Df;
qn.document;
var An = !!ue.documentElement && !!ue.head && typeof ue.addEventListener == "function" && typeof ue.createElement == "function",
  em = ~mc.indexOf("MSIE") || ~mc.indexOf("Trident/"),
  Ai, Li, ji, Ii, Mi, zn = "___FONT_AWESOME___",
  zo = 16,
  nm = "fa",
  tm = "svg-inline--fa",
  wt = "data-fa-i2svg",
  _o = "data-fa-pseudo-element",
  zv = "data-fa-pseudo-element-pending",
  Rs = "data-prefix",
  Fs = "data-icon",
  hc = "fontawesome-i2svg",
  _v = "async",
  Ov = ["HTML", "HEAD", "STYLE", "SCRIPT"],
  rm = function() {
      try {
          return !0
      } catch {
          return !1
      }
  }(),
  oe = "classic",
  ge = "sharp",
  Us = [oe, ge];

function oi(e) {
  return new Proxy(e, {
      get: function(t, r) {
          return r in t ? t[r] : t[oe]
      }
  })
}
var Zr = oi((Ai = {}, Ne(Ai, oe, {
      fa: "solid",
      fas: "solid",
      "fa-solid": "solid",
      far: "regular",
      "fa-regular": "regular",
      fal: "light",
      "fa-light": "light",
      fat: "thin",
      "fa-thin": "thin",
      fad: "duotone",
      "fa-duotone": "duotone",
      fab: "brands",
      "fa-brands": "brands",
      fak: "kit",
      "fa-kit": "kit"
  }), Ne(Ai, ge, {
      fa: "solid",
      fass: "solid",
      "fa-solid": "solid",
      fasr: "regular",
      "fa-regular": "regular"
  }), Ai)),
  Xr = oi((Li = {}, Ne(Li, oe, {
      solid: "fas",
      regular: "far",
      light: "fal",
      thin: "fat",
      duotone: "fad",
      brands: "fab",
      kit: "fak"
  }), Ne(Li, ge, {
      solid: "fass",
      regular: "fasr"
  }), Li)),
  Jr = oi((ji = {}, Ne(ji, oe, {
      fab: "fa-brands",
      fad: "fa-duotone",
      fak: "fa-kit",
      fal: "fa-light",
      far: "fa-regular",
      fas: "fa-solid",
      fat: "fa-thin"
  }), Ne(ji, ge, {
      fass: "fa-solid",
      fasr: "fa-regular"
  }), ji)),
  Tv = oi((Ii = {}, Ne(Ii, oe, {
      "fa-brands": "fab",
      "fa-duotone": "fad",
      "fa-kit": "fak",
      "fa-light": "fal",
      "fa-regular": "far",
      "fa-solid": "fas",
      "fa-thin": "fat"
  }), Ne(Ii, ge, {
      "fa-solid": "fass",
      "fa-regular": "fasr"
  }), Ii)),
  Av = /fa(s|r|l|t|d|b|k|ss|sr)?[\-\ ]/,
  im = "fa-layers-text",
  Lv = /Font ?Awesome ?([56 ]*)(Solid|Regular|Light|Thin|Duotone|Brands|Free|Pro|Sharp|Kit)?.*/i,
  jv = oi((Mi = {}, Ne(Mi, oe, {
      900: "fas",
      400: "far",
      normal: "far",
      300: "fal",
      100: "fat"
  }), Ne(Mi, ge, {
      900: "fass",
      400: "fasr"
  }), Mi)),
  am = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  Iv = am.concat([11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
  Mv = ["class", "data-prefix", "data-icon", "data-fa-transform", "data-fa-mask"],
  ct = {
      GROUP: "duotone-group",
      SWAP_OPACITY: "swap-opacity",
      PRIMARY: "primary",
      SECONDARY: "secondary"
  },
  qr = new Set;
Object.keys(Xr[oe]).map(qr.add.bind(qr));
Object.keys(Xr[ge]).map(qr.add.bind(qr));
var Rv = [].concat(Us, li(qr), ["2xs", "xs", "sm", "lg", "xl", "2xl", "beat", "border", "fade", "beat-fade", "bounce", "flip-both", "flip-horizontal", "flip-vertical", "flip", "fw", "inverse", "layers-counter", "layers-text", "layers", "li", "pull-left", "pull-right", "pulse", "rotate-180", "rotate-270", "rotate-90", "rotate-by", "shake", "spin-pulse", "spin-reverse", "spin", "stack-1x", "stack-2x", "stack", "ul", ct.GROUP, ct.SWAP_OPACITY, ct.PRIMARY, ct.SECONDARY]).concat(am.map(function(e) {
      return "".concat(e, "x")
  })).concat(Iv.map(function(e) {
      return "w-".concat(e)
  })),
  Or = qn.FontAwesomeConfig || {};

function Fv(e) {
  var n = ue.querySelector("script[" + e + "]");
  if (n) return n.getAttribute(e)
}

function Uv(e) {
  return e === "" ? !0 : e === "false" ? !1 : e === "true" ? !0 : e
}
if (ue && typeof ue.querySelector == "function") {
  var Bv = [
      ["data-family-prefix", "familyPrefix"],
      ["data-css-prefix", "cssPrefix"],
      ["data-family-default", "familyDefault"],
      ["data-style-default", "styleDefault"],
      ["data-replacement-class", "replacementClass"],
      ["data-auto-replace-svg", "autoReplaceSvg"],
      ["data-auto-add-css", "autoAddCss"],
      ["data-auto-a11y", "autoA11y"],
      ["data-search-pseudo-elements", "searchPseudoElements"],
      ["data-observe-mutations", "observeMutations"],
      ["data-mutate-approach", "mutateApproach"],
      ["data-keep-original-source", "keepOriginalSource"],
      ["data-measure-performance", "measurePerformance"],
      ["data-show-missing-icons", "showMissingIcons"]
  ];
  Bv.forEach(function(e) {
      var n = Is(e, 2),
          t = n[0],
          r = n[1],
          i = Uv(Fv(t));
      i != null && (Or[r] = i)
  })
}
var lm = {
  styleDefault: "solid",
  familyDefault: "classic",
  cssPrefix: nm,
  replacementClass: tm,
  autoReplaceSvg: !0,
  autoAddCss: !0,
  autoA11y: !0,
  searchPseudoElements: !1,
  observeMutations: !0,
  mutateApproach: "async",
  keepOriginalSource: !0,
  measurePerformance: !1,
  showMissingIcons: !0
};
Or.familyPrefix && (Or.cssPrefix = Or.familyPrefix);
var nr = R(R({}, lm), Or);
nr.autoReplaceSvg || (nr.observeMutations = !1);
var $ = {};
Object.keys(lm).forEach(function(e) {
  Object.defineProperty($, e, {
      enumerable: !0,
      set: function(t) {
          nr[e] = t, Tr.forEach(function(r) {
              return r($)
          })
      },
      get: function() {
          return nr[e]
      }
  })
});
Object.defineProperty($, "familyPrefix", {
  enumerable: !0,
  set: function(n) {
      nr.cssPrefix = n, Tr.forEach(function(t) {
          return t($)
      })
  },
  get: function() {
      return nr.cssPrefix
  }
});
qn.FontAwesomeConfig = $;
var Tr = [];

function Vv(e) {
  return Tr.push(e),
      function() {
          Tr.splice(Tr.indexOf(e), 1)
      }
}
var jn = zo,
  vn = {
      size: 16,
      x: 0,
      y: 0,
      rotate: 0,
      flipX: !1,
      flipY: !1
  };

function $v(e) {
  if (!(!e || !An)) {
      var n = ue.createElement("style");
      n.setAttribute("type", "text/css"), n.innerHTML = e;
      for (var t = ue.head.childNodes, r = null, i = t.length - 1; i > -1; i--) {
          var a = t[i],
              l = (a.tagName || "").toUpperCase();
          ["STYLE", "LINK"].indexOf(l) > -1 && (r = a)
      }
      return ue.head.insertBefore(n, r), e
  }
}
var Wv = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

function Dr() {
  for (var e = 12, n = ""; e-- > 0;) n += Wv[Math.random() * 62 | 0];
  return n
}

function lr(e) {
  for (var n = [], t = (e || []).length >>> 0; t--;) n[t] = e[t];
  return n
}

function Bs(e) {
  return e.classList ? lr(e.classList) : (e.getAttribute("class") || "").split(" ").filter(function(n) {
      return n
  })
}

function om(e) {
  return "".concat(e).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
}

function Hv(e) {
  return Object.keys(e || {}).reduce(function(n, t) {
      return n + "".concat(t, '="').concat(om(e[t]), '" ')
  }, "").trim()
}

function Ka(e) {
  return Object.keys(e || {}).reduce(function(n, t) {
      return n + "".concat(t, ": ").concat(e[t].trim(), ";")
  }, "")
}

function Vs(e) {
  return e.size !== vn.size || e.x !== vn.x || e.y !== vn.y || e.rotate !== vn.rotate || e.flipX || e.flipY
}

function Yv(e) {
  var n = e.transform,
      t = e.containerWidth,
      r = e.iconWidth,
      i = {
          transform: "translate(".concat(t / 2, " 256)")
      },
      a = "translate(".concat(n.x * 32, ", ").concat(n.y * 32, ") "),
      l = "scale(".concat(n.size / 16 * (n.flipX ? -1 : 1), ", ").concat(n.size / 16 * (n.flipY ? -1 : 1), ") "),
      s = "rotate(".concat(n.rotate, " 0 0)"),
      u = {
          transform: "".concat(a, " ").concat(l, " ").concat(s)
      },
      c = {
          transform: "translate(".concat(r / 2 * -1, " -256)")
      };
  return {
      outer: i,
      inner: u,
      path: c
  }
}

function Gv(e) {
  var n = e.transform,
      t = e.width,
      r = t === void 0 ? zo : t,
      i = e.height,
      a = i === void 0 ? zo : i,
      l = e.startCentered,
      s = l === void 0 ? !1 : l,
      u = "";
  return s && em ? u += "translate(".concat(n.x / jn - r / 2, "em, ").concat(n.y / jn - a / 2, "em) ") : s ? u += "translate(calc(-50% + ".concat(n.x / jn, "em), calc(-50% + ").concat(n.y / jn, "em)) ") : u += "translate(".concat(n.x / jn, "em, ").concat(n.y / jn, "em) "), u += "scale(".concat(n.size / jn * (n.flipX ? -1 : 1), ", ").concat(n.size / jn * (n.flipY ? -1 : 1), ") "), u += "rotate(".concat(n.rotate, "deg) "), u
}
var Qv = `:root, :host {
--fa-font-solid: normal 900 1em/1 "Font Awesome 6 Solid";
--fa-font-regular: normal 400 1em/1 "Font Awesome 6 Regular";
--fa-font-light: normal 300 1em/1 "Font Awesome 6 Light";
--fa-font-thin: normal 100 1em/1 "Font Awesome 6 Thin";
--fa-font-duotone: normal 900 1em/1 "Font Awesome 6 Duotone";
--fa-font-sharp-solid: normal 900 1em/1 "Font Awesome 6 Sharp";
--fa-font-sharp-regular: normal 400 1em/1 "Font Awesome 6 Sharp";
--fa-font-brands: normal 400 1em/1 "Font Awesome 6 Brands";
}

svg:not(:root).svg-inline--fa, svg:not(:host).svg-inline--fa {
overflow: visible;
box-sizing: content-box;
}

.svg-inline--fa {
display: var(--fa-display, inline-block);
height: 1em;
overflow: visible;
vertical-align: -0.125em;
}
.svg-inline--fa.fa-2xs {
vertical-align: 0.1em;
}
.svg-inline--fa.fa-xs {
vertical-align: 0em;
}
.svg-inline--fa.fa-sm {
vertical-align: -0.0714285705em;
}
.svg-inline--fa.fa-lg {
vertical-align: -0.2em;
}
.svg-inline--fa.fa-xl {
vertical-align: -0.25em;
}
.svg-inline--fa.fa-2xl {
vertical-align: -0.3125em;
}
.svg-inline--fa.fa-pull-left {
margin-right: var(--fa-pull-margin, 0.3em);
width: auto;
}
.svg-inline--fa.fa-pull-right {
margin-left: var(--fa-pull-margin, 0.3em);
width: auto;
}
.svg-inline--fa.fa-li {
width: var(--fa-li-width, 2em);
top: 0.25em;
}
.svg-inline--fa.fa-fw {
width: var(--fa-fw-width, 1.25em);
}

.fa-layers svg.svg-inline--fa {
bottom: 0;
left: 0;
margin: auto;
position: absolute;
right: 0;
top: 0;
}

.fa-layers-counter, .fa-layers-text {
display: inline-block;
position: absolute;
text-align: center;
}

.fa-layers {
display: inline-block;
height: 1em;
position: relative;
text-align: center;
vertical-align: -0.125em;
width: 1em;
}
.fa-layers svg.svg-inline--fa {
-webkit-transform-origin: center center;
        transform-origin: center center;
}

.fa-layers-text {
left: 50%;
top: 50%;
-webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
-webkit-transform-origin: center center;
        transform-origin: center center;
}

.fa-layers-counter {
background-color: var(--fa-counter-background-color, #ff253a);
border-radius: var(--fa-counter-border-radius, 1em);
box-sizing: border-box;
color: var(--fa-inverse, #fff);
line-height: var(--fa-counter-line-height, 1);
max-width: var(--fa-counter-max-width, 5em);
min-width: var(--fa-counter-min-width, 1.5em);
overflow: hidden;
padding: var(--fa-counter-padding, 0.25em 0.5em);
right: var(--fa-right, 0);
text-overflow: ellipsis;
top: var(--fa-top, 0);
-webkit-transform: scale(var(--fa-counter-scale, 0.25));
        transform: scale(var(--fa-counter-scale, 0.25));
-webkit-transform-origin: top right;
        transform-origin: top right;
}

.fa-layers-bottom-right {
bottom: var(--fa-bottom, 0);
right: var(--fa-right, 0);
top: auto;
-webkit-transform: scale(var(--fa-layers-scale, 0.25));
        transform: scale(var(--fa-layers-scale, 0.25));
-webkit-transform-origin: bottom right;
        transform-origin: bottom right;
}

.fa-layers-bottom-left {
bottom: var(--fa-bottom, 0);
left: var(--fa-left, 0);
right: auto;
top: auto;
-webkit-transform: scale(var(--fa-layers-scale, 0.25));
        transform: scale(var(--fa-layers-scale, 0.25));
-webkit-transform-origin: bottom left;
        transform-origin: bottom left;
}

.fa-layers-top-right {
top: var(--fa-top, 0);
right: var(--fa-right, 0);
-webkit-transform: scale(var(--fa-layers-scale, 0.25));
        transform: scale(var(--fa-layers-scale, 0.25));
-webkit-transform-origin: top right;
        transform-origin: top right;
}

.fa-layers-top-left {
left: var(--fa-left, 0);
right: auto;
top: var(--fa-top, 0);
-webkit-transform: scale(var(--fa-layers-scale, 0.25));
        transform: scale(var(--fa-layers-scale, 0.25));
-webkit-transform-origin: top left;
        transform-origin: top left;
}

.fa-1x {
font-size: 1em;
}

.fa-2x {
font-size: 2em;
}

.fa-3x {
font-size: 3em;
}

.fa-4x {
font-size: 4em;
}

.fa-5x {
font-size: 5em;
}

.fa-6x {
font-size: 6em;
}

.fa-7x {
font-size: 7em;
}

.fa-8x {
font-size: 8em;
}

.fa-9x {
font-size: 9em;
}

.fa-10x {
font-size: 10em;
}

.fa-2xs {
font-size: 0.625em;
line-height: 0.1em;
vertical-align: 0.225em;
}

.fa-xs {
font-size: 0.75em;
line-height: 0.0833333337em;
vertical-align: 0.125em;
}

.fa-sm {
font-size: 0.875em;
line-height: 0.0714285718em;
vertical-align: 0.0535714295em;
}

.fa-lg {
font-size: 1.25em;
line-height: 0.05em;
vertical-align: -0.075em;
}

.fa-xl {
font-size: 1.5em;
line-height: 0.0416666682em;
vertical-align: -0.125em;
}

.fa-2xl {
font-size: 2em;
line-height: 0.03125em;
vertical-align: -0.1875em;
}

.fa-fw {
text-align: center;
width: 1.25em;
}

.fa-ul {
list-style-type: none;
margin-left: var(--fa-li-margin, 2.5em);
padding-left: 0;
}
.fa-ul > li {
position: relative;
}

.fa-li {
left: calc(var(--fa-li-width, 2em) * -1);
position: absolute;
text-align: center;
width: var(--fa-li-width, 2em);
line-height: inherit;
}

.fa-border {
border-color: var(--fa-border-color, #eee);
border-radius: var(--fa-border-radius, 0.1em);
border-style: var(--fa-border-style, solid);
border-width: var(--fa-border-width, 0.08em);
padding: var(--fa-border-padding, 0.2em 0.25em 0.15em);
}

.fa-pull-left {
float: left;
margin-right: var(--fa-pull-margin, 0.3em);
}

.fa-pull-right {
float: right;
margin-left: var(--fa-pull-margin, 0.3em);
}

.fa-beat {
-webkit-animation-name: fa-beat;
        animation-name: fa-beat;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, ease-in-out);
        animation-timing-function: var(--fa-animation-timing, ease-in-out);
}

.fa-bounce {
-webkit-animation-name: fa-bounce;
        animation-name: fa-bounce;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.28, 0.84, 0.42, 1));
        animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.28, 0.84, 0.42, 1));
}

.fa-fade {
-webkit-animation-name: fa-fade;
        animation-name: fa-fade;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1));
        animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1));
}

.fa-beat-fade {
-webkit-animation-name: fa-beat-fade;
        animation-name: fa-beat-fade;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1));
        animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1));
}

.fa-flip {
-webkit-animation-name: fa-flip;
        animation-name: fa-flip;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, ease-in-out);
        animation-timing-function: var(--fa-animation-timing, ease-in-out);
}

.fa-shake {
-webkit-animation-name: fa-shake;
        animation-name: fa-shake;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, linear);
        animation-timing-function: var(--fa-animation-timing, linear);
}

.fa-spin {
-webkit-animation-name: fa-spin;
        animation-name: fa-spin;
-webkit-animation-delay: var(--fa-animation-delay, 0s);
        animation-delay: var(--fa-animation-delay, 0s);
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 2s);
        animation-duration: var(--fa-animation-duration, 2s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, linear);
        animation-timing-function: var(--fa-animation-timing, linear);
}

.fa-spin-reverse {
--fa-animation-direction: reverse;
}

.fa-pulse,
.fa-spin-pulse {
-webkit-animation-name: fa-spin;
        animation-name: fa-spin;
-webkit-animation-direction: var(--fa-animation-direction, normal);
        animation-direction: var(--fa-animation-direction, normal);
-webkit-animation-duration: var(--fa-animation-duration, 1s);
        animation-duration: var(--fa-animation-duration, 1s);
-webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
        animation-iteration-count: var(--fa-animation-iteration-count, infinite);
-webkit-animation-timing-function: var(--fa-animation-timing, steps(8));
        animation-timing-function: var(--fa-animation-timing, steps(8));
}

@media (prefers-reduced-motion: reduce) {
.fa-beat,
.fa-bounce,
.fa-fade,
.fa-beat-fade,
.fa-flip,
.fa-pulse,
.fa-shake,
.fa-spin,
.fa-spin-pulse {
  -webkit-animation-delay: -1ms;
          animation-delay: -1ms;
  -webkit-animation-duration: 1ms;
          animation-duration: 1ms;
  -webkit-animation-iteration-count: 1;
          animation-iteration-count: 1;
  -webkit-transition-delay: 0s;
          transition-delay: 0s;
  -webkit-transition-duration: 0s;
          transition-duration: 0s;
}
}
@-webkit-keyframes fa-beat {
0%, 90% {
  -webkit-transform: scale(1);
          transform: scale(1);
}
45% {
  -webkit-transform: scale(var(--fa-beat-scale, 1.25));
          transform: scale(var(--fa-beat-scale, 1.25));
}
}
@keyframes fa-beat {
0%, 90% {
  -webkit-transform: scale(1);
          transform: scale(1);
}
45% {
  -webkit-transform: scale(var(--fa-beat-scale, 1.25));
          transform: scale(var(--fa-beat-scale, 1.25));
}
}
@-webkit-keyframes fa-bounce {
0% {
  -webkit-transform: scale(1, 1) translateY(0);
          transform: scale(1, 1) translateY(0);
}
10% {
  -webkit-transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0);
          transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0);
}
30% {
  -webkit-transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em));
          transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em));
}
50% {
  -webkit-transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0);
          transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0);
}
57% {
  -webkit-transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em));
          transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em));
}
64% {
  -webkit-transform: scale(1, 1) translateY(0);
          transform: scale(1, 1) translateY(0);
}
100% {
  -webkit-transform: scale(1, 1) translateY(0);
          transform: scale(1, 1) translateY(0);
}
}
@keyframes fa-bounce {
0% {
  -webkit-transform: scale(1, 1) translateY(0);
          transform: scale(1, 1) translateY(0);
}
10% {
  -webkit-transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0);
          transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0);
}
30% {
  -webkit-transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em));
          transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em));
}
50% {
  -webkit-transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0);
          transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0);
}
57% {
  -webkit-transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em));
          transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em));
}
64% {
  -webkit-transform: scale(1, 1) translateY(0);
          transform: scale(1, 1) translateY(0);
}
100% {
  -webkit-transform: scale(1, 1) translateY(0);
          transform: scale(1, 1) translateY(0);
}
}
@-webkit-keyframes fa-fade {
50% {
  opacity: var(--fa-fade-opacity, 0.4);
}
}
@keyframes fa-fade {
50% {
  opacity: var(--fa-fade-opacity, 0.4);
}
}
@-webkit-keyframes fa-beat-fade {
0%, 100% {
  opacity: var(--fa-beat-fade-opacity, 0.4);
  -webkit-transform: scale(1);
          transform: scale(1);
}
50% {
  opacity: 1;
  -webkit-transform: scale(var(--fa-beat-fade-scale, 1.125));
          transform: scale(var(--fa-beat-fade-scale, 1.125));
}
}
@keyframes fa-beat-fade {
0%, 100% {
  opacity: var(--fa-beat-fade-opacity, 0.4);
  -webkit-transform: scale(1);
          transform: scale(1);
}
50% {
  opacity: 1;
  -webkit-transform: scale(var(--fa-beat-fade-scale, 1.125));
          transform: scale(var(--fa-beat-fade-scale, 1.125));
}
}
@-webkit-keyframes fa-flip {
50% {
  -webkit-transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg));
          transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg));
}
}
@keyframes fa-flip {
50% {
  -webkit-transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg));
          transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg));
}
}
@-webkit-keyframes fa-shake {
0% {
  -webkit-transform: rotate(-15deg);
          transform: rotate(-15deg);
}
4% {
  -webkit-transform: rotate(15deg);
          transform: rotate(15deg);
}
8%, 24% {
  -webkit-transform: rotate(-18deg);
          transform: rotate(-18deg);
}
12%, 28% {
  -webkit-transform: rotate(18deg);
          transform: rotate(18deg);
}
16% {
  -webkit-transform: rotate(-22deg);
          transform: rotate(-22deg);
}
20% {
  -webkit-transform: rotate(22deg);
          transform: rotate(22deg);
}
32% {
  -webkit-transform: rotate(-12deg);
          transform: rotate(-12deg);
}
36% {
  -webkit-transform: rotate(12deg);
          transform: rotate(12deg);
}
40%, 100% {
  -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
}
}
@keyframes fa-shake {
0% {
  -webkit-transform: rotate(-15deg);
          transform: rotate(-15deg);
}
4% {
  -webkit-transform: rotate(15deg);
          transform: rotate(15deg);
}
8%, 24% {
  -webkit-transform: rotate(-18deg);
          transform: rotate(-18deg);
}
12%, 28% {
  -webkit-transform: rotate(18deg);
          transform: rotate(18deg);
}
16% {
  -webkit-transform: rotate(-22deg);
          transform: rotate(-22deg);
}
20% {
  -webkit-transform: rotate(22deg);
          transform: rotate(22deg);
}
32% {
  -webkit-transform: rotate(-12deg);
          transform: rotate(-12deg);
}
36% {
  -webkit-transform: rotate(12deg);
          transform: rotate(12deg);
}
40%, 100% {
  -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
}
}
@-webkit-keyframes fa-spin {
0% {
  -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
}
100% {
  -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
}
}
@keyframes fa-spin {
0% {
  -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
}
100% {
  -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
}
}
.fa-rotate-90 {
-webkit-transform: rotate(90deg);
        transform: rotate(90deg);
}

.fa-rotate-180 {
-webkit-transform: rotate(180deg);
        transform: rotate(180deg);
}

.fa-rotate-270 {
-webkit-transform: rotate(270deg);
        transform: rotate(270deg);
}

.fa-flip-horizontal {
-webkit-transform: scale(-1, 1);
        transform: scale(-1, 1);
}

.fa-flip-vertical {
-webkit-transform: scale(1, -1);
        transform: scale(1, -1);
}

.fa-flip-both,
.fa-flip-horizontal.fa-flip-vertical {
-webkit-transform: scale(-1, -1);
        transform: scale(-1, -1);
}

.fa-rotate-by {
-webkit-transform: rotate(var(--fa-rotate-angle, none));
        transform: rotate(var(--fa-rotate-angle, none));
}

.fa-stack {
display: inline-block;
vertical-align: middle;
height: 2em;
position: relative;
width: 2.5em;
}

.fa-stack-1x,
.fa-stack-2x {
bottom: 0;
left: 0;
margin: auto;
position: absolute;
right: 0;
top: 0;
z-index: var(--fa-stack-z-index, auto);
}

.svg-inline--fa.fa-stack-1x {
height: 1em;
width: 1.25em;
}
.svg-inline--fa.fa-stack-2x {
height: 2em;
width: 2.5em;
}

.fa-inverse {
color: var(--fa-inverse, #fff);
}

.sr-only,
.fa-sr-only {
position: absolute;
width: 1px;
height: 1px;
padding: 0;
margin: -1px;
overflow: hidden;
clip: rect(0, 0, 0, 0);
white-space: nowrap;
border-width: 0;
}

.sr-only-focusable:not(:focus),
.fa-sr-only-focusable:not(:focus) {
position: absolute;
width: 1px;
height: 1px;
padding: 0;
margin: -1px;
overflow: hidden;
clip: rect(0, 0, 0, 0);
white-space: nowrap;
border-width: 0;
}

.svg-inline--fa .fa-primary {
fill: var(--fa-primary-color, currentColor);
opacity: var(--fa-primary-opacity, 1);
}

.svg-inline--fa .fa-secondary {
fill: var(--fa-secondary-color, currentColor);
opacity: var(--fa-secondary-opacity, 0.4);
}

.svg-inline--fa.fa-swap-opacity .fa-primary {
opacity: var(--fa-secondary-opacity, 0.4);
}

.svg-inline--fa.fa-swap-opacity .fa-secondary {
opacity: var(--fa-primary-opacity, 1);
}

.svg-inline--fa mask .fa-primary,
.svg-inline--fa mask .fa-secondary {
fill: black;
}

.fad.fa-inverse,
.fa-duotone.fa-inverse {
color: var(--fa-inverse, #fff);
}`;

function sm() {
  var e = nm,
      n = tm,
      t = $.cssPrefix,
      r = $.replacementClass,
      i = Qv;
  if (t !== e || r !== n) {
      var a = new RegExp("\\.".concat(e, "\\-"), "g"),
          l = new RegExp("\\--".concat(e, "\\-"), "g"),
          s = new RegExp("\\.".concat(n), "g");
      i = i.replace(a, ".".concat(t, "-")).replace(l, "--".concat(t, "-")).replace(s, ".".concat(r))
  }
  return i
}
var vc = !1;

function zl() {
  $.autoAddCss && !vc && ($v(sm()), vc = !0)
}
var Kv = {
      mixout: function() {
          return {
              dom: {
                  css: sm,
                  insertCss: zl
              }
          }
      },
      hooks: function() {
          return {
              beforeDOMElementCreation: function() {
                  zl()
              },
              beforeI2svg: function() {
                  zl()
              }
          }
      }
  },
  _n = qn || {};
_n[zn] || (_n[zn] = {});
_n[zn].styles || (_n[zn].styles = {});
_n[zn].hooks || (_n[zn].hooks = {});
_n[zn].shims || (_n[zn].shims = []);
var un = _n[zn],
  um = [],
  Zv = function e() {
      ue.removeEventListener("DOMContentLoaded", e), Pa = 1, um.map(function(n) {
          return n()
      })
  },
  Pa = !1;
An && (Pa = (ue.documentElement.doScroll ? /^loaded|^c/ : /^loaded|^i|^c/).test(ue.readyState), Pa || ue.addEventListener("DOMContentLoaded", Zv));

function Xv(e) {
  !An || (Pa ? setTimeout(e, 0) : um.push(e))
}

function si(e) {
  var n = e.tag,
      t = e.attributes,
      r = t === void 0 ? {} : t,
      i = e.children,
      a = i === void 0 ? [] : i;
  return typeof e == "string" ? om(e) : "<".concat(n, " ").concat(Hv(r), ">").concat(a.map(si).join(""), "</").concat(n, ">")
}

function gc(e, n, t) {
  if (e && e[n] && e[n][t]) return {
      prefix: n,
      iconName: t,
      icon: e[n][t]
  }
}
var Jv = function(n, t) {
      return function(r, i, a, l) {
          return n.call(t, r, i, a, l)
      }
  },
  _l = function(n, t, r, i) {
      var a = Object.keys(n),
          l = a.length,
          s = i !== void 0 ? Jv(t, i) : t,
          u, c, h;
      for (r === void 0 ? (u = 1, h = n[a[0]]) : (u = 0, h = r); u < l; u++) c = a[u], h = s(h, n[c], c, n);
      return h
  };

function qv(e) {
  for (var n = [], t = 0, r = e.length; t < r;) {
      var i = e.charCodeAt(t++);
      if (i >= 55296 && i <= 56319 && t < r) {
          var a = e.charCodeAt(t++);
          (a & 64512) == 56320 ? n.push(((i & 1023) << 10) + (a & 1023) + 65536) : (n.push(i), t--)
      } else n.push(i)
  }
  return n
}

function Oo(e) {
  var n = qv(e);
  return n.length === 1 ? n[0].toString(16) : null
}

function Dv(e, n) {
  var t = e.length,
      r = e.charCodeAt(n),
      i;
  return r >= 55296 && r <= 56319 && t > n + 1 && (i = e.charCodeAt(n + 1), i >= 56320 && i <= 57343) ? (r - 55296) * 1024 + i - 56320 + 65536 : r
}

function yc(e) {
  return Object.keys(e).reduce(function(n, t) {
      var r = e[t],
          i = !!r.icon;
      return i ? n[r.iconName] = r.icon : n[t] = r, n
  }, {})
}

function To(e, n) {
  var t = arguments.length > 2 && arguments[2] !== void 0 ? arguments[2] : {},
      r = t.skipHooks,
      i = r === void 0 ? !1 : r,
      a = yc(n);
  typeof un.hooks.addPack == "function" && !i ? un.hooks.addPack(e, yc(n)) : un.styles[e] = R(R({}, un.styles[e] || {}), a), e === "fas" && To("fa", n)
}
var Ri, Fi, Ui, Ft = un.styles,
  e1 = un.shims,
  n1 = (Ri = {}, Ne(Ri, oe, Object.values(Jr[oe])), Ne(Ri, ge, Object.values(Jr[ge])), Ri),
  $s = null,
  cm = {},
  dm = {},
  fm = {},
  mm = {},
  pm = {},
  t1 = (Fi = {}, Ne(Fi, oe, Object.keys(Zr[oe])), Ne(Fi, ge, Object.keys(Zr[ge])), Fi);

function r1(e) {
  return ~Rv.indexOf(e)
}

function i1(e, n) {
  var t = n.split("-"),
      r = t[0],
      i = t.slice(1).join("-");
  return r === e && i !== "" && !r1(i) ? i : null
}
var hm = function() {
  var n = function(a) {
      return _l(Ft, function(l, s, u) {
          return l[u] = _l(s, a, {}), l
      }, {})
  };
  cm = n(function(i, a, l) {
      if (a[3] && (i[a[3]] = l), a[2]) {
          var s = a[2].filter(function(u) {
              return typeof u == "number"
          });
          s.forEach(function(u) {
              i[u.toString(16)] = l
          })
      }
      return i
  }), dm = n(function(i, a, l) {
      if (i[l] = l, a[2]) {
          var s = a[2].filter(function(u) {
              return typeof u == "string"
          });
          s.forEach(function(u) {
              i[u] = l
          })
      }
      return i
  }), pm = n(function(i, a, l) {
      var s = a[2];
      return i[l] = l, s.forEach(function(u) {
          i[u] = l
      }), i
  });
  var t = "far" in Ft || $.autoFetchSvg,
      r = _l(e1, function(i, a) {
          var l = a[0],
              s = a[1],
              u = a[2];
          return s === "far" && !t && (s = "fas"), typeof l == "string" && (i.names[l] = {
              prefix: s,
              iconName: u
          }), typeof l == "number" && (i.unicodes[l.toString(16)] = {
              prefix: s,
              iconName: u
          }), i
      }, {
          names: {},
          unicodes: {}
      });
  fm = r.names, mm = r.unicodes, $s = Za($.styleDefault, {
      family: $.familyDefault
  })
};
Vv(function(e) {
  $s = Za(e.styleDefault, {
      family: $.familyDefault
  })
});
hm();

function Ws(e, n) {
  return (cm[e] || {})[n]
}

function a1(e, n) {
  return (dm[e] || {})[n]
}

function dt(e, n) {
  return (pm[e] || {})[n]
}

function vm(e) {
  return fm[e] || {
      prefix: null,
      iconName: null
  }
}

function l1(e) {
  var n = mm[e],
      t = Ws("fas", e);
  return n || (t ? {
      prefix: "fas",
      iconName: t
  } : null) || {
      prefix: null,
      iconName: null
  }
}

function Dn() {
  return $s
}
var Hs = function() {
  return {
      prefix: null,
      iconName: null,
      rest: []
  }
};

function Za(e) {
  var n = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
      t = n.family,
      r = t === void 0 ? oe : t,
      i = Zr[r][e],
      a = Xr[r][e] || Xr[r][i],
      l = e in un.styles ? e : null;
  return a || l || null
}
var wc = (Ui = {}, Ne(Ui, oe, Object.keys(Jr[oe])), Ne(Ui, ge, Object.keys(Jr[ge])), Ui);

function Xa(e) {
  var n, t = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
      r = t.skipLookups,
      i = r === void 0 ? !1 : r,
      a = (n = {}, Ne(n, oe, "".concat($.cssPrefix, "-").concat(oe)), Ne(n, ge, "".concat($.cssPrefix, "-").concat(ge)), n),
      l = null,
      s = oe;
  (e.includes(a[oe]) || e.some(function(c) {
      return wc[oe].includes(c)
  })) && (s = oe), (e.includes(a[ge]) || e.some(function(c) {
      return wc[ge].includes(c)
  })) && (s = ge);
  var u = e.reduce(function(c, h) {
      var g = i1($.cssPrefix, h);
      if (Ft[h] ? (h = n1[s].includes(h) ? Tv[s][h] : h, l = h, c.prefix = h) : t1[s].indexOf(h) > -1 ? (l = h, c.prefix = Za(h, {
              family: s
          })) : g ? c.iconName = g : h !== $.replacementClass && h !== a[oe] && h !== a[ge] && c.rest.push(h), !i && c.prefix && c.iconName) {
          var y = l === "fa" ? vm(c.iconName) : {},
              k = dt(c.prefix, c.iconName);
          y.prefix && (l = null), c.iconName = y.iconName || k || c.iconName, c.prefix = y.prefix || c.prefix, c.prefix === "far" && !Ft.far && Ft.fas && !$.autoFetchSvg && (c.prefix = "fas")
      }
      return c
  }, Hs());
  return (e.includes("fa-brands") || e.includes("fab")) && (u.prefix = "fab"), (e.includes("fa-duotone") || e.includes("fad")) && (u.prefix = "fad"), !u.prefix && s === ge && (Ft.fass || $.autoFetchSvg) && (u.prefix = "fass", u.iconName = dt(u.prefix, u.iconName) || u.iconName), (u.prefix === "fa" || l === "fa") && (u.prefix = Dn() || "fas"), u
}
var o1 = function() {
      function e() {
          wv(this, e), this.definitions = {}
      }
      return kv(e, [{
          key: "add",
          value: function() {
              for (var t = this, r = arguments.length, i = new Array(r), a = 0; a < r; a++) i[a] = arguments[a];
              var l = i.reduce(this._pullDefinitions, {});
              Object.keys(l).forEach(function(s) {
                  t.definitions[s] = R(R({}, t.definitions[s] || {}), l[s]), To(s, l[s]);
                  var u = Jr[oe][s];
                  u && To(u, l[s]), hm()
              })
          }
      }, {
          key: "reset",
          value: function() {
              this.definitions = {}
          }
      }, {
          key: "_pullDefinitions",
          value: function(t, r) {
              var i = r.prefix && r.iconName && r.icon ? {
                  0: r
              } : r;
              return Object.keys(i).map(function(a) {
                  var l = i[a],
                      s = l.prefix,
                      u = l.iconName,
                      c = l.icon,
                      h = c[2];
                  t[s] || (t[s] = {}), h.length > 0 && h.forEach(function(g) {
                      typeof g == "string" && (t[s][g] = c)
                  }), t[s][u] = c
              }), t
          }
      }]), e
  }(),
  kc = [],
  Ut = {},
  Qt = {},
  s1 = Object.keys(Qt);

function u1(e, n) {
  var t = n.mixoutsTo;
  return kc = e, Ut = {}, Object.keys(Qt).forEach(function(r) {
      s1.indexOf(r) === -1 && delete Qt[r]
  }), kc.forEach(function(r) {
      var i = r.mixout ? r.mixout() : {};
      if (Object.keys(i).forEach(function(l) {
              typeof i[l] == "function" && (t[l] = i[l]), ba(i[l]) === "object" && Object.keys(i[l]).forEach(function(s) {
                  t[l] || (t[l] = {}), t[l][s] = i[l][s]
              })
          }), r.hooks) {
          var a = r.hooks();
          Object.keys(a).forEach(function(l) {
              Ut[l] || (Ut[l] = []), Ut[l].push(a[l])
          })
      }
      r.provides && r.provides(Qt)
  }), t
}

function Ao(e, n) {
  for (var t = arguments.length, r = new Array(t > 2 ? t - 2 : 0), i = 2; i < t; i++) r[i - 2] = arguments[i];
  var a = Ut[e] || [];
  return a.forEach(function(l) {
      n = l.apply(null, [n].concat(r))
  }), n
}

function kt(e) {
  for (var n = arguments.length, t = new Array(n > 1 ? n - 1 : 0), r = 1; r < n; r++) t[r - 1] = arguments[r];
  var i = Ut[e] || [];
  i.forEach(function(a) {
      a.apply(null, t)
  })
}

function On() {
  var e = arguments[0],
      n = Array.prototype.slice.call(arguments, 1);
  return Qt[e] ? Qt[e].apply(null, n) : void 0
}

function Lo(e) {
  e.prefix === "fa" && (e.prefix = "fas");
  var n = e.iconName,
      t = e.prefix || Dn();
  if (!!n) return n = dt(t, n) || n, gc(gm.definitions, t, n) || gc(un.styles, t, n)
}
var gm = new o1,
  c1 = function() {
      $.autoReplaceSvg = !1, $.observeMutations = !1, kt("noAuto")
  },
  d1 = {
      i2svg: function() {
          var n = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {};
          return An ? (kt("beforeI2svg", n), On("pseudoElements2svg", n), On("i2svg", n)) : Promise.reject("Operation requires a DOM of some kind.")
      },
      watch: function() {
          var n = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {},
              t = n.autoReplaceSvgRoot;
          $.autoReplaceSvg === !1 && ($.autoReplaceSvg = !0), $.observeMutations = !0, Xv(function() {
              m1({
                  autoReplaceSvgRoot: t
              }), kt("watch", n)
          })
      }
  },
  f1 = {
      icon: function(n) {
          if (n === null) return null;
          if (ba(n) === "object" && n.prefix && n.iconName) return {
              prefix: n.prefix,
              iconName: dt(n.prefix, n.iconName) || n.iconName
          };
          if (Array.isArray(n) && n.length === 2) {
              var t = n[1].indexOf("fa-") === 0 ? n[1].slice(3) : n[1],
                  r = Za(n[0]);
              return {
                  prefix: r,
                  iconName: dt(r, t) || t
              }
          }
          if (typeof n == "string" && (n.indexOf("".concat($.cssPrefix, "-")) > -1 || n.match(Av))) {
              var i = Xa(n.split(" "), {
                  skipLookups: !0
              });
              return {
                  prefix: i.prefix || Dn(),
                  iconName: dt(i.prefix, i.iconName) || i.iconName
              }
          }
          if (typeof n == "string") {
              var a = Dn();
              return {
                  prefix: a,
                  iconName: dt(a, n) || n
              }
          }
      }
  },
  Xe = {
      noAuto: c1,
      config: $,
      dom: d1,
      parse: f1,
      library: gm,
      findIconDefinition: Lo,
      toHtml: si
  },
  m1 = function() {
      var n = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {},
          t = n.autoReplaceSvgRoot,
          r = t === void 0 ? ue : t;
      (Object.keys(un.styles).length > 0 || $.autoFetchSvg) && An && $.autoReplaceSvg && Xe.dom.i2svg({
          node: r
      })
  };

function Ja(e, n) {
  return Object.defineProperty(e, "abstract", {
      get: n
  }), Object.defineProperty(e, "html", {
      get: function() {
          return e.abstract.map(function(r) {
              return si(r)
          })
      }
  }), Object.defineProperty(e, "node", {
      get: function() {
          if (!!An) {
              var r = ue.createElement("div");
              return r.innerHTML = e.html, r.children
          }
      }
  }), e
}

function p1(e) {
  var n = e.children,
      t = e.main,
      r = e.mask,
      i = e.attributes,
      a = e.styles,
      l = e.transform;
  if (Vs(l) && t.found && !r.found) {
      var s = t.width,
          u = t.height,
          c = {
              x: s / u / 2,
              y: .5
          };
      i.style = Ka(R(R({}, a), {}, {
          "transform-origin": "".concat(c.x + l.x / 16, "em ").concat(c.y + l.y / 16, "em")
      }))
  }
  return [{
      tag: "svg",
      attributes: i,
      children: n
  }]
}

function h1(e) {
  var n = e.prefix,
      t = e.iconName,
      r = e.children,
      i = e.attributes,
      a = e.symbol,
      l = a === !0 ? "".concat(n, "-").concat($.cssPrefix, "-").concat(t) : a;
  return [{
      tag: "svg",
      attributes: {
          style: "display: none;"
      },
      children: [{
          tag: "symbol",
          attributes: R(R({}, i), {}, {
              id: l
          }),
          children: r
      }]
  }]
}

function Ys(e) {
  var n = e.icons,
      t = n.main,
      r = n.mask,
      i = e.prefix,
      a = e.iconName,
      l = e.transform,
      s = e.symbol,
      u = e.title,
      c = e.maskId,
      h = e.titleId,
      g = e.extra,
      y = e.watchable,
      k = y === void 0 ? !1 : y,
      E = r.found ? r : t,
      C = E.width,
      O = E.height,
      p = i === "fak",
      f = [$.replacementClass, a ? "".concat($.cssPrefix, "-").concat(a) : ""].filter(function(N) {
          return g.classes.indexOf(N) === -1
      }).filter(function(N) {
          return N !== "" || !!N
      }).concat(g.classes).join(" "),
      m = {
          children: [],
          attributes: R(R({}, g.attributes), {}, {
              "data-prefix": i,
              "data-icon": a,
              class: f,
              role: g.attributes.role || "img",
              xmlns: "http://www.w3.org/2000/svg",
              viewBox: "0 0 ".concat(C, " ").concat(O)
          })
      },
      x = p && !~g.classes.indexOf("fa-fw") ? {
          width: "".concat(C / O * 16 * .0625, "em")
      } : {};
  k && (m.attributes[wt] = ""), u && (m.children.push({
      tag: "title",
      attributes: {
          id: m.attributes["aria-labelledby"] || "title-".concat(h || Dr())
      },
      children: [u]
  }), delete m.attributes.title);
  var _ = R(R({}, m), {}, {
          prefix: i,
          iconName: a,
          main: t,
          mask: r,
          maskId: c,
          transform: l,
          symbol: s,
          styles: R(R({}, x), g.styles)
      }),
      L = r.found && t.found ? On("generateAbstractMask", _) || {
          children: [],
          attributes: {}
      } : On("generateAbstractIcon", _) || {
          children: [],
          attributes: {}
      },
      P = L.children,
      w = L.attributes;
  return _.children = P, _.attributes = w, s ? h1(_) : p1(_)
}

function xc(e) {
  var n = e.content,
      t = e.width,
      r = e.height,
      i = e.transform,
      a = e.title,
      l = e.extra,
      s = e.watchable,
      u = s === void 0 ? !1 : s,
      c = R(R(R({}, l.attributes), a ? {
          title: a
      } : {}), {}, {
          class: l.classes.join(" ")
      });
  u && (c[wt] = "");
  var h = R({}, l.styles);
  Vs(i) && (h.transform = Gv({
      transform: i,
      startCentered: !0,
      width: t,
      height: r
  }), h["-webkit-transform"] = h.transform);
  var g = Ka(h);
  g.length > 0 && (c.style = g);
  var y = [];
  return y.push({
      tag: "span",
      attributes: c,
      children: [n]
  }), a && y.push({
      tag: "span",
      attributes: {
          class: "sr-only"
      },
      children: [a]
  }), y
}

function v1(e) {
  var n = e.content,
      t = e.title,
      r = e.extra,
      i = R(R(R({}, r.attributes), t ? {
          title: t
      } : {}), {}, {
          class: r.classes.join(" ")
      }),
      a = Ka(r.styles);
  a.length > 0 && (i.style = a);
  var l = [];
  return l.push({
      tag: "span",
      attributes: i,
      children: [n]
  }), t && l.push({
      tag: "span",
      attributes: {
          class: "sr-only"
      },
      children: [t]
  }), l
}
var Ol = un.styles;

function jo(e) {
  var n = e[0],
      t = e[1],
      r = e.slice(4),
      i = Is(r, 1),
      a = i[0],
      l = null;
  return Array.isArray(a) ? l = {
      tag: "g",
      attributes: {
          class: "".concat($.cssPrefix, "-").concat(ct.GROUP)
      },
      children: [{
          tag: "path",
          attributes: {
              class: "".concat($.cssPrefix, "-").concat(ct.SECONDARY),
              fill: "currentColor",
              d: a[0]
          }
      }, {
          tag: "path",
          attributes: {
              class: "".concat($.cssPrefix, "-").concat(ct.PRIMARY),
              fill: "currentColor",
              d: a[1]
          }
      }]
  } : l = {
      tag: "path",
      attributes: {
          fill: "currentColor",
          d: a
      }
  }, {
      found: !0,
      width: n,
      height: t,
      icon: l
  }
}
var g1 = {
  found: !1,
  width: 512,
  height: 512
};

function y1(e, n) {
  !rm && !$.showMissingIcons && e && console.error('Icon with name "'.concat(e, '" and prefix "').concat(n, '" is missing.'))
}

function Io(e, n) {
  var t = n;
  return n === "fa" && $.styleDefault !== null && (n = Dn()), new Promise(function(r, i) {
      if (On("missingIconAbstract"), t === "fa") {
          var a = vm(e) || {};
          e = a.iconName || e, n = a.prefix || n
      }
      if (e && n && Ol[n] && Ol[n][e]) {
          var l = Ol[n][e];
          return r(jo(l))
      }
      y1(e, n), r(R(R({}, g1), {}, {
          icon: $.showMissingIcons && e ? On("missingIconAbstract") || {} : {}
      }))
  })
}
var Nc = function() {},
  Mo = $.measurePerformance && Ti && Ti.mark && Ti.measure ? Ti : {
      mark: Nc,
      measure: Nc
  },
  kr = 'FA "6.3.0"',
  w1 = function(n) {
      return Mo.mark("".concat(kr, " ").concat(n, " begins")),
          function() {
              return ym(n)
          }
  },
  ym = function(n) {
      Mo.mark("".concat(kr, " ").concat(n, " ends")), Mo.measure("".concat(kr, " ").concat(n), "".concat(kr, " ").concat(n, " begins"), "".concat(kr, " ").concat(n, " ends"))
  },
  Gs = {
      begin: w1,
      end: ym
  },
  qi = function() {};

function Sc(e) {
  var n = e.getAttribute ? e.getAttribute(wt) : null;
  return typeof n == "string"
}

function k1(e) {
  var n = e.getAttribute ? e.getAttribute(Rs) : null,
      t = e.getAttribute ? e.getAttribute(Fs) : null;
  return n && t
}

function x1(e) {
  return e && e.classList && e.classList.contains && e.classList.contains($.replacementClass)
}

function N1() {
  if ($.autoReplaceSvg === !0) return Di.replace;
  var e = Di[$.autoReplaceSvg];
  return e || Di.replace
}

function S1(e) {
  return ue.createElementNS("http://www.w3.org/2000/svg", e)
}

function E1(e) {
  return ue.createElement(e)
}

function wm(e) {
  var n = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
      t = n.ceFn,
      r = t === void 0 ? e.tag === "svg" ? S1 : E1 : t;
  if (typeof e == "string") return ue.createTextNode(e);
  var i = r(e.tag);
  Object.keys(e.attributes || []).forEach(function(l) {
      i.setAttribute(l, e.attributes[l])
  });
  var a = e.children || [];
  return a.forEach(function(l) {
      i.appendChild(wm(l, {
          ceFn: r
      }))
  }), i
}

function C1(e) {
  var n = " ".concat(e.outerHTML, " ");
  return n = "".concat(n, "Font Awesome fontawesome.com "), n
}
var Di = {
  replace: function(n) {
      var t = n[0];
      if (t.parentNode)
          if (n[1].forEach(function(i) {
                  t.parentNode.insertBefore(wm(i), t)
              }), t.getAttribute(wt) === null && $.keepOriginalSource) {
              var r = ue.createComment(C1(t));
              t.parentNode.replaceChild(r, t)
          } else t.remove()
  },
  nest: function(n) {
      var t = n[0],
          r = n[1];
      if (~Bs(t).indexOf($.replacementClass)) return Di.replace(n);
      var i = new RegExp("".concat($.cssPrefix, "-.*"));
      if (delete r[0].attributes.id, r[0].attributes.class) {
          var a = r[0].attributes.class.split(" ").reduce(function(s, u) {
              return u === $.replacementClass || u.match(i) ? s.toSvg.push(u) : s.toNode.push(u), s
          }, {
              toNode: [],
              toSvg: []
          });
          r[0].attributes.class = a.toSvg.join(" "), a.toNode.length === 0 ? t.removeAttribute("class") : t.setAttribute("class", a.toNode.join(" "))
      }
      var l = r.map(function(s) {
          return si(s)
      }).join(`
`);
      t.setAttribute(wt, ""), t.innerHTML = l
  }
};

function Ec(e) {
  e()
}

function km(e, n) {
  var t = typeof n == "function" ? n : qi;
  if (e.length === 0) t();
  else {
      var r = Ec;
      $.mutateApproach === _v && (r = qn.requestAnimationFrame || Ec), r(function() {
          var i = N1(),
              a = Gs.begin("mutate");
          e.map(i), a(), t()
      })
  }
}
var Qs = !1;

function xm() {
  Qs = !0
}

function Ro() {
  Qs = !1
}
var za = null;

function Cc(e) {
  if (!!pc && !!$.observeMutations) {
      var n = e.treeCallback,
          t = n === void 0 ? qi : n,
          r = e.nodeCallback,
          i = r === void 0 ? qi : r,
          a = e.pseudoElementsCallback,
          l = a === void 0 ? qi : a,
          s = e.observeMutationsRoot,
          u = s === void 0 ? ue : s;
      za = new pc(function(c) {
          if (!Qs) {
              var h = Dn();
              lr(c).forEach(function(g) {
                  if (g.type === "childList" && g.addedNodes.length > 0 && !Sc(g.addedNodes[0]) && ($.searchPseudoElements && l(g.target), t(g.target)), g.type === "attributes" && g.target.parentNode && $.searchPseudoElements && l(g.target.parentNode), g.type === "attributes" && Sc(g.target) && ~Mv.indexOf(g.attributeName))
                      if (g.attributeName === "class" && k1(g.target)) {
                          var y = Xa(Bs(g.target)),
                              k = y.prefix,
                              E = y.iconName;
                          g.target.setAttribute(Rs, k || h), E && g.target.setAttribute(Fs, E)
                      } else x1(g.target) && i(g.target)
              })
          }
      }), An && za.observe(u, {
          childList: !0,
          attributes: !0,
          characterData: !0,
          subtree: !0
      })
  }
}

function b1() {
  !za || za.disconnect()
}

function P1(e) {
  var n = e.getAttribute("style"),
      t = [];
  return n && (t = n.split(";").reduce(function(r, i) {
      var a = i.split(":"),
          l = a[0],
          s = a.slice(1);
      return l && s.length > 0 && (r[l] = s.join(":").trim()), r
  }, {})), t
}

function z1(e) {
  var n = e.getAttribute("data-prefix"),
      t = e.getAttribute("data-icon"),
      r = e.innerText !== void 0 ? e.innerText.trim() : "",
      i = Xa(Bs(e));
  return i.prefix || (i.prefix = Dn()), n && t && (i.prefix = n, i.iconName = t), i.iconName && i.prefix || (i.prefix && r.length > 0 && (i.iconName = a1(i.prefix, e.innerText) || Ws(i.prefix, Oo(e.innerText))), !i.iconName && $.autoFetchSvg && e.firstChild && e.firstChild.nodeType === Node.TEXT_NODE && (i.iconName = e.firstChild.data)), i
}

function _1(e) {
  var n = lr(e.attributes).reduce(function(i, a) {
          return i.name !== "class" && i.name !== "style" && (i[a.name] = a.value), i
      }, {}),
      t = e.getAttribute("title"),
      r = e.getAttribute("data-fa-title-id");
  return $.autoA11y && (t ? n["aria-labelledby"] = "".concat($.replacementClass, "-title-").concat(r || Dr()) : (n["aria-hidden"] = "true", n.focusable = "false")), n
}

function O1() {
  return {
      iconName: null,
      title: null,
      titleId: null,
      prefix: null,
      transform: vn,
      symbol: !1,
      mask: {
          iconName: null,
          prefix: null,
          rest: []
      },
      maskId: null,
      extra: {
          classes: [],
          styles: {},
          attributes: {}
      }
  }
}

function bc(e) {
  var n = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {
          styleParser: !0
      },
      t = z1(e),
      r = t.iconName,
      i = t.prefix,
      a = t.rest,
      l = _1(e),
      s = Ao("parseNodeAttributes", {}, e),
      u = n.styleParser ? P1(e) : [];
  return R({
      iconName: r,
      title: e.getAttribute("title"),
      titleId: e.getAttribute("data-fa-title-id"),
      prefix: i,
      transform: vn,
      mask: {
          iconName: null,
          prefix: null,
          rest: []
      },
      maskId: null,
      symbol: !1,
      extra: {
          classes: a,
          styles: u,
          attributes: l
      }
  }, s)
}
var T1 = un.styles;

function Nm(e) {
  var n = $.autoReplaceSvg === "nest" ? bc(e, {
      styleParser: !1
  }) : bc(e);
  return ~n.extra.classes.indexOf(im) ? On("generateLayersText", e, n) : On("generateSvgReplacementMutation", e, n)
}
var et = new Set;
Us.map(function(e) {
  et.add("fa-".concat(e))
});
Object.keys(Zr[oe]).map(et.add.bind(et));
Object.keys(Zr[ge]).map(et.add.bind(et));
et = li(et);

function Pc(e) {
  var n = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : null;
  if (!An) return Promise.resolve();
  var t = ue.documentElement.classList,
      r = function(g) {
          return t.add("".concat(hc, "-").concat(g))
      },
      i = function(g) {
          return t.remove("".concat(hc, "-").concat(g))
      },
      a = $.autoFetchSvg ? et : Us.map(function(h) {
          return "fa-".concat(h)
      }).concat(Object.keys(T1));
  a.includes("fa") || a.push("fa");
  var l = [".".concat(im, ":not([").concat(wt, "])")].concat(a.map(function(h) {
      return ".".concat(h, ":not([").concat(wt, "])")
  })).join(", ");
  if (l.length === 0) return Promise.resolve();
  var s = [];
  try {
      s = lr(e.querySelectorAll(l))
  } catch {}
  if (s.length > 0) r("pending"), i("complete");
  else return Promise.resolve();
  var u = Gs.begin("onTree"),
      c = s.reduce(function(h, g) {
          try {
              var y = Nm(g);
              y && h.push(y)
          } catch (k) {
              rm || k.name === "MissingIcon" && console.error(k)
          }
          return h
      }, []);
  return new Promise(function(h, g) {
      Promise.all(c).then(function(y) {
          km(y, function() {
              r("active"), r("complete"), i("pending"), typeof n == "function" && n(), u(), h()
          })
      }).catch(function(y) {
          u(), g(y)
      })
  })
}

function A1(e) {
  var n = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : null;
  Nm(e).then(function(t) {
      t && km([t], n)
  })
}

function L1(e) {
  return function(n) {
      var t = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
          r = (n || {}).icon ? n : Lo(n || {}),
          i = t.mask;
      return i && (i = (i || {}).icon ? i : Lo(i || {})), e(r, R(R({}, t), {}, {
          mask: i
      }))
  }
}
var j1 = function(n) {
      var t = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
          r = t.transform,
          i = r === void 0 ? vn : r,
          a = t.symbol,
          l = a === void 0 ? !1 : a,
          s = t.mask,
          u = s === void 0 ? null : s,
          c = t.maskId,
          h = c === void 0 ? null : c,
          g = t.title,
          y = g === void 0 ? null : g,
          k = t.titleId,
          E = k === void 0 ? null : k,
          C = t.classes,
          O = C === void 0 ? [] : C,
          p = t.attributes,
          f = p === void 0 ? {} : p,
          m = t.styles,
          x = m === void 0 ? {} : m;
      if (!!n) {
          var _ = n.prefix,
              L = n.iconName,
              P = n.icon;
          return Ja(R({
              type: "icon"
          }, n), function() {
              return kt("beforeDOMElementCreation", {
                  iconDefinition: n,
                  params: t
              }), $.autoA11y && (y ? f["aria-labelledby"] = "".concat($.replacementClass, "-title-").concat(E || Dr()) : (f["aria-hidden"] = "true", f.focusable = "false")), Ys({
                  icons: {
                      main: jo(P),
                      mask: u ? jo(u.icon) : {
                          found: !1,
                          width: null,
                          height: null,
                          icon: {}
                      }
                  },
                  prefix: _,
                  iconName: L,
                  transform: R(R({}, vn), i),
                  symbol: l,
                  title: y,
                  maskId: h,
                  titleId: E,
                  extra: {
                      attributes: f,
                      styles: x,
                      classes: O
                  }
              })
          })
      }
  },
  I1 = {
      mixout: function() {
          return {
              icon: L1(j1)
          }
      },
      hooks: function() {
          return {
              mutationObserverCallbacks: function(t) {
                  return t.treeCallback = Pc, t.nodeCallback = A1, t
              }
          }
      },
      provides: function(n) {
          n.i2svg = function(t) {
              var r = t.node,
                  i = r === void 0 ? ue : r,
                  a = t.callback,
                  l = a === void 0 ? function() {} : a;
              return Pc(i, l)
          }, n.generateSvgReplacementMutation = function(t, r) {
              var i = r.iconName,
                  a = r.title,
                  l = r.titleId,
                  s = r.prefix,
                  u = r.transform,
                  c = r.symbol,
                  h = r.mask,
                  g = r.maskId,
                  y = r.extra;
              return new Promise(function(k, E) {
                  Promise.all([Io(i, s), h.iconName ? Io(h.iconName, h.prefix) : Promise.resolve({
                      found: !1,
                      width: 512,
                      height: 512,
                      icon: {}
                  })]).then(function(C) {
                      var O = Is(C, 2),
                          p = O[0],
                          f = O[1];
                      k([t, Ys({
                          icons: {
                              main: p,
                              mask: f
                          },
                          prefix: s,
                          iconName: i,
                          transform: u,
                          symbol: c,
                          maskId: g,
                          title: a,
                          titleId: l,
                          extra: y,
                          watchable: !0
                      })])
                  }).catch(E)
              })
          }, n.generateAbstractIcon = function(t) {
              var r = t.children,
                  i = t.attributes,
                  a = t.main,
                  l = t.transform,
                  s = t.styles,
                  u = Ka(s);
              u.length > 0 && (i.style = u);
              var c;
              return Vs(l) && (c = On("generateAbstractTransformGrouping", {
                  main: a,
                  transform: l,
                  containerWidth: a.width,
                  iconWidth: a.width
              })), r.push(c || a.icon), {
                  children: r,
                  attributes: i
              }
          }
      }
  },
  M1 = {
      mixout: function() {
          return {
              layer: function(t) {
                  var r = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
                      i = r.classes,
                      a = i === void 0 ? [] : i;
                  return Ja({
                      type: "layer"
                  }, function() {
                      kt("beforeDOMElementCreation", {
                          assembler: t,
                          params: r
                      });
                      var l = [];
                      return t(function(s) {
                          Array.isArray(s) ? s.map(function(u) {
                              l = l.concat(u.abstract)
                          }) : l = l.concat(s.abstract)
                      }), [{
                          tag: "span",
                          attributes: {
                              class: ["".concat($.cssPrefix, "-layers")].concat(li(a)).join(" ")
                          },
                          children: l
                      }]
                  })
              }
          }
      }
  },
  R1 = {
      mixout: function() {
          return {
              counter: function(t) {
                  var r = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
                      i = r.title,
                      a = i === void 0 ? null : i,
                      l = r.classes,
                      s = l === void 0 ? [] : l,
                      u = r.attributes,
                      c = u === void 0 ? {} : u,
                      h = r.styles,
                      g = h === void 0 ? {} : h;
                  return Ja({
                      type: "counter",
                      content: t
                  }, function() {
                      return kt("beforeDOMElementCreation", {
                          content: t,
                          params: r
                      }), v1({
                          content: t.toString(),
                          title: a,
                          extra: {
                              attributes: c,
                              styles: g,
                              classes: ["".concat($.cssPrefix, "-layers-counter")].concat(li(s))
                          }
                      })
                  })
              }
          }
      }
  },
  F1 = {
      mixout: function() {
          return {
              text: function(t) {
                  var r = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {},
                      i = r.transform,
                      a = i === void 0 ? vn : i,
                      l = r.title,
                      s = l === void 0 ? null : l,
                      u = r.classes,
                      c = u === void 0 ? [] : u,
                      h = r.attributes,
                      g = h === void 0 ? {} : h,
                      y = r.styles,
                      k = y === void 0 ? {} : y;
                  return Ja({
                      type: "text",
                      content: t
                  }, function() {
                      return kt("beforeDOMElementCreation", {
                          content: t,
                          params: r
                      }), xc({
                          content: t,
                          transform: R(R({}, vn), a),
                          title: s,
                          extra: {
                              attributes: g,
                              styles: k,
                              classes: ["".concat($.cssPrefix, "-layers-text")].concat(li(c))
                          }
                      })
                  })
              }
          }
      },
      provides: function(n) {
          n.generateLayersText = function(t, r) {
              var i = r.title,
                  a = r.transform,
                  l = r.extra,
                  s = null,
                  u = null;
              if (em) {
                  var c = parseInt(getComputedStyle(t).fontSize, 10),
                      h = t.getBoundingClientRect();
                  s = h.width / c, u = h.height / c
              }
              return $.autoA11y && !i && (l.attributes["aria-hidden"] = "true"), Promise.resolve([t, xc({
                  content: t.innerHTML,
                  width: s,
                  height: u,
                  transform: a,
                  title: i,
                  extra: l,
                  watchable: !0
              })])
          }
      }
  },
  U1 = new RegExp('"', "ug"),
  zc = [1105920, 1112319];

function B1(e) {
  var n = e.replace(U1, ""),
      t = Dv(n, 0),
      r = t >= zc[0] && t <= zc[1],
      i = n.length === 2 ? n[0] === n[1] : !1;
  return {
      value: Oo(i ? n[0] : n),
      isSecondary: r || i
  }
}

function _c(e, n) {
  var t = "".concat(zv).concat(n.replace(":", "-"));
  return new Promise(function(r, i) {
      if (e.getAttribute(t) !== null) return r();
      var a = lr(e.children),
          l = a.filter(function(P) {
              return P.getAttribute(_o) === n
          })[0],
          s = qn.getComputedStyle(e, n),
          u = s.getPropertyValue("font-family").match(Lv),
          c = s.getPropertyValue("font-weight"),
          h = s.getPropertyValue("content");
      if (l && !u) return e.removeChild(l), r();
      if (u && h !== "none" && h !== "") {
          var g = s.getPropertyValue("content"),
              y = ~["Sharp"].indexOf(u[2]) ? ge : oe,
              k = ~["Solid", "Regular", "Light", "Thin", "Duotone", "Brands", "Kit"].indexOf(u[2]) ? Xr[y][u[2].toLowerCase()] : jv[y][c],
              E = B1(g),
              C = E.value,
              O = E.isSecondary,
              p = u[0].startsWith("FontAwesome"),
              f = Ws(k, C),
              m = f;
          if (p) {
              var x = l1(C);
              x.iconName && x.prefix && (f = x.iconName, k = x.prefix)
          }
          if (f && !O && (!l || l.getAttribute(Rs) !== k || l.getAttribute(Fs) !== m)) {
              e.setAttribute(t, m), l && e.removeChild(l);
              var _ = O1(),
                  L = _.extra;
              L.attributes[_o] = n, Io(f, k).then(function(P) {
                  var w = Ys(R(R({}, _), {}, {
                          icons: {
                              main: P,
                              mask: Hs()
                          },
                          prefix: k,
                          iconName: m,
                          extra: L,
                          watchable: !0
                      })),
                      N = ue.createElement("svg");
                  n === "::before" ? e.insertBefore(N, e.firstChild) : e.appendChild(N), N.outerHTML = w.map(function(z) {
                      return si(z)
                  }).join(`
`), e.removeAttribute(t), r()
              }).catch(i)
          } else r()
      } else r()
  })
}

function V1(e) {
  return Promise.all([_c(e, "::before"), _c(e, "::after")])
}

function $1(e) {
  return e.parentNode !== document.head && !~Ov.indexOf(e.tagName.toUpperCase()) && !e.getAttribute(_o) && (!e.parentNode || e.parentNode.tagName !== "svg")
}

function Oc(e) {
  if (!!An) return new Promise(function(n, t) {
      var r = lr(e.querySelectorAll("*")).filter($1).map(V1),
          i = Gs.begin("searchPseudoElements");
      xm(), Promise.all(r).then(function() {
          i(), Ro(), n()
      }).catch(function() {
          i(), Ro(), t()
      })
  })
}
var W1 = {
      hooks: function() {
          return {
              mutationObserverCallbacks: function(t) {
                  return t.pseudoElementsCallback = Oc, t
              }
          }
      },
      provides: function(n) {
          n.pseudoElements2svg = function(t) {
              var r = t.node,
                  i = r === void 0 ? ue : r;
              $.searchPseudoElements && Oc(i)
          }
      }
  },
  Tc = !1,
  H1 = {
      mixout: function() {
          return {
              dom: {
                  unwatch: function() {
                      xm(), Tc = !0
                  }
              }
          }
      },
      hooks: function() {
          return {
              bootstrap: function() {
                  Cc(Ao("mutationObserverCallbacks", {}))
              },
              noAuto: function() {
                  b1()
              },
              watch: function(t) {
                  var r = t.observeMutationsRoot;
                  Tc ? Ro() : Cc(Ao("mutationObserverCallbacks", {
                      observeMutationsRoot: r
                  }))
              }
          }
      }
  },
  Ac = function(n) {
      var t = {
          size: 16,
          x: 0,
          y: 0,
          flipX: !1,
          flipY: !1,
          rotate: 0
      };
      return n.toLowerCase().split(" ").reduce(function(r, i) {
          var a = i.toLowerCase().split("-"),
              l = a[0],
              s = a.slice(1).join("-");
          if (l && s === "h") return r.flipX = !0, r;
          if (l && s === "v") return r.flipY = !0, r;
          if (s = parseFloat(s), isNaN(s)) return r;
          switch (l) {
              case "grow":
                  r.size = r.size + s;
                  break;
              case "shrink":
                  r.size = r.size - s;
                  break;
              case "left":
                  r.x = r.x - s;
                  break;
              case "right":
                  r.x = r.x + s;
                  break;
              case "up":
                  r.y = r.y - s;
                  break;
              case "down":
                  r.y = r.y + s;
                  break;
              case "rotate":
                  r.rotate = r.rotate + s;
                  break
          }
          return r
      }, t)
  },
  Y1 = {
      mixout: function() {
          return {
              parse: {
                  transform: function(t) {
                      return Ac(t)
                  }
              }
          }
      },
      hooks: function() {
          return {
              parseNodeAttributes: function(t, r) {
                  var i = r.getAttribute("data-fa-transform");
                  return i && (t.transform = Ac(i)), t
              }
          }
      },
      provides: function(n) {
          n.generateAbstractTransformGrouping = function(t) {
              var r = t.main,
                  i = t.transform,
                  a = t.containerWidth,
                  l = t.iconWidth,
                  s = {
                      transform: "translate(".concat(a / 2, " 256)")
                  },
                  u = "translate(".concat(i.x * 32, ", ").concat(i.y * 32, ") "),
                  c = "scale(".concat(i.size / 16 * (i.flipX ? -1 : 1), ", ").concat(i.size / 16 * (i.flipY ? -1 : 1), ") "),
                  h = "rotate(".concat(i.rotate, " 0 0)"),
                  g = {
                      transform: "".concat(u, " ").concat(c, " ").concat(h)
                  },
                  y = {
                      transform: "translate(".concat(l / 2 * -1, " -256)")
                  },
                  k = {
                      outer: s,
                      inner: g,
                      path: y
                  };
              return {
                  tag: "g",
                  attributes: R({}, k.outer),
                  children: [{
                      tag: "g",
                      attributes: R({}, k.inner),
                      children: [{
                          tag: r.icon.tag,
                          children: r.icon.children,
                          attributes: R(R({}, r.icon.attributes), k.path)
                      }]
                  }]
              }
          }
      }
  },
  Tl = {
      x: 0,
      y: 0,
      width: "100%",
      height: "100%"
  };

function Lc(e) {
  var n = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : !0;
  return e.attributes && (e.attributes.fill || n) && (e.attributes.fill = "black"), e
}

function G1(e) {
  return e.tag === "g" ? e.children : [e]
}
var Q1 = {
      hooks: function() {
          return {
              parseNodeAttributes: function(t, r) {
                  var i = r.getAttribute("data-fa-mask"),
                      a = i ? Xa(i.split(" ").map(function(l) {
                          return l.trim()
                      })) : Hs();
                  return a.prefix || (a.prefix = Dn()), t.mask = a, t.maskId = r.getAttribute("data-fa-mask-id"), t
              }
          }
      },
      provides: function(n) {
          n.generateAbstractMask = function(t) {
              var r = t.children,
                  i = t.attributes,
                  a = t.main,
                  l = t.mask,
                  s = t.maskId,
                  u = t.transform,
                  c = a.width,
                  h = a.icon,
                  g = l.width,
                  y = l.icon,
                  k = Yv({
                      transform: u,
                      containerWidth: g,
                      iconWidth: c
                  }),
                  E = {
                      tag: "rect",
                      attributes: R(R({}, Tl), {}, {
                          fill: "white"
                      })
                  },
                  C = h.children ? {
                      children: h.children.map(Lc)
                  } : {},
                  O = {
                      tag: "g",
                      attributes: R({}, k.inner),
                      children: [Lc(R({
                          tag: h.tag,
                          attributes: R(R({}, h.attributes), k.path)
                      }, C))]
                  },
                  p = {
                      tag: "g",
                      attributes: R({}, k.outer),
                      children: [O]
                  },
                  f = "mask-".concat(s || Dr()),
                  m = "clip-".concat(s || Dr()),
                  x = {
                      tag: "mask",
                      attributes: R(R({}, Tl), {}, {
                          id: f,
                          maskUnits: "userSpaceOnUse",
                          maskContentUnits: "userSpaceOnUse"
                      }),
                      children: [E, p]
                  },
                  _ = {
                      tag: "defs",
                      children: [{
                          tag: "clipPath",
                          attributes: {
                              id: m
                          },
                          children: G1(y)
                      }, x]
                  };
              return r.push(_, {
                  tag: "rect",
                  attributes: R({
                      fill: "currentColor",
                      "clip-path": "url(#".concat(m, ")"),
                      mask: "url(#".concat(f, ")")
                  }, Tl)
              }), {
                  children: r,
                  attributes: i
              }
          }
      }
  },
  K1 = {
      provides: function(n) {
          var t = !1;
          qn.matchMedia && (t = qn.matchMedia("(prefers-reduced-motion: reduce)").matches), n.missingIconAbstract = function() {
              var r = [],
                  i = {
                      fill: "currentColor"
                  },
                  a = {
                      attributeType: "XML",
                      repeatCount: "indefinite",
                      dur: "2s"
                  };
              r.push({
                  tag: "path",
                  attributes: R(R({}, i), {}, {
                      d: "M156.5,447.7l-12.6,29.5c-18.7-9.5-35.9-21.2-51.5-34.9l22.7-22.7C127.6,430.5,141.5,440,156.5,447.7z M40.6,272H8.5 c1.4,21.2,5.4,41.7,11.7,61.1L50,321.2C45.1,305.5,41.8,289,40.6,272z M40.6,240c1.4-18.8,5.2-37,11.1-54.1l-29.5-12.6 C14.7,194.3,10,216.7,8.5,240H40.6z M64.3,156.5c7.8-14.9,17.2-28.8,28.1-41.5L69.7,92.3c-13.7,15.6-25.5,32.8-34.9,51.5 L64.3,156.5z M397,419.6c-13.9,12-29.4,22.3-46.1,30.4l11.9,29.8c20.7-9.9,39.8-22.6,56.9-37.6L397,419.6z M115,92.4 c13.9-12,29.4-22.3,46.1-30.4l-11.9-29.8c-20.7,9.9-39.8,22.6-56.8,37.6L115,92.4z M447.7,355.5c-7.8,14.9-17.2,28.8-28.1,41.5 l22.7,22.7c13.7-15.6,25.5-32.9,34.9-51.5L447.7,355.5z M471.4,272c-1.4,18.8-5.2,37-11.1,54.1l29.5,12.6 c7.5-21.1,12.2-43.5,13.6-66.8H471.4z M321.2,462c-15.7,5-32.2,8.2-49.2,9.4v32.1c21.2-1.4,41.7-5.4,61.1-11.7L321.2,462z M240,471.4c-18.8-1.4-37-5.2-54.1-11.1l-12.6,29.5c21.1,7.5,43.5,12.2,66.8,13.6V471.4z M462,190.8c5,15.7,8.2,32.2,9.4,49.2h32.1 c-1.4-21.2-5.4-41.7-11.7-61.1L462,190.8z M92.4,397c-12-13.9-22.3-29.4-30.4-46.1l-29.8,11.9c9.9,20.7,22.6,39.8,37.6,56.9 L92.4,397z M272,40.6c18.8,1.4,36.9,5.2,54.1,11.1l12.6-29.5C317.7,14.7,295.3,10,272,8.5V40.6z M190.8,50 c15.7-5,32.2-8.2,49.2-9.4V8.5c-21.2,1.4-41.7,5.4-61.1,11.7L190.8,50z M442.3,92.3L419.6,115c12,13.9,22.3,29.4,30.5,46.1 l29.8-11.9C470,128.5,457.3,109.4,442.3,92.3z M397,92.4l22.7-22.7c-15.6-13.7-32.8-25.5-51.5-34.9l-12.6,29.5 C370.4,72.1,384.4,81.5,397,92.4z"
                  })
              });
              var l = R(R({}, a), {}, {
                      attributeName: "opacity"
                  }),
                  s = {
                      tag: "circle",
                      attributes: R(R({}, i), {}, {
                          cx: "256",
                          cy: "364",
                          r: "28"
                      }),
                      children: []
                  };
              return t || s.children.push({
                  tag: "animate",
                  attributes: R(R({}, a), {}, {
                      attributeName: "r",
                      values: "28;14;28;28;14;28;"
                  })
              }, {
                  tag: "animate",
                  attributes: R(R({}, l), {}, {
                      values: "1;0;1;1;0;1;"
                  })
              }), r.push(s), r.push({
                  tag: "path",
                  attributes: R(R({}, i), {}, {
                      opacity: "1",
                      d: "M263.7,312h-16c-6.6,0-12-5.4-12-12c0-71,77.4-63.9,77.4-107.8c0-20-17.8-40.2-57.4-40.2c-29.1,0-44.3,9.6-59.2,28.7 c-3.9,5-11.1,6-16.2,2.4l-13.1-9.2c-5.6-3.9-6.9-11.8-2.6-17.2c21.2-27.2,46.4-44.7,91.2-44.7c52.3,0,97.4,29.8,97.4,80.2 c0,67.6-77.4,63.5-77.4,107.8C275.7,306.6,270.3,312,263.7,312z"
                  }),
                  children: t ? [] : [{
                      tag: "animate",
                      attributes: R(R({}, l), {}, {
                          values: "1;0;0;0;0;1;"
                      })
                  }]
              }), t || r.push({
                  tag: "path",
                  attributes: R(R({}, i), {}, {
                      opacity: "0",
                      d: "M232.5,134.5l7,168c0.3,6.4,5.6,11.5,12,11.5h9c6.4,0,11.7-5.1,12-11.5l7-168c0.3-6.8-5.2-12.5-12-12.5h-23 C237.7,122,232.2,127.7,232.5,134.5z"
                  }),
                  children: [{
                      tag: "animate",
                      attributes: R(R({}, l), {}, {
                          values: "0;0;1;1;0;0;"
                      })
                  }]
              }), {
                  tag: "g",
                  attributes: {
                      class: "missing"
                  },
                  children: r
              }
          }
      }
  },
  Z1 = {
      hooks: function() {
          return {
              parseNodeAttributes: function(t, r) {
                  var i = r.getAttribute("data-fa-symbol"),
                      a = i === null ? !1 : i === "" ? !0 : i;
                  return t.symbol = a, t
              }
          }
      }
  },
  X1 = [Kv, I1, M1, R1, F1, W1, H1, Y1, Q1, K1, Z1];
u1(X1, {
  mixoutsTo: Xe
});
Xe.noAuto;
Xe.config;
Xe.library;
Xe.dom;
var Fo = Xe.parse;
Xe.findIconDefinition;
Xe.toHtml;
var J1 = Xe.icon;
Xe.layer;
Xe.text;
Xe.counter;
var q = {
      exports: {}
  },
  q1 = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED",
  D1 = q1,
  e0 = D1;

function Sm() {}

function Em() {}
Em.resetWarningCache = Sm;
var n0 = function() {
  function e(r, i, a, l, s, u) {
      if (u !== e0) {
          var c = new Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
          throw c.name = "Invariant Violation", c
      }
  }
  e.isRequired = e;

  function n() {
      return e
  }
  var t = {
      array: e,
      bigint: e,
      bool: e,
      func: e,
      number: e,
      object: e,
      string: e,
      symbol: e,
      any: e,
      arrayOf: n,
      element: e,
      elementType: e,
      instanceOf: n,
      node: e,
      objectOf: n,
      oneOf: n,
      oneOfType: n,
      shape: n,
      exact: n,
      checkPropTypes: Em,
      resetWarningCache: Sm
  };
  return t.PropTypes = t, t
};
q.exports = n0();

function jc(e, n) {
  var t = Object.keys(e);
  if (Object.getOwnPropertySymbols) {
      var r = Object.getOwnPropertySymbols(e);
      n && (r = r.filter(function(i) {
          return Object.getOwnPropertyDescriptor(e, i).enumerable
      })), t.push.apply(t, r)
  }
  return t
}

function Vn(e) {
  for (var n = 1; n < arguments.length; n++) {
      var t = arguments[n] != null ? arguments[n] : {};
      n % 2 ? jc(Object(t), !0).forEach(function(r) {
          Bt(e, r, t[r])
      }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : jc(Object(t)).forEach(function(r) {
          Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
      })
  }
  return e
}

function _a(e) {
  return _a = typeof Symbol == "function" && typeof Symbol.iterator == "symbol" ? function(n) {
      return typeof n
  } : function(n) {
      return n && typeof Symbol == "function" && n.constructor === Symbol && n !== Symbol.prototype ? "symbol" : typeof n
  }, _a(e)
}

function Bt(e, n, t) {
  return n in e ? Object.defineProperty(e, n, {
      value: t,
      enumerable: !0,
      configurable: !0,
      writable: !0
  }) : e[n] = t, e
}

function t0(e, n) {
  if (e == null) return {};
  var t = {},
      r = Object.keys(e),
      i, a;
  for (a = 0; a < r.length; a++) i = r[a], !(n.indexOf(i) >= 0) && (t[i] = e[i]);
  return t
}

function r0(e, n) {
  if (e == null) return {};
  var t = t0(e, n),
      r, i;
  if (Object.getOwnPropertySymbols) {
      var a = Object.getOwnPropertySymbols(e);
      for (i = 0; i < a.length; i++) r = a[i], !(n.indexOf(r) >= 0) && (!Object.prototype.propertyIsEnumerable.call(e, r) || (t[r] = e[r]))
  }
  return t
}

function Uo(e) {
  return i0(e) || a0(e) || l0(e) || o0()
}

function i0(e) {
  if (Array.isArray(e)) return Bo(e)
}

function a0(e) {
  if (typeof Symbol < "u" && e[Symbol.iterator] != null || e["@@iterator"] != null) return Array.from(e)
}

function l0(e, n) {
  if (!!e) {
      if (typeof e == "string") return Bo(e, n);
      var t = Object.prototype.toString.call(e).slice(8, -1);
      if (t === "Object" && e.constructor && (t = e.constructor.name), t === "Map" || t === "Set") return Array.from(e);
      if (t === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return Bo(e, n)
  }
}

function Bo(e, n) {
  (n == null || n > e.length) && (n = e.length);
  for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
  return r
}

function o0() {
  throw new TypeError(`Invalid attempt to spread non-iterable instance.
In order to be iterable, non-array objects must have a [Symbol.iterator]() method.`)
}

function s0(e) {
  var n, t = e.beat,
      r = e.fade,
      i = e.beatFade,
      a = e.bounce,
      l = e.shake,
      s = e.flash,
      u = e.spin,
      c = e.spinPulse,
      h = e.spinReverse,
      g = e.pulse,
      y = e.fixedWidth,
      k = e.inverse,
      E = e.border,
      C = e.listItem,
      O = e.flip,
      p = e.size,
      f = e.rotation,
      m = e.pull,
      x = (n = {
          "fa-beat": t,
          "fa-fade": r,
          "fa-beat-fade": i,
          "fa-bounce": a,
          "fa-shake": l,
          "fa-flash": s,
          "fa-spin": u,
          "fa-spin-reverse": h,
          "fa-spin-pulse": c,
          "fa-pulse": g,
          "fa-fw": y,
          "fa-inverse": k,
          "fa-border": E,
          "fa-li": C,
          "fa-flip": O === !0,
          "fa-flip-horizontal": O === "horizontal" || O === "both",
          "fa-flip-vertical": O === "vertical" || O === "both"
      }, Bt(n, "fa-".concat(p), typeof p < "u" && p !== null), Bt(n, "fa-rotate-".concat(f), typeof f < "u" && f !== null && f !== 0), Bt(n, "fa-pull-".concat(m), typeof m < "u" && m !== null), Bt(n, "fa-swap-opacity", e.swapOpacity), n);
  return Object.keys(x).map(function(_) {
      return x[_] ? _ : null
  }).filter(function(_) {
      return _
  })
}

function u0(e) {
  return e = e - 0, e === e
}

function Cm(e) {
  return u0(e) ? e : (e = e.replace(/[\-_\s]+(.)?/g, function(n, t) {
      return t ? t.toUpperCase() : ""
  }), e.substr(0, 1).toLowerCase() + e.substr(1))
}
var c0 = ["style"];

function d0(e) {
  return e.charAt(0).toUpperCase() + e.slice(1)
}

function f0(e) {
  return e.split(";").map(function(n) {
      return n.trim()
  }).filter(function(n) {
      return n
  }).reduce(function(n, t) {
      var r = t.indexOf(":"),
          i = Cm(t.slice(0, r)),
          a = t.slice(r + 1).trim();
      return i.startsWith("webkit") ? n[d0(i)] = a : n[i] = a, n
  }, {})
}

function bm(e, n) {
  var t = arguments.length > 2 && arguments[2] !== void 0 ? arguments[2] : {};
  if (typeof n == "string") return n;
  var r = (n.children || []).map(function(u) {
          return bm(e, u)
      }),
      i = Object.keys(n.attributes || {}).reduce(function(u, c) {
          var h = n.attributes[c];
          switch (c) {
              case "class":
                  u.attrs.className = h, delete n.attributes.class;
                  break;
              case "style":
                  u.attrs.style = f0(h);
                  break;
              default:
                  c.indexOf("aria-") === 0 || c.indexOf("data-") === 0 ? u.attrs[c.toLowerCase()] = h : u.attrs[Cm(c)] = h
          }
          return u
      }, {
          attrs: {}
      }),
      a = t.style,
      l = a === void 0 ? {} : a,
      s = r0(t, c0);
  return i.attrs.style = Vn(Vn({}, i.attrs.style), l), e.apply(void 0, [n.tag, Vn(Vn({}, i.attrs), s)].concat(Uo(r)))
}
var Pm = !1;
try {
  Pm = !0
} catch {}

function m0() {
  if (!Pm && console && typeof console.error == "function") {
      var e;
      (e = console).error.apply(e, arguments)
  }
}

function Ic(e) {
  if (e && _a(e) === "object" && e.prefix && e.iconName && e.icon) return e;
  if (Fo.icon) return Fo.icon(e);
  if (e === null) return null;
  if (e && _a(e) === "object" && e.prefix && e.iconName) return e;
  if (Array.isArray(e) && e.length === 2) return {
      prefix: e[0],
      iconName: e[1]
  };
  if (typeof e == "string") return {
      prefix: "fas",
      iconName: e
  }
}

function Al(e, n) {
  return Array.isArray(n) && n.length > 0 || !Array.isArray(n) && n ? Bt({}, e, n) : {}
}
var ie = rr.forwardRef(function(e, n) {
  var t = e.icon,
      r = e.mask,
      i = e.symbol,
      a = e.className,
      l = e.title,
      s = e.titleId,
      u = e.maskId,
      c = Ic(t),
      h = Al("classes", [].concat(Uo(s0(e)), Uo(a.split(" ")))),
      g = Al("transform", typeof e.transform == "string" ? Fo.transform(e.transform) : e.transform),
      y = Al("mask", Ic(r)),
      k = J1(c, Vn(Vn(Vn(Vn({}, h), g), y), {}, {
          symbol: i,
          title: l,
          titleId: s,
          maskId: u
      }));
  if (!k) return m0("Could not find icon", c), null;
  var E = k.abstract,
      C = {
          ref: n
      };
  return Object.keys(e).forEach(function(O) {
      ie.defaultProps.hasOwnProperty(O) || (C[O] = e[O])
  }), p0(E[0], C)
});
ie.displayName = "FontAwesomeIcon";
ie.propTypes = {
  beat: q.exports.bool,
  border: q.exports.bool,
  beatFade: q.exports.bool,
  bounce: q.exports.bool,
  className: q.exports.string,
  fade: q.exports.bool,
  flash: q.exports.bool,
  mask: q.exports.oneOfType([q.exports.object, q.exports.array, q.exports.string]),
  maskId: q.exports.string,
  fixedWidth: q.exports.bool,
  inverse: q.exports.bool,
  flip: q.exports.oneOf([!0, !1, "horizontal", "vertical", "both"]),
  icon: q.exports.oneOfType([q.exports.object, q.exports.array, q.exports.string]),
  listItem: q.exports.bool,
  pull: q.exports.oneOf(["right", "left"]),
  pulse: q.exports.bool,
  rotation: q.exports.oneOf([0, 90, 180, 270]),
  shake: q.exports.bool,
  size: q.exports.oneOf(["2xs", "xs", "sm", "lg", "xl", "2xl", "1x", "2x", "3x", "4x", "5x", "6x", "7x", "8x", "9x", "10x"]),
  spin: q.exports.bool,
  spinPulse: q.exports.bool,
  spinReverse: q.exports.bool,
  symbol: q.exports.oneOfType([q.exports.bool, q.exports.string]),
  title: q.exports.string,
  titleId: q.exports.string,
  transform: q.exports.oneOfType([q.exports.string, q.exports.object]),
  swapOpacity: q.exports.bool
};
ie.defaultProps = {
  border: !1,
  className: "",
  mask: null,
  maskId: null,
  fixedWidth: !1,
  inverse: !1,
  flip: !1,
  icon: null,
  listItem: !1,
  pull: null,
  pulse: !1,
  rotation: null,
  size: null,
  spin: !1,
  spinPulse: !1,
  spinReverse: !1,
  beat: !1,
  fade: !1,
  beatFade: !1,
  bounce: !1,
  shake: !1,
  symbol: !1,
  title: "",
  titleId: null,
  transform: null,
  swapOpacity: !1
};
var p0 = bm.bind(null, rr.createElement),
  h0 = {
      prefix: "fas",
      iconName: "bullhorn",
      icon: [512, 512, [128226, 128363], "f0a1", "M480 32c0-12.9-7.8-24.6-19.8-29.6s-25.7-2.2-34.9 6.9L381.7 53c-48 48-113.1 75-181 75H192 160 64c-35.3 0-64 28.7-64 64v96c0 35.3 28.7 64 64 64l0 128c0 17.7 14.3 32 32 32h64c17.7 0 32-14.3 32-32V352l8.7 0c67.9 0 133 27 181 75l43.6 43.6c9.2 9.2 22.9 11.9 34.9 6.9s19.8-16.6 19.8-29.6V300.4c18.6-8.8 32-32.5 32-60.4s-13.4-51.6-32-60.4V32zm-64 76.7V240 371.3C357.2 317.8 280.5 288 200.7 288H192V192h8.7c79.8 0 156.5-29.8 215.3-83.3z"]
  },
  v0 = {
      prefix: "fas",
      iconName: "folder-open",
      icon: [576, 512, [128194, 128449, 61717], "f07c", "M88.7 223.8L0 375.8V96C0 60.7 28.7 32 64 32H181.5c17 0 33.3 6.7 45.3 18.7l26.5 26.5c12 12 28.3 18.7 45.3 18.7H416c35.3 0 64 28.7 64 64v32H144c-22.8 0-43.8 12.1-55.3 31.8zm27.6 16.1C122.1 230 132.6 224 144 224H544c11.5 0 22 6.1 27.7 16.1s5.7 22.2-.1 32.1l-112 192C453.9 474 443.4 480 432 480H32c-11.5 0-22-6.1-27.7-16.1s-5.7-22.2 .1-32.1l112-192z"]
  },
  g0 = {
      prefix: "fas",
      iconName: "circle-info",
      icon: [512, 512, ["info-circle"], "f05a", "M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"]
  },
  y0 = {
      prefix: "fas",
      iconName: "house",
      icon: [576, 512, [127968, 63498, 63500, "home", "home-alt", "home-lg-alt"], "f015", "M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"]
  },
  w0 = y0,
  ui = {
      prefix: "fas",
      iconName: "rotate-right",
      icon: [512, 512, ["redo-alt", "rotate-forward"], "f2f9", "M447.5 224H456c13.3 0 24-10.7 24-24V72c0-9.7-5.8-18.5-14.8-22.2s-19.3-1.7-26.2 5.2L397.4 96.6c-87.6-86.5-228.7-86.2-315.8 1c-87.5 87.5-87.5 229.3 0 316.8s229.3 87.5 316.8 0c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0c-62.5 62.5-163.8 62.5-226.3 0s-62.5-163.8 0-226.3c62.2-62.2 162.7-62.5 225.3-1L311 183c-6.9 6.9-8.9 17.2-5.2 26.2s12.5 14.8 22.2 14.8H447.5z"]
  },
  k0 = {
      prefix: "fas",
      iconName: "magnifying-glass",
      icon: [512, 512, [128269, "search"], "f002", "M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"]
  },
  x0 = k0,
  zm = {
      prefix: "fas",
      iconName: "plus",
      icon: [448, 512, [10133, 61543, "add"], "2b", "M240 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H32c-17.7 0-32 14.3-32 32s14.3 32 32 32H176V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H384c17.7 0 32-14.3 32-32s-14.3-32-32-32H240V80z"]
  },
  N0 = zm,
  S0 = {
      prefix: "fas",
      iconName: "chevron-left",
      icon: [320, 512, [9001], "f053", "M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"]
  },
  E0 = {
      prefix: "fas",
      iconName: "check",
      icon: [512, 512, [10003, 10004], "f00c", "M470.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L192 338.7 425.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"]
  },
  C0 = {
      prefix: "fas",
      iconName: "handcuffs",
      icon: [640, 512, [], "e4f8", "M240 32a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zM192 48a32 32 0 1 1 0 64 32 32 0 1 1 0-64zm-32 80c17.7 0 32 14.3 32 32h8c13.3 0 24 10.7 24 24v16c0 1.7-.2 3.4-.5 5.1C280.3 229.6 320 286.2 320 352c0 88.4-71.6 160-160 160S0 440.4 0 352c0-65.8 39.7-122.4 96.5-146.9c-.4-1.6-.5-3.3-.5-5.1V184c0-13.3 10.7-24 24-24h8c0-17.7 14.3-32 32-32zm0 320a96 96 0 1 0 0-192 96 96 0 1 0 0 192zm192-96c0-25.9-5.1-50.5-14.4-73.1c16.9-32.9 44.8-59.1 78.9-73.9c-.4-1.6-.5-3.3-.5-5.1V184c0-13.3 10.7-24 24-24h8c0-17.7 14.3-32 32-32s32 14.3 32 32h8c13.3 0 24 10.7 24 24v16c0 1.7-.2 3.4-.5 5.1C600.3 229.6 640 286.2 640 352c0 88.4-71.6 160-160 160c-62 0-115.8-35.3-142.4-86.9c9.3-22.5 14.4-47.2 14.4-73.1zm224 0a96 96 0 1 0 -192 0 96 96 0 1 0 192 0zM368 0a32 32 0 1 1 0 64 32 32 0 1 1 0-64zm80 48a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"]
  },
  KC = {
    prefix: "fas",
    iconName: "hospital",
    icon: [640, 512, [10003, 10004], "e4f8", "M192 48c0-26.5 21.5-48 48-48H400c26.5 0 48 21.5 48 48V512H368V432c0-26.5-21.5-48-48-48s-48 21.5-48 48v80H192V48zM48 96H160V512H48c-26.5 0-48-21.5-48-48V320H80c8.8 0 16-7.2 16-16s-7.2-16-16-16H0V224H80c8.8 0 16-7.2 16-16s-7.2-16-16-16H0V144c0-26.5 21.5-48 48-48zm544 0c26.5 0 48 21.5 48 48v48H560c-8.8 0-16 7.2-16 16s7.2 16 16 16h80v64H560c-8.8 0-16 7.2-16 16s7.2 16 16 16h80V464c0 26.5-21.5 48-48 48H480V96H592zM312 64c-8.8 0-16 7.2-16 16v24H272c-8.8 0-16 7.2-16 16v16c0 8.8 7.2 16 16 16h24v24c0 8.8 7.2 16 16 16h16c8.8 0 16-7.2 16-16V152h24c8.8 0 16-7.2 16-16V120c0-8.8-7.2-16-16-16H344V80c0-8.8-7.2-16-16-16H312z"]
  },
  rn = {
      prefix: "fas",
      iconName: "x",
      icon: [384, 512, [120], "58", "M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"]
  };
const _m = St({}),
  Om = () => Et(_m),
  b0 = () => Ya(_m),
  P0 = ({
      href: e,
      setHref: n
  }) => {
      const t = Om(),
          r = [{
              icon: w0,
              title: t.MAIN_PAGE_TITLE || "Home",
              subtitle: t.MAIN_PAGE_DESC || "",
              href: "home"
          }, {
              icon: v0,
              title: t.FILES_PAGE_TITLE || "Files",
              subtitle: t.FILES_PAGE_DESC || "",
              href: "files"
          }, {
              icon: KC,
              title: t.POLICE_PAGE_TITLE || "Medic List",
              subtitle: t.POLICE_PAGE_DESC || "",
              href: "mediclist"
          }, {
              icon: g0,
              title: t.DISPATCH_PAGE_TITLE || "Dispatch",
              subtitle: t.DISPATCH_PAGE_DESC || "",
              href: "dispatch"
          }],
          i = () => {
              V("closeUI")
          },
          a = ({
              data: l
          }) => d("div", {
              className: "navbar-button " + (l.href == e ? "selected" : ""),
              onClick: () => n(l.href),
              children: [o("div", {
                  className: "navbar-icon",
                  children: o(ie, {
                      icon: l.icon
                  })
              }), d("div", {
                  className: "navbar-desc",
                  children: [o("p", {
                      className: "navbar-title",
                      children: l.title
                  }), o("p", {
                      className: "navbar-subtitle",
                      children: l.subtitle
                  })]
              })]
          });
      return d("div", {
          className: "navbar",
          children: [d("div", {
              className: "logo",
              children: [d("div", {
                  className: "logo-title",
                  children: [o("p", {
                      style: {
                          color: "#ff3131"
                      },
                      children: t.JOB_TITLE || "POLICE"
                  }), o("p", {
                      children: t.MDT_TITLE || "MDT EMS"
                  })]
              }), o("div", {
                  className: "logo-rectangle"
              }), o("div", {
                  className: "logo-subtitle",
                  children: t.MDT_DESC || ""
              })]
          }), o("div", {
              className: "navigation",
              children: r.map((l, s) => o(a, {
                  data: l
              }, s))
          }), d("div", {
              className: "nav-footer",
              children: [o("button", {
                  onClick: () => n("notes"),
                  children: "NotePad"
              }), o("button", {
                  className: "long",
                  onClick: () => i(),
                  children: t.LOGOUT || "Logout"
              })]
          })]
      })
  },
  Tm = St(null),
  it = () => Et(Tm),
  z0 = () => ai(Tm);
const Ee = ({
      text: e
  }) => d("div", {
      className: "title-container",
      children: [o("div", {
          className: "title-text",
          children: e
      }), o("div", {
          className: "title-line"
      })]
  }),
  Am = St([]),
  Lm = () => Ya(Am),
  _0 = () => ai(Am),
  O0 = ({
      setHref: e
  }) => {
      const n = it(),
          t = Om(),
          [r, i] = S.exports.useState("available"),
          a = [{
              label: t.STATUS_AVAILABLE,
              name: "available"
          }, {
              label: t.STATUS_NOAVAILABLE,
              name: "noavailable"
          }, {
              label: t.STATUS_S2,
              name: "s2"
          }, {
              label: t.STATUS_S4,
              name: "s4"
          }, {
              label: t.STATUS_S5,
              name: "s5"
          }, {
              label: t.STATUS_S8,
              name: "s8"
          }],
          l = O => {
              i(O), V("setStatus", {
                  status: O
              })
          },
          [s, u] = S.exports.useState([]),
          [c, h] = S.exports.useState([]);
      D("setLastNotes", O => {
          u(O.vehicles), h(O.citizen)
      });
      const g = S.exports.useRef(null),
          y = S.exports.useRef(null),
          [k, E] = Lm(),
          C = () => {
              if (!g.current || !y.current) return;
              const O = g.current.value,
                  p = y.current.value;
              if (!O || !p) return;
              V("addNote", {
                  title: O,
                  content: p
              });
              const f = k;
              f.push({
                  title: O,
                  content: p,
                  annid: 0
              }), E(f), g.current.value = "", y.current.value = ""
          };
      return d("div", {
          className: "home-container",
          children: [d("div", {
              className: "home",
              children: [o(Ee, {
                  text: "Status s\u0142u\u017Cby"
              }), d("div", {
                  className: "self-container",
                  children: [o("div", {
                      className: "self-name",
                      children: n && d("span", {
                          children: [n.badge || "", " ", n.firstname, " ", n.lastname, " ", o("span", {
                              children: n.job.grade_label
                          })]
                      })
                  }), o("div", {
                      className: "self-hours",
                      children: o("div", {
                          children: n && n.dutyTime
                      })
                  }), o("div", {
                      className: "self-actions",
                      children: a.map((O, p) => o("div", {
                          className: "action-button " + (O.name == r && "clicked"),
                          onClick: () => l(O.name),
                          children: O.label
                      }, p))
                  })]
              }), o(Ee, {
                  text: "Ostatnie notatki obywateli"
              }), d("div", {
                  className: "notes-container",
                  style: {
                      marginBottom: "14px"
                  },
                  children: [d("div", {
                      className: "notes-header",
                      children: [o("span", {
                          style: {
                              width: "125px"
                          },
                          children: "Dane osobowe"
                      }), o("span", {
                          style: {
                              width: "103px"
                          },
                          children: "Data"
                      }), o("span", {
                          style: {
                              width: "336px"
                          },
                          children: "Pow\xF3d"
                      }), o("span", {
                          style: {
                              width: "125px"
                          },
                          children: "Wydane przez"
                      })]
                  }), o("div", {
                      className: "notes-notes",
                      children: o("table", {
                          children: c.reverse().map((O, p) => d("tr", {
                              className: "notes-row",
                              children: [o("td", {
                                  style: {
                                      width: "129px"
                                  },
                                  children: o("span", {
                                      children: O.name
                                  })
                              }), o("td", {
                                  style: {
                                      width: "107px"
                                  },
                                  children: o("span", {
                                      children: new Date(O.date * 1e3).toLocaleString("pl-PL", {
                                          year: "numeric",
                                          month: "2-digit",
                                          day: "2-digit",
                                          hour: "2-digit",
                                          minute: "2-digit",
                                          second: "2-digit"
                                      })
                                  })
                              }), o("td", {
                                  style: {
                                      width: "340px"
                                  },
                                  children: o("span", {
                                      children: O.reason
                                  })
                              }), o("td", {
                                  style: {
                                      width: "129px"
                                  },
                                  children: o("span", {
                                      children: O.medic
                                  })
                              })]
                          }, p))
                      })
                  })]
              }), o(Ee, {
                  text: "Ostatnie notatki pojazd\xF3w"
              }), d("div", {
                  className: "notes-container vehicle-container",
                  children: [d("div", {
                      className: "notes-header",
                      children: [o("span", {
                          style: {
                              width: "86px"
                          },
                          children: "Model"
                      }), o("span", {
                          style: {
                              width: "76px"
                          },
                          children: "W\u0142a\u015Bciciel"
                      }), o("span", {
                          style: {
                              width: "103px"
                          },
                          children: "Data"
                      }), o("span", {
                          style: {
                              width: "69px"
                          },
                          children: "Rej."
                      }), o("span", {
                          style: {
                              width: "263px"
                          },
                          children: "Pow\xF3d"
                      }), o("span", {
                          style: {
                              width: "84px"
                          },
                          children: "Wydane przez"
                      })]
                  }), o("div", {
                      className: "notes-notes vehicle-notes",
                      children: o("table", {
                          children: s.reverse().map((O, p) => d("tr", {
                              className: "notes-row",
                              children: [o("td", {
                                  style: {
                                      width: "90px"
                                  },
                                  children: o("span", {
                                      children: O.model
                                  })
                              }), o("td", {
                                  style: {
                                      width: "80px"
                                  },
                                  children: o("span", {
                                      children: O.owner
                                  })
                              }), o("td", {
                                  style: {
                                      width: "107px"
                                  },
                                  children: o("span", {
                                      children: new Date(O.date * 1e3).toLocaleString("pl-PL", {
                                          year: "numeric",
                                          month: "2-digit",
                                          day: "2-digit",
                                          hour: "2-digit",
                                          minute: "2-digit",
                                          second: "2-digit"
                                      })
                                  })
                              }), o("td", {
                                  style: {
                                      width: "73px"
                                  },
                                  children: o("span", {
                                      children: O.plate
                                  })
                              }), o("td", {
                                  style: {
                                      width: "267px"
                                  },
                                  children: o("span", {
                                      children: O.reason
                                  })
                              }), o("td", {
                                  style: {
                                      width: "88px"
                                  },
                                  children: o("span", {
                                      children: O.medic
                                  })
                              })]
                          }, p))
                      })
                  })]
              })]
          }), d("div", {
              className: "notepad",
              children: [o(Ee, {
                  text: "Notepad"
              }), d("div", {
                  className: "notepad-container",
                  children: [o("input", {
                      placeholder: "Tytu\u0142 notatki...",
                      ref: g
                  }), o("textarea", {
                      placeholder: "Tre\u015B\u0107 notatki...",
                      ref: y
                  }), d("div", {
                      className: "buttons",
                      children: [o("div", {
                          className: "btn",
                          onClick: () => e("notes"),
                          children: "Wszystkie notatki"
                      }), o("div", {
                          className: "btn btn-blue",
                          onClick: () => C(),
                          children: "Dodaj notatk\u0119"
                      })]
                  })]
              })]
          })]
      })
  };
const Ks = ({
      label: e,
      onSubmit: n,
      onCancel: t,
      placeholder: r,
      submitLabel: i
  }) => {
      const a = S.exports.useRef(null),
          l = () => {
              if (!a.current) return;
              const s = a.current.value;
              !s || (n(s), a.current.value = "")
          };
      return d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => t()
          }), d("div", {
              className: "modal-container",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: e
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => t(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), o("div", {
                  className: "modal-content",
                  children: o("textarea", {
                      placeholder: r,
                      ref: a
                  })
              }), o("div", {
                  className: "modal-footer",
                  children: o("div", {
                      className: "btn",
                      onClick: () => l(),
                      children: i
                  })
              })]
          })]
      })
  },
  Zs = e => {
      const n = () => {
          e.onSubmit(e.extraData)
      };
      return d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => e.onCancel()
          }), d("div", {
              className: "modal-container delete-modal",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: e.label
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => e.onCancel(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), o("div", {
                  className: "modal-content delete-modal",
                  children: e.text
              }), d("div", {
                  className: "modal-footer",
                  children: [o("div", {
                      className: "btn delete",
                      onClick: () => n(),
                      children: e.submitLabel
                  }), o("div", {
                      className: "btn",
                      onClick: () => e.onCancel(),
                      children: e.cancelLabel
                  })]
              })]
          })]
      })
  };
const T0 = ({
  data: e,
  refresh: n
}) => {
  const [t, r] = S.exports.useState(!1), [i, a] = S.exports.useState(!1), [l, s] = S.exports.useState(null);
  return d(J, {
      children: [t && o(Ks, {
          label: "Dodaj notatk\u0119",
          onSubmit: async g => {
              r(!1), await V("addVehicleNote", {
                  plate: e.plate,
                  note: g
              }), n()
          },
          onCancel: () => {
              r(!1)
          },
          placeholder: "Tre\u015B\u0107 notatki...",
          submitLabel: "Dodaj notatk\u0119"
      }), i && o(Zs, {
          label: "Usuwanie notatki",
          onSubmit: async g => {
              s(null), a(!1), g && (await V("deleteVehicleNote", {
                  plate: e.plate,
                  id: g
              }), setTimeout(() => {
                  n()
              }, 500))
          },
          onCancel: () => {
              a(!1), s(null)
          },
          text: "Czy na pewno chcesz usun\u0105\u0107 notatk\u0119?",
          submitLabel: "Usu\u0144",
          cancelLabel: "Anuluj",
          extraData: l
      }), o(Ee, {
          text: "Pojazd"
      }), o("div", {
          className: "info-container",
          children: d("div", {
              children: [d("div", {
                  className: "top",
                  children: [o("div", {
                      style: {
                          width: "219px"
                      },
                      children: "Model"
                  }), o("div", {
                      style: {
                          width: "168px"
                      },
                      children: "Rejestracja"
                  }), o("div", {
                      style: {
                          width: "158px"
                      },
                      children: "W\u0142a\u015Bciciel"
                  }), o("div", {
                      style: {
                          width: "158px"
                      },
                      children: "Wsp\xF3\u0142w\u0142a\u015Bciciel"
                  })]
              }), d("div", {
                  className: "bottom",
                  children: [o("div", {
                      style: {
                          width: "219px"
                      },
                      children: e.model
                  }), o("div", {
                      style: {
                          width: "168px"
                      },
                      children: e.plate
                  }), d("div", {
                      style: {
                          width: "158px"
                      },
                      children: [e.owner.firstname, " ", e.owner.lastname]
                  }), o("div", {
                      style: {
                          width: "158px"
                      },
                      children: e.subowner ? e.subowner.firstname + " " + e.subowner.lastname : "-"
                  })]
              })]
          })
      }), o("div", {
          className: "vehicle-notes",
          children: d("div", {
              className: "container",
              children: [d("div", {
                  className: "vehicle-notes-header",
                  children: [o("span", {
                      style: {
                          width: "104px"
                      },
                      children: "Data"
                  }), o("span", {
                      style: {
                          width: "488px"
                      },
                      children: "Notatka"
                  }), o("span", {
                      style: {
                          width: "111px"
                      },
                      children: "Wydane przez"
                  })]
              }), o("div", {
                  className: "vehicle-notes-results",
                  children: o("table", {
                      children: e.notes.map((g, y) => d("tr", {
                          className: "vehicle-notes-row",
                          onClick: () => {
                              a(!0), s(g.id)
                          },
                          children: [o("td", {
                              style: {
                                  width: "104px"
                              },
                              children: o("span", {
                                  children: new Date(g.date * 1e3).toLocaleString("pl-PL", {
                                      year: "numeric",
                                      month: "2-digit",
                                      day: "2-digit",
                                      hour: "2-digit",
                                      minute: "2-digit",
                                      second: "2-digit"
                                  })
                              })
                          }), o("td", {
                              style: {
                                  width: "488px"
                              },
                              children: o("span", {
                                  children: g.note
                              })
                          }), o("td", {
                              style: {
                                  width: "111px"
                              },
                              children: o("span", {
                                  children: g.medic
                              })
                          })]
                      }, y))
                  })
              }), o("div", {
                  className: "buttons",
                  children: o("div", {
                      className: "btn",
                      onClick: () => r(!0),
                      children: "Dodaj notatk\u0119"
                  })
              })]
          })
      })]
  })
};
const jm = St(null),
  A0 = () => Et(jm),
  L0 = () => ai(jm);
const j0 = ({
      data: e
  }) => {
      const n = it(),
          t = A0(),
          [r, i] = S.exports.useState(!1),
          [a, l] = S.exports.useState(0),
          [s, u] = S.exports.useState(0),
          [c, h] = S.exports.useState([]),
          [g, y] = S.exports.useState(!1),
          k = S.exports.useRef(null);
      var E = !0;
      const C = () => {
              let P = "";
              const w = {};
              for (let N = 0; N < c.length; N++) {
                  const z = c[N];
                  w[z.label] ? w[z.label] += 1 : w[z.label] = 1
              }
              for (const [N, z] of Object.entries(w)) E ? (z > 1 ? P = N + " " + z + "x" : P = N, E = !1) : z > 1 ? P += " | " + N + " " + z + "x" : P += " | " + N;
              return P
          },
          O = () => {
              l(0), u(0);
              let P = 0,
                  w = 0;
              for (let N = 0; N < c.length; N++) P += c[N].fine, w += c[N].jail;
              l(P), u(w)
          };
      let p = 0;
      const f = () => {
              if (a == 0 && s == 0 || !n) return;
              const P = C();
              if (P.length != 0) {
                  c.map(() => p += 1);
                  for (let w = p; w >= 0; w = w - 1) x(w);
                  V("submitFine", {
                      identifier: e.identifier,
                      fine: a,
                      jail: s,
                      reason: P,
                      medic: (n.badge || "") + " " + n.firstname + " " + n.lastname
                  }), r && i(!1)
              }
          },
          m = P => {
              const w = c;
              w.push(P), h(w), O()
          },
          x = P => {
              const w = c;
              w.splice(P, 1), h(w), O()
          },
          _ = () => {
              const P = document.querySelector("#customZarzuty"),
                  w = document.querySelector("#customGrzywna"),
                  N = document.querySelector("#customWyrok");
              if (P != null && w != null && N != null) {
                  var z = {
                      label: P.value,
                      fine: parseInt(w.value),
                      jail: parseInt(N.value)
                  };
                  m(z)
              }
              y(!1)
          },
          L = ({
              text: P
          }) => d("div", {
              className: "title-container",
              style: {
                  margin: 0
              },
              children: [o("div", {
                  className: "title-text",
                  style: {
                      fontSize: "7px"
                  },
                  children: P
              }), o("div", {
                  className: "title-line"
              })]
          });
      return d(J, {
          children: [g && d(J, {
              children: [o("div", {
                  className: "background",
                  onClick: () => y(!1)
              }), d("div", {
                  className: "modal-container",
                  children: [d("div", {
                      className: "modal-header",
                      children: [o("div", {
                          className: "modal-label",
                          children: "Niestandardowy rekord"
                      }), o("div", {
                          className: "modal-close",
                          onClick: () => y(!1),
                          children: o(ie, {
                              icon: rn
                          })
                      })]
                  }), d("div", {
                      className: "modal-content",
                      children: [o("input", {
                          type: "text",
                          id: "customZarzuty",
                          placeholder: "Rekord",
                          ref: k
                      }), o("input", {
                          type: "number",
                          id: "customWyrok",
                          placeholder: "Ilo\u015B\u0107 miesi\u0119cy",
                          ref: k
                      }), o("input", {
                          type: "number",
                          id: "customGrzywna",
                          placeholder: "Ilo\u015B\u0107 grzywny",
                          ref: k
                      })]
                  }), o("div", {
                      className: "modal-footer",
                      children: o("div", {
                          className: "btn",
                          onClick: () => _(),
                          children: "Zapisz zarzut"
                      })
                  })]
              })]
          }), o(Ee, {
              text: "Wystawianie mandat\xF3w"
          }), d("div", {
              className: "tariff-container",
              id: "tariff",
              children: [o("div", {
                  className: "fines-container",
                  children: o("div", {
                      className: "fines-scroll",
                      children: t == null ? void 0 : t.map((P, w) => d(J, {
                          children: [o("div", {
                              className: "tariff-title",
                              style: {
                                  marginTop: w == 0 ? "0" : "12px",
                                  width: "100%"
                              },
                              children: P.label
                          }, w), P.data.map((N, z) => d("div", {
                              className: "tariff-data",
                              onClick: () => m(N),
                              children: [o("span", {
                                  className: "tariff-reason",
                                  children: N.label
                              }), d("div", {
                                  className: "tariff-data-data",
                                  children: [N.jail > 0 && d("span", {
                                      className: "jail",
                                      children: [N.jail, " miesi\u0119cy"]
                                  }), N.fine > 0 && d("span", {
                                      className: "fine",
                                      children: [N.fine, " $"]
                                  }), o("div", {
                                      className: "add",
                                      children: o(ie, {
                                          icon: zm
                                      })
                                  })]
                              })]
                          }, z))]
                      }))
                  })
              }), d("div", {
                  className: "summary-container",
                  children: [o("div", {
                      className: "tariff-title",
                      children: "Podsumowanie faktury"
                  }), o("div", {
                      className: "summary-container2",
                      children: c.map((P, w) => d("div", {
                          className: "summary-fine",
                          children: [o("span", {
                              className: "summary-reason",
                              children: P.label
                          }), d("div", {
                              className: "summary-fine-data",
                              children: [P.jail > 0 && d("span", {
                                  className: "jail",
                                  children: [P.jail, " miesi\u0119cy"]
                              }), P.fine > 0 && d("span", {
                                  className: "fine",
                                  children: [P.fine, " $"]
                              }), o("div", {
                                  className: "remove",
                                  onClick: () => x(w),
                                  children: o(ie, {
                                      icon: rn
                                  })
                              })]
                          })]
                      }, w))
                  }), o("div", {
                      className: "tariff-custom",
                      onClick: () => y(!0),
                      children: "Dodaj niestandardowy rekord"
                  }), d("div", {
                      className: "summary-data",
                      children: [o(L, {
                          text: "PODSUMOWANIE"
                      }), d("div", {
                          className: "data",
                          children: [d("div", {
                              className: "summary-block",
                              style: {
                                  color: "#92FF3C"
                              },
                              children: [a, " $"]
                          })]
                      }), d("div", {
                          className: "data2",
                          children: [d("div", {
                              className: "data2-data",
                              children: [o(L, {
                                  text: "Data"
                              }), o("div", {
                                  className: "data2-block",
                                  children: new Date().toLocaleDateString()
                              })]
                          }), d("div", {
                              className: "data2-data",
                              children: [o(L, {
                                  text: "Wystawiaj\u0105cy"
                              }), o("div", {
                                  className: "data2-block",
                                  children: ((n == null ? void 0 : n.badge) || "") + " " + (n == null ? void 0 : n.firstname) + " " + (n == null ? void 0 : n.lastname)
                              })]
                          }), o("div", {
                              className: "summary-button-container",
                              children: o("div", {
                                  onClick: f,
                                  children: o(ie, {
                                      icon: E0
                                  })
                              })
                          })]
                      })]
                  })]
              })]
          })]
      })
  },
  I0 = ({
      data: e,
      refresh: n
  }) => {
      const [t, r] = S.exports.useState(!1), [i, a] = S.exports.useState("fines"), [l, s] = S.exports.useState(!1), u = () => {
          var m = document.querySelector(".poszukiwany");
          e.notes.length > 0 ? m.style.opacity = "1.0" : m.style.opacity = "0.0"
      };
      setTimeout(() => {
          u()
      }, 1e3), rr.useEffect(() => {
          const m = () => {
              !l || s(!1)
          };
          return window.addEventListener("goBack", m), () => window.removeEventListener("goBack", m)
      });
      const c = {
              fines: "Karta Medyczna",
              jails: "Ostatnie wyroki",
              notes: "Ostatnie notatki",
              vehicles: "Pojazdy"
          },
          [h, g] = S.exports.useState(!1),
          y = async m => {
              g(!1), await V("addCitizenNote", {
                  identifier: e.identifier,
                  note: m
              }), n()
          }, k = () => {
              g(!1)
          }, E = ({
              text: m
          }) => d("div", {
              className: "title-container",
              style: {
                  margin: 0
              },
              children: [o("div", {
                  className: "title-text",
                  style: {
                      fontSize: "11px"
                  },
                  children: m
              }), o("div", {
                  className: "title-line"
              })]
          }), C = ({
              text: m
          }) => o("div", {
              className: "data-text",
              children: m
          }), [O, p] = S.exports.useState(null);
      return d(J, {
          children: [h && o(Ks, {
              label: "Dodaj notatk\u0119",
              onSubmit: y,
              onCancel: k,
              placeholder: "Tre\u015B\u0107 notatki...",
              submitLabel: "Dodaj notatk\u0119"
          }), t && o(Zs, {
              label: "Usuwanie notatki",
              onSubmit: async m => {
                  p(null), r(!1), m && (await V("deleteCitizenNote", {
                      identifier: e.identifier,
                      id: m
                  }), setTimeout(() => {
                      n()
                  }, 500))
              },
              onCancel: () => {
                  r(!1), p(null)
              },
              text: "Czy na pewno chcesz usun\u0105\u0107 notatk\u0119?",
              submitLabel: "Usu\u0144",
              cancelLabel: "Anuluj",
              extraData: O
          }), l && o(j0, {
              data: e
          }), !l && d(J, {
              children: [o(Ee, {
                  text: "Dane osobowe"
              }), d("div", {
                  className: "data-container",
                  children: [d("div", {
                      className: "data-block",
                      children: [d("div", {
                          className: "img",
                          children: [o("div", {
                              className: "poszukiwany",
                              style: {
                                  opacity: 0
                              },
                              children: o("span", {
                                  children: "POSZUKIWANY"
                              })
                          }), o("img", {
                              src: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tenforums.com%2Fgeek%2Fgars%2Fimages%2F2%2Ftypes%2Fthumb_14400082930User.png"
                          })]
                      }), d("div", {
                          className: "data",
                          children: [o(E, {
                              text: "Imi\u0119 i Nazwisko"
                          }), o(C, {
                              text: e.firstname + " " + e.lastname
                          }), o(E, {
                              text: "P\u0142e\u0107"
                          }), o(C, {
                              text: e.sex == "m" ? "M\u0119\u017Cczyzna" : "Kobieta"
                          }), o(E, {
                              text: "Data urodzenia"
                          }), o(C, {
                              text: e.dateofbirth
                          }), o(E, {
                              text: "Licencje"
                          }), o(C, {
                              text: d(J, {
                                  children: [o("div", {
                                      className: e.licenses.drive_bike && "selected",
                                      children: "A"
                                  }), o("div", {
                                      className: e.licenses.drive && "selected",
                                      children: "B"
                                  }), o("div", {
                                      className: e.licenses.drive_truck && "selected",
                                      children: "C"
                                  })]
                              })
                          })]
                      })]
                  }), d("div", {
                      className: "data-buttons",
                      children: [o("div", {
                          className: "btn",
                          onClick: () => s(!0),
                          children: "Wystaw Fakture"
                      }), o("div", {
                          className: "btn",
                          style: {
                              opacity: 0
                          }
                      }), o("div", {
                          className: "btn " + (i == "fines" && "selected"),
                          onClick: () => a("fines"),
                          children: "Karta Medyczna"
                      }), o("div", {
                          className: "btn " + (i == "notes" && "selected"),
                          onClick: () => a("notes"),
                          children: "Notatki"
                      })]
                  })]
              }), o(Ee, {
                  text: c[i]
              }), o("div", {
                  className: "table-table",
                  children: d("div", {
                      className: "table-container",
                      children: [d("div", {
                          className: "table-header",
                          children: [i == "fines" && d(J, {
                              children: [o("span", {
                                  style: {
                                      width: "565px"
                                  },
                                  children: "Pow\xF3d"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Data"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Cena"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Wydane przez"
                              })]
                          }), i == "jails" && d(J, {
                              children: [o("span", {
                                  style: {
                                      width: "459px"
                                  },
                                  children: "Pow\xF3d"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Data"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Wyrok"
                              }), o("span", {
                                  style: {
                                      width: "102px"
                                  },
                                  children: "Grzywna"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Wydane przez"
                              })]
                          }), i == "notes" && d(J, {
                              children: [o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Data"
                              }), o("span", {
                                  style: {
                                      width: "694px"
                                  },
                                  children: "Notatka"
                              }), o("span", {
                                  style: {
                                      width: "125px"
                                  },
                                  children: "Wydane przez"
                              })]
                          }), i == "vehicles" && d(J, {
                              children: [o("span", {
                                  style: {
                                      width: "309px"
                                  },
                                  children: "Model"
                              }), o("span", {
                                  style: {
                                      width: "326px"
                                  },
                                  children: "Rejestracja"
                              }), o("span", {
                                  style: {
                                      width: "309px"
                                  },
                                  children: "Status"
                              })]
                          })]
                      }), o("div", {
                          className: "table-results",
                          children: o("table", {
                              children: e[i].map((m, x) => d("tr", {
                                  className: "table-row",
                                  onClick: () => {
                                      i === "notes" && (r(!0), p(m.id))
                                  },
                                  children: [i == "fines" && d(J, {
                                      children: [o("td", {
                                          style: {
                                              width: "565px"
                                          },
                                          children: o("span", {
                                              children: m.reason
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: new Date(m.date * 1e3).toLocaleString("pl-PL", {
                                                  year: "numeric",
                                                  month: "2-digit",
                                                  day: "2-digit",
                                                  hour: "2-digit",
                                                  minute: "2-digit",
                                                  second: "2-digit"
                                              })
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: d("span", {
                                              children: ["$", m.fine.toLocaleString("en-US")]
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: m.medic
                                          })
                                      })]
                                  }), i == "jails" && d(J, {
                                      children: [o("td", {
                                          style: {
                                              width: "459px"
                                          },
                                          children: o("span", {
                                              children: m.reason
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: new Date(m.date * 1e3).toLocaleString("pl-PL", {
                                                  year: "numeric",
                                                  month: "2-digit",
                                                  day: "2-digit",
                                                  hour: "2-digit",
                                                  minute: "2-digit",
                                                  second: "2-digit"
                                              })
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: m.jail
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "102px"
                                          },
                                          children: d("span", {
                                              children: ["$", m.fine.toLocaleString("en-US")]
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: m.medic
                                          })
                                      })]
                                  }), i == "notes" && d(J, {
                                      children: [o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: new Date(m.date * 1e3).toLocaleString("pl-PL", {
                                                  year: "numeric",
                                                  month: "2-digit",
                                                  day: "2-digit",
                                                  hour: "2-digit",
                                                  minute: "2-digit",
                                                  second: "2-digit"
                                              })
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "694px"
                                          },
                                          children: o("span", {
                                              children: m.reason
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "125px"
                                          },
                                          children: o("span", {
                                              children: m.medic
                                          })
                                      })]
                                  }), i == "vehicles" && d(J, {
                                      children: [o("td", {
                                          style: {
                                              width: "309px"
                                          },
                                          children: o("span", {
                                              children: m.model
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "326px"
                                          },
                                          children: o("span", {
                                              children: m.plate
                                          })
                                      }), o("td", {
                                          style: {
                                              width: "309px"
                                          },
                                          children: o("span", {
                                              children: m.status
                                          })
                                      })]
                                  })]
                              }, x))
                          })
                      }), o("div", {
                          className: "buttons",
                          children: i == "notes" && o("div", {
                              className: "btn",
                              onClick: () => g(!0),
                              children: "Dodaj notatk\u0119"
                          })
                      })]
                  })
              })]
          })]
      })
  },
  M0 = () => {
      const [e, n] = S.exports.useState(!0), [t, r] = S.exports.useState([]), [i, a] = S.exports.useState(null), l = S.exports.useRef(null), [s, u] = S.exports.useState(!1), c = () => {
          s || (r([]), u(!0), setTimeout(() => {
              u(!1)
          }, 2e3), Ca() && console.log("closest", "szukanie"), V("search", {
              value: null,
              type: e === !0 ? "citizen" : "vehicle"
          }))
      };
      S.exports.useEffect(() => {
          const y = k => {
              var C;
              if (k.key !== "Enter" || s || ((C = document == null ? void 0 : document.activeElement) == null ? void 0 : C.id) !== "search" || !l.current) return;
              const E = l.current.value;
              E.length < 1 || (Ca() && console.log(E, "szukanie"), r([]), u(!0), setTimeout(() => {
                  u(!1)
              }, 2e3), V("search", {
                  value: E,
                  type: e === !0 ? "citizen" : "vehicle"
              }))
          };
          return window.addEventListener("keyup", y), () => window.removeEventListener("keyup", y)
      }, [e]), D("searchResults", y => {
          a(null), r(y)
      });
      const h = async (y, k) => {
          const E = await V("setData", {
              type: y,
              identifier: k
          });
          a(E)
      }, g = () => {
          !i || h(i.type, i.identifier || i.plate)
      };
      return rr.useEffect(() => {
          const y = () => {
              const k = document.getElementById("tariff");
              i.type && !k && a(null)
          };
          return window.addEventListener("goBack", y), () => window.removeEventListener("goBack", y)
      }), o("div", {
          className: "files-container",
          style: {
              padding: i && i.type == "citizen" && "0 36px"
          },
          children: d("div", {
              className: "files",
              style: {
                  width: i && i.type == "citizen" && "1004px"
              },
              children: [i === null && d(J, {
                  children: [o(Ee, {
                      text: "Wyszukiwarka " + (e ? "obywateli" : "pojazd\xF3w")
                  }), d("div", {
                      className: "searcher",
                      children: [o("input", {
                          placeholder: "Wyszukaj " + (e ? "obywatela" : "pojazd") + "...",
                          id: "search",
                          ref: l
                      }), o("div", {
                          className: "closest",
                          onClick: () => c(),
                          children: "Najbli\u017Cszy"
                      }), o("div", {
                          className: "citizen-vehicle " + (e && "citizen"),
                          onClick: () => {
                              n(!e), l.current && (l.current.value = ""), r([]), a(null)
                          },
                          children: o("div", {
                              className: "in",
                              children: e ? "Obywatel" : "Pojazd"
                          })
                      })]
                  }), t.length > 0 && d(J, {
                      children: [o(Ee, {
                          text: e ? "Obywatele" : "Pojazdy"
                      }), d("div", {
                          className: "results-container",
                          children: [d("div", {
                              className: "results-header",
                              children: [e && d(J, {
                                  children: [o("span", {
                                      style: {
                                          width: "446px"
                                      },
                                      children: "Imi\u0119 i Nazwisko Obywatela"
                                  }), o("span", {
                                      style: {
                                          width: "265px"
                                      },
                                      children: "Data urodzenia obywatela"
                                  })]
                              }), !e && d(J, {
                                  children: [o("span", {
                                      style: {
                                          width: "219px"
                                      },
                                      children: "Model"
                                  }), o("span", {
                                      style: {
                                          width: "223px"
                                      },
                                      children: "Rejestracja"
                                  }), o("span", {
                                      style: {
                                          width: "265px"
                                      },
                                      children: "W\u0142a\u015Bciciel"
                                  })]
                              })]
                          }), o("div", {
                              className: "results-results",
                              children: o("table", {
                                  children: t.map((y, k) => d("tr", {
                                      className: "results-row",
                                      onClick: () => h(e ? "citizen" : "vehicle", e ? y.identifier : y.plate),
                                      children: [e && d(J, {
                                          children: [o("td", {
                                              style: {
                                                  width: "446px"
                                              },
                                              children: o("span", {
                                                  children: y.firstname + " " + y.lastname
                                              })
                                          }), o("td", {
                                              style: {
                                                  width: "265px"
                                              },
                                              children: o("span", {
                                                  children: y.dateofbirth
                                              })
                                          })]
                                      }), !e && d(J, {
                                          children: [o("td", {
                                              style: {
                                                  width: "219px"
                                              },
                                              children: o("span", {
                                                  children: y.model
                                              })
                                          }), o("td", {
                                              style: {
                                                  width: "223px"
                                              },
                                              children: o("span", {
                                                  children: y.plate
                                              })
                                          }), o("td", {
                                              style: {
                                                  width: "265px"
                                              },
                                              children: o("span", {
                                                  children: y.owner
                                              })
                                          })]
                                      })]
                                  }, k))
                              })
                          })]
                      })]
                  })]
              }), i && i.type == "vehicle" && o(T0, {
                  data: i,
                  refresh: g
              }), i && i.type == "citizen" && o(I0, {
                  data: i,
                  refresh: g
              })]
          })
      })
  },
  Im = St([]),
  R0 = () => Et(Im),
  F0 = () => Ya(Im),
  Mm = ({
      label: e,
      onSubmit: n,
      onCancel: t,
      firstPlaceholder: r,
      secondPlaceholder: i,
      submitLabel: a
  }) => {
      const l = S.exports.useRef(null),
          s = S.exports.useRef(null),
          u = () => {
              if (!l.current || !s.current) return;
              const c = l.current.value,
                  h = s.current.value;
              !c || !h || (n(c, h), l.current.value = "", s.current.value = "")
          };
      return d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => t()
          }), d("div", {
              className: "modal-container",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: e
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => t(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), d("div", {
                  className: "modal-content",
                  children: [o("input", {
                      placeholder: r,
                      ref: l
                  }), o("textarea", {
                      placeholder: i,
                      ref: s
                  })]
              }), o("div", {
                  className: "modal-footer",
                  children: o("div", {
                      className: "btn",
                      onClick: () => u(),
                      children: a
                  })
              })]
          })]
      })
  };
const U0 = () => {
      const e = it(),
          n = R0(),
          [t, r] = S.exports.useState(!1),
          i = (u, c) => {
              r(!1), V("addAnnoucement", {
                  title: u,
                  content: c
              })
          },
          a = () => {
              r(!1)
          },
          l = () => {
              var u = document.getElementById("annoucements-checkbox-idea"),
                  c = u == null ? void 0 : u.classList.contains("showed");
              if (c) {
                  document.querySelectorAll(".annoucements-checkbox-idea").forEach(function(g) {
                      var y = g;
                      y.style.display = "none"
                  }), u == null || u.classList.remove("showed");
                  var h = document.getElementById("confirm-button");
                  h.style.display = "none"
              } else {
                  document.querySelectorAll(".annoucements-checkbox-idea").forEach(function(y) {
                      var k = y;
                      k.style.display = "block"
                  }), u == null || u.classList.add("showed");
                  var h = document.getElementById("confirm-button");
                  h.style.display = "flex"
              }
          },
          s = () => {
              l(), document.querySelectorAll(".checkbox-input").forEach(function(u) {
                  var c = u;
                  if (c.checked) {
                      var h = c.id.replace("checkbox", "");
                      V("removeAnn", {
                          ret: h
                      })
                  }
              })
          };
      return d(J, {
          children: [t && o(Mm, {
              label: "Dodaj og\u0142oszenie",
              onSubmit: i,
              onCancel: a,
              firstPlaceholder: "Tytu\u0142 og\u0142oszenia...",
              secondPlaceholder: "Tre\u015B\u0107 og\u0142oszenia...",
              submitLabel: "Dodaj og\u0142oszenie"
          }), o("div", {
              className: "annoucements-container",
              children: d("div", {
                  className: "annoucements",
                  children: [o(Ee, {
                      text: "Og\u0142oszenia"
                  }), d("div", {
                      className: "container",
                      children: [d("div", {
                          className: "annoucements-header",
                          children: [o("span", {
                              style: {
                                  width: "265px"
                              },
                              children: "Tytu\u0142 og\u0142oszenia"
                          }), o("span", {
                              style: {
                                  width: "636px"
                              },
                              children: "Tre\u015B\u0107 og\u0142oszenia"
                          })]
                      }), o("div", {
                          className: "annoucements-results",
                          children: o("table", {
                              children: n.map((u, c) => d("tr", {
                                  className: "annoucements-row",
                                  id: "row-" + u.annid,
                                  children: [d("div", {
                                      className: "annoucements-checkbox-idea",
                                      id: "annoucements-checkbox-idea",
                                      children: [o("input", {
                                          type: "checkbox",
                                          className: "checkbox-input",
                                          id: "checkbox" + u.annid
                                      }), o("label", {
                                          htmlFor: "checkbox" + u.annid,
                                          children: o("span", {
                                              className: "checkbox"
                                          })
                                      })]
                                  }), o("td", {
                                      style: {
                                          width: "265px"
                                      },
                                      children: o("span", {
                                          children: u.title
                                      })
                                  }), o("td", {
                                      style: {
                                          width: "636px"
                                      },
                                      children: o("span", {
                                          children: u.content
                                      })
                                  })]
                              }, c))
                          })
                      }), d("div", {
                          className: "buttons",
                          children: [(e == null ? void 0 : e.job.grade_name) == "boss" && o("div", {
                              className: "remove-btn",
                              id: "confirm-button",
                              onClick: () => s(),
                              children: "Potwierd\u017A"
                          }), (e == null ? void 0 : e.job.grade_name) == "boss" && o("div", {
                              className: "remove-btn",
                              onClick: () => l(),
                              children: "Usu\u0144 og\u0142oszenia"
                          }), (e == null ? void 0 : e.job.grade_name) == "boss" && o("div", {
                              className: "btn",
                              onClick: () => r(!0),
                              children: "Dodaj og\u0142oszenie"
                          })]
                      })]
                  })]
              })
          })]
      })
  },
  Rm = St([]),
  Fm = () => Et(Rm),
  B0 = () => Ya(Rm);
const V0 = () => {
  const e = Fm();
  return o("div", {
      className: "mediclist-container",
      children: d("div", {
          className: "mediclist",
          children: [o(Ee, {
              text: "Funkcjonariusze"
          }), d("div", {
              className: "container",
              children: [d("div", {
                  className: "mediclist-header",
                  children: [o("span", {
                      style: {
                          width: "150px"
                      },
                      children: "Numer odznaki"
                  }), o("span", {
                      style: {
                          width: "350px"
                      },
                      children: "Imie i Nazwisko"
                  }), o("span", {
                      style: {
                          width: "215px"
                      },
                      children: "Stopie\u0144"
                  }), o("span", {
                      style: {
                          width: "182px"
                      },
                      children: "Status"
                  })]
              }), o("div", {
                  className: "mediclist-results",
                  children: o("table", {
                      children: e.map((n, t) => d("tr", {
                          className: "mediclist-row",
                          children: [o("td", {
                              style: {
                                  width: "150px"
                              },
                              children: o("span", {
                                  children: n.badge
                              })
                          }), o("td", {
                              style: {
                                  width: "350px"
                              },
                              children: o("span", {
                                  children: n.firstname + " " + n.lastname
                              })
                          }), o("td", {
                              style: {
                                  width: "215px"
                              },
                              children: o("span", {
                                  children: n.user_grade
                              })
                          }), o("td", {
                              style: {
                                  width: "182px"
                              },
                              children: o("span", {
                                  children: n.status
                              })
                          })]
                      }, t))
                  })
              })]
          })]
      })
  })
};
const $0 = () => {
  const [e, n] = S.exports.useState(!1), [t, r] = S.exports.useState([]), [i, a] = Lm(), l = S.exports.useRef(null), [s, u] = S.exports.useState(!1), [c, h] = S.exports.useState(null);
  S.exports.useEffect(() => {
      if (l.current && l.current.value && l.current.value.length > 0) {
          const C = l.current.value.toLocaleLowerCase(),
              O = i.filter(p => p.title.toLocaleLowerCase().includes(C) || p.content.toLocaleLowerCase().includes(C));
          r(O)
      } else r(i)
  }, [i]);
  const g = () => {
      if (l.current && l.current.value && l.current.value.length > 0) {
          const C = l.current.value.toLocaleLowerCase(),
              O = i.filter(p => p.title.toLocaleLowerCase().includes(C) || p.content.toLocaleLowerCase().includes(C));
          r(O)
      } else r(i)
  };
  return d(J, {
      children: [e && o(Mm, {
          label: "Dodaj notatk\u0119",
          onSubmit: (C, O) => {
              n(!1), V("addNote", {
                  title: C,
                  content: O
              })
          },
          onCancel: () => {
              n(!1)
          },
          firstPlaceholder: "Tytu\u0142 notatki...",
          secondPlaceholder: "Tre\u015B\u0107 notatki...",
          submitLabel: "Dodaj notatk\u0119"
      }), s && o(Zs, {
          label: "Usuwanie notatki",
          onSubmit: C => {
              h(null), u(!1), V("deleteNote", {
                  annid: C
              })
          },
          onCancel: () => {
              u(!1), h(null)
          },
          text: "Czy na pewno chcesz usun\u0105\u0107 notatk\u0119?",
          submitLabel: "Usu\u0144",
          cancelLabel: "Anuluj",
          extraData: c
      }), o("div", {
          className: "notes-container",
          children: d("div", {
              className: "notes",
              children: [o(Ee, {
                  text: "Og\u0142oszenia"
              }), o("input", {
                  className: "search-container",
                  placeholder: "Wyszukaj notatki...",
                  ref: l,
                  onInput: () => g()
              }), d("div", {
                  className: "container",
                  children: [d("div", {
                      className: "notes-header",
                      children: [o("span", {
                          style: {
                              width: "265px"
                          },
                          children: "Tytu\u0142 notatki"
                      }), o("span", {
                          style: {
                              width: "636px"
                          },
                          children: "Tre\u015B\u0107 notatki"
                      })]
                  }), o("div", {
                      className: "notes-results",
                      children: o("table", {
                          children: t.map((C, O) => d("tr", {
                              className: "notes-row",
                              onClick: () => {
                                  u(!0), h(C.annid)
                              },
                              children: [o("td", {
                                  style: {
                                      width: "265px"
                                  },
                                  children: o("span", {
                                      children: C.title
                                  })
                              }), o("td", {
                                  style: {
                                      width: "636px"
                                  },
                                  children: o("span", {
                                      children: C.content
                                  })
                              })]
                          }, O))
                      })
                  }), o("div", {
                      className: "buttons",
                      children: o("div", {
                          className: "btn",
                          onClick: () => n(!0),
                          children: "Dodaj notatk\u0119"
                      })
                  })]
              })]
          })
      })]
  })
};
const ci = e => {
      const n = () => {
          e.onSubmit(e.extraData)
      };
      return d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => e.onCancel()
          }), d("div", {
              className: "modal-container delete-modal",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: e.label
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => e.onCancel(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), o("div", {
                  className: "modal-content delete-modal",
                  children: e.text
              }), d("div", {
                  className: "modal-footer",
                  children: [o("div", {
                      className: "btn",
                      onClick: () => n(),
                      children: e.submitLabel
                  }), o("div", {
                      className: "btn",
                      onClick: () => e.onCancel(),
                      children: e.cancelLabel
                  })]
              })]
          })]
      })
  },
  Um = St({
      units: [],
      vehicles: []
  }),
  di = () => Et(Um),
  W0 = () => ai(Um);
const H0 = () => {
  const e = it(),
      [n, t] = S.exports.useState([]),
      [r, i] = S.exports.useState({
          sv: ""
      }),
      [a, l] = S.exports.useState({
          nego: ""
      }),
      [s, u] = S.exports.useState({
          notatki: ""
      }),
      [c, h] = S.exports.useState({
          zadania: ""
      }),
      [g, y] = S.exports.useState({
          miejsce: ""
      });
  D("setNapadowa1", v => {
      t(v)
  }), D("setNapadowa1SV", v => {
      i(v)
  }), D("setNapadowa1NEGO", v => {
      l(v)
  }), D("setNapadowa1Notatki", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("inputNewNotatki");
          b.value = v.notatki
      }
      u(v)
  }), D("setNapadowa1Zadania", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("inputNewZadania");
          b.value = v.zadania
      }
      h(v)
  }), D("setNapadowa1Miejsce", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("newPlacowka");
          b.value = v.miejsce
      }
      y(v)
  });
  const k = v => {
          let b = "";
          v && e && (b = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaSV", {
              zakladkaType: "napadowa1",
              sv: b
          })
      },
      E = v => {
          let b = "";
          v && e && (b = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaNEGO", {
              zakladkaType: "napadowa1",
              nego: b
          })
      },
      C = () => {
          V("clearNapadowa", {
              zakladkaType: "napadowa1"
          })
      },
      O = () => {
          m != null && (f(!1), V("removeUnit", {
              zakladkaType: "napadowa1",
              index: m + 1
          }), x(null))
      },
      [p, f] = S.exports.useState(!1),
      [m, x] = S.exports.useState(null),
      _ = di(),
      [L, P] = S.exports.useState(!1),
      [w, N] = S.exports.useState(null),
      [z, j] = S.exports.useState(null),
      [U, W] = S.exports.useState(null),
      [Q, ce] = S.exports.useState(null),
      [X, te] = S.exports.useState(null),
      [T, B] = S.exports.useState(null),
      [H, Y] = S.exports.useState(null),
      M = () => {
          if (P(!1), !(!w && !z && !U))
              if (m === null) {
                  var v = {
                      medic1: U,
                      medic2: Q,
                      medic3: X,
                      medic4: T,
                      medic5: H
                  };
                  V("createUnit", {
                      zakladkaType: "napadowa1",
                      unit: w,
                      vehicle: z,
                      medics: v
                  })
              } else {
                  var v = {
                      medic1: U,
                      medic2: Q,
                      medic3: X,
                      medic4: T,
                      medic5: H
                  };
                  V("editUnit", {
                      zakladkaType: "napadowa1",
                      index: m + 1,
                      unit: w,
                      vehicle: z,
                      medics: v
                  })
              }
      },
      Z = () => {
          P(!1), N(null), j(null), W(null), ce(null), te(null), B(null), Y(null)
      },
      G = (v, b) => {
          v == "unit" ? N(b) : v == "vehicle" ? j(b) : v == "medic1" && (b != "" || b != null) ? W(b) : v == "medic2" && (b != "" || b != null) ? ce(b) : v == "medic3" && (b != "" || b != null) ? te(b) : v == "medic4" && (b != "" || b != null) ? B(b) : v == "medic5" && (b != "" || b != null) && Y(b)
      },
      de = v => {
          V("updateZadaniaAkcyjna", {
              zakladkaType: "napadowa1",
              text: v
          })
      },
      je = v => {
          V("updateNotatkiAkcyjna", {
              zakladkaType: "napadowa1",
              text: v
          })
      },
      I = v => {
          V("updateRabunekAkcyjna", {
              zakladkaType: "napadowa1",
              text: v
          })
      },
      K = () => {
          for (var v = 0, b = n, be = 0; be < b.length; be++) v += b[be].medics.length;
          return v
      };
  return d(J, {
      children: [p && o(ci, {
          label: "Usun\u0105\u0107 jednostk\u0119 po\u015Bcigow\u0105?",
          text: "Czy na pewno chcesz usun\u0105\u0107 U" + (m !== null && m + 1) + "?",
          submitLabel: "Usu\u0144",
          cancelLabel: "Anuluj",
          onSubmit: O,
          onCancel: () => f(!1)
      }), L && d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => Z()
          }), d("div", {
              className: "modal-container",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: "Informacje o jednostce po\u015Bcigowej"
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => Z(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), d("div", {
                  className: "modal-content",
                  children: [o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic1", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic2", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic3", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic4", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic5", v.target.value)
                  }), d("div", {
                      className: "napadowa-modal",
                      children: [o("select", {
                          onChange: v => G("unit", v.target.value),
                          children: _.units.map((v, b) => o("option", {
                              value: v,
                              children: v
                          }, b))
                      }), o("select", {
                          onChange: v => G("vehicle", v.target.value),
                          children: _.vehicles.map((v, b) => o("option", {
                              value: v,
                              children: v
                          }, b))
                      })]
                  }), d("div", {
                      className: "napadowa-modal",
                      children: [o("input", {
                          type: "text",
                          placeholder: "Notatka"
                      }), d("select", {
                          onChange: v => G("vehicle", v.target.value),
                          children: [o("option", {
                              children: "U1"
                          }), o("option", {
                              children: "U2"
                          }), o("option", {
                              children: "U3"
                          }), o("option", {
                              children: "U4"
                          }), o("option", {
                              children: "U5"
                          }), o("option", {
                              children: "U6"
                          }), o("option", {
                              children: "U7"
                          }), o("option", {
                              children: "U8"
                          }), o("option", {
                              children: "U9"
                          }), o("option", {
                              children: "U10"
                          })]
                      })]
                  })]
              }), o("div", {
                  className: "modal-footer",
                  children: o("div", {
                      className: "btn",
                      onClick: () => M(),
                      children: "Zapisz unit"
                  })
              })]
          })]
      }), o("div", {
          className: "napadowa-container",
          children: d("div", {
              className: "napadowa",
              children: [o(Ee, {
                  text: "Napadowa 1"
              }), d("div", {
                  className: "napadowa-header",
                  children: [d("div", {
                      style: {
                          width: "275px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Plac\xF3wka"
                      }), o("div", {
                          className: "header-content",
                          style: {
                              backgroundColor: "#0D141F",
                              color: "rgba(255, 255, 255, 0.6)"
                          },
                          children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("input", {
                              type: "text",
                              id: "newPlacowka",
                              placeholder: "Plac\xF3wka rabunku...",
                              onBlur: v => I(v.target.value)
                          }) : o("input", {
                              type: "text",
                              id: "oldPlacowka",
                              value: g.miejsce,
                              placeholder: "Plac\xF3wka rabunku (Uzupe\u0142nia SV/NEGO)",
                              disabled: !0
                          })
                      })]
                  }), d("div", {
                      style: {
                          width: "210px"
                      },
                      children: [d("div", {
                          className: "header-title pwc",
                          children: [o("div", {
                              className: "pwc-button",
                              onClick: () => k(!0),
                              children: "Przejmij"
                          }), o("span", {
                              children: "SV"
                          }), o("div", {
                              className: "pwc-button",
                              onClick: () => k(!1),
                              children: "Zresetuj"
                          })]
                      }), o("div", {
                          className: "header-content",
                          children: r.sv != "" ? r.sv : "BRAK"
                      })]
                  }), d("div", {
                      style: {
                          width: "210px"
                      },
                      children: [d("div", {
                          className: "header-title pwc",
                          children: [o("div", {
                              className: "pwc-button",
                              onClick: () => E(!0),
                              children: "Przejmij"
                          }), o("span", {
                              children: "NEGO"
                          }), o("div", {
                              className: "pwc-button",
                              onClick: () => E(!1),
                              children: "Zresetuj"
                          })]
                      }), o("div", {
                          className: "header-content",
                          children: a.nego != "" ? a.nego : "BRAK"
                      })]
                  }), d("div", {
                      style: {
                          width: "115px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Unity"
                      }), o("div", {
                          className: "header-content",
                          children: n.length
                      })]
                  }), d("div", {
                      style: {
                          width: "115px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Jednostki"
                      }), o("div", {
                          className: "header-content",
                          children: K()
                      })]
                  })]
              }), d("div", {
                  className: "napadowa-container2",
                  children: [d("div", {
                      className: "patrols-container",
                      children: [d("header", {
                          children: [o("span", {
                              children: "Unit"
                          }), r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) && d("span", {
                              className: "refresh",
                              onClick: () => C(),
                              children: [o(ie, {
                                  icon: ui
                              }), "  Wyczy\u015B\u0107 Napadow\u0105"]
                          })]
                      }), n.map((v, b) => d("div", {
                          className: "patrol",
                          onContextMenu: () => {
                              if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
                                  f(!0), x(b);
                                  return
                              }
                          },
                          onClick: () => {
                              (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) && (x(b), P(!0))
                          },
                          children: [d("div", {
                              className: "pu-index",
                              children: ["U", b + 1]
                          }), o("div", {
                              className: "names",
                              children: v.medics.map((be, or) => o("span", {
                                  children: be.name
                              }, or))
                          }), o("div", {
                              className: "unit",
                              children: v.unit
                          }), o("div", {
                              className: "vehicle",
                              children: v.vehicle
                          }), o("div", {
                              className: "status",
                              children: o("span", {
                                  children: v.status
                              })
                          })]
                      }, b))]
                  }), d("div", {
                      className: "patrols-right",
                      children: [d("div", {
                          className: "patrols-s4",
                          children: [o("header", {
                              children: "\u017B\u0104DANIA"
                          }), o("div", {
                              className: "s4-scroll",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("textarea", {
                                  placeholder: "\u017B\u0105dania napastnik\xF3w...",
                                  id: "inputNewZadania",
                                  onBlur: v => de(v.target.value)
                              }) : o("textarea", {
                                  value: c.zadania,
                                  placeholder: "\u017B\u0105dania napastnik\xF3w (Uzupe\u0142nia SV/NEGO)",
                                  id: "inputZadania",
                                  disabled: !0
                              })
                          })]
                      }), d("div", {
                          className: "patrols-s4",
                          children: [o("header", {
                              children: "NOTATKI"
                          }), o("div", {
                              className: "s4-scroll",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("textarea", {
                                  placeholder: "Notatki na temat rabunku...",
                                  id: "inputNewNotatki",
                                  onBlur: v => je(v.target.value)
                              }) : o("textarea", {
                                  value: s.notatki,
                                  placeholder: "Notatki na temat rabunku (Uzupe\u0142nia SV/NEGO)",
                                  id: "inputNotatki",
                                  disabled: !0
                              })
                          })]
                      }), o("div", {
                          className: "patrols-self",
                          children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("div", {
                              className: "create-patrol",
                              onClick: () => {
                                  P(!0), N(_.units[0]), j(_.vehicles[0])
                              },
                              children: "Stw\xF3rz unit"
                          }) : o("div", {
                              className: "create-patrol",
                              children: "Stw\xF3rz unit (TYLKO SV/NEGO)"
                          })
                      })]
                  })]
              })]
          })
      })]
  })
};
const Y0 = () => {
  const e = it(),
      [n, t] = S.exports.useState([]),
      [r, i] = S.exports.useState({
          sv: ""
      }),
      [a, l] = S.exports.useState({
          nego: ""
      }),
      [s, u] = S.exports.useState({
          notatki: ""
      }),
      [c, h] = S.exports.useState({
          zadania: ""
      }),
      [g, y] = S.exports.useState({
          miejsce: ""
      });
  D("setNapadowa2", v => {
      t(v)
  }), D("setNapadowa2SV", v => {
      i(v)
  }), D("setNapadowa2NEGO", v => {
      l(v)
  }), D("setNapadowa2Notatki", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("inputNewNotatki");
          b.value = v.notatki
      }
      u(v)
  }), D("setNapadowa2Zadania", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("inputNewZadania");
          b.value = v.zadania
      }
      h(v)
  }), D("setNapadowa2Miejsce", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("newPlacowka");
          b.value = v.miejsce
      }
      y(v)
  });
  const k = v => {
          let b = "";
          v && e && (b = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaSV", {
              zakladkaType: "napadowa2",
              sv: b
          })
      },
      E = v => {
          let b = "";
          v && e && (b = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaNEGO", {
              zakladkaType: "napadowa2",
              nego: b
          })
      },
      C = () => {
          V("clearNapadowa", {
              zakladkaType: "napadowa2"
          })
      },
      O = () => {
          m != null && (f(!1), V("removeUnit", {
              zakladkaType: "napadowa2",
              index: m + 1
          }), x(null))
      },
      [p, f] = S.exports.useState(!1),
      [m, x] = S.exports.useState(null),
      _ = di(),
      [L, P] = S.exports.useState(!1),
      [w, N] = S.exports.useState(null),
      [z, j] = S.exports.useState(null),
      [U, W] = S.exports.useState(null),
      [Q, ce] = S.exports.useState(null),
      [X, te] = S.exports.useState(null),
      [T, B] = S.exports.useState(null),
      [H, Y] = S.exports.useState(null),
      M = () => {
          if (P(!1), !(!w && !z && !U))
              if (m === null) {
                  var v = {
                      medic1: U,
                      medic2: Q,
                      medic3: X,
                      medic4: T,
                      medic5: H
                  };
                  V("createUnit", {
                      zakladkaType: "napadowa2",
                      unit: w,
                      vehicle: z,
                      medics: v
                  })
              } else {
                  var v = {
                      medic1: U,
                      medic2: Q,
                      medic3: X,
                      medic4: T,
                      medic5: H
                  };
                  V("editUnit", {
                      zakladkaType: "napadowa2",
                      index: m + 1,
                      unit: w,
                      vehicle: z,
                      medics: v
                  })
              }
      },
      Z = () => {
          P(!1), N(null), j(null), W(null), ce(null), te(null), B(null), Y(null)
      },
      G = (v, b) => {
          v == "unit" ? N(b) : v == "vehicle" ? j(b) : v == "medic1" && (b != "" || b != null) ? W(b) : v == "medic2" && (b != "" || b != null) ? ce(b) : v == "medic3" && (b != "" || b != null) ? te(b) : v == "medic4" && (b != "" || b != null) ? B(b) : v == "medic5" && (b != "" || b != null) && Y(b)
      },
      de = v => {
          V("updateZadaniaAkcyjna", {
              zakladkaType: "napadowa2",
              text: v
          })
      },
      je = v => {
          V("updateNotatkiAkcyjna", {
              zakladkaType: "napadowa2",
              text: v
          })
      },
      I = v => {
          V("updateRabunekAkcyjna", {
              zakladkaType: "napadowa2",
              text: v
          })
      },
      K = () => {
          for (var v = 0, b = n, be = 0; be < b.length; be++) v += b[be].medics.length;
          return v
      };
  return d(J, {
      children: [p && o(ci, {
          label: "Usun\u0105\u0107 jednostk\u0119 po\u015Bcigow\u0105?",
          text: "Czy na pewno chcesz usun\u0105\u0107 U" + (m !== null && m + 1) + "?",
          submitLabel: "Usu\u0144",
          cancelLabel: "Anuluj",
          onSubmit: O,
          onCancel: () => f(!1)
      }), L && d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => Z()
          }), d("div", {
              className: "modal-container",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: "Informacje o jednostce po\u015Bcigowej"
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => Z(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), d("div", {
                  className: "modal-content",
                  children: [o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic1", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic2", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic3", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic4", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic5", v.target.value)
                  }), d("div", {
                      className: "napadowa2-modal",
                      children: [o("select", {
                          onChange: v => G("unit", v.target.value),
                          children: _.units.map((v, b) => o("option", {
                              value: v,
                              children: v
                          }, b))
                      }), o("select", {
                          onChange: v => G("vehicle", v.target.value),
                          children: _.vehicles.map((v, b) => o("option", {
                              value: v,
                              children: v
                          }, b))
                      })]
                  }), d("div", {
                      className: "napadowa2-modal",
                      children: [o("input", {
                          type: "text",
                          placeholder: "Notatka"
                      }), d("select", {
                          onChange: v => G("vehicle", v.target.value),
                          children: [o("option", {
                              children: "U1"
                          }), o("option", {
                              children: "U2"
                          }), o("option", {
                              children: "U3"
                          }), o("option", {
                              children: "U4"
                          }), o("option", {
                              children: "U5"
                          }), o("option", {
                              children: "U6"
                          }), o("option", {
                              children: "U7"
                          }), o("option", {
                              children: "U8"
                          }), o("option", {
                              children: "U9"
                          }), o("option", {
                              children: "U10"
                          })]
                      })]
                  })]
              }), o("div", {
                  className: "modal-footer",
                  children: o("div", {
                      className: "btn",
                      onClick: () => M(),
                      children: "Zapisz unit"
                  })
              })]
          })]
      }), o("div", {
          className: "napadowa2-container",
          children: d("div", {
              className: "napadowa2",
              children: [o(Ee, {
                  text: "napadowa 2"
              }), d("div", {
                  className: "napadowa2-header",
                  children: [d("div", {
                      style: {
                          width: "275px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Plac\xF3wka"
                      }), o("div", {
                          className: "header-content",
                          style: {
                              backgroundColor: "#0D141F",
                              color: "rgba(255, 255, 255, 0.6)"
                          },
                          children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("input", {
                              type: "text",
                              id: "newPlacowka",
                              placeholder: "Plac\xF3wka rabunku...",
                              onBlur: v => I(v.target.value)
                          }) : o("input", {
                              type: "text",
                              id: "oldPlacowka",
                              value: g.miejsce,
                              placeholder: "Plac\xF3wka rabunku (Uzupe\u0142nia SV/NEGO)",
                              disabled: !0
                          })
                      })]
                  }), d("div", {
                      style: {
                          width: "210px"
                      },
                      children: [d("div", {
                          className: "header-title pwc",
                          children: [o("div", {
                              className: "pwc-button",
                              onClick: () => k(!0),
                              children: "Przejmij"
                          }), o("span", {
                              children: "SV"
                          }), o("div", {
                              className: "pwc-button",
                              onClick: () => k(!1),
                              children: "Zresetuj"
                          })]
                      }), o("div", {
                          className: "header-content",
                          children: r.sv != "" ? r.sv : "BRAK"
                      })]
                  }), d("div", {
                      style: {
                          width: "210px"
                      },
                      children: [d("div", {
                          className: "header-title pwc",
                          children: [o("div", {
                              className: "pwc-button",
                              onClick: () => E(!0),
                              children: "Przejmij"
                          }), o("span", {
                              children: "NEGO"
                          }), o("div", {
                              className: "pwc-button",
                              onClick: () => E(!1),
                              children: "Zresetuj"
                          })]
                      }), o("div", {
                          className: "header-content",
                          children: a.nego != "" ? a.nego : "BRAK"
                      })]
                  }), d("div", {
                      style: {
                          width: "115px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Unity"
                      }), o("div", {
                          className: "header-content",
                          children: n.length
                      })]
                  }), d("div", {
                      style: {
                          width: "115px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Jednostki"
                      }), o("div", {
                          className: "header-content",
                          children: K()
                      })]
                  })]
              }), d("div", {
                  className: "napadowa2-container2",
                  children: [d("div", {
                      className: "patrols-container",
                      children: [d("header", {
                          children: [o("span", {
                              children: "Unit"
                          }), r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) && d("span", {
                              className: "refresh",
                              onClick: () => C(),
                              children: [o(ie, {
                                  icon: ui
                              }), "  Wyczy\u015B\u0107 Napadow\u0105"]
                          })]
                      }), n.map((v, b) => d("div", {
                          className: "patrol",
                          onContextMenu: () => {
                              if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
                                  f(!0), x(b);
                                  return
                              }
                          },
                          onClick: () => {
                              (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) && (x(b), P(!0))
                          },
                          children: [d("div", {
                              className: "pu-index",
                              children: ["U", b + 1]
                          }), o("div", {
                              className: "names",
                              children: v.medics.map((be, or) => o("span", {
                                  children: be.name
                              }, or))
                          }), o("div", {
                              className: "unit",
                              children: v.unit
                          }), o("div", {
                              className: "vehicle",
                              children: v.vehicle
                          }), o("div", {
                              className: "status",
                              children: o("span", {
                                  children: v.status
                              })
                          })]
                      }, b))]
                  }), d("div", {
                      className: "patrols-right",
                      children: [d("div", {
                          className: "patrols-s4",
                          children: [o("header", {
                              children: "\u017B\u0104DANIA"
                          }), o("div", {
                              className: "s4-scroll",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("textarea", {
                                  placeholder: "\u017B\u0105dania napastnik\xF3w...",
                                  id: "inputNewZadania",
                                  onBlur: v => de(v.target.value)
                              }) : o("textarea", {
                                  value: c.zadania,
                                  placeholder: "\u017B\u0105dania napastnik\xF3w (Uzupe\u0142nia SV/NEGO)",
                                  id: "inputZadania",
                                  disabled: !0
                              })
                          })]
                      }), d("div", {
                          className: "patrols-s4",
                          children: [o("header", {
                              children: "NOTATKI"
                          }), o("div", {
                              className: "s4-scroll",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("textarea", {
                                  placeholder: "Notatki na temat rabunku...",
                                  id: "inputNewNotatki",
                                  onBlur: v => je(v.target.value)
                              }) : o("textarea", {
                                  value: s.notatki,
                                  placeholder: "Notatki na temat rabunku (Uzupe\u0142nia SV/NEGO)",
                                  id: "inputNotatki",
                                  disabled: !0
                              })
                          })]
                      }), o("div", {
                          className: "patrols-self",
                          children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("div", {
                              className: "create-patrol",
                              onClick: () => {
                                  P(!0), N(_.units[0]), j(_.vehicles[0])
                              },
                              children: "Stw\xF3rz unit"
                          }) : o("div", {
                              className: "create-patrol",
                              children: "Stw\xF3rz unit (TYLKO SV/NEGO)"
                          })
                      })]
                  })]
              })]
          })
      })]
  })
};
const G0 = () => {
  const e = it(),
      [n, t] = S.exports.useState([]),
      [r, i] = S.exports.useState({
          sv: ""
      }),
      [a, l] = S.exports.useState({
          nego: ""
      }),
      [s, u] = S.exports.useState({
          notatki: ""
      }),
      [c, h] = S.exports.useState({
          zadania: ""
      }),
      [g, y] = S.exports.useState({
          miejsce: ""
      });
  D("setNapadowa3", v => {
      t(v)
  }), D("setNapadowa3SV", v => {
      i(v)
  }), D("setNapadowa3NEGO", v => {
      l(v)
  }), D("setNapadowa3Notatki", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("inputNewNotatki");
          b.value = v.notatki
      }
      u(v)
  }), D("setNapadowa3Zadania", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("inputNewZadania");
          b.value = v.zadania
      }
      h(v)
  }), D("setNapadowa3Miejsce", v => {
      if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
          var b = document.getElementById("newPlacowka");
          b.value = v.miejsce
      }
      y(v)
  });
  const k = v => {
          let b = "";
          v && e && (b = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaSV", {
              zakladkaType: "napadowa3",
              sv: b
          })
      },
      E = v => {
          let b = "";
          v && e && (b = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaNEGO", {
              zakladkaType: "napadowa3",
              nego: b
          })
      },
      C = () => {
          V("clearNapadowa", {
              zakladkaType: "napadowa3"
          })
      },
      O = () => {
          m != null && (f(!1), V("removeUnit", {
              zakladkaType: "napadowa3",
              index: m + 1
          }), x(null))
      },
      [p, f] = S.exports.useState(!1),
      [m, x] = S.exports.useState(null),
      _ = di(),
      [L, P] = S.exports.useState(!1),
      [w, N] = S.exports.useState(null),
      [z, j] = S.exports.useState(null),
      [U, W] = S.exports.useState(null),
      [Q, ce] = S.exports.useState(null),
      [X, te] = S.exports.useState(null),
      [T, B] = S.exports.useState(null),
      [H, Y] = S.exports.useState(null),
      M = () => {
          if (P(!1), !(!w && !z && !U))
              if (m === null) {
                  var v = {
                      medic1: U,
                      medic2: Q,
                      medic3: X,
                      medic4: T,
                      medic5: H
                  };
                  V("createUnit", {
                      zakladkaType: "napadowa3",
                      unit: w,
                      vehicle: z,
                      medics: v
                  })
              } else {
                  var v = {
                      medic1: U,
                      medic2: Q,
                      medic3: X,
                      medic4: T,
                      medic5: H
                  };
                  V("editUnit", {
                      zakladkaType: "napadowa3",
                      index: m + 1,
                      unit: w,
                      vehicle: z,
                      medics: v
                  })
              }
      },
      Z = () => {
          P(!1), N(null), j(null), W(null), ce(null), te(null), B(null), Y(null)
      },
      G = (v, b) => {
          v == "unit" ? N(b) : v == "vehicle" ? j(b) : v == "medic1" && (b != "" || b != null) ? W(b) : v == "medic2" && (b != "" || b != null) ? ce(b) : v == "medic3" && (b != "" || b != null) ? te(b) : v == "medic4" && (b != "" || b != null) ? B(b) : v == "medic5" && (b != "" || b != null) && Y(b)
      },
      de = v => {
          V("updateZadaniaAkcyjna", {
              zakladkaType: "napadowa3",
              text: v
          })
      },
      je = v => {
          V("updateNotatkiAkcyjna", {
              zakladkaType: "napadowa3",
              text: v
          })
      },
      I = v => {
          V("updateRabunekAkcyjna", {
              zakladkaType: "napadowa3",
              text: v
          })
      },
      K = () => {
          for (var v = 0, b = n, be = 0; be < b.length; be++) v += b[be].medics.length;
          return v
      };
  return d(J, {
      children: [p && o(ci, {
          label: "Usun\u0105\u0107 jednostk\u0119 po\u015Bcigow\u0105?",
          text: "Czy na pewno chcesz usun\u0105\u0107 U" + (m !== null && m + 1) + "?",
          submitLabel: "Usu\u0144",
          cancelLabel: "Anuluj",
          onSubmit: O,
          onCancel: () => f(!1)
      }), L && d(J, {
          children: [o("div", {
              className: "background",
              onClick: () => Z()
          }), d("div", {
              className: "modal-container",
              children: [d("div", {
                  className: "modal-header",
                  children: [o("div", {
                      className: "modal-label",
                      children: "Informacje o jednostce po\u015Bcigowej"
                  }), o("div", {
                      className: "modal-close",
                      onClick: () => Z(),
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), d("div", {
                  className: "modal-content",
                  children: [o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic1", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic2", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic3", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic4", v.target.value)
                  }), o("input", {
                      type: "text",
                      placeholder: "Funkcjonariusz",
                      onBlur: v => G("medic5", v.target.value)
                  }), d("div", {
                      className: "napadowa3-modal",
                      children: [o("select", {
                          onChange: v => G("unit", v.target.value),
                          children: _.units.map((v, b) => o("option", {
                              value: v,
                              children: v
                          }, b))
                      }), o("select", {
                          onChange: v => G("vehicle", v.target.value),
                          children: _.vehicles.map((v, b) => o("option", {
                              value: v,
                              children: v
                          }, b))
                      })]
                  }), d("div", {
                      className: "napadowa3-modal",
                      children: [o("input", {
                          type: "text",
                          placeholder: "Notatka"
                      }), d("select", {
                          onChange: v => G("vehicle", v.target.value),
                          children: [o("option", {
                              children: "U1"
                          }), o("option", {
                              children: "U2"
                          }), o("option", {
                              children: "U3"
                          }), o("option", {
                              children: "U4"
                          }), o("option", {
                              children: "U5"
                          }), o("option", {
                              children: "U6"
                          }), o("option", {
                              children: "U7"
                          }), o("option", {
                              children: "U8"
                          }), o("option", {
                              children: "U9"
                          }), o("option", {
                              children: "U10"
                          })]
                      })]
                  })]
              }), o("div", {
                  className: "modal-footer",
                  children: o("div", {
                      className: "btn",
                      onClick: () => M(),
                      children: "Zapisz unit"
                  })
              })]
          })]
      }), o("div", {
          className: "napadowa3-container",
          children: d("div", {
              className: "napadowa3",
              children: [o(Ee, {
                  text: "Napadowa 3"
              }), d("div", {
                  className: "napadowa3-header",
                  children: [d("div", {
                      style: {
                          width: "275px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Plac\xF3wka"
                      }), o("div", {
                          className: "header-content",
                          style: {
                              backgroundColor: "#0D141F",
                              color: "rgba(255, 255, 255, 0.6)"
                          },
                          children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("input", {
                              type: "text",
                              id: "newPlacowka",
                              placeholder: "Plac\xF3wka rabunku...",
                              onBlur: v => I(v.target.value)
                          }) : o("input", {
                              type: "text",
                              id: "oldPlacowka",
                              value: g.miejsce,
                              placeholder: "Plac\xF3wka rabunku (Uzupe\u0142nia SV/NEGO)",
                              disabled: !0
                          })
                      })]
                  }), d("div", {
                      style: {
                          width: "210px"
                      },
                      children: [d("div", {
                          className: "header-title pwc",
                          children: [o("div", {
                              className: "pwc-button",
                              onClick: () => k(!0),
                              children: "Przejmij"
                          }), o("span", {
                              children: "SV"
                          }), o("div", {
                              className: "pwc-button",
                              onClick: () => k(!1),
                              children: "Zresetuj"
                          })]
                      }), o("div", {
                          className: "header-content",
                          children: r.sv != "" ? r.sv : "BRAK"
                      })]
                  }), d("div", {
                      style: {
                          width: "210px"
                      },
                      children: [d("div", {
                          className: "header-title pwc",
                          children: [o("div", {
                              className: "pwc-button",
                              onClick: () => E(!0),
                              children: "Przejmij"
                          }), o("span", {
                              children: "NEGO"
                          }), o("div", {
                              className: "pwc-button",
                              onClick: () => E(!1),
                              children: "Zresetuj"
                          })]
                      }), o("div", {
                          className: "header-content",
                          children: a.nego != "" ? a.nego : "BRAK"
                      })]
                  }), d("div", {
                      style: {
                          width: "115px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Unity"
                      }), o("div", {
                          className: "header-content",
                          children: n.length
                      })]
                  }), d("div", {
                      style: {
                          width: "115px"
                      },
                      children: [o("div", {
                          className: "header-title",
                          children: "Jednostki"
                      }), o("div", {
                          className: "header-content",
                          children: K()
                      })]
                  })]
              }), d("div", {
                  className: "napadowa3-container2",
                  children: [d("div", {
                      className: "patrols-container",
                      children: [d("header", {
                          children: [o("span", {
                              children: "Unit"
                          }), r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) && d("span", {
                              className: "refresh",
                              onClick: () => C(),
                              children: [o(ie, {
                                  icon: ui
                              }), "  Wyczy\u015B\u0107 Napadow\u0105"]
                          })]
                      }), n.map((v, b) => d("div", {
                          className: "patrol",
                          onContextMenu: () => {
                              if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
                                  f(!0), x(b);
                                  return
                              }
                          },
                          onClick: () => {
                              (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) && (x(b), P(!0))
                          },
                          children: [d("div", {
                              className: "pu-index",
                              children: ["U", b + 1]
                          }), o("div", {
                              className: "names",
                              children: v.medics.map((be, or) => o("span", {
                                  children: be.name
                              }, or))
                          }), o("div", {
                              className: "unit",
                              children: v.unit
                          }), o("div", {
                              className: "vehicle",
                              children: v.vehicle
                          }), o("div", {
                              className: "status",
                              children: o("span", {
                                  children: v.status
                              })
                          })]
                      }, b))]
                  }), d("div", {
                      className: "patrols-right",
                      children: [d("div", {
                          className: "patrols-s4",
                          children: [o("header", {
                              children: "\u017B\u0104DANIA"
                          }), o("div", {
                              className: "s4-scroll",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("textarea", {
                                  placeholder: "\u017B\u0105dania napastnik\xF3w...",
                                  id: "inputNewZadania",
                                  onBlur: v => de(v.target.value)
                              }) : o("textarea", {
                                  value: c.zadania,
                                  placeholder: "\u017B\u0105dania napastnik\xF3w (Uzupe\u0142nia SV/NEGO)",
                                  id: "inputZadania",
                                  disabled: !0
                              })
                          })]
                      }), d("div", {
                          className: "patrols-s4",
                          children: [o("header", {
                              children: "NOTATKI"
                          }), o("div", {
                              className: "s4-scroll",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("textarea", {
                                  placeholder: "Notatki na temat rabunku...",
                                  id: "inputNewNotatki",
                                  onBlur: v => je(v.target.value)
                              }) : o("textarea", {
                                  value: s.notatki,
                                  placeholder: "Notatki na temat rabunku (Uzupe\u0142nia SV/NEGO)",
                                  id: "inputNotatki",
                                  disabled: !0
                              })
                          })]
                      }), o("div", {
                          className: "patrols-self",
                          children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) || a.nego == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("div", {
                              className: "create-patrol",
                              onClick: () => {
                                  P(!0), N(_.units[0]), j(_.vehicles[0])
                              },
                              children: "Stw\xF3rz unit"
                          }) : o("div", {
                              className: "create-patrol",
                              children: "Stw\xF3rz unit (TYLKO SV/NEGO)"
                          })
                      })]
                  })]
              })]
          })
      })]
  })
};
const Q0 = () => {
      const e = it(),
          [n, t] = S.exports.useState([]),
          [r, i] = S.exports.useState({
              sv: ""
          }),
          [a, l] = S.exports.useState([]),
          [s, u] = S.exports.useState({
              zatrzymani: 0
          }),
          [c, h] = S.exports.useState({
              trasa: ""
          });
      D("setKonwojowa", I => {
          t(I)
      }), D("setStatusData", I => {
          i(I)
      }), D("setPrzydzial", I => {
          l(I)
      }), D("setKonwojowaSV", I => {
          i(I)
      }), D("setKonwojowaZatrzymani", I => {
          if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
              var K = document.getElementById("newZatrzymani"),
                  v = I.zatrzymani;
              K.value = v.toString()
          }
          u(I)
      }), D("setKonwojowaTrasa", I => {
          if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
              var K = document.getElementById("newTrasa");
              K.value = I.trasa
          }
          h(I)
      });
      const g = I => {
              let K = "";
              I && e && (K = e.badge + " " + e.firstname + " " + e.lastname), V("setNapadowaSV", {
                  zakladkaType: "konwojowa",
                  sv: K
              })
          },
          y = () => {
              V("clearNapadowa", {
                  zakladkaType: "konwojowa"
              })
          },
          k = () => {
              O != null && (C(!1), V("removeUnit", {
                  zakladkaType: "konwojowa",
                  index: O + 1
              }), p(null))
          },
          [E, C] = S.exports.useState(!1),
          [O, p] = S.exports.useState(null),
          f = di(),
          [m, x] = S.exports.useState(!1),
          [_, L] = S.exports.useState(null),
          [P, w] = S.exports.useState(null),
          [N, z] = S.exports.useState(null),
          [j, U] = S.exports.useState(null),
          [W, Q] = S.exports.useState(null),
          [ce, X] = S.exports.useState(null),
          [te, T] = S.exports.useState(null),
          B = () => {
              if (x(!1), !(!_ && !P && !N))
                  if (O === null) {
                      var I = {
                          medic1: N,
                          medic2: j,
                          medic3: W,
                          medic4: ce,
                          medic5: te
                      };
                      V("createUnit", {
                          zakladkaType: "konwojowa",
                          unit: _,
                          vehicle: P,
                          medics: I
                      })
                  } else {
                      var I = {
                          medic1: N,
                          medic2: j,
                          medic3: W,
                          medic4: ce,
                          medic5: te
                      };
                      V("editUnit", {
                          zakladkaType: "konwojowa",
                          index: O + 1,
                          unit: _,
                          vehicle: P,
                          medics: I
                      })
                  }
          },
          H = () => {
              x(!1), L(null), w(null), z(null), U(null), Q(null), X(null), T(null)
          },
          Y = (I, K) => {
              I == "unit" ? L(K) : I == "vehicle" ? w(K) : I == "medic1" && (K != "" || K != null) ? z(K) : I == "medic2" && (K != "" || K != null) ? U(K) : I == "medic3" && (K != "" || K != null) ? Q(K) : I == "medic4" && (K != "" || K != null) ? X(K) : I == "medic5" && (K != "" || K != null) && T(K)
          },
          M = I => {
              V("updateZatrzymani", {
                  text: I
              })
          },
          Z = I => {
              V("updateRabunekAkcyjna", {
                  zakladkaType: "konwojowa",
                  text: I
              })
          },
          G = () => {
              V("addSWAT")
          },
          de = I => {
              V("removePrydzial", {
                  id: I
              })
          },
          je = () => {
              for (var I = 0, K = n, v = 0; v < K.length; v++) I += K[v].medics.length;
              return I
          };
      return d(J, {
          children: [E && o(ci, {
              label: "Usun\u0105\u0107 jednostk\u0119 po\u015Bcigow\u0105?",
              text: "Czy na pewno chcesz usun\u0105\u0107 U" + (O !== null && O + 1) + "?",
              submitLabel: "Usu\u0144",
              cancelLabel: "Anuluj",
              onSubmit: k,
              onCancel: () => C(!1)
          }), m && d(J, {
              children: [o("div", {
                  className: "background",
                  onClick: () => H()
              }), d("div", {
                  className: "modal-container",
                  children: [d("div", {
                      className: "modal-header",
                      children: [o("div", {
                          className: "modal-label",
                          children: "Informacje o jednostce konwojowej"
                      }), o("div", {
                          className: "modal-close",
                          onClick: () => H(),
                          children: o(ie, {
                              icon: rn
                          })
                      })]
                  }), d("div", {
                      className: "modal-content",
                      children: [o("input", {
                          type: "text",
                          placeholder: "Funkcjonariusz",
                          onBlur: I => Y("medic1", I.target.value)
                      }), o("input", {
                          type: "text",
                          placeholder: "Funkcjonariusz",
                          onBlur: I => Y("medic2", I.target.value)
                      }), o("input", {
                          type: "text",
                          placeholder: "Funkcjonariusz",
                          onBlur: I => Y("medic3", I.target.value)
                      }), o("input", {
                          type: "text",
                          placeholder: "Funkcjonariusz",
                          onBlur: I => Y("medic4", I.target.value)
                      }), o("input", {
                          type: "text",
                          placeholder: "Funkcjonariusz",
                          onBlur: I => Y("medic5", I.target.value)
                      }), d("div", {
                          className: "konwojowa-modal",
                          children: [o("select", {
                              onChange: I => Y("unit", I.target.value),
                              children: f.units.map((I, K) => o("option", {
                                  value: I,
                                  children: I
                              }, K))
                          }), o("select", {
                              onChange: I => Y("vehicle", I.target.value),
                              children: f.vehicles.map((I, K) => o("option", {
                                  value: I,
                                  children: I
                              }, K))
                          })]
                      }), d("div", {
                          className: "konwojowa-modal",
                          children: [o("input", {
                              type: "text",
                              placeholder: "Notatka"
                          }), d("select", {
                              onChange: I => Y("vehicle", I.target.value),
                              children: [o("option", {
                                  children: "U1"
                              }), o("option", {
                                  children: "U2"
                              }), o("option", {
                                  children: "U3"
                              }), o("option", {
                                  children: "U4"
                              }), o("option", {
                                  children: "U5"
                              }), o("option", {
                                  children: "U6"
                              }), o("option", {
                                  children: "U7"
                              }), o("option", {
                                  children: "U8"
                              }), o("option", {
                                  children: "U9"
                              }), o("option", {
                                  children: "U10"
                              }), o("option", {
                                  children: "ZATRZMANY"
                              })]
                          })]
                      })]
                  }), o("div", {
                      className: "modal-footer",
                      children: o("div", {
                          className: "btn",
                          onClick: () => B(),
                          children: "Zapisz unit"
                      })
                  })]
              })]
          }), o("div", {
              className: "konwojowa-container",
              children: d("div", {
                  className: "konwojowa",
                  children: [o(Ee, {
                      text: "konwojowa"
                  }), d("div", {
                      className: "konwojowa-header",
                      children: [d("div", {
                          style: {
                              width: "225px"
                          },
                          children: [o("div", {
                              className: "header-title",
                              children: "Trasa"
                          }), o("div", {
                              className: "header-content",
                              style: {
                                  backgroundColor: "#1f0d0d",
                                  color: "rgba(255, 255, 255, 0.6)"
                              },
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("input", {
                                  className: "trasa-content",
                                  id: "newTrasa",
                                  type: "text",
                                  placeholder: "Trasa przewozu...",
                                  onBlur: I => Z(I.target.value)
                              }) : o("input", {
                                  className: "trasa-content",
                                  type: "text",
                                  placeholder: "Trasa przewozu... (SV/NEGO)",
                                  value: c.trasa,
                                  disabled: !0
                              })
                          })]
                      }), d("div", {
                          style: {
                              width: "240px"
                          },
                          children: [d("div", {
                              className: "header-title pwc",
                              children: [o("div", {
                                  className: "pwc-button",
                                  onClick: () => g(!0),
                                  children: "Przejmij"
                              }), o("span", {
                                  children: "SV"
                              }), o("div", {
                                  className: "pwc-button",
                                  onClick: () => g(!1),
                                  children: "Zresetuj"
                              })]
                          }), o("div", {
                              className: "header-content",
                              children: r.sv != "" ? r.sv : "BRAK"
                          })]
                      }), d("div", {
                          style: {
                              width: "150px"
                          },
                          children: [o("div", {
                              className: "header-title",
                              children: "Unity"
                          }), o("div", {
                              className: "header-content",
                              children: n.length
                          })]
                      }), d("div", {
                          style: {
                              width: "150px"
                          },
                          children: [o("div", {
                              className: "header-title",
                              children: "Jednostki"
                          }), o("div", {
                              className: "header-content",
                              children: je()
                          })]
                      }), d("div", {
                          style: {
                              width: "150px"
                          },
                          children: [o("div", {
                              className: "header-title",
                              children: "Zatrzymani"
                          }), o("div", {
                              className: "header-content",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("input", {
                                  className: "zatrzymani-data",
                                  id: "newZatrzymani",
                                  type: "number",
                                  placeholder: "Ilo\u015B\u0107 zatrzymanych...",
                                  onBlur: I => M(I.target.value)
                              }) : o("input", {
                                  className: "zatrzymani-data",
                                  type: "number",
                                  placeholder: "Ilo\u015B\u0107 zatrzymanych... (UZUPE\u0141NIA SV/NEGO)",
                                  value: s.zatrzymani,
                                  disabled: !0
                              })
                          })]
                      })]
                  }), d("div", {
                      className: "konwojowa-container2",
                      children: [d("div", {
                          className: "patrols-container",
                          children: [d("header", {
                              children: [o("span", {
                                  children: "Unit"
                              }), r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) && d("span", {
                                  className: "refresh",
                                  onClick: () => y(),
                                  children: [o(ie, {
                                      icon: ui
                                  }), "  Wyczy\u015B\u0107 jednostki"]
                              })]
                          }), n.map((I, K) => d("div", {
                              className: "patrol",
                              onContextMenu: () => {
                                  if (r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname)) {
                                      C(!0), p(K);
                                      return
                                  }
                              },
                              onClick: () => {
                                  r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) && (p(K), x(!0))
                              },
                              children: [d("div", {
                                  className: "pu-index",
                                  children: ["U", K + 1]
                              }), o("div", {
                                  className: "names",
                                  children: I.medics.map((v, b) => o("span", {
                                      children: v.name
                                  }, b))
                              }), o("div", {
                                  className: "unit",
                                  children: I.unit
                              }), o("div", {
                                  className: "vehicle",
                                  children: I.vehicle
                              }), o("div", {
                                  className: "status",
                                  children: o("span", {
                                      children: I.status
                                  })
                              })]
                          }, K))]
                      }), d("div", {
                          className: "patrols-right",
                          children: [d("div", {
                              className: "patrols-s4",
                              children: [d("div", {
                                  className: "patrolsprzydzial",
                                  children: [o("header", {
                                      children: "SWAT"
                                  }), o("div", {
                                      className: "przydzial-button",
                                      onClick: G,
                                      children: o(ie, {
                                          icon: N0
                                      })
                                  })]
                              }), o("div", {
                                  className: "s4-scroll",
                                  children: a.map((I, K) => o("div", {
                                      onClick: () => de(I.id),
                                      children: I.name
                                  }, K))
                              })]
                          }), o("div", {
                              className: "patrols-self",
                              children: r.sv == (e == null ? void 0 : e.badge) + " " + (e == null ? void 0 : e.firstname) + " " + (e == null ? void 0 : e.lastname) ? o("div", {
                                  className: "create-patrol",
                                  onClick: () => {
                                      x(!0), L(f.units[0]), w(f.vehicles[0])
                                  },
                                  children: "Stw\xF3rz unit"
                              }) : o("div", {
                                  className: "create-patrol",
                                  children: "Stw\xF3rz unit (TYLKO SV/NEGO)"
                              })
                          })]
                      })]
                  })]
              })
          })]
      })
  },
  K0 = () => {
      var H, Y;
      const e = Fm(),
          n = it(),
          [t, r] = S.exports.useState(null);
      S.exports.useState(!1);
      const [i, a] = S.exports.useState([]), [l, s] = S.exports.useState({
          pwc: "",
          cityStatus: {
              label: "Zielony",
              color: "#92FF3C",
              textColor: "black"
          }
      }), [u, c] = S.exports.useState([]), [h, g] = S.exports.useState("dispatch");
      D("setDispatch", M => {
          a(M)
      }), D("setStatusData", M => {
          s(M)
      }), D("setS4", M => {
          c(M)
      }), D("setCurrentPatrol", M => {
          M == null ? r(null) : r(M)
      });
      const y = M => {
              let Z = "";
              M && n && (Z = n.badge + " " + n.firstname + " " + n.lastname), V("setPWC", {
                  pwc: Z
              })
          },
          k = () => {
              V("clearDispatch", {})
          },
          E = () => {
              t != null && V("leavePatrol", {
                  index: t + 1
              })
          },
          [C, O] = S.exports.useState(!1),
          p = () => {
              O(!1)
          },
          f = M => {
              O(!1), !!M && t !== null && V("changePatrolStatus", {
                  index: t + 1,
                  status: M
              })
          },
          [m, x] = S.exports.useState(!1),
          [_, L] = S.exports.useState(null),
          P = di(),
          w = () => {
              L(null), x(!1)
          },
          N = async () => {
              const M = Number(_);
              L(null), x(!1), t !== null && await V("leavePatrol", {
                  index: t + 1
              }), V("joinPatrol", {
                  index: M + 1
              })
          }, [z, j] = S.exports.useState(!1), [U, W] = S.exports.useState(null), [Q, ce] = S.exports.useState(null), X = (M, Z) => {
              if (j(!1), !(!U && !Q)) {
                  if (t !== null && U == i[t].unit && Q == i[t].vehicle) {
                      W(null), ce(null);
                      return
                  }
                  t === null ? V("createPatrol", {
                      unit: U,
                      vehicle: Q
                  }) : V("editPatrol", {
                      index: t + 1,
                      unit: U,
                      vehicle: Q
                  })
              }
          }, te = () => {
              j(!1), W(null), ce(null)
          }, T = (M, Z) => {
              M == "unit" ? W(Z) : M == "vehicle" && ce(Z)
          }, B = M => {
              var Z = document.querySelector(".zakladka-selected");
              Z == null || Z.classList.remove("zakladka-selected");
              var G = document.querySelector("." + M);
              G == null || G.classList.add("zakladka-selected");
              var de = M;
              de == "dispatch2" ? de = "dispatch" : (de == "napadowa-1" || de == "napadowa-2" || de == "napadowa-3") && (de = de.replace("-", "")), g(de)
          };
      return d(J, {
          children: [C && o(Ks, {
              label: "Wpisz status",
              placeholder: "Podaj status...",
              submitLabel: "Potwierd\u017A",
              onCancel: p,
              onSubmit: f
          }), m && o(ci, {
              label: "Do\u0142\u0105czy\u0107 do patrolu?",
              text: "Czy na pewno chcesz do\u0142\u0105czy\u0107 do PU " + (_ !== null && _ + 1) + "?",
              submitLabel: "Do\u0142\u0105cz",
              cancelLabel: "Anuluj",
              onSubmit: N,
              onCancel: w
          }), z && d(J, {
              children: [o("div", {
                  className: "background",
                  onClick: () => te()
              }), d("div", {
                  className: "modal-container",
                  children: [d("div", {
                      className: "modal-header",
                      children: [o("div", {
                          className: "modal-label",
                          children: "Informacje o patrolu"
                      }), o("div", {
                          className: "modal-close",
                          onClick: () => te(),
                          children: o(ie, {
                              icon: rn
                          })
                      })]
                  }), o("div", {
                      className: "modal-content",
                      children: d("div", {
                          className: "dispatch-modal",
                          children: [o("select", {
                              onChange: M => T("unit", M.target.value),
                              children: P.units.map((M, Z) => o("option", {
                                  value: M,
                                  selected: t !== null && i[t].unit == M,
                                  children: M
                              }, Z))
                          }), o("select", {
                              onChange: M => T("vehicle", M.target.value),
                              children: P.vehicles.map((M, Z) => o("option", {
                                  value: M,
                                  selected: t !== null && i[t].vehicle == M,
                                  children: M
                              }, Z))
                          })]
                      })
                  }), o("div", {
                      className: "modal-footer",
                      children: o("div", {
                          className: "btn",
                          onClick: () => X(),
                          children: "Zapisz patrol"
                      })
                  })]
              })]
          }), d("div", {
              className: "buttons-zakladki",
              children: [o("button", {
                  className: "dispatch2 zakladka-selected",
                  onClick: () => B("dispatch2"),
                  children: "Dispatch"
              })]
          }), o("div", {
              style: {
                  display: h == "napadowa1" ? "block" : "none"
              },
              children: o(H0, {})
          }), o("div", {
              style: {
                  display: h == "napadowa2" ? "block" : "none"
              },
              children: o(Y0, {})
          }), o("div", {
              style: {
                  display: h == "napadowa3" ? "block" : "none"
              },
              children: o(G0, {})
          }), o("div", {
              style: {
                  display: h == "konwoj" ? "block" : "none"
              },
              children: o(Q0, {})
          }), o("div", {
              className: "dispatch-container",
              style: {
                  display: h == "dispatch" ? "block" : "none"
              },
              children: d("div", {
                  className: "dispatch",
                  children: [o(Ee, {
                      text: "Dispatch"
                  }), d("div", {
                      className: "dispatch-header",
                      children: [d("div", {
                          style: {
                              width: "10px"
                          }
                      }), d("div", {
                          style: {
                              width: "400px"
                          },
                          children: [d("div", {
                              className: "header-title pwc",
                              children: [o("div", {
                                  className: "pwc-button",
                                  onClick: () => y(!0),
                                  children: "Przejmij"
                              }), o("span", {
                                  children: "PWC"
                              }), o("div", {
                                  className: "pwc-button",
                                  onClick: () => y(!1),
                                  children: "Zresetuj"
                              })]
                          }), o("div", {
                              className: "header-content",
                              children: l.pwc
                          })]
                      }), d("div", {
                          style: {
                              width: "174px"
                          },
                          children: [o("div", {
                              className: "header-title",
                              children: "On Duty"
                          }), o("div", {
                              className: "header-content",
                              children: e.length
                          })]
                      }), d("div", {
                          style: {
                              width: "213px"
                          },
                          children: [o("div", {
                              className: "header-title",
                              children: "Patrole"
                          }), o("div", {
                              className: "header-content",
                              children: i.length
                          })]
                      })]
                  }), d("div", {
                      className: "dispatch-container2",
                      children: [d("div", {
                          className: "patrols-container",
                          children: [d("header", {
                              children: [o("span", {
                                  children: "Patrol Unit"
                              }), l.pwc == (n == null ? void 0 : n.badge) + " " + (n == null ? void 0 : n.firstname) + " " + (n == null ? void 0 : n.lastname) && d("span", {
                                  className: "refresh",
                                  onClick: () => k(),
                                  children: [o(ie, {
                                      icon: ui
                                  }), "  Wyczy\u015B\u0107 Dispatch"]
                              })]
                          }), i.map((M, Z) => d("div", {
                              className: "patrol",
                              onClick: () => {
                                  Z != t && (L(Z), x(!0))
                              },
                              children: [d("div", {
                                  className: "pu-index",
                                  children: ["PU ", Z + 1]
                              }), o("div", {
                                  className: "badges",
                                  children: M.medics.map((G, de) => o("span", {
                                      children: G.badge
                                  }, de))
                              }), o("div", {
                                  className: "names",
                                  children: M.medics.map((G, de) => d("span", {
                                      children: [G.firstname, " ", G.lastname]
                                  }, de))
                              }), o("div", {
                                  className: "unit",
                                  children: M.unit
                              }), o("div", {
                                  className: "vehicle",
                                  children: M.vehicle
                              }), o("div", {
                                  className: "status",
                                  children: o("span", {
                                      children: M.status
                                  })
                              })]
                          }, Z))]
                      }), d("div", {
                          className: "patrols-right",
                          children: [d("div", {
                              className: "patrols-s4",
                              children: [o("header", {
                                  children: "STATUS 4"
                              }), o("div", {
                                  className: "s4-scroll",
                                  children: u.map((M, Z) => d("div", {
                                      children: [M.badge, " ", M.firstname, " ", M.lastname]
                                  }, Z))
                              })]
                          }), d("div", {
                              className: "patrols-self",
                              children: [t === null && o(J, {
                                  children: o("div", {
                                      className: "create-patrol",
                                      onClick: () => {
                                          j(!0), W(P.units[0]), ce(P.vehicles[0])
                                      },
                                      children: "Stw\xF3rz patrol"
                                  })
                              }), t !== null && d(J, {
                                  children: [d("div", {
                                      className: "line",
                                      children: [o("div", {
                                          className: "btn",
                                          onClick: () => E(),
                                          children: "Opu\u015B\u0107 patrol"
                                      }), o("div", {
                                          className: "btn",
                                          onClick: () => {
                                              j(!0), W(i[t].unit), ce(i[t].vehicle)
                                          },
                                          children: "Edytuj"
                                      })]
                                  }), d("div", {
                                      className: "line",
                                      children: [o("div", {
                                          className: "patrol-data",
                                          children: (H = i[t]) == null ? void 0 : H.unit
                                      }), o("div", {
                                          className: "patrol-data",
                                          children: (Y = i[t]) == null ? void 0 : Y.vehicle
                                      })]
                                  }), o("div", {
                                      className: "line",
                                      children: o("div", {
                                          className: "status",
                                          onClick: () => O(!0),
                                          children: "Zmie\u0144 status"
                                      })
                                  })]
                              })]
                          })]
                      })]
                  })]
              })
          })]
      })
  },
  Z0 = () => {
      const e = z0(),
          [n, t] = b0(),
          [r, i] = S.exports.useState(!1),
          a = L0(),
          l = W0(),
          [s, u] = S.exports.useState("home");
      D("init", ({
          locale: p,
          tariff: f,
          units: m,
          vehicles: x
      }) => {
          a(f), l({
              units: m,
              vehicles: x
          });
          const L = n;
          for (const P in p) L[P] = p[P];
          t(L), i(!0)
      }), D("setPlayerData", p => {
          e(p)
      });
      const [c, h] = F0();
      D("setAnnoucements", p => {
          h(p)
      }), D("addAnnoucement", p => {
          const f = c;
          f.push(p), h(f)
      });
      const g = _0();
      D("setNotes", p => {
          g(p)
      });
      const [y, k] = B0();
      D("setmediclist", p => {
          k(p)
      }), r || V("uiLoaded", {});
      const E = () => {
              V("closeUI")
          },
          C = new Event("goBack"),
          O = () => {
              dispatchEvent(C)
          };
      return d("div", {
          className: "mdt-container",
          children: [d("div", {
              className: "speakers",
              children: [o("div", {
                  className: "circle"
              }), o("div", {
                  className: "rectangle"
              }), o("div", {
                  className: "circle"
              })]
          }), d("div", {
              className: "mdt-screen",
              children: [d("div", {
                  className: "mdt-topbar",
                  children: [d("div", {
                      className: "icons",
                      onClick: () => O(),
                      style: {
                          cursor: "pointer"
                      },
                      children: [o(ie, {
                          icon: S0
                      }), o("span", {
                          style: {
                              marginLeft: "10px",
                              fontSize: "12px"
                          },
                          children: "Cofnij"
                      })]
                  }), d("div", {
                      className: "href",
                      children: [d("div", {
                          style: {
                              display: "flex",
                              justifyContent: "center",
                              width: "100%"
                          },
                          children: ["www.", o("span", {
                              children: n.UI_TABLET_NAME || "Police-MDT.com"
                          }), "/", s, "/"]
                      }), o("div", {
                          className: "search-icon",
                          children: o(ie, {
                              icon: x0
                          })
                      })]
                  }), o("div", {
                      className: "icons",
                      onClick: () => E(),
                      style: {
                          cursor: "pointer"
                      },
                      children: o(ie, {
                          icon: rn
                      })
                  })]
              }), d("div", {
                  className: "mdt-page",
                  children: [o(P0, {
                      href: s,
                      setHref: u
                  }), o("div", {
                      style: {
                          display: s == "home" ? "block" : "none"
                      },
                      children: o(O0, {
                          setHref: u
                      })
                  }), o("div", {
                      style: {
                          display: s == "files" ? "block" : "none"
                      },
                      children: o(M0, {})
                  }), o("div", {
                      style: {
                          display: s == "annoucements" ? "block" : "none"
                      },
                      children: o(U0, {})
                  }), o("div", {
                      style: {
                          display: s == "mediclist" ? "block" : "none"
                      },
                      children: o(V0, {})
                  }), o("div", {
                      style: {
                          display: s == "dispatch" ? "block" : "none"
                      },
                      children: o(K0, {})
                  }), o("div", {
                      style: {
                          display: s == "notes" ? "block" : "none"
                      },
                      children: o($0, {})
                  })]
              })]
          })]
      })
  };
Ll.createRoot(document.getElementById("root")).render(o(rr.StrictMode, {
  children: o(ov, {
      children: o(yv, {
          children: o(Z0, {})
      })
  })
}));