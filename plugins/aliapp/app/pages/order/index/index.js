(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/order/index/index"],{"12a7":function(e,t,n){"use strict";(function(e){Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var o=n("2f62");function r(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);t&&(o=o.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),n.push.apply(n,o)}return n}function a(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?r(n,!0).forEach(function(t){i(e,t,n[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):r(n).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))})}return e}function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}var s=function(){return n.e("components/basic-component/app-tab-nav/app-tab-nav").then(n.bind(null,"7fd0"))},c=function(){return n.e("components/page-component/app-no-goods/app-no-goods").then(n.bind(null,"8112"))},d=function(){return n.e("components/page-component/app-related-suggestion-product/app-related-suggestion-product").then(n.bind(null,"1ce4"))},u=function(){return n.e("components/page-component/app-order-goods-info/app-order-goods-info").then(n.bind(null,"1602"))},l={data:function(){return{list:[{name:"全部",id:0},{name:"待付款",id:1},{name:"待发货",id:2},{name:"待收货",id:3},{name:"已完成",id:4}],page:1,currentIndex:0,orders:[],search:{keyword:"",dateArr:[]},pagination:null,qr_code_url:"",is_qrcode:!1,is_show:!1,is_load_show:!1,bgColor:"#f7f7f7",isRequest:!0,template_message:[],recommend_list:[]}},methods:{getList:function(){var t=this;this.isRequest=!1,this.$request({url:this.$api.order.list,data:{status:this.currentIndex,keyword:this.search?this.search.keyword:"",dateArr:this.search?JSON.stringify(this.search.dateArr):JSON.stringify([]),page:this.page}}).then(function(n){var o=n.code,r=n.data,a=n.msg;if(t.$hideLoading(),t.is_load_show=!1,t.is_show=!0,0===o){var i=r.list,s=r.pagination;1!==t.page?t.orders=t.orders.concat(i):t.orders=i,t.page=i.length?t.page+1:t.page,t.pagination=s,t.template_message=r.template_message}else e.showModal({title:"",content:a,showCancel:!1});t.isRequest=!0}).catch(function(){t.is_load_show=!1,t.$hideLoading()})},loadRecommend:function(){var e=this;this.$request({url:this.$api.goods.new_recommend,data:{type:"order_pay"}}).then(function(t){0===t.code&&(e.recommend_list=t.data.list)})},clickTab:function(e){this.isRequest&&(this.page=1,this.currentIndex=e.currentTarget.dataset.id,this.is_show=!1,this.$showLoading(),this.getList())},getPageUrl:function(e,t){return"community"===t?"/plugins/community/order-detail/order-detail?id=".concat(e,"&is_user=1"):5==this.currentIndex?"/pages/order/refund-detail/refund-detail?id=".concat(e,"&sign=").concat(t):"/pages/order/order-detail/order-detail?id=".concat(e,"&sign=").concat(t)},confirm:function(t){var n=this;e.showModal({title:"提示",content:"是否确认收货?",success:function(o){o.confirm&&(e.showLoading({title:"确认收货中"}),n.$request({url:n.$api.order.confirm,data:{id:t.id}}).then(function(t){e.hideLoading(),0===t.code?e.redirectTo({url:"/pages/order/index/index?status=4"}):e.showModal({title:"",content:t.msg,showCancel:!1})}).catch(function(){e.hideLoading()}))}})},cancel:function(t){var n=this;e.showModal({title:"提示",content:"是否取消订单？",success:function(o){o.confirm&&(e.showLoading({title:"取消中"}),n.$request({url:n.$api.order.cancel,data:{id:t.id}}).then(function(t){e.hideLoading(),0==t.code?e.redirectTo({url:"/pages/order/index/index?status="+n.currentIndex}):e.showModal({title:"",content:t.msg,showCancel:!1})}).catch(function(){e.hideLoading()}))}})},logistics:function(t){if(1==t.is_send&&0==t.detailExpress.length){var n=[t.id,t.express,t.express_no,t.customer_name,t.detail[0].goods_info.pic_url],o=n[0],r=n[1],a=n[2],i=n[3],s=n[4];e.navigateTo({url:"/pages/order/express-detail/express-detail?id=".concat(o,"&express=").concat(r,"&express_no=").concat(a,"&customer_name=").concat(i,"&cover_pic=").concat(s)})}else if(1==t.is_send&&1==t.detailExpress.length&&2!=t.send_type){var c=t.detailExpress[0].express,d=t.detailExpress[0].express_no,u=t.detailExpress[0].customer_name,l=t.detailExpress[0].expressRelation[0].orderDetail.goods_info.goods_attr.cover_pic;e.navigateTo({url:"/pages/order/express-detail/express-detail?express="+c+"&customer_name="+u+"&express_no="+d+"&cover_pic="+l})}else t.detailExpress.length>=1&&e.navigateTo({url:"/pages/order/express-list/express-list?order_id="+t.id})},orderPay:function(t){var n=this;n.$showLoading(),n.$request({url:n.$api.order.list_pay_data,data:{id:t.id}}).then(function(t){n.$hideLoading(),0===t.code&&n.$payment.pay(t.data.id).then(function(){e.redirectTo({url:"/pages/order/index/index?status=2"})}).catch(function(t){e.showModal({title:"",content:t.errMsg,showCancel:!1})})}).catch(function(){n.$hideLoading()})},appraise:function(t){e.navigateTo({url:"/pages/order/appraise/appraise?id=".concat(t.id)})},getClerkCode:function(t){var n=this;n.$showLoading(),n.$request({url:n.$api.order.clerk_qr_code,data:{id:t.id}}).then(function(t){n.$hideLoading(),0===t.code?(n.qr_code_url=t.data.file_path,n.is_qrcode=!0):e.showModal({title:"",content:t.msg,showCancel:!1})}).catch(function(){n.$hideLoading()})},closeQrcode:function(){this.is_qrcode=!1},toSearch:function(){e.navigateTo({url:"/pages/order/search/search"})},isShowExpressButton:function(e){if(e.is_send){if(1==e.detailExpress.length&&2==e.detailExpress[0].send_type&&0==e.send_type)return!1;if(0==e.is_confirm)return!0}return!1}},onLoad:function(t){this.currentIndex=t.status?t.status:this.currentIndex,this.loadRecommend(),e.removeStorage({key:"search"})},onReachBottom:function(){this.is_load_show=!0,this.getList()},onShow:function(){var t=this;setTimeout(function(){e.getStorage({key:"search",success:function(e){t.search=e.data;var n=setInterval(function(){t.isRequest&&(t.page=1,t.$showLoading(),t.getList(),t.$store.dispatch("gConfig/setTabBarBoolean",t.tabBarNavs.navs)),clearInterval(n)},300)},fail:function(){var e=setInterval(function(){t.isRequest&&(t.page=1,t.$showLoading(),t.getList(),t.$store.dispatch("gConfig/setTabBarBoolean",t.tabBarNavs.navs)),clearInterval(e)},300)}})},0)},computed:a({},(0,o.mapGetters)("mallConfig",{tabBarNavs:"getNavBar",getTheme:"getTheme"})),components:{"app-tab-nav":s,"app-order-goods-info":u,"app-related-suggestion-product":d,"app-no-goods":c}};t.default=l}).call(this,n("c11b")["default"])},"2f3a":function(e,t,n){},"52c4":function(e,t,n){"use strict";var o=n("2f3a"),r=n.n(o);r.a},d279:function(e,t,n){"use strict";var o=function(){var e=this,t=e.$createElement,n=(e._self._c,e.__map(e.orders,function(t,n){var o=e.getPageUrl(t.id,t.sign),r=e.isShowExpressButton(t),a=e.isShowExpressButton(t);return{$orig:e.__get_orig(t),m0:o,m1:r,m2:a}}));e.$mp.data=Object.assign({},{$root:{l0:n}})},r=[];n.d(t,"a",function(){return o}),n.d(t,"b",function(){return r})},de25:function(e,t,n){"use strict";n.r(t);var o=n("d279"),r=n("deea");for(var a in r)"default"!==a&&function(e){n.d(t,e,function(){return r[e]})}(a);n("52c4");var i=n("2877"),s=Object(i["a"])(r["default"],o["a"],o["b"],!1,null,"13c616e9",null);t["default"]=s.exports},deea:function(e,t,n){"use strict";n.r(t);var o=n("12a7"),r=n.n(o);for(var a in o)"default"!==a&&function(e){n.d(t,e,function(){return o[e]})}(a);t["default"]=r.a}},[["f918","common/runtime","common/vendor"]]]);