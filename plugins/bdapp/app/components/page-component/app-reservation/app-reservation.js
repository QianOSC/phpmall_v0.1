(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/app-reservation/app-reservation"],{"0874":function(t,e,n){"use strict";n.r(e);var u=n("97f1"),o=n.n(u);for(var r in u)"default"!==r&&function(t){n.d(e,t,function(){return u[t]})}(r);e["default"]=o.a},7678:function(t,e,n){"use strict";var u=n("c607"),o=n.n(u);o.a},"8c0d":function(t,e,n){"use strict";var u=function(){var t=this,e=t.$createElement;t._self._c},o=[];n.d(e,"a",function(){return u}),n.d(e,"b",function(){return o})},"97f1":function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={name:"app-reservation",props:{buttonColor:{type:String,default:function(){return"blue"}},buyBtnStyle:{type:Number,default:function(){return 4}},buyBtnText:{type:String,default:function(){return"预约"}},customizeGoodsTag:{type:Boolean,default:function(){return!1}},fill:{type:Number,default:function(){return 0}},goodsCoverProportion:{type:String,default:function(){return"3-2"}},goodsStyle:{type:Number,default:function(){return 3}},goodsTagPicUrl:{type:String,default:function(){return"http://v4test2.zjhejiang.com/plugins/diy/assets/images/goods-tag-xp.png"}},list:{type:Array,default:function(){return[]}},listStyle:{type:Number,default:function(){return 1}},showBuyBtn:{type:Boolean,default:function(){return!0}},showGoodsName:{type:Boolean,default:function(){return!1}},showGoodsTag:{type:Boolean,default:function(){return!1}},scrollTop:{type:Number,default:function(){return 0}},value:{type:Boolean,default:function(){return!0}}},data:function(){return{height:0,request:this.value}},created:function(){var e=this;t.getSystemInfo({success:function(t){e.height=t.windowHeight}})},methods:{autoEnd:function(){var t=this;this.$lazyLoadingData("app-reservation").then(function(e){e[0].height+e[0].top<t.height&&(t.request=!1,t.$emit("input",t.request))})}},watch:{scrollTop:{handler:function(t,e){t>e&&this.request&&this.autoEnd()}}}};e.default=n}).call(this,n("5486")["default"])},"99fe":function(t,e,n){"use strict";n.r(e);var u=n("8c0d"),o=n("0874");for(var r in o)"default"!==r&&function(t){n.d(e,t,function(){return o[t]})}(r);n("7678");var a=n("2877"),i=Object(a["a"])(o["default"],u["a"],u["b"],!1,null,"64e272bc",null);e["default"]=i.exports},c607:function(t,e,n){}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/app-reservation/app-reservation-create-component',
    {
        'components/page-component/app-reservation/app-reservation-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('5486')['createComponent'](__webpack_require__("99fe"))
        })
    },
    [['components/page-component/app-reservation/app-reservation-create-component']]
]);                
