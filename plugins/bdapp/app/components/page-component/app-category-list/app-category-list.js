(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/app-category-list/app-category-list"],{"1adb":function(t,e,n){"use strict";var r=n("fa19"),i=n.n(r);i.a},"3b9b":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r={name:"app-category-list",props:{list:{type:Array,default:function(){return[]}},windowHeight:{type:Number,default:function(){return 0}},windowWidth:{type:Number,default:function(){return 0}},botHeight:{type:Number,default:function(){return 0}},noSetHeight:{type:String},theme:String},methods:{active:function(t,e){this.$emit("click",t,e)}},computed:{setHeight:function(){var t=0;return this.$parent.$parent.$children[0].tabbarbool&&(t=this.botHeight),this.windowHeight*(750/this.windowWidth)-t-88+"rpx"}}};e.default=r},"5d3f":function(t,e,n){"use strict";n.r(e);var r=n("9dfe"),i=n("87c7");for(var u in i)"default"!==u&&function(t){n.d(e,t,function(){return i[t]})}(u);n("1adb");var a=n("2877"),o=Object(a["a"])(i["default"],r["a"],r["b"],!1,null,null,null);e["default"]=o.exports},"87c7":function(t,e,n){"use strict";n.r(e);var r=n("3b9b"),i=n.n(r);for(var u in r)"default"!==u&&function(t){n.d(e,t,function(){return r[t]})}(u);e["default"]=i.a},"9dfe":function(t,e,n){"use strict";var r=function(){var t=this,e=t.$createElement;t._self._c},i=[];n.d(e,"a",function(){return r}),n.d(e,"b",function(){return i})},fa19:function(t,e,n){}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/app-category-list/app-category-list-create-component',
    {
        'components/page-component/app-category-list/app-category-list-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('5486')['createComponent'](__webpack_require__("5d3f"))
        })
    },
    [['components/page-component/app-category-list/app-category-list-create-component']]
]);                
