(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/app-exclusive-coupon/app-exclusive-coupon-two"],{"4c5f":function(t,e,n){"use strict";var i=n("d234"),a=n.n(i);a.a},"9b9a":function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement,n=(t._self._c,t.__map(t.coupon_list,function(e,n){var i=t.__get_style([t.couponBoxStyle(e,n)]);return{$orig:t.__get_orig(e),s0:i}}));t.$mp.data=Object.assign({},{$root:{l0:n}})},a=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return a})},"9da3":function(t,e,n){"use strict";n.r(e);var i=n("9b9a"),a=n("b35c");for(var o in a)"default"!==o&&function(t){n.d(e,t,function(){return a[t]})}(o);n("4c5f");var r=n("2877"),c=Object(r["a"])(a["default"],i["a"],i["b"],!1,null,"4aeb5e7e",null);e["default"]=c.exports},b35c:function(t,e,n){"use strict";n.r(e);var i=n("d341"),a=n.n(i);for(var o in i)"default"!==o&&function(t){n.d(e,t,function(){return i[t]})}(o);e["default"]=a.a},d234:function(t,e,n){},d341:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={name:"app-exclusive-coupon-two",props:{receiveBg:{type:String,default:function(){return""}},list:{type:Array,default:function(){return[]}},textColor:{type:String,default:function(){return"#ffffff"}},unclaimedBg:{type:String,default:function(){return""}},index:{type:Number},sign:{type:String},noneColor:{type:Boolean,default:function(){return!1}},background:String,page_id:Number,template_id:Number,is_required:Boolean,coupon_req:Boolean,couponBg:{type:String,default:"#D9BC8B"},addType:String,couponBgType:{type:String,default:function(){return"#pure"}},dIndex:{type:Array,default:function(){return[0,0]}},mIndex:{type:Array,default:function(){return[0,0]}},dType:String},data:function(){return{coupon_list:[]}},computed:{receiveTip:function(){var t="立即领取";return"integral-mall"===this.sign&&(t="立即兑换"),t},couponBgImg:function(){switch(this.coupon_list.length){case 1:return"../../../static/image/diy/bg_coupon_index_1.png";case 2:return"../../../static/image/diy/bg_coupon_index_2.png";case 3:return"../../../static/image/diy/bg_coupon_index_3.png";default:return"../../../static/image/diy/bg_coupon_index_4.png"}},couponBoxStyle:function(){var e=this;return function(n,i){var a,o,r=e.coupon_list,c=t.getSystemInfoSync().windowWidth,u=750/c;switch(r.length){case 1:a="".concat(parseInt(702/u),"px");break;case 2:a="".concat(parseInt(341/u),"px");break;case 3:a="".concat(parseInt(220/u),"px");break;default:a="".concat(parseInt(274/u),"px");break}var s={"margin-left":"".concat(20/u,"px")};return 0===i&&(s=Object.assign(s,{"margin-left":"".concat(24/u,"px")})),i===e.coupon_list.length-1&&(s=Object.assign(s,{"margin-right":"".concat(24/u,"px")})),o=n.is_receive>0?"#B4B4B4":"gradient"===e.couponBgType?"linear-gradient(to left, "+e.couponBg+","+e.$utils.colorRgba(e.couponBg,.5)+")":e.couponBg,Object.assign(s,{background:o,width:a,"min-width":r.length>3?a:"auto"})}}},methods:{flushCache:function(t){if(0==this.page_id){var e=this.$storage.getStorageSync("INDEX_MALL"),n=this.dIndex,i=this.mIndex;"module"===this.dType?e.home_pages.navs[i[0]].template.data[i[1]].data.list[n[0]].data[n[1]].data.coupon_list=t:e.home_pages.navs[n[0]].template.data[n[1]].data.coupon_list=t,this.$storage.setStorageSync("INDEX_MALL",e)}},receive:function(e){var n=this,i=this.coupon_list;if("integral-mall"!=this.sign){if(1==i[e].is_receive)return t.showToast({mask:!0,title:"已领取",icon:"none"}),!0;t.showLoading({mask:!0,title:"领取中"}),this.$request({url:this.$api.coupon.receive,data:{coupon_id:i[e].id}}).then(function(i){if(t.hideLoading(),0===i.code){0==i.data.rest&&(n.coupon_list[e].is_receive="1");var a=n.coupon_list;n.flushCache(a),n.$store.dispatch("page/actionSetCoupon",{list:[Object.assign(a[e],i.data)],type:"receive"})}else t.showToast({title:i.msg,icon:"none"})}).catch(function(){t.hideLoading()})}else this.$jump({url:i[e].page_url,open_type:"navigate"})},loadData:function(){var t=this;this.$request({url:this.$api.index.extra,data:{type:"mall",key:"coupon",page_id:this.page_id,index:this.index}}).then(function(e){if(t.coupon_list=e.data,0===t.page_id){var n=t.$storage.getStorageSync("INDEX_MALL");n.home_pages[t.index].list=t.coupon_list,t.$storage.setStorageSync("INDEX_MALL",n)}})}},mounted:function(){if(this.coupon_req)this.coupon_list=this.list;else if(this.is_required)this.loadData();else{var t=this.$storage.getStorageSync("INDEX_MALL");this.coupon_list=t.home_pages[this.index].list}}};e.default=n}).call(this,n("5486")["default"])}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/app-exclusive-coupon/app-exclusive-coupon-two-create-component',
    {
        'components/page-component/app-exclusive-coupon/app-exclusive-coupon-two-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('5486')['createComponent'](__webpack_require__("9da3"))
        })
    },
    [['components/page-component/app-exclusive-coupon/app-exclusive-coupon-two-create-component']]
]);                
