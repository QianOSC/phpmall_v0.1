(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/miaosha/advance/advance"],{"64e5":function(t,e,n){},6655:function(t,e,n){"use strict";var i=n("64e5"),r=n.n(i);r.a},6758:function(t,e,n){"use strict";n.r(e);var i=n("7dad"),r=n.n(i);for(var a in i)"default"!==a&&function(t){n.d(e,t,function(){return i[t]})}(a);e["default"]=r.a},7843:function(t,e,n){"use strict";n.r(e);var i=n("ca9d"),r=n("6758");for(var a in r)"default"!==a&&function(t){n.d(e,t,function(){return r[t]})}(a);n("6655");var s=n("2877"),o=Object(s["a"])(r["default"],i["a"],i["b"],!1,null,"c3783598",null);e["default"]=o.exports},"7dad":function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=a(n("a34a")),r=n("2f62");function a(t){return t&&t.__esModule?t:{default:t}}function s(t){return u(t)||c(t)||o()}function o(){throw new TypeError("Invalid attempt to spread non-iterable instance")}function c(t){if(Symbol.iterator in Object(t)||"[object Arguments]"===Object.prototype.toString.call(t))return Array.from(t)}function u(t){if(Array.isArray(t)){for(var e=0,n=new Array(t.length);e<t.length;e++)n[e]=t[e];return n}}function h(t,e,n,i,r,a,s){try{var o=t[a](s),c=o.value}catch(u){return void n(u)}o.done?e(c):Promise.resolve(c).then(i,r)}function l(t){return function(){var e=this,n=arguments;return new Promise(function(i,r){var a=t.apply(e,n);function s(t){h(a,i,r,s,o,"next",t)}function o(t){h(a,i,r,s,o,"throw",t)}s(void 0)})}}function p(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);e&&(i=i.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),n.push.apply(n,i)}return n}function m(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?p(n,!0).forEach(function(e){f(t,e,n[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):p(n).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))})}return t}function f(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}var d=function(){return n.e("plugins/miaosha/components/app-product-list").then(n.bind(null,"697d"))},g={name:"advance",data:function(){return{time_list:[],goods_list:[],next_time:"",page:1,active_index:null,scroll_id:"",is_estimate:0,open_time:0,type:0,page_count:1,nav_bool:!1,currentRoute:this.$platDiff.route(),time:-1,html:"",is_booking:!1,loading:!1}},computed:m({},(0,r.mapState)({tabBarNavs:function(t){return t.mallConfig.navbar.navs}}),{},(0,r.mapGetters)("iPhoneX",{BotHeight:"getBotHeight"}),{},(0,r.mapGetters)("mallConfig",{getTheme:"getTheme"}),{themeObject:function(){return{back:this.getTheme+"-m-back "+this.getTheme,backP:this.getTheme+"-m-back-p "+this.getTheme,backO:this.getTheme+"-m-back-o "+this.getTheme,theme:this.getTheme,color:this.getTheme+"-m-text "+this.getTheme,sBack:this.getTheme+"-s-back "+this.getTheme,border:this.getTheme+"-m-border "+this.getTheme}}}),onLoad:function(){var t=this;this.getTimeList().then(function(){var e=!1;t.time_list.map(function(n,i){1===n.status&&(e=!0,t.active_index=i,t.scroll_id="ms_".concat(i),n.type=1,t.getGoodsList(n))}),t.$nextTick(function(){t.loading=!0}),!1===e&&(t.active_index=0,t.time_list.length>0?(t.type=1,t.open_time=t.time_list[0].open_time,t.getGoodsList({open_time:t.open_time,type:t.type})):1===t.is_estimate&&(t.type=2,t.open_time=0,t.is_booking=!0,t.getGoodsList({open_time:t.open_time,type:t.type})))})},onShow:function(){1===this.type&&this.set_time(this.time_list[this.active_index].date_time)},onHide:function(){clearInterval(this.time)},onUnload:function(){clearInterval(this.time)},methods:{getTimeList:function(){var e=l(i.default.mark(function e(){var n,r,a,s,o;return i.default.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return t.showLoading({title:"加载中..."}),e.prev=1,e.next=4,this.$request({url:this.$api.miaosha.time_list,method:"get"});case 4:n=e.sent,0===n.code&&(r=n.data,a=r.is_estimate,s=r.list,o=r.next_miaosha_date_time,this.time_list=s,this.is_estimate=a,this.next_time=o),e.next=11;break;case 8:throw e.prev=8,e.t0=e["catch"](1),new Error(e.t0);case 11:t.hideLoading();case 12:case"end":return e.stop()}},e,this,[[1,8]])}));function n(){return e.apply(this,arguments)}return n}(),getGoodsList:function(){var t=l(i.default.mark(function t(e){var n;return i.default.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.prev=0,this.open_time=e.open_time,this.type=e.type,1===this.type?this.set_time(e.date_time):clearInterval(this.time),t.next=6,this.$request({url:this.$api.miaosha.goods,data:{open_time:e.open_time,type:e.type,page:this.page}});case 6:n=t.sent,0===n.code&&(this.goods_list=n.data.list,this.page_count=n.data.pagination.page_count),t.next=13;break;case 10:throw t.prev=10,t.t0=t["catch"](0),new Error(t.t0);case 13:case"end":return t.stop()}},t,this,[[0,10]])}));function e(e){return t.apply(this,arguments)}return e}(),activeTime:function(t,e){this.active_index=e,this.scroll_id="ms_".concat(e),this.page=1,this.getGoodsList(t),this.getTimeList(),2===t.type?this.is_booking=!0:this.is_booking=!1},scrollLower:function(){var t=l(i.default.mark(function t(){var e;return i.default.wrap(function(t){while(1)switch(t.prev=t.next){case 0:if(t.prev=0,!(this.page>=this.page_count)){t.next=3;break}return t.abrupt("return");case 3:return this.page++,t.next=6,this.$request({url:this.$api.miaosha.goods,data:{open_time:this.open_time,type:this.type,page:this.page}});case 6:e=t.sent,0===e.code&&(this.goods_list=[].concat(s(this.goods_list),s(e.data.list))),t.next=13;break;case 10:throw t.prev=10,t.t0=t["catch"](0),new Error(t.t0);case 13:case"end":return t.stop()}},t,this,[[0,10]])}));function e(){return t.apply(this,arguments)}return e}(),set_nav:function(){for(var t=this.currentRoute,e=0;e<this.tabBarNavs.length;e++)if(t.includes(this.tabBarNavs[e].url.split("?")[0]))return this.nav_bool=!0;return this.nav_bool=!1},set_time:function(t){var e=this;if(clearInterval(this.time),t){var n=new Date(t.replace(/-/g,"/")),i=n.getTime()-(new Date).getTime(),r=parseInt(i/1e3/60/60/24%30),a=parseInt(i/1e3/60/60%24),s=parseInt(i/1e3/60%60),o=parseInt(i/1e3%60);this.html=r>0?r+"天"+a+":"+(s<10?"0"+s:s)+":"+(o<10?"0"+o:o):a+":"+(s<10?"0"+s:s)+":"+(o<10?"0"+o:o),this.time=setInterval(function(){var t=n.getTime()-(new Date).getTime();t<0&&(clearInterval(e.time),e.time_list[e.active_index].status=2);var i=parseInt(t/1e3/60/60/24%30),r=parseInt(t/1e3/60/60%24),a=parseInt(t/1e3/60%60),s=parseInt(t/1e3%60);e.html=i>0?i+"天"+r+":"+(a<10?"0"+a:a)+":"+(s<10?"0"+s:s):r+":"+(a<10?"0"+a:a)+":"+(s<10?"0"+s:s)},1e3)}},router_go:function(){t.reLaunch({url:"/pages/index/index"})}},onShareAppMessage:function(){},components:{"product-list":d},watch:{tabBarNavs:{handler:function(){this.set_nav()},immediate:!0}}};e.default=g}).call(this,n("f266")["default"])},ca9d:function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c},r=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return r})}},[["b6f8","common/runtime","common/vendor"]]]);