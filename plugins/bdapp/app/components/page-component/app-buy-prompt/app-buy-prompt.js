(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/app-buy-prompt/app-buy-prompt"],{4448:function(t,n,a){"use strict";var u=a("8eba2"),e=a.n(u);e.a},"49f6":function(t,n,a){"use strict";a.r(n);var u=a("7d75"),e=a("905a");for(var r in e)"default"!==r&&function(t){a.d(n,t,function(){return e[t]})}(r);a("4448");var o=a("2877"),c=Object(o["a"])(e["default"],u["a"],u["b"],!1,null,"51605034",null);n["default"]=c.exports},"7d75":function(t,n,a){"use strict";var u=function(){var t=this,n=t.$createElement;t._self._c},e=[];a.d(n,"a",function(){return u}),a.d(n,"b",function(){return e})},"8eba2":function(t,n,a){},"905a":function(t,n,a){"use strict";a.r(n);var u=a("92fc"),e=a.n(u);for(var r in u)"default"!==r&&function(t){a.d(n,t,function(){return u[t]})}(r);n["default"]=e.a},"92fc":function(t,n,a){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var u={name:"app-buy-prompt",data:function(){return{buy_data:null}},created:function(){var t=this;t.$request({url:t.$api.index.buy_data}).then(function(n){0===n.code&&(t.buy_data=n.data)})},methods:{catchTouchMove:function(){return!1}}};n.default=u}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/app-buy-prompt/app-buy-prompt-create-component',
    {
        'components/page-component/app-buy-prompt/app-buy-prompt-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('5486')['createComponent'](__webpack_require__("49f6"))
        })
    },
    [['components/page-component/app-buy-prompt/app-buy-prompt-create-component']]
]);                
