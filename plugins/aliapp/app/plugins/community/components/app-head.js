;my.defineComponent || (my.defineComponent = Component);(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["plugins/community/components/app-head"],{3301:function(e,t,n){},4180:function(e,t,n){"use strict";var r=n("3301"),a=n.n(r);a.a},4807:function(e,t,n){"use strict";n.r(t);var r=n("4df3"),a=n.n(r);for(var c in r)"default"!==c&&function(e){n.d(t,e,function(){return r[e]})}(c);t["default"]=a.a},"4df3":function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var r=n("2f62");function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),n.push.apply(n,r)}return n}function c(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(n,!0).forEach(function(t){u(e,t,n[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(n).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))})}return e}function u(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}var i={name:"app-head",props:{height:{type:String,default:function(){return"360rpx"}},theme:String},data:function(){return{head:""}},computed:c({},(0,r.mapState)({community:function(e){return e.mallConfig.__wxapp_img.community}})),mounted:function(){var e=this;switch(e.head=e.community.a,e.theme){case"b":e.head=e.community.b;break;case"c":e.head=e.community.c;break;case"d":e.head=e.community.d;break;case"e":e.head=e.community.e;break;case"g":e.head=e.community.g;break;case"h":e.head=e.community.h;break;case"i":e.head=e.community.i;break}}};t.default=i},"4e793":function(e,t,n){"use strict";var r=function(){var e=this,t=e.$createElement;e._self._c},a=[];n.d(t,"a",function(){return r}),n.d(t,"b",function(){return a})},d0d3:function(e,t,n){"use strict";n.r(t);var r=n("4e793"),a=n("4807");for(var c in a)"default"!==c&&function(e){n.d(t,e,function(){return a[e]})}(c);n("4180");var u=n("2877"),i=Object(u["a"])(a["default"],r["a"],r["b"],!1,null,"429376a8",null);t["default"]=i.exports}}]);
;(my["webpackJsonp"] = my["webpackJsonp"] || []).push([
    'plugins/community/components/app-head-create-component',
    {
        'plugins/community/components/app-head-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('c11b')['createComponent'](__webpack_require__("d0d3"))
        })
    },
    [['plugins/community/components/app-head-create-component']]
]);                
