(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/pt/components/app-group-avatar-short"],{3218:function(t,e,r){"use strict";var n=r("5193"),i=r.n(n);i.a},5193:function(t,e,r){},"553d":function(t,e,r){"use strict";var n=function(){var t=this,e=t.$createElement;t._self._c;t._isMounted||(t.e0=function(e){t.shareShow=!0},t.e1=function(e){t.shareShow=!0})},i=[];r.d(e,"a",function(){return n}),r.d(e,"b",function(){return i})},8972:function(t,e,r){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=r("2f62");function i(t,e){var r=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),r.push.apply(r,n)}return r}function o(t){for(var e=1;e<arguments.length;e++){var r=null!=arguments[e]?arguments[e]:{};e%2?i(r,!0).forEach(function(e){a(t,e,r[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(r)):i(r).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(r,e))})}return t}function a(t,e,r){return e in t?Object.defineProperty(t,e,{value:r,enumerable:!0,configurable:!0,writable:!0}):t[e]=r,t}var s=function(){return r.e("components/page-component/app-share-qr-code-poster/app-share-qr-code-poster").then(r.bind(null,"409e"))},u=function(){return r.e("components/page-component/app-attr/app-attr").then(r.bind(null,"d3c4"))},c={name:"app-group-avatar-short",props:{surplus_people:Number,group_users:Array,surplusDateTime:String,url:String,status:String,goodsId:String,one_goods_id:Number,is_join:String,detail:Object,theme:String,posterConfig:String,posterGenerate:String,hasPosterNav:{type:Boolean,default:function(){return!1}}},data:function(){return{time:null,html:"",shareShow:!1,attr:{},selectAttr:{},show:0,goods:{},userList:[]}},destroyed:function(){clearInterval(this.time)},methods:{setShow:function(){var e=this;t.showLoading(),this.$request({url:this.$api.pt.detail,data:{id:this.goodsId,group_id:this.detail.group_id}}).then(function(r){t.hideLoading(),0===r.code?(e.show=Math.random(),e.goods=r.data.detail):t.showModal({content:r.msg,showCancel:!1})}).catch(function(e){t.hideLoading()})},setAttr:function(t){this.attr=t},setTime:function(t){var e=this,r=new Date(t.replace(/-/g,"/"));clearInterval(this.time),this.time=setInterval(function(){var t=r.getTime()-(new Date).getTime();t<0&&clearInterval(e.time);var n=parseInt(t/1e3/60/60/24%30),i=parseInt(t/1e3/60/60%24),o=parseInt(t/1e3/60%60),a=parseInt(t/1e3%60);e.html=n>0?n+"天"+i+":"+(o<10?"0"+o:o)+":"+(a<10?"0"+a:a):i+":"+(o<10?"0"+o:o)+":"+(a<10?"0"+a:a)},1e3)},attrTap:function(t){this.selectAttr=null!==t?t:{}},buySubmit:function(){if(0===Object.keys(this.selectAttr).length)t.showModal({title:"提示",content:"请先选择规格",showCancel:!1});else{for(var e=this.goods.mch_id,r=[],n={id:this.goods.id,attr:[],num:this.attr.number,goods_attr_id:this.selectAttr.id,cart_id:0},i=0;i<this.selectAttr.attr_list.length;i++){var o={attr_id:this.selectAttr.attr_list[i].attr_id,attr_group_id:this.selectAttr.attr_list[i].attr_group_id};n.attr.push(o)}r.push({mch_id:e,pintuan_order_id:this.detail.id,pintuan_group_id:this.detail.group_id,goods_list:[n]}),this.$jump({open_type:"navigate",url:"/pages/order-submit/order-submit?mch_list=".concat(JSON.stringify(r),"&preview_url=").concat(encodeURIComponent(this.$api.pt.order_preview),"&submit_url=").concat(encodeURIComponent(this.$api.pt.order_submit),"&order_page_url=/plugins/pt/order/order&plugin=pt")})}},arr:function(t){for(var e=[],r=0;r<t;r++)e.push(r);return e}},watch:{surplusDateTime:{handler:function(t){this.setTime(t)},immediate:!0},status:{handler:function(t){3===Number(t)?this.userList=this.arr(this.orderRelation.length+this.surplus_people):(Number(t),this.userList=this.arr(this.surplus_people))},immediate:!0}},computed:o({},(0,n.mapGetters)("iPhoneX",{getEmpty:"getEmpty"})),components:{"app-share-qr-code":s,"app-attr":u}};e.default=c}).call(this,r("f266")["default"])},"90e0":function(t,e,r){"use strict";r.r(e);var n=r("8972"),i=r.n(n);for(var o in n)"default"!==o&&function(t){r.d(e,t,function(){return n[t]})}(o);e["default"]=i.a},bed2:function(t,e,r){"use strict";r.r(e);var n=r("553d"),i=r("90e0");for(var o in i)"default"!==o&&function(t){r.d(e,t,function(){return i[t]})}(o);r("3218");var a=r("2877"),s=Object(a["a"])(i["default"],n["a"],n["b"],!1,null,"6829ae58",null);e["default"]=s.exports}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'plugins/pt/components/app-group-avatar-short-create-component',
    {
        'plugins/pt/components/app-group-avatar-short-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("bed2"))
        })
    },
    [['plugins/pt/components/app-group-avatar-short-create-component']]
]);                
