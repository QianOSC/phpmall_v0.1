(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/bonus/cash/cash"],{"21bb":function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement;e._self._c;e._isMounted||(e.e0=function(t){e.cashTypeModel=!0},e.e1=function(t){e.warningInfo=!1})},i=[];n.d(t,"a",function(){return a}),n.d(t,"b",function(){return i})},"4e74":function(e,t,n){"use strict";(function(e){Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var a=n("2f62");function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),n.push.apply(n,a)}return n}function r(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(n,!0).forEach(function(t){o(e,t,n[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(n).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))})}return e}function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}var c=function(){return n.e("components/page-component/app-cash-model/app-cash-model").then(n.bind(null,"8637"))},u={data:function(){return{cashTypeModel:!1,visible:!1,mark_num:-1,captain:{},pay_type:{auto:!1,alipay:!1,wechat:!1,bank:!1,balance:!1},warningInfo:"",submitOver:!1,template_message:[],config:[],getMoney:null,cashType:""}},components:{appCashModel:c},computed:r({},(0,a.mapState)({mall:function(e){return e.mallConfig.mall},custom_setting:function(e){return e.mallConfig.share_setting_custom},share_setting:function(e){return e.mallConfig.share_setting}}),{cashName:function(){switch(this.cashType){case"auto":return"自动";case"wx":return"微信线下打款";case"alipay":return"支付宝线下打款";case"bank":return"银联线下打款";case"balance":return"商城余额";default:return}}}),methods:{payTypeChange:function(e){switch(this.cashType=e,e){case"auto":this.mark_num=0;break;case"wx":this.mark_num=1;break;case"alipay":this.mark_num=2;break;case"bank":this.mark_num=3;break;case"balance":this.mark_num=4;break;default:this.mark_num=-1;break}},subscribe:function(){var t=this;-1!=this.mark_num?this.$subscribe(this.template_message).then(function(e){t.submit()}).catch(function(e){t.submit()}):e.showToast({title:"请选择提现方式",icon:"none"})},submit:function(){var e=this,t={price:e.moneyInput,type:"auto"};4==e.mark_num?t.type="balance":0==e.mark_num?t.type="auto":(t.name=e.name,t.mobile=e.mobile,1==e.mark_num&&(t.type="wechat"),2==e.mark_num&&(t.type="alipay"),3==e.mark_num&&(t.type="bank",t.bank_name=e.bank_name)),e.$request({url:e.$api.bonus.cash,data:t,method:"post"}).then(function(t){e.$hideLoading(),0==t.code?e.submitOver=!0:e.warningInfo=t.msg}).catch(function(t){e.$hideLoading()})},toDetail:function(){this.submitOver=!1,e.redirectTo({url:"/plugins/bonus/cash-detail/cash-detail"})},getStatus:function(){var t=this;t.$request({url:t.$api.bonus.status}).then(function(n){t.$hideLoading(),0==n.code?t.captain=n.data.captain:e.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(e){t.$hideLoading()})},setting:function(){var t=this;t.$request({url:t.$api.bonus.setting}).then(function(n){if(t.$hideLoading(),t.getStatus(),0==n.code){t.config=n.data.list,t.template_message=n.data.list.template_message_withdraw;for(var a=0;a<t.config.pay_type.length;a++)switch(t.config.pay_type[a]){case"auto":t.pay_type.auto=!0;break;case"alipay":t.pay_type.alipay=!0;break;case"wechat":t.pay_type.wechat=!0;break;case"balance":t.pay_type.balance=!0;break;case"bank":t.pay_type.bank=!0;break}}else e.showToast({title:n.msg,icon:"none",duration:1e3})}).catch(function(e){t.$hideLoading()})}},onLoad:function(e){var t=this;e.money>0&&(t.money=e.money),t.setting()}};t.default=u}).call(this,n("5486")["default"])},5820:function(e,t,n){"use strict";var a=n("a3c5"),i=n.n(a);i.a},9549:function(e,t,n){"use strict";n.r(t);var a=n("21bb"),i=n("d925");for(var r in i)"default"!==r&&function(e){n.d(t,e,function(){return i[e]})}(r);n("5820");var o=n("2877"),c=Object(o["a"])(i["default"],a["a"],a["b"],!1,null,"7d564956",null);t["default"]=c.exports},a3c5:function(e,t,n){},d925:function(e,t,n){"use strict";n.r(t);var a=n("4e74"),i=n.n(a);for(var r in a)"default"!==r&&function(e){n.d(t,e,function(){return a[e]})}(r);t["default"]=i.a}},[["f9a3","common/runtime","common/vendor"]]]);