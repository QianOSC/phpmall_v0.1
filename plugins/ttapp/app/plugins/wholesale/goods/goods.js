(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/wholesale/goods/goods"],{"45f7":function(t,e,o){"use strict";o.r(e);var n=o("6a33"),r=o("e793");for(var a in r)"default"!==a&&function(t){o.d(e,t,function(){return r[t]})}(a);o("e7d0");var i=o("2877"),s=Object(i["a"])(r["default"],n["a"],n["b"],!1,null,"3091b2ea",null);e["default"]=s.exports},"6a33":function(t,e,o){"use strict";var n=function(){var t=this,e=t.$createElement,o=(t._self._c,encodeURIComponent(t.mall.setting.web_service_url));t.$mp.data=Object.assign({},{$root:{m0:o}})},r=[];o.d(e,"a",function(){return n}),o.d(e,"b",function(){return r})},"8ecf":function(t,e,o){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=a(o("a34a")),r=o("2f62");function a(t){return t&&t.__esModule?t:{default:t}}function i(t,e,o,n,r,a,i){try{var s=t[a](i),c=s.value}catch(l){return void o(l)}s.done?e(c):Promise.resolve(c).then(n,r)}function s(t){return function(){var e=this,o=arguments;return new Promise(function(n,r){var a=t.apply(e,o);function s(t){i(a,n,r,s,c,"next",t)}function c(t){i(a,n,r,s,c,"throw",t)}s(void 0)})}}function c(t,e){var o=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),o.push.apply(o,n)}return o}function l(t){for(var e=1;e<arguments.length;e++){var o=null!=arguments[e]?arguments[e]:{};e%2?c(o,!0).forEach(function(e){u(t,e,o[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(o)):c(o).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(o,e))})}return t}function u(t,e,o){return e in t?Object.defineProperty(t,e,{value:o,enumerable:!0,configurable:!0,writable:!0}):t[e]=o,t}var d=function(){return o.e("components/page-component/goods/app-goods-banner").then(o.bind(null,"12b6"))},h=function(){return o.e("components/page-component/app-attr/app-attr").then(o.bind(null,"d3c4"))},f=function(){return o.e("components/page-component/goods/app-goods-full-reduce").then(o.bind(null,"6132"))},p=function(){return o.e("components/page-component/goods/bd-info").then(o.bind(null,"0e01"))},b=function(){return Promise.all([o.e("common/vendor"),o.e("components/page-component/goods/bd-coupon")]).then(o.bind(null,"11b2"))},g=function(){return o.e("components/page-component/goods/bd-xbc").then(o.bind(null,"8639"))},m=function(){return o.e("components/page-component/goods/bd-kb").then(o.bind(null,"4c29"))},v=function(){return o.e("components/page-component/goods/bd-hc").then(o.bind(null,"de37"))},_=function(){return o.e("components/page-component/goods/bd-detail").then(o.bind(null,"3e70"))},w=function(){return o.e("components/page-component/goods/bd-comments").then(o.bind(null,"9470"))},y=function(){return o.e("components/basic-component/app-close/app-close").then(o.bind(null,"f0dd"))},O=function(){return o.e("components/page-component/goods/bd-service").then(o.bind(null,"861b"))},x={name:"goods",data:function(){return{showClose:!1,is_open:0,goods:{},selectAttr:null,previewUrl:this.$api.wholesale.order_preview,submitUrl:this.$api.wholesale.order_submit,show:0,list:[],appAttr:{},totalNumber:0,totalPrice:"0.00",poster_config:this.$api.wholesale.poster_config,poster_generate:this.$api.wholesale.poster_generate,url:this.$api.wholesale.poster,goods_id:-1,loading:!1,first:!0,is_vip:!1,is_vip_card_user:0,discount:null,full_reduce:null,flash_sale:null,wholesaleDiscount:0}},onLoad:function(t){var e=this,o=this;o.goods_id=t.id,o.$showLoading({type:"global",text:"加载中..."}),o.request({url:o.$api.wholesale.detail,data:{id:o.goods_id}}).then(function(t){o.first=!1,o.goods=t.detail,t.detail.goods_activity&&(e.full_reduce=t.detail.goods_activity.full_reduce),o.goods.vip_card_appoint.discount>0&&(o.is_vip=!0,o.discount=o.goods.vip_card_appoint.discount),o.is_vip_card_user=o.goods.vip_card_appoint.is_vip_card_user;var n=!0,r=!1,a=void 0;try{for(var i,s=o.goods.attr[Symbol.iterator]();!(n=(i=s.next()).done);n=!0){var c=i.value;c.number="0"}}catch(g){r=!0,a=g}finally{try{n||null==s.return||s.return()}finally{if(r)throw a}}if(1==o.goods.attr_groups.length)o.goods.attr[0].number="0";else{var l=!0,u=!1,d=void 0;try{for(var h,f=o.goods.attr_groups[Symbol.iterator]();!(l=(h=f.next()).done);l=!0){var p=h.value;for(var b in p.less_attr_group_name=p.attr_group_name.substring(0,10),p.scrollLeft=0,p.attr_list)p.attr_list[b].active=!(b>0),p.attr_list[b].number=0}}catch(g){u=!0,d=g}finally{try{l||null==f.return||f.return()}finally{if(u)throw d}}}o.flash_sale=o.goods.plugin_extra.flash_sale,o.loading=!0,o.$hideLoading()})},onShow:function(){var t=this;if(this.showClose=!1,setTimeout(function(){t.showClose=!0}),this.first)return!1;var e=JSON.parse(JSON.stringify(this.goods.attr)),o=JSON.parse(JSON.stringify(this.goods.attr_groups));this.$showLoading(),this.$nextTick(function(){var n=t;n.request({url:n.$api.wholesale.detail,data:{id:n.goods_id}}).then(function(r){n.goods=r.detail,n.goods.attr=e,n.goods.attr_groups=o,t.$hideLoading()})})},computed:l({},(0,r.mapState)("gConfig",{mall:function(t){return t.mallConfig.mall},iphone:function(t){return t.iphone},iphoneHeight:function(t){return t.iphoneHeight}}),{},(0,r.mapGetters)("mallConfig",{getTheme:"getTheme"}),{},(0,r.mapState)({mall:function(t){return t.mallConfig.mall},themeObject:function(t){var e=t.mallConfig.mall.setting.theme_color;return{back:e+"-m-back "+e,backP:e+"-m-back-p "+e,backO:e+"-m-back-o "+e,theme:e,color:e+"-m-text "+e,sBack:e+"-s-back "+e,border:e+"-m-border "+e,mBtn:e+"-m-gradient-btn "+e,sBtn:e+"-s-gradient-btn "+e}}}),{good_negotiable:function(){var t=this.mall.setting.good_negotiable;this.contact_tel="",this.contact="",this.contact_web="";for(var e=[],o=0;o<t.length;o++)"contact_tel"===t[o]&&(this.contact_tel="contact_tel"),"contact_web"===t[o]&&(this.contact_web="contact_web");return this.contact_tel&&e.push(this.contact_tel),this.contact&&e.push(this.contact),this.contact_web&&e.push(this.contact_web),console.log(e),e},contactBtn:function(){var t=this.good_negotiable.length,e=this.getTheme;return 3!==t||"a"!==e&&"b"!==e&&"f"!==e?3===t&&"a"!==e&&"b"!==e&&"f"!==e?"".concat(this.themeObject.mBtn," ").concat(e,"-s-text ").concat(e," bd-three-one bd-no-radius "):2!==t||"a"!==e&&"b"!==e&&"f"!==e||this.contact_tel?2!==t||"a"!==e&&"b"!==e&&"f"!==e||!this.contact_tel?2!==t||"a"===e||"b"===e||"f"===e||this.contact_tel?2===t&&"a"!==e&&"b"!==e&&"f"!==e&&this.contact_tel?"".concat(this.themeObject.mBtn," ").concat(e,"-s-text ").concat(e," bd-btn-half bd-content-radius-1"):"".concat(this.themeObject.mBtn," text ").concat(e," all-width all-radius "):"".concat(this.themeObject.sBtn," ").concat(e,"-s-text ").concat(e," bd-btn-half bd-content-radius-0"):"".concat(e,"-m-back text ").concat(e," bd-btn-half bd-content-radius-1"):"".concat(this.themeObject.sBtn," text ").concat(e," bd-btn-half bd-content-radius-0"):"".concat(this.themeObject.mBtn," text ").concat(e," bd-three-one bd-no-radius ")}}),onShareAppMessage:function(){return this.$shareAppMessage({path:"/plugins/wholesale/goods/goods",title:this.goods.app_share_title?this.goods.app_share_title:this.goods.name,imageUrl:this.goods.app_share_pic?this.goods.app_share_pic:"",params:{id:this.goods.id}})},methods:{getMall:function(t){this.is_open=t.is_open},setCoupon:function(t){this.$set(this.goods.goods_coupon_center[t],"is_receive",1)},clickAttr:function(){this.show=Math.random()},attr:function(t){this.appAttr=t},favorite:function(){var e=this.$api.user.favorite_add,o=!0;this.goods.favorite&&(e=this.$api.user.favorite_remove,o=!1),this.goods.favorite=o,this.$request({url:e,data:{goods_id:this.goods.id}}).then(function(e){0===e.code||t.showModal({title:"提示",content:e.msg,showCancel:!1})}).catch(function(t){})},back:function(){t.reLaunch({url:"/pages/index/index"})},request:function(){var e=s(n.default.mark(function e(o){var r,a,i;return n.default.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return r=o.url,a=o.data,e.next=3,this.$request({url:r,data:a});case 3:if(i=e.sent,0!==i.code){e.next=8;break}return e.abrupt("return",i.data);case 8:t.showToast({title:i.msg,icon:"none",duration:1e3}),setTimeout(function(){t.navigateBack()},1e3);case 10:case"end":return e.stop()}},e,this)}));function o(t){return e.apply(this,arguments)}return o}(),attrtap:function(t,e){var o=this,n=this;if(null!==t){n.goods=t;var r=!0,a=!1,i=void 0;try{for(var s,c=e[Symbol.iterator]();!(r=(s=c.next()).done);r=!0){var l=s.value,u=!0,d=!1,h=void 0;try{for(var f,p=n.goods.attr[Symbol.iterator]();!(u=(f=p.next()).done);u=!0){var b=f.value;l.id==b.id&&(b.number=l.number)}}catch(q){d=!0,h=q}finally{try{u||null==p.return||p.return()}finally{if(d)throw h}}}}catch(q){a=!0,i=q}finally{try{r||null==c.return||c.return()}finally{if(a)throw i}}n.totalNumber=0;var g=0,m=!0,v=!1,_=void 0;try{for(var w,y=n.goods.attr[Symbol.iterator]();!(m=(w=y.next()).done);m=!0){var O=w.value;if(n.totalNumber+=+O.number,O.number>0){var x=1===n.goods.level_show?O.price_member:O.price;g+=O.number*x}}}catch(q){v=!0,_=q}finally{try{m||null==y.return||y.return()}finally{if(v)throw _}}if(n.goods.attr_groups.length>1){var j=!0,$=!1,S=void 0;try{for(var k,P=n.goods.attr_groups[0].attr_list[Symbol.iterator]();!(j=(k=P.next()).done);j=!0){var C=k.value;C.number=0;var B=!0,D=!1,N=void 0;try{for(var T,L=n.goods.attr[Symbol.iterator]();!(B=(T=L.next()).done);B=!0){var M=T.value;M.number>0&&C.attr_id==M.attr_list[0].attr_id&&C.attr_name==M.attr_list[0].attr_name&&(C.number+=+M.number,C.length=-5-10*+C.number.toString().length)}}catch(q){D=!0,N=q}finally{try{B||null==L.return||L.return()}finally{if(D)throw N}}}}catch(q){$=!0,S=q}finally{try{j||null==P.return||P.return()}finally{if($)throw S}}}setTimeout(function(){var t=0,e=!0,r=!1,a=void 0;try{for(var i,s=n.goods.wholesaleGoods.wholesale_rules[Symbol.iterator]();!(e=(i=s.next()).done);e=!0){var c=i.value;n.totalNumber<c.num||(o.wholesaleDiscount=c.discount,t++)}}catch(q){r=!0,a=q}finally{try{e||null==s.return||s.return()}finally{if(r)throw a}}0==t&&(o.wholesaleDiscount=0==n.goods.wholesaleGoods.type?10:0),o.wholesaleDiscount>0&&(0==n.goods.wholesaleGoods.type?g*=o.wholesaleDiscount/10:g-=o.wholesaleDiscount*n.totalNumber),n.totalPrice=g.toFixed(2)},0)}}},components:{"app-banner":d,"app-attr":h,"app-goods-full-reduce":f,appClose:y,bdInfo:p,bdCoupon:b,bdXbc:g,bdKb:m,bdHc:v,bdDetail:_,bdComments:w,bdService:O}};e.default=x}).call(this,o("f266")["default"])},a550:function(t,e,o){},ae58:function(t,e){t.exports=require("../siteinfo.js")},e793:function(t,e,o){"use strict";o.r(e);var n=o("8ecf"),r=o.n(n);for(var a in n)"default"!==a&&function(t){o.d(e,t,function(){return n[t]})}(a);e["default"]=r.a},e7d0:function(t,e,o){"use strict";var n=o("a550"),r=o.n(n);r.a}},[["456b","common/runtime","common/vendor"]]]);