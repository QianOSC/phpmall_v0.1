(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["plugins/mch/mch/goods-attr-info/goods-attr-info"],{"0efb":function(t,r,s){"use strict";s.r(r);var i=s("c036"),a=s("0f20");for(var e in a)"default"!==e&&function(t){s.d(r,t,function(){return a[t]})}(e);s("bf6b");var o=s("2877"),n=Object(o["a"])(a["default"],i["a"],i["b"],!1,null,"71b140ec",null);r["default"]=n.exports},"0f20":function(t,r,s){"use strict";s.r(r);var i=s("c193"),a=s.n(i);for(var e in i)"default"!==e&&function(t){s.d(r,t,function(){return i[t]})}(e);r["default"]=a.a},bf6b:function(t,r,s){"use strict";var i=s("d787"),a=s.n(i);a.a},c036:function(t,r,s){"use strict";var i=function(){var t=this,r=t.$createElement;t._self._c},a=[];s.d(r,"a",function(){return i}),s.d(r,"b",function(){return a})},c193:function(t,r,s){"use strict";(function(t){Object.defineProperty(r,"__esModule",{value:!0}),r.default=void 0;var s={data:function(){return{iphone_x:!1,attr_groups:[],attr_list:[],unit:"件",attr:[],select:!1,chooseAttr:{},chooseGroup:{},chooseList:[],selectList:[],selectStatus:!1,chooseIndex:-1,listLength:0,showGroup:!1,showSetting:!1,inputName:!1,inputStock:!1,inputNo:!1,inputWeight:!1,startIndex:-10,endIndex:90,setting:{price:"",stock:"",no:"",weight:""},groupIndex:-1}},methods:{settingValue:function(t,r){var s=t.detail.value;switch(r){case"price":this.setting.price=s;break;case"stock":this.setting.stock=s;break;case"no":this.setting.no=s;break;case"weight":this.setting.weight=s;break}},nameBlur:function(t,r){r?(this.inputName=!1,this.attr[t].price=this.money(r.detail.value)):(this.inputName=!0,this.inputStock=!1,this.inputNo=!1,this.inputWeight=!1,this.chooseIndex=t)},stockBlur:function(t,r){r?(this.inputStock=!1,this.attr[t].stock=r.detail.value):(this.inputStock=!0,this.inputName=!1,this.inputNo=!1,this.inputWeight=!1,this.chooseIndex=t)},noBlur:function(t,r){r?(this.inputNo=!1,this.attr[t].no=r.detail.value):(this.inputNo=!0,this.inputName=!1,this.inputStock=!1,this.inputWeight=!1,this.chooseIndex=t)},weightBlur:function(t,r){r?(this.inputWeight=!1,this.attr[t].weight=r.detail.value):(this.inputWeight=!0,this.inputName=!1,this.inputStock=!1,this.inputNo=!1,this.chooseIndex=t)},money:function(t){var r=t.toString();return 0===r.indexOf(".")&&(r="0"+r),r=r.replace(/[^\d.]/g,""),r=r.replace(/\.{2,}/g,"."),r=r.replace(".","$#$").replace(/\./g,"").replace("$#$","."),r=r.replace(/^(\-)*(\d+)\.(\d\d).*$/,"$1$2.$3"),r.indexOf(".")<0&&""!=r&&(r=parseFloat(r)),r},allSetting:function(){var r=!1;for(var s in this.attr)this.attr[s].select&&(r=!0);r?this.showSetting=!0:t.showToast({title:"请选择规格",icon:"none",duration:1e3})},settingSubmit:function(){for(var t in this.attr)this.attr[t].select&&(this.setting.price&&(this.attr[t].price=this.money(this.setting.price),this.$forceUpdate()),this.setting.stock&&(this.attr[t].stock=this.setting.stock,this.$forceUpdate()),this.setting.no&&(this.attr[t].no=this.setting.no,this.$forceUpdate()),this.setting.weight&&(this.attr[t].weight=this.setting.weight,this.$forceUpdate()));this.close()},close:function(){this.showSetting=!1,this.setting.stock="",this.setting.price="",this.setting.no="",this.setting.weight=""},unSelect:function(t,r){this.attr[r].select=!this.attr[r].select;var s=!0;for(var i in this.attr)this.attr[i].select||(s=!1);this.selectStatus=s,this.$forceUpdate()},allSelect:function(){for(var t in this.selectStatus=!this.selectStatus,this.attr)this.attr[t].select=!this.selectStatus,this.attr[t].show==this.listLength&&(this.attr[t].select=this.selectStatus)},save:function(){var r=this,s=!0;for(var i in r.attr)if(!r.attr[i].price||!r.attr[i].stock)return s=!1,t.showToast({title:"请填写规格信息",icon:"none",duration:1e3}),!1;s&&(t.showLoading({title:"保存中..."}),t.setStorage({key:"temp_attr_info",data:r.attr,success:function(){t.hideLoading(),setTimeout(function(){t.navigateBack()},500)},fail:function(r){t.hideLoading(),t.showToast({title:r.errMsg,icon:"none",duration:1e3})}}))},choose:function(t,r){this.chooseGroup=t,this.groupIndex!=r?(this.showGroup=!0,this.groupIndex=r):this.showGroup=!this.showGroup},confirm:function(r,s){for(var i in this.showGroup=!1,this.attr_groups[this.groupIndex].attr_list)this.attr_groups[this.groupIndex].attr_list[i].choose=!1;for(var a in r>-1?(this.chooseAttr=s,s.attr_groups_id=this.attr_groups[this.groupIndex].attr_groups_id,this.attr_groups[this.groupIndex].attr_list[r].choose=!0,this.attr_groups[this.groupIndex].choose=!0,this.attr_groups[this.groupIndex].choose_attr=this.attr_groups[this.groupIndex].attr_list[r].attr_name):(this.chooseGroup={},this.chooseAttr={},this.attr_groups[this.groupIndex].choose=!1,this.attr_groups[this.groupIndex].choose_attr=""),this.chooseList=[],this.attr_groups)if(this.attr_groups[a].choose)for(var e in this.attr_groups[a].attr_list)if(this.attr_groups[a].attr_list[e].choose){var o=this.attr_groups[a],n=o.attr_group_id,h=o.attr_group_name,u=o.attr_list;this.chooseList.push({attr_group_id:n,attr_group_name:h,attr_id:u[e].attr_id,attr_name:u[e].attr_name})}this.listLength=this.chooseList.length;var c=!1,_=-1;for(var g in this.attr)if(this.attr[g].show=0,this.attr[g].choose=[],this.attr[g].showIndex=-200,this.chooseList.length>0)for(var p in this.attr[g].attr_list)for(var l in this.chooseList){var d=this.attr[g].attr_list[p],f=d.attr_group_id,m=d.attr_id;f==this.chooseList[l].attr_group_id&&m==this.chooseList[l].attr_id&&(this.attr[g].choose.push(this.chooseList[l].attr_name),this.attr[g].choose=Array.from(new Set(this.attr[g].choose)),this.attr[g].show=this.attr[g].choose.length,this.attr[g].showIndex=_,c=!0,this.$forceUpdate())}else this.attr[g].showIndex=g;if(c)for(var v in this.attr)this.attr[v].show==this.listLength&&(_++,this.attr[v].showIndex=_);else for(var w in this.attr)this.attr[w].choose=[],this.attr[w].show=this.attr[w].choose.length;this.startIndex=-10,this.endIndex=90,t.pageScrollTo({scrollTop:0,duration:300})},saveData:function(t,r,s,i,a){var e={attr_list:[],stock:"",price:"",no:"",weight:"",pic_url:"",shareLevelList:[],member_price:{}};e.attr_list.push(t),r&&e.attr_list.push(r),s&&e.attr_list.push(s),i&&e.attr_list.push(i),a&&e.attr_list.push(a),this.attr.push(e),this.$hideLoading()}},onPageScroll:function(t){var r=this;r.startIndex=Math.floor((t.scrollTop-50)/250)-150,r.endIndex=r.startIndex+300},onLoad:function(){var r=this;r.$showLoading({type:"global",text:"加载中..."}),t.getStorage({key:"goods_unit",success:function(t){r.unit=t.data}}),t.getStorage({key:"temp_attr_info",success:function(s){for(var i in t.getStorage({key:"temp_attr",success:function(t){r.attr_groups=t.data}}),r.attr_list[0]=[],r.attr=s.data,r.attr)r.attr[i].show=0,r.attr[i].choose=[],r.attr[i].id=i,r.attr[i].select=!1,r.attr[i].showIndex=i;r.$hideLoading()},fail:function(){t.getStorage({key:"temp_attr",success:function(t){r.attr_groups=t.data,r.attr=[];for(var s=0;s<r.attr_groups[0].attr_list.length;s++){var i={attr_group_id:r.attr_groups[0].attr_group_id,attr_group_name:r.attr_groups[0].attr_group_name,attr_id:r.attr_groups[0].attr_list[s].attr_id,attr_name:r.attr_groups[0].attr_list[s].attr_name};if(1===r.attr_groups.length)r.saveData(i);else for(var a=0;a<r.attr_groups[1].attr_list.length;a++){var e={attr_group_id:r.attr_groups[1].attr_group_id,attr_group_name:r.attr_groups[1].attr_group_name,attr_id:r.attr_groups[1].attr_list[a].attr_id,attr_name:r.attr_groups[1].attr_list[a].attr_name};if(2===r.attr_groups.length)r.saveData(i,e);else for(var o=0;o<r.attr_groups[2].attr_list.length;o++){var n={attr_group_id:r.attr_groups[2].attr_group_id,attr_group_name:r.attr_groups[2].attr_group_name,attr_id:r.attr_groups[2].attr_list[o].attr_id,attr_name:r.attr_groups[2].attr_list[o].attr_name};if(3===r.attr_groups.length)r.saveData(i,e,n);else for(var h=0;h<r.attr_groups[3].attr_list.length;h++){var u={attr_group_id:r.attr_groups[3].attr_group_id,attr_group_name:r.attr_groups[3].attr_group_name,attr_id:r.attr_groups[3].attr_list[h].attr_id,attr_name:r.attr_groups[3].attr_list[h].attr_name};if(4===r.attr_groups.length)r.saveData(i,e,n,u),r.$hideLoading();else for(var c=0;c<r.attr_groups[4].attr_list.length;c++){var _={attr_group_id:r.attr_groups[4].attr_group_id,attr_group_name:r.attr_groups[4].attr_group_name,attr_id:r.attr_groups[4].attr_list[c].attr_id,attr_name:r.attr_groups[4].attr_list[c].attr_name};r.saveData(i,e,n,u,_)}}}}}for(var g in r.attr)r.attr[g].show=0,r.attr[g].choose=[],r.attr[g].id=g,r.attr[g].showIndex=g}})}}),t.getSystemInfo({success:function(t){(t.model.indexOf("iPhone X")>-1||t.model.indexOf("iPhone 11")>-1||t.model.indexOf("iPhone11")>-1||t.model.indexOf("iPhone12")>-1||t.model.indexOf("Unknown Device")>-1)&&(r.iphone_x=!0)}})}};r.default=s}).call(this,s("c11b")["default"])},d787:function(t,r,s){}},[["4e4c","common/runtime","common/vendor"]]]);