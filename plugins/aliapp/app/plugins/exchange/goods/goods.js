(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["plugins/exchange/goods/goods"],{"449f":function(e,t,o){"use strict";(function(e){Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var n=s(o("a34a")),i=o("2f62");function s(e){return e&&e.__esModule?e:{default:e}}function r(e,t,o,n,i,s,r){try{var a=e[s](r),c=a.value}catch(u){return void o(u)}a.done?t(c):Promise.resolve(c).then(n,i)}function a(e){return function(){var t=this,o=arguments;return new Promise(function(n,i){var s=e.apply(t,o);function a(e){r(s,n,i,a,c,"next",e)}function c(e){r(s,n,i,a,c,"throw",e)}a(void 0)})}}function c(e,t){var o=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),o.push.apply(o,n)}return o}function u(e){for(var t=1;t<arguments.length;t++){var o=null!=arguments[t]?arguments[t]:{};t%2?c(o,!0).forEach(function(t){d(e,t,o[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(o)):c(o).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(o,t))})}return e}function d(e,t,o){return t in e?Object.defineProperty(e,t,{value:o,enumerable:!0,configurable:!0,writable:!0}):e[t]=o,e}var p=function(){return o.e("components/page-component/goods/app-goods-banner").then(o.bind(null,"12b6"))},l=function(){return o.e("components/page-component/goods/app-goods-full-reduce").then(o.bind(null,"6132"))},g=function(){return o.e("components/basic-component/app-close/app-close").then(o.bind(null,"f0dd"))},h=function(){return o.e("components/page-component/goods/bd-info").then(o.bind(null,"0e01"))},f=function(){return Promise.all([o.e("common/vendor"),o.e("components/page-component/goods/bd-coupon")]).then(o.bind(null,"11b2"))},_=function(){return o.e("components/page-component/goods/bd-xbc").then(o.bind(null,"8639"))},m=function(){return o.e("components/page-component/goods/bd-kb").then(o.bind(null,"4c29"))},b=function(){return o.e("components/page-component/goods/bd-hc").then(o.bind(null,"de37"))},v=function(){return o.e("components/page-component/goods/bd-detail").then(o.bind(null,"3e70"))},w=function(){return o.e("components/page-component/goods/bd-comments").then(o.bind(null,"9470"))},x={name:"goods",data:function(){return{showClose:!1,is_open:!1,goods:{},posterConfig:this.$api.exchange.poster_config,posterGenerate:this.$api.exchange.poster_generate,url:"",is_vip:!1,is_vip_card_user:0,show:!1,list:[],goods_id:-1,loading:!1,first:!0,discount:null,flash_sale:null,full_reduce:null}},onLoad:function(e){var t=this;this.goods_id=e.goods_id,this.posterConfig=this.posterConfig+"&goods_id="+this.goods_id,this.posterGenerate=this.posterGenerate+"&goods_id="+this.goods_id,this.$showLoading({type:"global",text:"加载中..."}),this.request({url:this.$api.exchange.detail,data:{id:this.goods_id}}).then(function(e){if(e){t.first=!1;var o=e.goods;t.goods=o,t.loading=!0,t.url="".concat(t.$api.goods.poster,"&goods_id=").concat(t.goods.id),t.goods.vip_card_appoint.discount&&(t.is_vip=!0,t.discount=t.goods.vip_card_appoint.discount),t.full_reduce=o.goods_activity.full_reduce,t.flash_sale=t.goods.plugin_extra.flash_sale,t.is_vip_card_user=t.goods.vip_card_appoint.is_vip_card_user,t.$hideLoading()}})},onShow:function(){var e=this;if(this.showClose=!1,setTimeout(function(){e.showClose=!0}),this.first)return!1;this.$showLoading(),this.$nextTick(function(){e.request({url:e.$api.exchange.detail,data:{id:e.goods_id}}).then(function(t){var o=t.goods;e.goods=o,e.loading=!0,e.full_reduce=o.goods_activity.full_reduce,e.url="".concat(e.$api.goods.poster,"&goods_id=").concat(e.goods.id),e.goods.vip_card_appoint.discount&&(e.is_vip=!0,e.discount=e.goods.vip_card_appoint.discount),e.flash_sale=e.goods.plugin_extra.flash_sale,e.is_vip_card_user=e.goods.vip_card_appoint.is_vip_card_user,e.$hideLoading()})})},computed:u({},(0,i.mapState)("gConfig",{iphone:function(e){return e.iphone},iphoneHeight:function(e){return e.iphoneHeight}}),{},(0,i.mapGetters)("mallConfig",{getTheme:"getTheme"}),{},(0,i.mapState)({mall:function(e){return e.mallConfig.mall},userInfo:function(e){return e.user.info}}),{themeObject:function(){return{back:this.getTheme+"-m-back "+this.getTheme,backO:this.getTheme+"-m-back-o "+this.getTheme,theme:this.getTheme,color:this.getTheme+"-m-text "+this.getTheme,sBack:this.getTheme+"-s-back "+this.getTheme}}}),onShareAppMessage:function(){return this.$shareAppMessage({path:"/plugins/exchange/goods/goods",title:this.goods.app_share_title?this.goods.app_share_title:this.goods.name,imageUrl:this.goods.app_share_pic?this.goods.app_share_pic:"",params:{goods_id:this.goods.id}})},methods:{getMall:function(e){this.is_open=1==e.is_open},toExchange:function(){var t=[];for(var o in this.goods.attr[0].attr_list)t.push({attr_id:this.goods.attr[0].attr_list[o].attr_id,attr_group_id:this.goods.attr[0].attr_list[o].attr_group_id});var n=[{mch_id:0,goods_list:[{id:this.goods.id,attr:t,num:1,cat_id:0,goods_attr_id:this.goods.attr[0].id}]}],i="/pages/order-submit/order-submit?mch_list=".concat(JSON.stringify(n));i+="&preview_url=".concat(encodeURIComponent(this.$api.exchange.order_preview),"&submit_url=").concat(encodeURIComponent(this.$api.exchange.order_submit),"&plugin=exchange"),e.navigateTo({url:i})},request:function(){var t=a(n.default.mark(function t(o){var i,s,r;return n.default.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return i=o.url,s=o.data,t.next=3,this.$request({url:i,data:s});case 3:if(r=t.sent,0!==r.code){t.next=8;break}return t.abrupt("return",r.data);case 8:e.showModal({title:"提示",content:r.msg,showCancel:!1,success:function(t){e.navigateBack()}});case 9:case"end":return t.stop()}},t,this)}));function o(e){return t.apply(this,arguments)}return o}(),setCoupon:function(e){this.$set(this.goods.goods_coupon_center[e],"is_receive",1)}},components:{"app-banner":p,appClose:g,appGoodsFullReduce:l,bdInfo:h,bdCoupon:f,bdXbc:_,bdKb:m,bdHc:b,bdDetail:v,bdComments:w}};t.default=x}).call(this,o("c11b")["default"])},4588:function(e,t,o){"use strict";var n=o("b2f7"),i=o.n(n);i.a},"99ad":function(e,t,o){"use strict";o.r(t);var n=o("449f"),i=o.n(n);for(var s in n)"default"!==s&&function(e){o.d(t,e,function(){return n[e]})}(s);t["default"]=i.a},a976:function(e,t,o){"use strict";o.r(t);var n=o("b5e8"),i=o("99ad");for(var s in i)"default"!==s&&function(e){o.d(t,e,function(){return i[e]})}(s);o("4588");var r=o("2877"),a=Object(r["a"])(i["default"],n["a"],n["b"],!1,null,null,null);t["default"]=a.exports},ae58:function(e,t){e.exports=require("../siteinfo.js")},b2f7:function(e,t,o){},b5e8:function(e,t,o){"use strict";var n=function(){var e=this,t=e.$createElement;e._self._c},i=[];o.d(t,"a",function(){return n}),o.d(t,"b",function(){return i})}},[["dfea","common/runtime","common/vendor"]]]);