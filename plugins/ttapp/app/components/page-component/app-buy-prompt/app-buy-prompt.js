(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/app-buy-prompt/app-buy-prompt"],{4448:function(t,n,e){"use strict";var a=e("8eba2"),u=e.n(a);u.a},"49f6":function(t,n,e){"use strict";e.r(n);var a=e("c0ee"),u=e("905a");for(var r in u)"default"!==r&&function(t){e.d(n,t,function(){return u[t]})}(r);e("4448");var c=e("2877"),o=Object(c["a"])(u["default"],a["a"],a["b"],!1,null,"51605034",null);n["default"]=o.exports},"8eba2":function(t,n,e){},"905a":function(t,n,e){"use strict";e.r(n);var a=e("92fc"),u=e.n(a);for(var r in a)"default"!==r&&function(t){e.d(n,t,function(){return a[t]})}(r);n["default"]=u.a},"92fc":function(t,n,e){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var a={name:"app-buy-prompt",data:function(){return{buy_data:null}},created:function(){var t=this;t.$request({url:t.$api.index.buy_data}).then(function(n){0===n.code&&(t.buy_data=n.data)})},methods:{catchTouchMove:function(){return!1}}};n.default=a},c0ee:function(t,n,e){"use strict";var a=function(){var t=this,n=t.$createElement;t._self._c},u=[];e.d(n,"a",function(){return a}),e.d(n,"b",function(){return u})}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/app-buy-prompt/app-buy-prompt-create-component',
    {
        'components/page-component/app-buy-prompt/app-buy-prompt-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("49f6"))
        })
    },
    [['components/page-component/app-buy-prompt/app-buy-prompt-create-component']]
]);                
