;my.defineComponent || (my.defineComponent = Component);(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["components/page-component/app-swiper/swiper"],{"4ec4":function(t,e,n){"use strict";var i=n("9a20"),u=n.n(i);u.a},8486:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={name:"u-swiper",props:{list:{type:Array,default:function(){return[]}},imgMode:{type:String,default:"aspectFill"},name:{type:String,default:"image"},height:{type:[Number,String],default:250},duration:{type:[Number,String],default:500},interval:{type:[String,Number],default:3e3},mode:{type:String,default:"round"},indicatorPos:{type:String,default:"bottomCenter"},autoplay:{type:Boolean,default:!0}},data:function(){return{num:0,zIndex:0,showpic:null,hidepic:null,setTime:0,touchDot:0}},methods:{touchstart:function(t){this.touchDot=t.touches[0].pageX},touchend:function(t){var e=this,n=t.changedTouches[0].pageX;n-this.touchDot<=-40&&(this.num=this.num-1,this.num<0&&(this.num=this.list.length-1),setTimeout(function(){e.zIndex=e.num},1e3)),n-this.touchDot>=40&&(this.num=this.num+1,this.num>=this.list.length&&(this.num=0),setTimeout(function(){e.zIndex=e.num},1e3))}},destroyed:function(){clearInterval(this.setTime)},watch:{list:{handler:function(e){var n=this;if(0!==e.length){var i=t.createAnimation({});i.opacity(1).step({duration:this.duration}),this.showpic=i.export(),i.opacity(0).step({duration:this.duration}),this.hidepic=i.export(),this.autoplay&&(this.setTime=setInterval(function(){n.num=n.num+1,n.num>=n.list.length&&(n.num=0),setTimeout(function(){n.zIndex=n.num},n.interval+1e3)},this.interval))}},immediate:!0}}};e.default=n}).call(this,n("c11b")["default"])},"9a20":function(t,e,n){},b6b4:function(t,e,n){"use strict";n.r(e);var i=n("e831"),u=n("fbbc");for(var a in u)"default"!==a&&function(t){n.d(e,t,function(){return u[t]})}(a);n("4ec4");var o=n("2877"),r=Object(o["a"])(u["default"],i["a"],i["b"],!1,null,null,null);e["default"]=r.exports},e831:function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c},u=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return u})},fbbc:function(t,e,n){"use strict";n.r(e);var i=n("8486"),u=n.n(i);for(var a in i)"default"!==a&&function(t){n.d(e,t,function(){return i[t]})}(a);e["default"]=u.a}}]);
;(my["webpackJsonp"] = my["webpackJsonp"] || []).push([
    'components/page-component/app-swiper/swiper-create-component',
    {
        'components/page-component/app-swiper/swiper-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('c11b')['createComponent'](__webpack_require__("b6b4"))
        })
    },
    [['components/page-component/app-swiper/swiper-create-component']]
]);                
