(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/app_admin/change-add/change-add"],{"0172":function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c},r=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return r})},"0d85":function(t,e,n){},"25c3":function(t,e,n){"use strict";n.r(e);var i=n("3d92"),r=n.n(i);for(var o in i)"default"!==o&&function(t){n.d(e,t,function(){return i[t]})}(o);e["default"]=r.a},"3d92":function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=n("2f62");function r(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);e&&(i=i.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),n.push.apply(n,i)}return n}function o(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?r(n,!0).forEach(function(e){a(t,e,n[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):r(n).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))})}return t}function a(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}var c=function(){return n.e("components/page-component/app-area-picker/app-area-picker").then(n.bind(null,"8e44"))},d={data:function(){return{ids:[0],id:"",list:[],name:"",mobile:"",province_id:0,city_id:0,district_id:0,detail:"",order_no:"",province:"",city:"",district:"",order:{}}},components:{"app-area-picker":c},computed:o({},(0,i.mapState)({theme:function(t){return t.mallConfig.theme},userInfo:function(t){return t.user.info},adminImg:function(t){return t.mallConfig.__wxapp_img.app_admin}})),methods:{areaEvent:function(t){t&&(this.province=t.province.name,this.city=t.city.name,this.district=t.district.name)},getDistrict:function(){var e=this;e.$showLoading({text:"加载中..."}),e.$request({url:e.$api.default.district}).then(function(n){0==n.code?(e.list=n.data.list,e.getList()):(e.$hideLoading(),t.showToast({title:n.msg,icon:"none",duration:1e3}))}).catch(function(t){e.$hideLoading()})},getList:function(){var e=this;e.$request({url:e.$api.app_admin.order,data:{status:"-1",keyword:e.order_no},method:"post"}).then(function(n){if(e.$hideLoading(),0==n.code){if(e.order=n.data.list[0],e.name=n.data.list[0].name,e.mobile=n.data.list[0].mobile,!n.data.list[0].address)return t.setNavigationBarTitle({title:"添加收货地址"}),!1;var i=n.data.list[0].address.trim().split(" ");e.detail=i[i.length-1];var r=e.list;e.ids=[],r.forEach(function(t){if(t.name==i[0]){e.ids[0]=t.id;var n=t;n.list.forEach(function(t){if(t.name==i[1]){e.ids[1]=t.id;var n=t;n.list.forEach(function(t){t.name==i[2]&&(e.ids[2]=t.id)})}})}})}else t.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(t){e.$hideLoading()})},saveAddress:function(e){var n=this;n.province?(t.showLoading({title:"提交中..."}),n.$request({url:n.$api.app_admin.update_address,method:"POST",data:{order_id:n.order.id,name:n.name,mobile:n.mobile,province:n.province,city:n.city,district:n.district,address:n.detail}}).then(function(e){t.hideLoading(),0==e.code?(t.showToast({title:e.msg,duration:1e3,icon:"success",mask:!1}),setTimeout(function(){t.navigateBack()},500)):t.showToast({title:e.msg,icon:"none",duration:1e3})}).catch(function(e){t.hideLoading(),t.showToast({title:e,icon:"none",duration:1e3})})):t.showToast({title:"地区不能为空",icon:"none",duration:1e3})}},onLoad:function(t){var e=this;t.order_no&&(e.order_no=t.order_no,e.getDistrict())}};e.default=d}).call(this,n("c11b")["default"])},"61a9":function(t,e,n){"use strict";var i=n("0d85"),r=n.n(i);r.a},d80a:function(t,e,n){"use strict";n.r(e);var i=n("0172"),r=n("25c3");for(var o in r)"default"!==o&&function(t){n.d(e,t,function(){return r[t]})}(o);n("61a9");var a=n("2877"),c=Object(a["a"])(r["default"],i["a"],i["b"],!1,null,"46cbaa21",null);e["default"]=c.exports}},[["1633","common/runtime","common/vendor"]]]);