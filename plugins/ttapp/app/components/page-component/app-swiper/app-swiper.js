(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/app-swiper/app-swiper"],{"402e":function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c},o=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return o})},"79c3":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i={name:"u-swiper",props:{list:{type:Array,default:function(){return[]}},title:{type:Boolean,default:!1},indicator:{type:Object,default:function(){return{}}},borderRadius:{type:[Number,String],default:0},interval:{type:[String,Number],default:3e3},mode:{type:String,default:"round"},height:{type:[Number,String],default:250},indicatorPos:{type:String,default:"bottomCenter"},effect3d:{type:Boolean,default:!1},effect3dPreviousMargin:{type:[Number,String],default:-10},autoplay:{type:Boolean,default:!0},duration:{type:[Number,String],default:500},circular:{type:Boolean,default:!0},imgMode:{type:String,default:"aspectFill"},name:{type:String,default:"image"},bgColor:{type:String,default:"#f3f4f6"}},watch:{list:function(t,e){t.length!==e.length&&(this.current=0)}},data:function(){return{current:0}},computed:{justifyContent:function(){return"topLeft"==this.indicatorPos||"bottomLeft"==this.indicatorPos?"flex-start":"topCenter"==this.indicatorPos||"bottomCenter"==this.indicatorPos?"center":"topRight"==this.indicatorPos||"bottomRight"==this.indicatorPos?"flex-end":void 0},titlePaddingBottom:function(){var t=0;return"none"==this.mode?"12rpx":(t=["bottomLeft","bottomCenter","bottomRight"].indexOf(this.indicatorPos)>=0&&"number"==this.mode?"60rpx":["bottomLeft","bottomCenter","bottomRight"].indexOf(this.indicatorPos)>=0&&"number"!=this.mode?"40rpx":"12rpx",t)}},methods:{listClick:function(t){this.$emit("click",t)},change:function(t){var e=t.detail.current;this.current=e,this.$emit("change",e)},animationfinish:function(t){}}};e.default=i},"8af3":function(t,e,n){"use strict";n.r(e);var i=n("402e"),o=n("a5de");for(var r in o)"default"!==r&&function(t){n.d(e,t,function(){return o[t]})}(r);n("c1f7");var a=n("2877"),u=Object(a["a"])(o["default"],i["a"],i["b"],!1,null,"5c5831ed",null);e["default"]=u.exports},a5de:function(t,e,n){"use strict";n.r(e);var i=n("79c3"),o=n.n(i);for(var r in i)"default"!==r&&function(t){n.d(e,t,function(){return i[t]})}(r);e["default"]=o.a},ac96:function(t,e,n){},c1f7:function(t,e,n){"use strict";var i=n("ac96"),o=n.n(i);o.a}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/app-swiper/app-swiper-create-component',
    {
        'components/page-component/app-swiper/app-swiper-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("8af3"))
        })
    },
    [['components/page-component/app-swiper/app-swiper-create-component']]
]);                
