(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/page-component/u-goods-list/u-ordinary-list"],{"14bd":function(t,i,e){"use strict";var o=function(){var t=this,i=t.$createElement,e=(t._self._c,t.__map(t.goodsList,function(i,e){var o=t.isShowStock(i),n=t.isShowMemPrice(i),s=t.isShowVip(i),r=t.isShowOriginalPrice(i),a=t.isShowOriginalPrice(i),u=t.isShowBuyBtn(i);return{$orig:t.__get_orig(i),m0:o,m1:n,m2:s,m3:r,m4:a,m5:u}})),o=t.__map(t.goodsList,function(i,e){var o=t.isShowStock(i),n=t.isShowMemPrice(i),s=t.isShowVip(i),r=t.isShowOriginalPrice(i),a=t.isShowOriginalPrice(i);return{$orig:t.__get_orig(i),m6:o,m7:n,m8:s,m9:r,m10:a}}),n=t.__map(t.goodsList,function(i,e){var o=t.isShowStock(i),n=t.isShowMemPrice(i),s=t.isShowVip(i),r=t.isShowOriginalPrice(i),a=t.isShowBuyBtn(i);return{$orig:t.__get_orig(i),m11:o,m12:n,m13:s,m14:r,m15:a}}),s=t.__map(t.goodsList,function(i,e){var o=t.isShowStock(i),n=t.isShowMemPrice(i),s=t.isShowVip(i),r=t.isShowOriginalPrice(i),a=t.isShowOriginalPrice(i),u=t.isShowBuyBtn(i);return{$orig:t.__get_orig(i),m16:o,m17:n,m18:s,m19:r,m20:a,m21:u}}),r=t.__map(t.goodsList,function(i,e){var o=t.isShowStock(i),n=t.isShowMemPrice(i),s=t.isShowVip(i),r=t.isShowOriginalPrice(i),a=t.isShowOriginalPrice(i),u=t.isShowBuyBtn(i),l=t.isShowBuyBtn(i);return{$orig:t.__get_orig(i),m22:o,m23:n,m24:s,m25:r,m26:a,m27:u,m28:l}});t.$mp.data=Object.assign({},{$root:{l0:e,l1:o,l2:n,l3:s,l4:r}})},n=[];e.d(i,"a",function(){return o}),e.d(i,"b",function(){return n})},"24ba":function(t,i,e){"use strict";e.r(i);var o=e("14bd"),n=e("2832");for(var s in n)"default"!==s&&function(t){e.d(i,t,function(){return n[t]})}(s);e("aee2");var r=e("2877"),a=Object(r["a"])(n["default"],o["a"],o["b"],!1,null,"27ccb947",null);i["default"]=a.exports},2832:function(t,i,e){"use strict";e.r(i);var o=e("350a"),n=e.n(o);for(var s in o)"default"!==s&&function(t){e.d(i,t,function(){return o[t]})}(s);i["default"]=n.a},"350a":function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var o=e("2f62");function n(t,i){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(t);i&&(o=o.filter(function(i){return Object.getOwnPropertyDescriptor(t,i).enumerable})),e.push.apply(e,o)}return e}function s(t){for(var i=1;i<arguments.length;i++){var e=null!=arguments[i]?arguments[i]:{};i%2?n(e,!0).forEach(function(i){r(t,i,e[i])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(e)):n(e).forEach(function(i){Object.defineProperty(t,i,Object.getOwnPropertyDescriptor(e,i))})}return t}function r(t,i,e){return i in t?Object.defineProperty(t,i,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[i]=e,t}var a=function(){return e.e("components/page-component/app-attr/app-attr").then(e.bind(null,"d3c4"))},u={name:"u-goods-list",props:{activity:{type:Object},isDIY:{type:Boolean,default:!1},showCat:{type:Boolean},catList:{type:Array},catStyle:{type:Number},theme:{type:String},themeObject:{type:Object},list:{type:Array},listStyle:{type:[Number,Boolean]},borderShow:{type:Number},goodsStyle:{type:Number},fill:{type:Number,default:1},goodsTagPicUrl:{type:String},showGoodsTag:{type:Number},showGoodsName:{type:Number,default:1},showGoodsPrice:{type:Number,default:1},showBuyBtn:{type:[Number,Boolean],default:1},buyBtn:{type:String,default:"cart"},buyBtnStyle:{type:Number},buyBtnText:{type:String},buttonColor:{type:String},textStyle:{type:Number},goodsCoverProportion:{type:String},isUnderLinePrice:{type:Boolean,default:!0},isShowAttr:{type:Boolean,default:!1},isBuy:{type:Boolean,default:!0},previewUrl:{type:String},submitUrl:{type:String},addTime:{type:Number,default:0},pagination:{type:Boolean,default:!1},reset:{type:Boolean,default:!1}},computed:s({},(0,o.mapState)({appSetting:function(t){return t.mallConfig.mall.setting},appImg:function(t){return t.mallConfig.__wxapp_img.mall},isShowCart:function(t){return!this.isDIY&&t.mallConfig.mall.setting.is_show_cart&&this.showBuyBtn},isShowGoodsName:function(t){return!this.isDIY&&t.mallConfig.mall.setting.is_show_goods_name}}),{},(0,o.mapGetters)("mallConfig",{getVideo:"getVideo"}),{copyList:function(){return this.is_show_off?this.showCat?this.catList[this.activeCurrent].goodsList:this.list:[]},goodsStyleObject:function(){var t="";return 2===this.goodsStyle&&(t+="u-is-border "),3!==this.goodsStyle&&(t+="u-white-back"),t},mode:function(){var t="";return t=1===this.fill?"aspectFill":"aspectFit",t},sellOutPic:function(){return"1"===this.appSetting.is_use_stock?this.appImg.plugins_out:this.appSetting.sell_out_pic},tagLeftTop:function(){return-1===this.listStyle||0===this.listStyle||2===this.listStyle||3===this.listStyle?"u-goods-tag-radius":""},buyBtnClass:function(){var t="";return 2!=this.buyBtnStyle&&4!=this.buyBtnStyle||(t+="u-text-btn-border "),4!=this.buyBtnStyle&&3!=this.buyBtnStyle||(t+="u-text-btn-radius"),t},btnStyle:function(){var t="";return 1==this.buyBtnStyle||3==this.buyBtnStyle?t+="background-color: ".concat(this.buttonColor,";color: #ffffff;"):t+="border-color: ".concat(this.buttonColor,";color: ").concat(this.buttonColor,";"),t},textAlign:function(){return 2===this.textStyle?"u-text-align":null},pluginAlign:function(){return 2===this.textStyle?"dir-left-nowrap main-center":null},coverPicHeight:function(){return"1-1"===this.goodsCoverProportion?"702rpx":"468rpx"},goodsListClass:function(){return 2===this.listStyle?"dir-left-wrap main-between u-goods-list":3===this.listStyle?"dir-left-wrap main-left u-one-line-three-list":0===this.listStyle?"u-swipe-left-right-list":1===this.borderShow?"u-goods-list u-bottom-border":"u-goods-list"}}),data:function(){return{activeCurrent:0,is_show_off:!0,attrGoods:{goods:{},attrShow:0},tempList:[],goodsList:[]}},methods:{cloneData:function(t){return JSON.parse(JSON.stringify(t))},splitData:function(){var t=this;if(this.tempList.length){var i=this.tempList[0];this.goodsList.push(i),this.tempList.splice(0,1),this.tempList.length&&setTimeout(function(){t.splitData()},this.addTime)}},changeNav:function(t){this.goodsList=[],this.activeCurrent=t,this.tempList=this.cloneData(this.copyList),this.splitData()},isShowStock:function(t){return 1===this.appSetting.is_show_stock&&0===t.goods_stock?1:0},isShowBuyBtn:function(t){return this.showBuyBtn&&0!==t.goods_stock&&1!==t.is_negotiable?1:0},isShowMemPrice:function(t){return 1!==t.level_show&&2!==t.level_show||1===t.is_negotiable?0:1},isShowVip:function(t){return t.vip_card_appoint&&t.vip_card_appoint.discount&&1!==t.is_negotiable?1:0},isShowOriginalPrice:function(t){return this.isUnderLinePrice&&1!==t.is_negotiable?1:0},buyProduct:function(i){var e=this;this.isBuy?this.isShowAttr?(this.attrGoods.goods=i,this.attrGoods.attrShow=Math.random()):(t.showLoading({text:"",mask:!0}),this.$request({url:this.$api.goods.attr,data:{id:i.id,mch_id:i.mch_id}}).then(function(o){if(t.hideLoading(),0===o.code){var n=Object.assign(i,o.data);e.$emit("buyProduct",{goods:n,attrShow:Math.random()})}else t.showToast({title:o.msg,icon:"none"})})):this.router(i)},router:function(i){if(i.video_url&&1==this.getVideo&&"lottery"!==i.sign&&"bargain"!==i.sign&&"wholesale"!==i.sign){var e=i.id;"advance"===i.sign?e=i.goods_id:"gift"===i.sign&&(e+="&is_share=1"),t.navigateTo({url:"/pages/goods/video?goods_id=".concat(e,"&sign=").concat(i.sign)})}else t.navigateTo({url:i.page_url})},empty:function(){this.goodsList=[]}},watch:{catList:{handler:function(t){this.showCat&&(!this.$validation.array(t)||this.$validation.isEmpty(t)?this.is_show_off=!1:this.is_show_off=!0)},deep:!0,immediate:!0},copyList:{handler:function(t,i){if(t){if(this.pagination&&!this.reset){var e=Array.isArray(i)&&i.length>0?i.length:0;this.tempList=this.tempList.concat(this.cloneData(t.slice(e)))}else this.goodsList=[],this.tempList=this.cloneData(t);this.splitData()}},deep:!0,immediate:!0}},components:{appAttr:a}};i.default=u}).call(this,e("f266")["default"])},"4b12":function(t,i,e){},aee2:function(t,i,e){"use strict";var o=e("4b12"),n=e.n(o);n.a}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/page-component/u-goods-list/u-ordinary-list-create-component',
    {
        'components/page-component/u-goods-list/u-ordinary-list-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("24ba"))
        })
    },
    [['components/page-component/u-goods-list/u-ordinary-list-create-component']]
]);                
