(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/community/profit/profit"],{"61c6":function(t,e,n){},a1f6:function(t,e,n){"use strict";n.r(e);var i=n("f907"),a=n.n(i);for(var o in i)"default"!==o&&function(t){n.d(e,t,function(){return i[t]})}(o);e["default"]=a.a},aa44:function(t,e,n){"use strict";n.r(e);var i=n("f08b"),a=n("a1f6");for(var o in a)"default"!==o&&function(t){n.d(e,t,function(){return a[t]})}(o);n("cf5e");var r=n("2877"),s=Object(r["a"])(a["default"],i["a"],i["b"],!1,null,"5769aac4",null);e["default"]=s.exports},cf5e:function(t,e,n){"use strict";var i=n("61c6"),a=n.n(i);a.a},f08b:function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c;t._isMounted||(t.e0=function(e){t.show=!t.show},t.e1=function(e){t.show=!t.show})},a=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return a})},f907:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=n("2f62");function a(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);e&&(i=i.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),n.push.apply(n,i)}return n}function o(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?a(n,!0).forEach(function(e){r(t,e,n[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):a(n).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))})}return t}function r(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}var s=function(){return n.e("components/basic-component/app-tab-nav/app-tab-nav").then(n.bind(null,"7fd0"))},c={data:function(){return{show:!1,statics:{all_price:"",stay_price:""},tabList:[{id:1,name:"概况"},{id:2,name:"明细"}],activeTab:1,type:"",page:1,list:[],detail:[]}},components:{"app-tab-nav":s},computed:o({},(0,i.mapGetters)("mallConfig",{getTheme:"getTheme"}),{},(0,i.mapState)({stock:function(t){return t.mallConfig.__wxapp_img.stock},bonusImg:function(t){return t.mallConfig.__wxapp_img.bonus},userInfo:function(t){return t.user.info}})),onLoad:function(t){this.$showLoading({type:"global",text:"加载中..."}),this.getStatus()},onReachBottom:function(){this.page++,2==this.activeTab?this.getDetail():this.getList()},methods:{tabStatus:function(t){var e=t.currentTarget.dataset.id;this.show=!1,this.activeTab=e,this.page=1,0==this.detail.length&&this.$showLoading({type:"global",text:"加载中..."}),2==this.activeTab?this.getDetail():this.getList()},toggle:function(t){this.type=t,this.show=!1,this.page=1,this.getDetail()},getDetail:function(){var e=this;e.$request({url:e.$api.community.profit_detail,data:{type:this.type,page:this.page}}).then(function(n){t.hideLoading(),e.$hideLoading(),0==n.code?(e.statics=n.data.data,e.page>1?e.detail=e.detail.concat(n.data.list):e.detail=n.data.list):t.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(n){t.hideLoading(),e.$hideLoading()})},getList:function(){var e=this;e.$request({url:e.$api.community.profit_list,data:{page:this.page}}).then(function(n){t.hideLoading(),e.$hideLoading(),0==n.code?e.page>1?e.list=e.list.concat(n.list):e.list=n.list:t.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(n){t.hideLoading(),e.$hideLoading()})},getStatus:function(){var e=this,n=this;n.$request({url:n.$api.community.index}).then(function(n){0==n.code?(e.setting=n.data.setting,n.data.middleman.id>0?(e.middleman=n.data.middleman,e.apply_at=e.middleman.apply_at.substring(0,10),e.getList()):(t.showToast({title:"您还不是团长，现在前往申请页面",icon:"none",duration:1e3}),setTimeout(function(){t.redirectTo({url:"/plugins/community/apply/apply"})},1e3))):t.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(t){n.$hideLoading()})}}};e.default=c}).call(this,n("f266")["default"])}},[["86ae","common/runtime","common/vendor"]]]);