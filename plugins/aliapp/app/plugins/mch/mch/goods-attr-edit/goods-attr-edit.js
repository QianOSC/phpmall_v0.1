(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["plugins/mch/mch/goods-attr-edit/goods-attr-edit"],{"0010":function(t,i,e){"use strict";var r=function(){var t=this,i=t.$createElement;t._self._c},n=[];e.d(i,"a",function(){return r}),e.d(i,"b",function(){return n})},"09c5":function(t,i,e){"use strict";var r=e("7881"),n=e.n(r);n.a},"383a":function(t,i,e){"use strict";e.r(i);var r=e("cb77"),n=e.n(r);for(var a in r)"default"!==a&&function(t){e.d(i,t,function(){return r[t]})}(a);i["default"]=n.a},"6a26":function(t,i,e){"use strict";e.r(i);var r=e("0010"),n=e("383a");for(var a in n)"default"!==a&&function(t){e.d(i,t,function(){return n[t]})}(a);e("09c5");var s=e("2877"),o=Object(s["a"])(n["default"],r["a"],r["b"],!1,null,"39f9adf0",null);i["default"]=o.exports},7881:function(t,i,e){},cb77:function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var r=e("2f62");function n(t,i){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);i&&(r=r.filter(function(i){return Object.getOwnPropertyDescriptor(t,i).enumerable})),e.push.apply(e,r)}return e}function a(t){for(var i=1;i<arguments.length;i++){var e=null!=arguments[i]?arguments[i]:{};i%2?n(e,!0).forEach(function(i){s(t,i,e[i])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(e)):n(e).forEach(function(i){Object.defineProperty(t,i,Object.getOwnPropertyDescriptor(e,i))})}return t}function s(t,i,e){return i in t?Object.defineProperty(t,i,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[i]=e,t}var o={data:function(){return{iphone_x:!1,detail:{},index:-1,list:[],idx:-1,attrList:[],attr:[]}},computed:a({},(0,r.mapState)({userInfo:function(t){return t.user.info}})),methods:{pop:function(t){this.index=t},close:function(){this.index=-1},add_attr:function(){this.list.push({attr_id:this.list.length>0?+this.list[this.list.length-1].attr_id+1:1,attr_name:"",pic_url:""})},toDelete:function(){var t=[];for(var i in this.attrList)for(var e in this.attrList[i].attr_list){var r=this.attrList[i].attr_list[e],n=r.attr_group_id,a=r.attr_id;n==this.attr[this.idx].attr_group_id&&a==this.list[this.index].attr_id&&t.unshift(i)}for(var s in t)this.attrList.splice(t[s],1);this.list.splice(this.index,1),this.index=-1},save:function(){for(var i in this.list){if(!this.list[i].attr_name)return t.showToast({title:"请输入规格值",icon:"none",duration:1e3}),!1;for(var e in this.list)if(i!==e&&this.list[i].attr_name===this.list[e].attr_name)return t.showToast({title:"同一规格组下，规格名不能重复",icon:"none",duration:1e3}),!1}var r=!1;for(var n in this.list.length>this.attr[this.idx].attr_list.length&&(r=!0),this.attrList)for(var a in this.attrList[n].attr_list)for(var s in this.list){var o=this.attrList[n].attr_list[a],c=o.attr_group_id,u=o.attr_id;c==this.attr[this.idx].attr_group_id&&u==this.list[s].attr_id&&(this.attrList[n].attr_list[a].attr_name=this.list[s].attr_name)}t.showLoading({title:"保存中..."}),r?t.removeStorage({key:"temp_attr_info"}):0===this.attrList.length?t.removeStorage({key:"temp_attr_info"}):t.setStorage({key:"temp_attr_info",data:this.attrList,fail:function(i){t.hideLoading(),t.showToast({title:i.errMsg,icon:"none",duration:1e3})}}),this.attr[this.idx].attr_list=this.list,t.setStorage({key:"temp_attr",data:this.attr}),setTimeout(function(){t.navigateBack()},500)}},onLoad:function(i){var e=this;this.idx=i.index,t.getStorage({key:"temp_attr",success:function(t){e.attr=t.data,e.detail=e.attr[i.index],e.list=JSON.parse(JSON.stringify(e.detail.attr_list))}}),t.getStorage({key:"temp_attr_info",success:function(t){e.attrList=t.data}}),t.getSystemInfo({success:function(t){(t.model.indexOf("iPhone X")>-1||t.model.indexOf("iPhone 11")>-1||t.model.indexOf("iPhone11")>-1||t.model.indexOf("iPhone12")>-1||t.model.indexOf("Unknown Device")>-1)&&(e.iphone_x=!0)}})}};i.default=o}).call(this,e("c11b")["default"])}},[["9cfd","common/runtime","common/vendor"]]]);