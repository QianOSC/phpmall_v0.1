(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/order-submit/store-pick"],{"0b05":function(t,i,n){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var n={name:"store-pick",data:function(){return{mchIndex:null,list:null,firstGoodsId:null,plugin:null,manualLocation:!1,longitude:"",latitude:"",locationAddress:null}},onLoad:function(t){this.mchIndex=t.mchIndex,this.firstGoodsId=t.firstGoodsId||null,this.plugin=t.plugin||null},onShow:function(){this.manualLocation||this.getLocation()},methods:{getLocation:function(){var i=this;t.showLoading({mask:!0,title:"正在获取位置信息"}),t.getLocation({success:function(n){t.hideLoading(),i.longitude=n.longitude,i.latitude=n.latitude,i.loadData()},fail:function(){t.hideLoading(),t.showModal({title:"提示",content:"获取位置信息失败，需要授权获取您的位置信息",showCancel:!1,confirmText:"打开授权",success:function(i){i.confirm&&t.openSetting({})}})}})},selectLocation:function(){var i=this;this.manualLocation=!0,t.chooseLocation({success:function(t){i.longitude=t.longitude,i.latitude=t.latitude,i.locationAddress=(t.address||"")+" "+t.name||"",i.locationAddress=i.locationAddress.trim(),i.loadData()}})},loadData:function(){var i=this;t.showLoading({mask:!0,title:"加载中"}),this.$request({url:"booking"===this.plugin?this.$api.book.store_list:this.$api.order.store_list,data:{keyword:"",longitude:this.longitude,latitude:this.latitude,goods_id:this.firstGoodsId}}).then(function(n){t.hideLoading(),0===n.code&&(i.list=n.data.list)}).catch(function(){t.hideLoading()})},setData:function(i){if("gift"===this.plugin){this.$store.state.gift.store_id;i,this.$store.commit("gift/storeId",i)}else{var n=this.$store.state.orderSubmit.formData;n.list[this.mchIndex].store_id=i,this.$store.commit("orderSubmit/mutSetFormData",n)}t.navigateBack()}}};i.default=n}).call(this,n("f266")["default"])},"2dcc":function(t,i,n){"use strict";n.r(i);var o=n("0b05"),e=n.n(o);for(var a in o)"default"!==a&&function(t){n.d(i,t,function(){return o[t]})}(a);i["default"]=e.a},"3de9":function(t,i,n){},"5d1b":function(t,i,n){"use strict";var o=n("610c"),e=n.n(o);e.a},"610c":function(t,i,n){},"881e":function(t,i,n){"use strict";n.r(i);var o=n("c974"),e=n("2dcc");for(var a in e)"default"!==a&&function(t){n.d(i,t,function(){return e[t]})}(a);n("5d1b"),n("dd35");var s=n("2877"),d=Object(s["a"])(e["default"],o["a"],o["b"],!1,null,"0ca9c716",null);i["default"]=d.exports},c974:function(t,i,n){"use strict";var o=function(){var t=this,i=t.$createElement;t._self._c},e=[];n.d(i,"a",function(){return o}),n.d(i,"b",function(){return e})},dd35:function(t,i,n){"use strict";var o=n("3de9"),e=n.n(o);e.a}},[["9237","common/runtime","common/vendor"]]]);