(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/community/detail/detail"],{"0a67":function(t,e,i){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=i("2f62");function o(t,e){var i=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),i.push.apply(i,n)}return i}function r(t){for(var e=1;e<arguments.length;e++){var i=null!=arguments[e]?arguments[e]:{};e%2?o(i,!0).forEach(function(e){a(t,e,i[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(i)):o(i).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(i,e))})}return t}function a(t,e,i){return e in t?Object.defineProperty(t,e,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[e]=i,t}var s=function(){return i.e("components/page-component/app-share-qr-code-poster/app-share-qr-code-poster").then(i.bind(null,"409e"))},c={data:function(){return{timeInterval:null,showShare:!1,id:0,middleman_id:0,list:[],order:[],status_text:"",activity:{},d:"",h:"",m:"",themeColor:"#ff4544",setting:{}}},components:{appShareQrCode:s},computed:r({},(0,n.mapGetters)("mallConfig",{getTheme:"getTheme"}),{},(0,n.mapState)({stock:function(t){return t.mallConfig.__wxapp_img.stock},appSetting:function(t){return t.mallConfig.mall.setting},appImg:function(t){return t.mallConfig.__wxapp_img.mall},bonusImg:function(t){return t.mallConfig.__wxapp_img.bonus}})),onLoad:function(t){var e=this;e.id=t.id,e.middleman_id=t.middleman_id,e.$showLoading({type:"global",text:"加载中..."}),e.getSetting(),setTimeout(function(){switch(e.getTheme){case"b":e.themeColor="#fcc600";break;case"c":e.themeColor="#ff547b";break;case"d":e.themeColor="#ddb766";break;case"e":e.themeColor="#7783ea";break;case"g":e.themeColor="#63be72";break;case"h":e.themeColor="#4a90e2";break;case"i":e.themeColor="#333333";break}},0)},onShareAppMessage:function(){return this.$shareAppMessage({title:this.setting.app_share_title?this.setting.app_share_title:this.$children[0].navigationBarTitle,imageUrl:this.setting.app_share_pic?this.setting.app_share_pic:this.list[0].cover_pic,path:"/plugins/community/activity/activity",params:{id:this.id}})},onHide:function(){clearInterval(this.timeInterval)},onUnload:function(){clearInterval(this.timeInterval)},methods:{copy:function(){var e,i=this,n="";if(0===i.order.length)return t.showToast({title:"暂无订单，复制接龙文本失败",duration:1e3,icon:"none"}),!1;for(var o=0;o<i.order.length;o++)for(var r in e=o+1,e>1&&(n+="\n\n"),e<10?n+="【00"+e+"】\n":e<100?n+="【0"+e+"】\n":e<1e3&&(n+="【"+e+"】\n"),n+="用户昵称："+i.order[o].name+"\n商品名称：",i.order[o].list){for(var a in r>0&&(n+="、"),n+=i.order[o].list[r].goods+"（",i.order[o].list[r].attr)a>0&&(n+="/"),n+=i.order[o].list[r].attr[a].attr_name;n+="） x"+i.order[o].list[r].num}t.setClipboardData({data:n,success:function(){t.hideToast(),t.getClipboardData({success:function(){t.showToast({title:"复制成功",duration:1e3})}})}})},switchGood:function(e){var i=this;i.$request({url:i.$api.community.switch,data:{activity_id:i.id,goods_id:e.id},method:"post"}).then(function(e){t.hideLoading(),t.showToast({title:e.msg,icon:"none",duration:1e3})})},toOrder:function(){t.redirectTo({url:"/plugins/community/order/order?keyword="+this.activity.title})},toRecord:function(){t.navigateTo({url:"/plugins/community/record/record?id="+this.id})},getTime:function(t){t>86399?(this.d=Math.floor(t/86400),t-=86400*this.d):this.d=0,t>3599?(this.h=Math.floor(t/3600),t-=3600*this.h):this.h=0,t>59?(this.m=Math.floor(t/60),t-=60*this.m):this.m=0},getSetting:function(){var e=this;e.$request({url:e.$api.community.setting}).then(function(i){0===i.code?(e.setting=i.data,e.getList()):t.showToast({title:i.msg,icon:"none",duration:1e3})}).catch(function(){e.$hideLoading()})},getOrder:function(){var t=this,e=this;e.$request({url:e.$api.community.middle_list,data:{status:0,keyword:e.activity.title,is_pagination:2}}).then(function(e){t.order=e.data.list})},getList:function(){var e=this;e.$request({url:e.$api.community.activity_detail,data:{id:e.id},method:"post"}).then(function(i){if(t.hideLoading(),e.$hideLoading(),0===i.code){for(var n in e.activity=i.data.activity,e.list=i.data.list,e.list)e.list[n].check=!0;if(0==e.activity.activity_status){var o=e.activity.time-1;e.timeInterval=setInterval(function(){e.getTime(o),o--,0==o&&(clearInterval(e.timeInterval),e.getList())},1e3)}else e.status_text=e.activity.end_at.slice(5)+"结束",e.getOrder()}else t.showToast({title:i.msg,icon:"none",duration:1e3})}).catch(function(){t.hideLoading(),e.$hideLoading()})}}};e.default=c}).call(this,i("f266")["default"])},"145b":function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement;t._self._c;t._isMounted||(t.e0=function(e){t.showShare=!0})},o=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return o})},4243:function(t,e,i){},"4d92a":function(t,e,i){"use strict";i.r(e);var n=i("0a67"),o=i.n(n);for(var r in n)"default"!==r&&function(t){i.d(e,t,function(){return n[t]})}(r);e["default"]=o.a},"92cb":function(t,e,i){"use strict";i.r(e);var n=i("145b"),o=i("4d92a");for(var r in o)"default"!==r&&function(t){i.d(e,t,function(){return o[t]})}(r);i("9f8f");var a=i("2877"),s=Object(a["a"])(o["default"],n["a"],n["b"],!1,null,"1ed40206",null);e["default"]=s.exports},"9f8f":function(t,e,i){"use strict";var n=i("4243"),o=i.n(n);o.a}},[["8e7d","common/runtime","common/vendor"]]]);