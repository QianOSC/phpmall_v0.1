(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/index"],{8069:function(e,t,n){"use strict";n.r(t);var a=n("a094"),i=n.n(a);for(var r in a)"default"!==r&&function(e){n.d(t,e,function(){return a[e]})}(r);t["default"]=i.a},a094:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var a=r(n("a34a")),i=n("2f62");function r(e){return e&&e.__esModule?e:{default:e}}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),n.push.apply(n,a)}return n}function s(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(n,!0).forEach(function(t){p(e,t,n[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(n).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))})}return e}function p(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function u(e,t,n,a,i,r,o){try{var s=e[r](o),p=s.value}catch(u){return void n(u)}s.done?t(p):Promise.resolve(p).then(a,i)}function c(e){return function(){var t=this,n=arguments;return new Promise(function(a,i){var r=e.apply(t,n);function o(e){u(r,a,i,o,s,"next",e)}function s(e){u(r,a,i,o,s,"throw",e)}o(void 0)})}}var h=function(){return n.e("components/page-component/index/app-index").then(n.bind(null,"6f02"))},d=function(){return n.e("components/page-component/index/app-diy-page").then(n.bind(null,"6a38"))},l=function(){return n.e("components/page-component/app-buy-prompt/app-buy-prompt").then(n.bind(null,"49f6"))},g=function(){return n.e("components/page-component/app-my-app/app-my-app").then(n.bind(null,"d7d6"))},f=function(){return n.e("components/page-component/app-attr/app-attr").then(n.bind(null,"d3c4"))},m={name:"index",components:{appIndex:h,"app-diy-page":d,appBuyPrompt:l,appMyApp:g,appAttr:f},data:function(){return{homePages:[],type:"",is_storage:!1,haveBackground:!0,destroy:!0,pageHide:!1,is_required:!0,coupon_req:!1,page_id:0,attrGoods:{goods:{},attrShow:0}}},onShow:function(){this.pageHide=!1},onHide:function(){this.pageHide=!0},onLoad:function(e){var t=this;if("undefined"!==typeof e.scene&&("share"===e.scene?this.share(e):this.qrcode(e)),"undefined"!==typeof e.user_id&&this.$store.dispatch("user/setTempParentId",e.user_id),this.page_id="undefined"!==typeof e.page_id?Number(e.page_id):0,0===this.page_id){var n=this.$storage.getStorageSync("INDEX_MALL");if(n){var a=new Date(n.time.replace(/-/g,"/"));a.setMinutes(a.getMinutes()+10);var i=new Date,r=i.getTime()-a.getTime();r>=0?(this.type=n.type,this.homePages=n.home_pages,this.loadMall()):(this.type=n.type,"diy"===this.type&&(this.coupon_req=!0,this.homePages={}),this.$nextTick(function(){t.homePages=n.home_pages;var e=t;t.homePages.navs&&t.homePages.navs.length>0&&t.homePages.navs.forEach(function(t,n){t.template.data.forEach(function(t,n){if("background"===t.id)return e.haveBackground=!1,!1})})}),this.is_required=!1)}else this.loadMall()}else this.coupon_req=!0,this.loadDiy()},onPageScroll:function(e){this.$store.dispatch("page/actionSetScrollTop",e.scrollTop)},methods:{loadMall:function(){var e=c(a.default.mark(function e(){var t,n,i,r,o=this;return a.default.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return e.next=2,this.$request({url:this.$api.index.tplIndex,data:{page_id:0},method:"get"});case 2:t=e.sent,n=t.code,i=t.data,this.$hideLoading(),0===n&&(this.is_storage=!1,this.$popupAd.show=null,this.type=i.type,r=this,this.is_required=!0,"diy"===this.type&&(this.coupon_req=!0,this.homePages={}),this.$nextTick(function(){o.homePages=i.home_pages,o.homePages.navs&&r.homePages.navs.length>0&&o.homePages.navs.forEach(function(e,t){e.template.data.forEach(function(e,t){if("background"===e.id)return r.haveBackground=!1,!1})})}),this.$storage.setStorageSync("INDEX_MALL",i));case 6:case"end":return e.stop()}},e,this)}));function t(){return e.apply(this,arguments)}return t}(),loadDiy:function(){var e=c(a.default.mark(function e(){var t,n,i,r;return a.default.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return e.next=2,this.$request({url:this.$api.index.tplIndex,data:{page_id:this.page_id},method:"get"});case 2:t=e.sent,n=t.code,i=t.data,this.$hideLoading(),0===n&&(this.is_storage=!1,this.$popupAd.show=null,this.homePages=i.home_pages,this.type=i.type,r=this,this.homePages.navs&&r.homePages.navs.length>0&&this.homePages.navs.forEach(function(e,t){e.template.data.forEach(function(e,t){if("background"===e.id)return r.haveBackground=!1,!1})}));case 6:case"end":return e.stop()}},e,this)}));function t(){return e.apply(this,arguments)}return t}(),share:function(e){if("undefined"!==typeof e.params){var t=JSON.parse(e.params);this.$jump({url:t.path+"?"+this.$utils.objectToUrlParams(t),open_type:"navigate"})}},qrcode:function(e){var t=this;this.$request({url:this.$api.default.qrcode_parameter,data:{token:e.scene}}).then(function(e){if(0===e.code){t.$store.dispatch("page/actionSetQeury",null);var n=e.data.detail,a=n.data,i=n.path,r="plugin-private://wx2b03c6e691cd7370/pages/live-player-plugin"==i?"".concat(i):"/".concat(i);a&&(r+="?"+t.$utils.objectToUrlParams(a),"undefined"!==typeof a.user_id&&t.$store.dispatch("user/setTempParentId",a.user_id)),("/pages/index/index"!="/".concat(i)||"undefined"!==typeof a.page_id&&a.page_id!==t.homePages.id!==0)&&t.$jump({url:r,open_type:"navigate"})}}).catch(function(){})},buyProduct:function(e){this.attrGoods.goods=e.goods,this.attrGoods.attrShow=e.attrShow}},onShareAppMessage:function(){var e={path:"/pages/index/index",params:{}};return 0==this.page_id?(e.title=this.mall.setting.share_title?this.mall.setting.share_title:this.mall.name,e.imageUrl=this.mall.setting.share_pic):(e.title=this.homePages.title,e.params.page_id=this.page_id),this.$shareAppMessage(e)},computed:s({},(0,i.mapGetters)("mallConfig",{tabBarNavs:"getNavBar",getTheme:"getTheme"}),{},(0,i.mapState)("mallConfig",{config:function(e){return e.mall.setting},mall:function(e){return e.mall}}),{themeObject:function(){return{back:this.getTheme+"-m-back "+this.getTheme,backP:this.getTheme+"-m-back-p "+this.getTheme,backO:this.getTheme+"-m-back-o "+this.getTheme,theme:this.getTheme,color:this.getTheme+"-m-text "+this.getTheme,sBack:this.getTheme+"-s-back "+this.getTheme,border:this.getTheme+"-m-border "+this.getTheme}}})};t.default=m},ae58:function(e,t){e.exports=require("../siteinfo.js")},e03c:function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement;e._self._c},i=[];n.d(t,"a",function(){return a}),n.d(t,"b",function(){return i})},f75a:function(e,t,n){"use strict";n.r(t);var a=n("e03c"),i=n("8069");for(var r in i)"default"!==r&&function(e){n.d(t,e,function(){return i[e]})}(r);var o=n("2877"),s=Object(o["a"])(i["default"],a["a"],a["b"],!1,null,null,null);t["default"]=s.exports}},[["d537","common/runtime","common/vendor"]]]);