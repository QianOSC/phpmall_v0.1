(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["plugins/mch/mch/express/express"],{1733:function(e,t,n){"use strict";(function(e){Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var r=n("2f62");function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(n,!0).forEach(function(t){s(e,t,n[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(n).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))})}return e}function s(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}var a={data:function(){return{express:"",id:"",express_no:"",express_company:""}},computed:i({},(0,r.mapState)({userInfo:function(e){return e.user.info},adminImg:function(e){return e.mallConfig.__wxapp_img.app_admin}})),methods:{copy:function(){e.setClipboardData({data:this.express_no,success:function(){e.getClipboardData()}})}},onLoad:function(t){var n=this;n.$showLoading({type:"global",text:"加载中..."}),n.$request({url:n.$api.app_admin.express_detail,data:{id:t.id,express:t.express,customer_name:t.customer_name,express_no:t.express_no}}).then(function(r){n.$hideLoading(),0==r.code?(n.express=r.data.express,n.id=t.id,n.express_company=t.express,n.express_no=t.express_no):e.showToast({title:r.msg,icon:"none",duration:1e3})}).catch(function(t){n.$hideLoading(),e.showToast({title:t,icon:"none",duration:1e3})})}};t.default=a}).call(this,n("c11b")["default"])},"2c83":function(e,t,n){"use strict";var r=function(){var e=this,t=e.$createElement;e._self._c},o=[];n.d(t,"a",function(){return r}),n.d(t,"b",function(){return o})},9964:function(e,t,n){"use strict";n.r(t);var r=n("2c83"),o=n("d783");for(var i in o)"default"!==i&&function(e){n.d(t,e,function(){return o[e]})}(i);n("e106");var s=n("2877"),a=Object(s["a"])(o["default"],r["a"],r["b"],!1,null,"d4f2f83c",null);t["default"]=a.exports},d783:function(e,t,n){"use strict";n.r(t);var r=n("1733"),o=n.n(r);for(var i in r)"default"!==i&&function(e){n.d(t,e,function(){return r[e]})}(i);t["default"]=o.a},e106:function(e,t,n){"use strict";var r=n("f567"),o=n.n(r);o.a},f567:function(e,t,n){}},[["58ca","common/runtime","common/vendor"]]]);