(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/gift/components/receive/receive-content"],{"23f0":function(t,i,n){"use strict";n.r(i);var e=n("74af"),a=n.n(e);for(var o in e)"default"!==o&&function(t){n.d(i,t,function(){return e[t]})}(o);i["default"]=a.a},3500:function(t,i,n){"use strict";var e=function(){var t=this,i=t.$createElement,n=(t._self._c,t._f("getPicUrl")(t.is_big_gift,t.goods_info,t.cover_pic,t.big_gift_pic));t._isMounted||(t.e0=function(i){t.shareBool=!0}),t.$mp.data=Object.assign({},{$root:{f0:n}})},a=[];n.d(i,"a",function(){return e}),n.d(i,"b",function(){return a})},7378:function(t,i,n){"use strict";var e=n("d00e"),a=n.n(e);a.a},"74af":function(t,i,n){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var e=function(){return n.e("plugins/gift/components/receive/gift-over").then(n.bind(null,"5482"))},a=function(){return n.e("plugins/gift/components/receive/participant").then(n.bind(null,"e134"))},o=function(){return n.e("components/page-component/app-share-qr-code-poster/app-share-qr-code-poster").then(n.bind(null,"409e"))},s={name:"gift-content",data:function(){return{shareBool:!1,animationData1:null,animationData2:null,animationStatus:!1}},props:["theme","avatar","nickname","bless_word","is_big_gift","cover_pic","name","status","type","num","userOrder","open_type","open_status","winUser","gift_status","gift_id","win_goods_status","small","is_status","win_time","goods_info","big_gift_pic","address_status","user_id","bless_music","is_play"],methods:{share:function(){this.$emit("share")},routeGo:function(){t.navigateTo({url:"/plugins/gift/index/index"})},routeAddress:function(){for(var i=0,n=0;n<this.userOrder.length;n++)this.userOrder[n].user_id==this.user_id&&(i=this.userOrder[n].id);var e=0;"num_open"===this.type||"time_open"===this.type?e=2:"direct_open"===this.type&&(e=1),t.navigateTo({url:"/plugins/gift/address/address?status=".concat(e,"&id=").concat(i)})},play:function(){this.is_play?this.$emit("play",!1):(this.start(),this.$emit("play",!0,this.bless_music))},animationFun:function(i){if(this.animationStatus){var n=t.createAnimation({duration:1e3});n.opacity(0).scale(1.5,1.5).step(),this[i]=n.export()}},animationEnd:function(i){var n=t.createAnimation({duration:0});n.opacity(1).scale(1,1).step(),this[i]=n.export()},recodeEnd:function(){var i=t.createAnimation({duration:0});i.opacity(1).scale(1,1).step();var n=t.createAnimation({duration:0});n.opacity(1).scale(1,1).step(),this.animationData1=i.export(),this.animationData2=n.export(),this.animationStatus=!1},recodeClick:function(){var t=this;this.animationStatus=!0,this.animationFun("animationData1"),setTimeout(function(){t.animationFun("animationData2")},500),setTimeout(function(){t.animationRest()},1e3)},animationRest:function(){var t=this;this.animationEnd("animationData1"),setTimeout(function(){t.animationEnd("animationData2")},500),setTimeout(function(){t.animationStatus&&t.recodeClick()},100)},start:function(){this.recodeClick()},end:function(){this.recodeEnd()}},computed:{url:function(){return"".concat(this.$api.gift.poster,"&gift_id=").concat(this.gift_id)}},filters:{getPicUrl:function(t,i,n,e){if(0===t){var a=JSON.parse(i).goods_attr;return a.pic_url?a.pic_url:n}return e}},components:{"gift-over":e,participant:a,"app-share-qr-code-poster":o},watch:{is_play:{handler:function(t){t||this.end()}}}};i.default=s}).call(this,n("5486")["default"])},cc41:function(t,i,n){"use strict";n.r(i);var e=n("3500"),a=n("23f0");for(var o in a)"default"!==o&&function(t){n.d(i,t,function(){return a[t]})}(o);n("7378");var s=n("2877"),r=Object(s["a"])(a["default"],e["a"],e["b"],!1,null,"c97dbd7c",null);i["default"]=r.exports},d00e:function(t,i,n){}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'plugins/gift/components/receive/receive-content-create-component',
    {
        'plugins/gift/components/receive/receive-content-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('5486')['createComponent'](__webpack_require__("cc41"))
        })
    },
    [['plugins/gift/components/receive/receive-content-create-component']]
]);                
