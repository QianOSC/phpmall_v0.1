(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/community/apply/apply"],{"1d8f":function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var n,a=r(e("a34a")),o=e("2f62");function r(t){return t&&t.__esModule?t:{default:t}}function s(t,i,e,n,a,o,r){try{var s=t[o](r),c=s.value}catch(d){return void e(d)}s.done?i(c):Promise.resolve(c).then(n,a)}function c(t){return function(){var i=this,e=arguments;return new Promise(function(n,a){var o=t.apply(i,e);function r(t){s(o,n,a,r,c,"next",t)}function c(t){s(o,n,a,r,c,"throw",t)}r(void 0)})}}function d(t,i){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);i&&(n=n.filter(function(i){return Object.getOwnPropertyDescriptor(t,i).enumerable})),e.push.apply(e,n)}return e}function u(t){for(var i=1;i<arguments.length;i++){var e=null!=arguments[i]?arguments[i]:{};i%2?d(e,!0).forEach(function(i){m(t,i,e[i])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(e)):d(e).forEach(function(i){Object.defineProperty(t,i,Object.getOwnPropertyDescriptor(e,i))})}return t}function m(t,i,e){return i in t?Object.defineProperty(t,i,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[i]=e,t}var f=function(){return e.e("components/page-component/app-area-picker/app-area-picker").then(e.bind(null,"8e44"))},l=function(){return e.e("plugins/community/components/app-head").then(e.bind(null,"d0d3"))},p=function(){return e.e("components/basic-component/app-textarea/app-textarea").then(e.bind(null,"47cb"))},h={data:function(){return{wait:!1,middleman:{status:99},id:null,form:{location:"",latitude:"",longitude:"",name:"",mobile:"",province_id:0,city_id:0,district_id:0,detail:""},location:"",setting:{middleman:""},is_refund_address:0,detail_url:"",list:[],submit_status:!1,automatic:"",province:[],focus:!1,address:!1}},computed:u({},(0,o.mapGetters)("mallConfig",{getTheme:"getTheme"}),{},(0,o.mapState)({community:function(t){return t.mallConfig.__wxapp_img.community},bonusImg:function(t){return t.mallConfig.__wxapp_img.bonus}})),components:{appAreaPicker:f,appTextArea:p,appHead:l},onLoad:function(t){t.id>0&&(this.address=!0),this.getPlace(),this.getStatus()},methods:(n={areaEvent:function(t){t&&(this.form.province_id=t.province.id,this.form.city_id=t.city.id,this.form.district_id=t.district.id)},toCommunity:function(){t.navigateTo({url:"/plugins/community/index/index"})},toIndex:function(){t.navigateTo({url:"/pages/index/index"})},reApply:function(){var t=this;t.middleman.status=-2},middlemanPay:function(){var i=this;if(i.id>0)return i.pay(i.id),!1;i.$request({url:i.$api.community.apply_pay,data:{id:i.middleman.id}}).then(function(e){0==e.code?i.pay(e.data.id):t.showToast({title:e.msg,icon:"none",duration:1e3})}).catch(function(t){i.$hideLoading()})},getStatus:function(){var i=this;i.$request({url:i.$api.community.index}).then(function(e){i.$hideLoading(),0==e.code?(i.setting=e.data.setting,t.setNavigationBarTitle({title:"申请"+i.setting.middleman}),e.data.middleman.id>0?(i.middleman=e.data.middleman,i.address&&(i.middleman.status=-2,i.form=e.data.middleman,i.form.province==i.form.city?i.location=i.form.province+" "+i.form.district+" "+i.form.location:i.location=i.form.province+" "+i.form.city+" "+i.form.district+" "+i.form.location,t.setNavigationBarTitle({title:"填写"+i.setting.middleman+"信息"}))):i.middleman.status=-2):t.showToast({title:e.msg,icon:"none",duration:1e3})}).catch(function(){i.$hideLoading()})},getPlace:function(){var i=this;i.$request({url:i.$api.city.cityName}).then(function(e){0===e.code?i.province=e.data.list:t.showToast({title:e.msg,icon:"none",duration:1e3})})},getInfo:function(i){var e=this;this.$request({url:this.$api.user.wechat_district,data:{province_name:i.address[0],city_name:i.address[1],county_name:i.address[2]}}).then(function(t){if(0===t.code){var n=t.data.district,a=n.province,o=n.city,r=n.district;i.province_id=a.id,i.city_id=o.id,i.district_id=r.id,e.form=i}}).catch(function(){t.showToast({title:"网络异常",icon:"none"})})}},m(n,"areaEvent",function(t){t&&(this.form.province_id=t.province.id,this.form.city_id=t.city.id,this.form.district_id=t.district.id,this.list=[t.province.name,t.city.name,t.district.name])}),m(n,"saveAddress",function(){var i=this;return this.form.detail&&this.form.province_id&&this.form.city_id&&this.form.district_id?void i.$request({url:i.$api.community.edit_address,data:{detail:i.form.detail},method:"post"}).then(function(i){t.showToast({title:i.msg,icon:"none",duration:1e3}),0==i.code&&setTimeout(function(){t.navigateBack({})},1e3)}).catch(function(t){i.$hideLoading()}):(t.showToast({title:"提货地址不能为空",icon:"none"}),!1)}),m(n,"submit",function(){var i=c(a.default.mark(function i(){var e,n,o,r,s,c,d,u,m,f,l;return a.default.wrap(function(i){while(1)switch(i.prev=i.next){case 0:if(i.prev=0,!this.submit_status){i.next=3;break}return i.abrupt("return");case 3:if(this.form.detail||(e="提货地址不能为空"),this.form.location||(e="所在地区不能为空"),this.form.mobile||(e="手机号不能为空"),this.form.name||(e="姓名不能为空"),!e){i.next=10;break}return t.showToast({title:e,icon:"none"}),i.abrupt("return");case 10:return this.submit_status=!0,n=this.$api.community.apply,o=this.form,this.is_refund_address>0&&(n=this.$api.app_admin.refund_address_edit,r=this.form,s=r.id,c=r.name,d=r.mobile,u=r.detail,o={form:JSON.stringify({id:s,name:c,mobile:d,address_detail:u,address:this.list,is_default:0,remark:""})}),i.next=16,this.$request({url:n,data:o,method:"POST"});case 16:m=i.sent,this.submit_status=!1,0===m.code?(f=m.data.queue_id,l=m.data.token,this.getResult(f,l)):t.showToast({title:m.msg,icon:"none"}),i.next=25;break;case 21:throw i.prev=21,i.t0=i["catch"](0),this.submit_status=!1,new Error(i.t0);case 25:case"end":return i.stop()}},i,this,[[0,21]])}));function e(){return i.apply(this,arguments)}return e}()),m(n,"getResult",function(i,e){var n=this;this.$request({url:this.$api.community.apply_result,data:{queue_id:i,token:e}}).then(function(a){0===a.code?a.data.retry&&1===a.data.retry?n.getPayDataTimer=setTimeout(function(){n.getResult(i,e)},1e3):(t.hideLoading(),a.data.id>0&&(n.id=a.data.id),n.getStatus()):(n.exchangeCoupon=!1,t.hideLoading(),t.showModal({title:"提示",content:a.msg,showCancel:!1}))}).catch(function(i){n.exchangeCoupon=!1,t.hideLoading(),t.showModal({title:"提示",content:i.errMsg,showCancel:!1})})}),m(n,"pay",function(i){var e=this;this.$payment.pay(i).then(function(t){e.getStatus()}).catch(function(){t.showToast({title:"支付失败",icon:"none",duration:1e3})})}),m(n,"detailFocus",function(){this.focus=!0}),n)};i.default=h}).call(this,e("f266")["default"])},"216d":function(t,i,e){"use strict";var n=function(){var t=this,i=t.$createElement;t._self._c;t._isMounted||(t.e0=function(i){t.focus=!1})},a=[];e.d(i,"a",function(){return n}),e.d(i,"b",function(){return a})},2461:function(t,i,e){"use strict";e.r(i);var n=e("216d"),a=e("51b6");for(var o in a)"default"!==o&&function(t){e.d(i,t,function(){return a[t]})}(o);e("dab08");var r=e("2877"),s=Object(r["a"])(a["default"],n["a"],n["b"],!1,null,"24e84671",null);i["default"]=s.exports},"51b6":function(t,i,e){"use strict";e.r(i);var n=e("1d8f"),a=e.n(n);for(var o in n)"default"!==o&&function(t){e.d(i,t,function(){return n[t]})}(o);i["default"]=a.a},"836a":function(t,i,e){},dab08:function(t,i,e){"use strict";var n=e("836a"),a=e.n(n);a.a}},[["c031","common/runtime","common/vendor"]]]);