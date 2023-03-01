(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/goods/app-goods-video"],{1154:function(t,e,n){},7789:function(t,e,n){"use strict";n.r(e);var i=n("95f6"),o=n.n(i);for(var a in i)"default"!==a&&function(t){n.d(e,t,function(){return i[t]})}(a);e["default"]=o.a},"911b":function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c},o=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return o})},"95f6":function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={props:{video_id:{type:Number,default:0},video_url:{type:String,default:""},play:{type:Boolean,default:!1},height:{type:String,default:""},width:{type:String,default:""}},data:function(){return{loading:!0}},methods:{videoPlay:function(){this.videoCtx=t.createVideoContext("video_".concat(this.video_id),this),this.play?this.videoCtx.play():this.videoCtx.pause()},waiting:function(){this.loading=!1},pause:function(){},setPlay:function(){this.loading=!0}},watch:{play:{handler:function(){this.videoPlay()}}},beforeDestroy:function(){this.videoCtx=null}};e.default=n}).call(this,n("f266")["default"])},"9eb5":function(t,e,n){"use strict";n.r(e);var i=n("911b"),o=n("7789");for(var a in o)"default"!==a&&function(t){n.d(e,t,function(){return o[t]})}(a);n("f071");var u=n("2877"),f=Object(u["a"])(o["default"],i["a"],i["b"],!1,null,"391c511e",null);e["default"]=f.exports},f071:function(t,e,n){"use strict";var i=n("1154"),o=n.n(i);o.a}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/goods/app-goods-video-create-component',
    {
        'components/page-component/goods/app-goods-video-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("9eb5"))
        })
    },
    [['components/page-component/goods/app-goods-video-create-component']]
]);                
