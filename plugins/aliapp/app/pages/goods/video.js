(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/goods/video"],{"1a7d":function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var s=n(e("a34a")),r=e("2f62"),o=n(e("947e"));function n(t){return t&&t.__esModule?t:{default:t}}function a(t,i,e,s,r,o,n){try{var a=t[o](n),h=a.value}catch(c){return void e(c)}a.done?i(h):Promise.resolve(h).then(s,r)}function h(t){return function(){var i=this,e=arguments;return new Promise(function(s,r){var o=t.apply(i,e);function n(t){a(o,s,r,n,h,"next",t)}function h(t){a(o,s,r,n,h,"throw",t)}n(void 0)})}}function c(t,i){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var s=Object.getOwnPropertySymbols(t);i&&(s=s.filter(function(i){return Object.getOwnPropertyDescriptor(t,i).enumerable})),e.push.apply(e,s)}return e}function u(t){for(var i=1;i<arguments.length;i++){var e=null!=arguments[i]?arguments[i]:{};i%2?c(e,!0).forEach(function(i){d(t,i,e[i])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(e)):c(e).forEach(function(i){Object.defineProperty(t,i,Object.getOwnPropertyDescriptor(e,i))})}return t}function d(t,i,e){return i in t?Object.defineProperty(t,i,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[i]=e,t}var l=function(){return e.e("components/page-component/goods/app-goods-video").then(e.bind(null,"9eb5"))},p=function(){return e.e("components/page-component/app-attr/app-attr").then(e.bind(null,"d3c4"))},g=function(){return e.e("components/basic-component/app-iphone-x/app-iphone-x").then(e.bind(null,"7598"))},m=function(){return e.e("components/page-component/app-pt-attr/app-pt-attr").then(e.bind(null,"051f"))},f={components:{videoNew:l,appPtAttr:m,"app-attr":p,"app-iphone-x":g},data:function(){return{buyText:"立即购买",sign:"",cartShow:1,plugin:"",buyBool:!1,previewUrl:"",submitUrl:"",show_pt:!1,pt:!0,selectGroupAttrId:-1,pintuan_groups:[],appAttr:{},translateX:"10",height:"667px",cur_index:null,width:"",sysheight:0,containerStyle:"transform:translateY(0px)",distance:0,listTouchStartY:0,listTouchDirection:null,scroll:!1,videoList:[],clicktime:0,goodBool:!1,goods_list:[],page:1,goods_id:0,show:0,item:null,selectAttr:{},attrGroup:[],ne:0,pre:0,is_show_buy:!0,is_share:0,addText:"",ptAttr:{},ptId:0,getResult:null}},computed:u({},(0,r.mapGetters)("iPhoneX",{getEmpty:"getEmpty"}),{},(0,r.mapGetters)("mallConfig",{getTheme:"getTheme"}),{},(0,r.mapState)("gift",{theme:function(t){return t.theme}}),{themeObject:function(){return"gift"===this.sign?{back:this.theme+"-background",userTheme:this.theme,color:this.theme+"-color",backO:this.theme+"-background-o",backP:this.theme+"-background-p"}:{back:this.getTheme+"-m-back "+this.getTheme,backP:this.getTheme+"-m-back-p "+this.getTheme,backO:this.getTheme+"-m-back-o "+this.getTheme,theme:this.getTheme,color:this.getTheme+"-m-text "+this.getTheme,sBack:this.getTheme+"-s-back "+this.getTheme,border:this.getTheme+"-m-border "+this.getTheme}}}),onLoad:function(i){var e=this;switch(this.goods_id=i.goods_id,this.sign=i.sign,this.is_share=i.is_share,this.sign){case"advance":this.cartShow=0,this.buyText="支付定金",this.buyBool=!0;break;case"booking":this.cartShow=0,this.buyText="立即预约",this.plugin="booking",this.submitUrl=this.$api.book.order_submit,this.previewUrl=this.$api.book.order_preview;break;case"miaosha":this.addText="加入购物车",this.submitUrl=this.$api.miaosha.order_submit,this.previewUrl=this.$api.miaosha.order_preview;break;case"pintuan":this.$request({url:this.$api.pt.detail,data:{id:this.goods_id,group_id:0}}).then(function(t){e.item=t.data.detail,e.cartShow=t.data.detail.pintuanGoods.is_alone_buy,e.ptAttr=JSON.parse(JSON.stringify(t.data.detail.attr)),e.ptId=JSON.parse(JSON.stringify(t.data.detail.id)),e.selectGroupAttrId=e.item.groups[0].groups.id,e.item.attr=e.item.groups[0].attr,e.item.id=e.item.groups[0].groups.goods_id});break;case"integral_mall":this.cartShow=0,this.buyText="立即兑换",this.submitUrl=this.$api.integral_mall.order_submit,this.previewUrl=this.$api.integral_mall.order_preview;break;case"step":this.cartShow=0,this.buyText="立即兑换",this.submitUrl=this.$api.step.order_submit,this.previewUrl=this.$api.step.order_preview;break;case"gift":this.cartShow=0,this.buyBool=!0,this.buyText="加入礼包",this.$request({url:this.$api.gift.config,method:"get"}).then(function(t){0===t.code&&e.$store.commit("gift/setTheme",Number(t.data.theme.id))});break;case"mch":this.addText="加入购物车",this.submitUrl=this.$api.mch.order_submit,this.previewUrl=this.$api.mch.order_preview;break;case"pick":this.addText="加入凑单池",this.is_show_buy=!1;break;case"exchange":this.cartShow=0,this.submitUrl=this.$api.exchange.order_submit,this.previewUrl=this.$api.exchange.order_preview;break;case"community":this.addText="加入购物车",this.is_show_buy=!1;break;default:this.addText="加入购物车";break}this.getVideo(i.goods_id);var s=t.getSystemInfoSync();this.height="".concat(s.windowHeight,"px"),this.width="".concat(s.windowWidth,"px"),this.sysheight=s.windowHeight},onHide:function(){this.videoList[this.cur_index].flag=!1,clearTimeout(this.getResult)},onShow:function(){null!==this.cur_index&&(this.videoList[this.cur_index].flag=!0)},methods:{buyClick:function(t){(0,o.default)(t,this.sign,this,this.goods_list[this.cur_index])},submit:function(){var i=this.item,e=this.appAttr.number,s=this.selectAttr;return s?e<=0?(t.showModal({title:"提示",content:"商品数量不能为0",showCancel:!1}),!1):!!i:(t.showModal({title:"提示",content:"请先选择规格",showCancel:!1}),!1)},onAttr:function(t){this.selectAttr=t},specification:function(t){this.attrGroup=t.attr_groups,"pintuan"===this.sign?(this.item=t,this.cartShow=t.pintuanGoods.is_alone_buy,this.show_pt=!0,this.ptAttr=JSON.parse(JSON.stringify(t.attr)),this.ptId=JSON.parse(JSON.stringify(t.id)),this.selectGroupAttrId=t.groups[0].groups.id,this.item.id=t.groups[0].groups.goods_id,this.item.attr=t.groups[0].attr,this.show=Math.random()):(this.show=Math.random(),this.item=t)},setGroupAttrID:function(t){this.selectGroupAttrId=t.groups.id,this.selectAttr=null,this.item.attr=t.attr,this.item.id=t.groups.goods_id},attr:function(t){this.appAttr=t},buy:function(){if(!this.submit())return!1;var i=this.item,e=this.appAttr.number,s=this.selectAttr,r=s.id,o=[];for(var n in s.attr_list)o.push({attr_id:s.attr_list[n].attr_id,attr_group_id:s.attr_list[n].attr_group_id});var a=[],h={mch_id:i.mch_id?i.mch_id:0,pintuan_order_id:0,pintuan_group_id:0,goods_list:[]};h.goods_list.push({id:i.id,attr:o,num:e,cat_id:0,goods_attr_id:r}),a.push(h),t.navigateTo({url:"/pages/order-submit/order-submit?mch_list=".concat(JSON.stringify(a),"&preview_url=").concat(encodeURIComponent(this.$api.pt.order_preview),"&submit_url=").concat(encodeURIComponent(this.$api.pt.order_submit))})},individual:function(){this.pt?(this.pt=!1,this.selectAttr={},this.item.attr=this.ptAttr,this.item.id=this.ptId):0===Object.keys(this.selectAttr).length?t.showToast({title:"请选择规格",icon:"none"}):this.buy()},multiplayer:function(){if(this.pt){if(this.selectAttr&&0===Object.keys(this.selectAttr).length)t.showToast({title:"请选择规格",icon:"none"});else if(this.selectAttr&&Object.keys(this.selectAttr).length>0){for(var i=this.item.mch_id,e=[],s={id:this.item.id,attr:[],num:this.appAttr.number,goods_attr_id:this.selectAttr.id,cart_id:0},r=0;r<this.selectAttr.attr_list.length;r++){var o={attr_id:this.selectAttr.attr_list[r].attr_id,attr_group_id:this.selectAttr.attr_list[r].attr_group_id};s.attr.push(o)}e.push({mch_id:i,pintuan_order_id:0,pintuan_group_id:this.selectGroupAttrId,goods_list:[s]}),t.navigateTo({url:"/pages/order-submit/order-submit?mch_list=".concat(JSON.stringify(e),"&preview_url=").concat(encodeURIComponent(this.$api.pt.order_preview),"&submit_url=").concat(encodeURIComponent(this.$api.pt.order_submit),"&order_page_url=/plugins/pt/order/order&plugin=pt")})}}else this.selectAttr={},this.pt=!0,this.selectGroupAttrId=this.item.groups[0].groups.id,this.item.attr=this.item.groups[0].attr,this.item.id=this.item.groups[0].groups.goods_id},getVideo:function(){var t=h(s.default.mark(function t(){var i,e,r,o,n,a,h,c,u=this;return s.default.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$request({url:this.$api.goods.goods_video_list,method:"get",data:{goodsId:this.goods_id,page:this.page,limit:3}});case 2:if(i=t.sent,0!==i.code){t.next=26;break}for(e=i.data.list,r=!0,o=!1,n=void 0,t.prev=8,a=e[Symbol.iterator]();!(r=(h=a.next()).done);r=!0)c=h.value,this.videoList.push({video_id:c.id,video_url:c.video_url,flag:!1}),this.goods_list.push(c);t.next=16;break;case 12:t.prev=12,t.t0=t["catch"](8),o=!0,n=t.t0;case 16:t.prev=16,t.prev=17,r||null==a.return||a.return();case 19:if(t.prev=19,!o){t.next=22;break}throw n;case 22:return t.finish(19);case 23:return t.finish(16);case 24:null==this.cur_index&&(this.cur_index=0),this.$nextTick().then(function(){u.videoList[u.cur_index].flag=!0});case 26:case"end":return t.stop()}},t,this,[[8,12,16,24],[17,,19,23]])}));function i(){return t.apply(this,arguments)}return i}(),routeGo:function(i){t.navigateTo({url:i})},close:function(){var i=this.goods_list[this.cur_index].page_url;this.is_share&&(i+="&is_share=1"),t.redirectTo({url:i})},clickVideo:function(t){if(this.goodBool=!1,this.clicktime>0&&t.timeStamp-this.clicktime<200)clearTimeout(this.han);else{var i=this;this.han=setTimeout(function(){i.videoList[i.cur_index].flag=!i.videoList[i.cur_index].flag},200)}this.clicktime=t.timeStamp},ListTouchStart:function(t){this.listTouchStartY=t.changedTouches[0].pageY},ListTouchMove:function(t){this.listTouchDirection=this.listTouchStartY-t.changedTouches[0].pageY>10?-1:0,this.listTouchDirection=t.changedTouches[0].pageY-this.listTouchStartY>10?1:this.listTouchDirection;var i=this.distance+t.changedTouches[0].pageY-this.listTouchStartY;i>0||Math.abs(this.listTouchStartY-t.changedTouches[0].pageY)<2&&(this.listTouchDirection=null)},ListTouchEnd:function(t){this.handelVideo(t)},handelVideo:function(){if((0!=this.cur_index||1!=this.listTouchDirection)&&(this.translateX=10,!this.scroll&&this.listTouchDirection)){var t=this.listTouchDirection*this.sysheight+this.distance;if(!(t>0||t<-this.sysheight*(this.videoList.length-1))){var i=!0,e=!1,s=void 0;try{for(var r,o=this.videoList[Symbol.iterator]();!(i=(r=o.next()).done);i=!0){var n=r.value;n.flag=!1}}catch(a){e=!0,s=a}finally{try{i||null==o.return||o.return()}finally{if(e)throw s}}this.animate(t,this.listTouchDirection),this.cur_index=this.cur_index-this.listTouchDirection,this.videoList[this.cur_index].flag=!0,this.videoList.length==this.cur_index+1&&(this.page++,this.getVideo()),this.listTouchDirection=null}}},animate:function(t,i){var e=this,s=this.distance;return new Promise(function(r,o){e.scroll=!0;var n=setInterval(function(){-1===i&&t<s||1===i&&t>s?(s+=100*i,e.containerStyle="transform:translateY(".concat(s,"px)")):(clearInterval(n),s=t,e.distance=t,e.containerStyle="transform:translateY(".concat(s,"px)"),e.scroll=!1,r())},20)})},previous:function(){var t=this;if(0!==this.cur_index){var i=!0,e=!1,s=void 0;try{for(var r,o=this.videoList[Symbol.iterator]();!(i=(r=o.next()).done);i=!0){var n=r.value;n.flag=!1}}catch(a){e=!0,s=a}finally{try{i||null==o.return||o.return()}finally{if(e)throw s}}this.distance=this.distance+this.sysheight,this.cur_index=this.cur_index-1,this.containerStyle="transform:translateY(".concat(this.distance,"px)"),clearTimeout(this.pre),this.pre=setTimeout(function(){t.videoList[t.cur_index].flag=!0},300)}},add:function(){var i=h(s.default.mark(function i(e,r){var o,n,a,h=this;return s.default.wrap(function(i){while(1)switch(i.prev=i.next){case 0:if("pick"!==this.sign){i.next=11;break}if(0!==this.item.activity_id){i.next=5;break}t.showToast({title:"活动不存在",icon:"none"}),i.next=9;break;case 5:return i.next=7,this.$request({url:this.$api.pick.add,data:{goods_id:e.goods_id,attr:e.id,num:r,pick_activity_id:this.item.activity_id}});case 7:o=i.sent,0===o.code&&t.showToast({title:"加入成功",icon:"none"});case 9:i.next=12;break;case 11:"community"===this.sign&&(n=e.id,a=e.goods_id,this.$request({url:this.$api.community.cart_add,data:{activity_id:this.item.id,goods_id:a,goods_attr_id:n,num:r},method:"post"}).then(function(t){0===t.code&&h.addResult(t.data.queue_id,t.data.token)}));case 12:case"end":return i.stop()}},i,this)}));function e(t,e){return i.apply(this,arguments)}return e}(),addResult:function(i,e){var s=this;this.$request({url:this.$api.community.cart_result,method:"post",data:{queue_id:i,token:e}}).then(function(r){0===r.code?r.data&&1===r.data.retry?s.getResult=setTimeout(function(){s.addResult(i,e)},1e3):(s.attrShow=0,t.hideLoading(),t.showToast({title:"添加成功",duration:1e3})):(t.hideLoading(),t.showToast({title:r.msg,icon:"none",duration:1e3}))})},next:function(){var i=this;this.cur_index+1!==this.videoList.length?(this.distance=this.distance-this.sysheight,this.containerStyle="transform:translateY(".concat(this.distance,"px)"),clearTimeout(this.ne),this.ne=setTimeout(function(){i.videoList[i.cur_index].flag=!1,i.cur_index=i.cur_index+1,i.videoList[i.cur_index].flag=!0}),this.videoList.length<this.cur_index+2&&(this.page++,this.getVideo())):t.showToast({title:"无更多视频",icon:"none"})}},onShareAppMessage:function(){var t=this.goods_list[this.cur_index],i={id:t.id,mch_id:t.mch_id};return"integral_mall"===t.sign&&(delete i.id,i.goods_id=t.id),this.$shareAppMessage({title:t.app_share_title?t.app_share_title:t.name,imageUrl:t.app_share_pic?t.app_share_pic:t.cover_pic,path:t.page_url.split("?")[0],params:i})},watch:{appAttr:{handler:function(t){"none"===t.display&&(this.show_pt=!1)}}},onUnload:function(){this.videoCtx=null,clearTimeout(this.getResult)}};i.default=f}).call(this,e("c11b")["default"])},2361:function(t,i,e){"use strict";var s=e("df1f"),r=e.n(s);r.a},"548d":function(t,i,e){"use strict";e.r(i);var s=e("f563"),r=e("faaf");for(var o in r)"default"!==o&&function(t){e.d(i,t,function(){return r[t]})}(o);e("2361");var n=e("2877"),a=Object(n["a"])(r["default"],s["a"],s["b"],!1,null,null,null);i["default"]=a.exports},df1f:function(t,i,e){},f563:function(t,i,e){"use strict";var s=function(){var t=this,i=t.$createElement;t._self._c;t._isMounted||(t.e0=function(i){t.goodBool=!t.goodBool})},r=[];e.d(i,"a",function(){return s}),e.d(i,"b",function(){return r})},faaf:function(t,i,e){"use strict";e.r(i);var s=e("1a7d"),r=e.n(s);for(var o in s)"default"!==o&&function(t){e.d(i,t,function(){return s[t]})}(o);i["default"]=r.a}},[["12feb","common/runtime","common/vendor"]]]);