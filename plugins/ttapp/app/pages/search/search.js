(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/search/search"],{"411d":function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement;t._self._c},r=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return r})},6292:function(t,e,i){},"650b":function(t,e,i){"use strict";i.r(e);var n=i("411d"),r=i("e143");for(var o in r)"default"!==o&&function(t){i.d(e,t,function(){return r[t]})}(o);i("812f");var s=i("2877"),c=Object(s["a"])(r["default"],n["a"],n["b"],!1,null,"508515f0",null);e["default"]=c.exports},"812f":function(t,e,i){"use strict";var n=i("6292"),r=i.n(n);r.a},e143:function(t,e,i){"use strict";i.r(e);var n=i("face"),r=i.n(n);for(var o in n)"default"!==o&&function(t){i.d(e,t,function(){return n[t]})}(o);e["default"]=r.a},face:function(t,e,i){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=o(i("a34a")),r=i("2f62");function o(t){return t&&t.__esModule?t:{default:t}}function s(t){return h(t)||a(t)||c()}function c(){throw new TypeError("Invalid attempt to spread non-iterable instance")}function a(t){if(Symbol.iterator in Object(t)||"[object Arguments]"===Object.prototype.toString.call(t))return Array.from(t)}function h(t){if(Array.isArray(t)){for(var e=0,i=new Array(t.length);e<t.length;e++)i[e]=t[e];return i}}function u(t,e,i,n,r,o,s){try{var c=t[o](s),a=c.value}catch(h){return void i(h)}c.done?e(a):Promise.resolve(a).then(n,r)}function l(t){return function(){var e=this,i=arguments;return new Promise(function(n,r){var o=t.apply(e,i);function s(t){u(o,n,r,s,c,"next",t)}function c(t){u(o,n,r,s,c,"throw",t)}s(void 0)})}}function f(t,e){var i=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),i.push.apply(i,n)}return i}function d(t){for(var e=1;e<arguments.length;e++){var i=null!=arguments[e]?arguments[e]:{};e%2?f(i,!0).forEach(function(e){g(t,e,i[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(i)):f(i).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(i,e))})}return t}function g(t,e,i){return e in t?Object.defineProperty(t,e,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[e]=i,t}var m=function(){return i.e("components/page-component/u-goods-list/u-ordinary-list").then(i.bind(null,"24ba"))},p=function(){return i.e("components/page-component/app-attr/app-attr").then(i.bind(null,"d3c4"))},y=1,v=!1,b=!1,w={name:"search",components:{uOrdinaryList:m,uAttr:p},data:function(){return{hotGoodsList:[],list:[],isSearch:!1,historyList:[],keyword:"",recommend_list:[],mch_id:0,beginAfter:!0,tempList:[],realHistoryList:[],loading:!1,goodsReset:!1,attrGoods:{attrShow:0},submitUrl:"",previewUrl:""}},computed:d({},(0,r.mapGetters)("mallConfig",{getTheme:"getTheme",getSetting:"getSetting"}),{newList:function(){return this.list.length>0?this.list:this.recommend_list},sizeTransform:function(){var e=t.getSystemInfoSync().windowWidth,i=750/e,n=24/i,r=20/i,o=60/i,s=e-2*n;return{p:i,boxLeft:n,marginRight:r,btnWidth:o,listWidth:s}},themeObject:function(){return{back:this.getTheme+"-m-back "+this.getTheme,theme:this.getTheme,color:this.getTheme+"-m-text "+this.getTheme,sBack:this.getTheme+"-s-back "+this.getTheme}}},(0,r.mapState)({isListUnderlinePrice:function(t){return t.mallConfig.mall.setting.is_list_underline_price}})),onLoad:function(t){this.mch_id=t.mch_id?t.mch_id:0,y=1,v=!1,b=!1,this.historyList=this.getHistory(),this.getSelect(),this.getRecommend(),this.getHotSearch()},onReachBottom:function(){b||(this.goodsReset=!1,this.keyword&&(this.loading=!0,this.getGoodsList()))},watch:{keyword:{handler:function(t){""==t&&this.cancel()},immediate:!0}},methods:{getSelect:function(){var e=l(n.default.mark(function e(){var i,r;return n.default.wrap(function(e){while(1)switch(e.prev=e.next){case 0:i=this.historyList,i&&i.length&&(r=this,setTimeout(function(){var e=t.createSelectorQuery();e.selectAll(".once-item").fields({size:!0},function(t){r.formatData(t),r.beginAfter?r.selectLimitList(t):r.selectAllList()}).exec()},500));case 2:case"end":return e.stop()}},e,this)}));function i(){return e.apply(this,arguments)}return i}(),formatData:function(t){for(var e=this,i=e.historyList,n=e.sizeTransform,r=n.marginRight,o=n.listWidth,s=[],c=[],a=0,h=0;h<t.length;h++){var u=t[h].width+r,l=u+a;l<=o?(c.push(i[h]),a=l):0===c.length&&0===a?s.push([i[h]]):(s.push(c),a=0,c=[],h--)}c.length&&s.push(c),this.tempList=s},selectLimitList:function(t){var e=this,i=e.sizeTransform,n=i.btnWidth,r=i.listWidth,o=i.marginRight,s=JSON.parse(JSON.stringify(e.tempList)),c=[];if(s.length>2){var a=0,h=r-n-o,u=0;s[1].forEach(function(e,i){u+=t[s[0].length+i].width+o,u<=h&&(a=i+1)}),s[1].splice(a,s[1].length-a,{mark:!0}),c=[s[0],s[1]],e.beginAfter=!0}else s.forEach(function(t){return c.push(t)}),e.beginAfter=!1;e.realHistoryList=c},selectAllList:function(){var t=this.tempList,e=[];if(t&&t.length)for(var i=0;i<5&&i<t.length;i++)e.push(t[i]);this.beginAfter=!1,this.realHistoryList=e},goodsNav:function(e){t.navigateTo({url:e})},clear:function(){t.hideKeyboard(),this.keyword="",this.loading=!1},getHotSearch:function(){var t=this;1==this.getSetting.is_show_hot_goods&&this.$request({url:this.$api.goods.hot_search}).then(function(e){t.hotGoodsList=e.data.list})},cancel:function(){this.isSearch=!1,this.loading=!1,this.keyword="",this.list=[]},reset:function(){y=1,b=!1,this.goodsReset=!0,this.getGoodsList()},search:function(){var t=this.keyword;""!==t&&(this.keyword=t.trim(),this.setHistory(),this.getSelect(),this.reset())},getGoodsList:function(){var e=this;this.keyword&&(v||(v=!0,this.$request({url:this.$api.default.goods_list,data:{keyword:this.keyword,mch_id:this.mch_id,page:y}}).then(function(i){v=!1,e.isSearch=!0,e.loading=!1;var n,r=i.code,o=i.data,c=i.msg;0===r?(1===y&&(e.list=[]),o.list.length>0?((n=e.list).push.apply(n,s(o.list)),y++):(b=!0,1===y&&e.getRecommend())):t.showModal({content:c})}).catch(function(){v=!1})))},setHistory:function(){var e=this.getHistory(),i=this.keyword.trim();e.forEach(function(t,n){t.keyword===i&&e.splice(n,1)}),e.unshift({keyword:i}),e.length>20&&e.pop(),this.historyList=e,t.setStorageSync("SEARCH_HISTORY_LIST",e)},getHistory:function(){var e=t.getStorageSync("SEARCH_HISTORY_LIST");return e||(e=[]),e},deleteHistory:function(){var e=this;t.showModal({content:"确认删除全部历史记录？",success:function(i){i.confirm&&(t.removeStorageSync("SEARCH_HISTORY_LIST"),e.historyList=[])}})},historyClick:function(t){this.keyword=t.trim(),this.reset()},getRecommend:function(){var t=this;this.mch_id||this.recommend_list.length>0||this.$request({url:this.$api.goods.new_recommend,data:{goods_id:0,type:"goods"}}).then(function(e){0===e.code&&(t.recommend_list=e.data.list)})},buyProduct:function(t){var e=t.goods,i=t.attrShow;console.log(e),this.attrGoods.attrShow=i,this.attrGoods.goods=e}}};e.default=w}).call(this,i("f266")["default"])}},[["eef2","common/runtime","common/vendor"]]]);