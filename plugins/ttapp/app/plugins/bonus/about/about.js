(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/bonus/about/about"],{"0bf4":function(t,e,n){"use strict";var r=function(){var t=this,e=t.$createElement;t._self._c},o=[];n.d(e,"a",function(){return r}),n.d(e,"b",function(){return o})},"23fb":function(t,e,n){"use strict";n.r(e);var r=n("0bf4"),o=n("3425");for(var i in o)"default"!==i&&function(t){n.d(e,t,function(){return o[t]})}(i);n("c7e9");var u=n("2877"),c=Object(u["a"])(o["default"],r["a"],r["b"],!1,null,"5504bd8a",null);e["default"]=c.exports},3425:function(t,e,n){"use strict";n.r(e);var r=n("dfdc"),o=n.n(r);for(var i in r)"default"!==i&&function(t){n.d(e,t,function(){return r[t]})}(i);e["default"]=o.a},c7e9:function(t,e,n){"use strict";var r=n("ddc5"),o=n.n(r);o.a},ddc5:function(t,e,n){},dfdc:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r=n("2f62");function o(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);e&&(r=r.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),n.push.apply(n,r)}return n}function i(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?o(n,!0).forEach(function(e){u(t,e,n[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):o(n).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))})}return t}function u(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}var c={data:function(){return{loadingOver:!1,list:[]}},computed:i({},(0,r.mapState)({userInfo:function(t){return t.user.info},bonusImg:function(t){return t.mallConfig.__wxapp_img.bonus}})),methods:{getList:function(){var e=this;this.$request({url:this.$api.bonus.member}).then(function(n){e.$hideLoading(),0===n.code?(e.list=n.data.list,e.loadingOver=!0):t.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(){e.$hideLoading()})}},onLoad:function(){var t=this;t.$showLoading({type:"global",text:"加载中..."}),t.getList()}};e.default=c}).call(this,n("f266")["default"])}},[["933a","common/runtime","common/vendor"]]]);