;my.defineComponent || (my.defineComponent = Component);(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["components/basic-component/app-image/app-image"],{"281c3":function(t,n,i){"use strict";i.r(n);var r=i("cdc9"),e=i.n(r);for(var a in r)"default"!==a&&function(t){i.d(n,t,function(){return r[t]})}(a);n["default"]=e.a},"2d7a":function(t,n,i){"use strict";var r=i("3837"),e=i.n(r);e.a},3837:function(t,n,i){},aeba:function(t,n,i){"use strict";var r=function(){var t=this,n=t.$createElement;t._self._c},e=[];i.d(n,"a",function(){return r}),i.d(n,"b",function(){return e})},cdc9:function(t,n,i){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var r={name:"app-image",props:{imgSrc:String,width:String,height:String,mode:{type:String,default:function(){return"aspectFill"}},borderRadius:String},data:function(){return{is_loading:!0,is_error:!1}},computed:{appBackground:function(){return"width: ".concat(this.width,";height: ").concat(this.height,";")},imgStyle:function(){return"border-radius: ".concat(this.borderRadius)}},methods:{imgError:function(){this.is_error=!0},imgLoad:function(){this.is_loading=!1}}};n.default=r},f54c:function(t,n,i){"use strict";i.r(n);var r=i("aeba"),e=i("281c3");for(var a in e)"default"!==a&&function(t){i.d(n,t,function(){return e[t]})}(a);i("2d7a");var c=i("2877"),u=Object(c["a"])(e["default"],r["a"],r["b"],!1,null,"90a64a1e",null);n["default"]=u.exports}}]);
;(my["webpackJsonp"] = my["webpackJsonp"] || []).push([
    'components/basic-component/app-image/app-image-create-component',
    {
        'components/basic-component/app-image/app-image-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('c11b')['createComponent'](__webpack_require__("f54c"))
        })
    },
    [['components/basic-component/app-image/app-image-create-component']]
]);                
