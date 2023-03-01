;my.defineComponent || (my.defineComponent = Component);(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/order/components/app-select"],{"477f":function(t,e,n){"use strict";n.r(e);var a=n("a716"),u=n("8b1a");for(var i in u)"default"!==i&&function(t){n.d(e,t,function(){return u[t]})}(i);n("d15a");var c=n("2877"),r=Object(c["a"])(u["default"],a["a"],a["b"],!1,null,"3cad72ae",null);e["default"]=r.exports},"8b1a":function(t,e,n){"use strict";n.r(e);var a=n("a860"),u=n.n(a);for(var i in a)"default"!==i&&function(t){n.d(e,t,function(){return a[t]})}(i);e["default"]=u.a},a716:function(t,e,n){"use strict";var a=function(){var t=this,e=t.$createElement;t._self._c},u=[];n.d(e,"a",function(){return a}),n.d(e,"b",function(){return u})},a860:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={name:"app-select",components:{},props:{list:{type:Array,default:function(){return[]}},isShow:{type:Boolean,default:!1},title:{type:String,default:""},height:{type:String,default:"440rpx"}},data:function(){return{newValue:0,value:0,indicatorStyle:"height: ".concat(Math.round(t.getSystemInfoSync().screenWidth/(750/88)),"px;")}},methods:{confirm:function(t){this.$emit("confirm",{index:this.newValue,is_modal_confirm:"close"==t})},change:function(t){this.newValue=t.detail.value[0]}}};e.default=n}).call(this,n("c11b")["default"])},c1ba:function(t,e,n){},d15a:function(t,e,n){"use strict";var a=n("c1ba"),u=n.n(a);u.a}}]);
;(my["webpackJsonp"] = my["webpackJsonp"] || []).push([
    'pages/order/components/app-select-create-component',
    {
        'pages/order/components/app-select-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('c11b')['createComponent'](__webpack_require__("477f"))
        })
    },
    [['pages/order/components/app-select-create-component']]
]);                
