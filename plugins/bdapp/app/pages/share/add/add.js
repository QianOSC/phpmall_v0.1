(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/share/add/add"],{2979:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var o=n("2f62");function a(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(t);e&&(o=o.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),n.push.apply(n,o)}return n}function i(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?a(n,!0).forEach(function(e){r(t,e,n[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):a(n).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))})}return t}function r(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}var s=function(){return n.e("components/page-component/app-diy-form/app-diy-form").then(n.bind(null,"7d93"))},u={data:function(){return{status:null,mallName:"",name:"",phone:"",parent_name:"",height:0,form:{},template_message:[],read:!1,protocol:!1}},computed:i({},(0,o.mapState)({mall:function(t){return t.mallConfig.mall},custom_setting:function(t){return t.mallConfig.share_setting_custom},share_setting:function(t){return t.mallConfig.share_setting}})),components:{AppDiyForm:s},methods:{handleFormInput:function(t){var e=[];for(var n in t)e[n]={key:t[n].key,label:t[n].name,value:t[n].value,required:t[n].is_required};this.form=e},toRead:function(){this.read=!this.read},imageLoad:function(t){var e=t.detail.width,n=t.detail.height;this.height=n*(702/e)},subscribe:function(){var e=this,n=this,o=0;if(this.form.length>0){var a=!0,i=!1,r=void 0;try{for(var s,u=this.form[Symbol.iterator]();!(a=(s=u.next()).done);a=!0){var l=s.value;if(1==l.required){if(!l.value)return t.showToast({title:"请填写"+l.label,icon:"none",duration:1e3}),!1;if("img_upload"==l.key&&Array.isArray(l.value)){var c=!0,f=!1,d=void 0;try{for(var h,m=l.value[Symbol.iterator]();!(c=(h=m.next()).done);c=!0){var p=h.value;if(!p)return t.showToast({title:"请填写"+l.label,icon:"none",duration:1e3}),!1}}catch(g){f=!0,d=g}finally{try{c||null==m.return||m.return()}finally{if(f)throw d}}}}}}catch(g){i=!0,r=g}finally{try{a||null==u.return||u.return()}finally{if(i)throw r}}}1==this.read?(o=1,n.name?n.phone?/0?(1)[0-9]{10}/.test(n.phone)?this.$subscribe(this.template_message).then(function(t){e.submit(o)}).catch(function(t){e.submit(o)}):t.showToast({title:"请输入正确的手机号码",icon:"none",duration:1e3}):t.showToast({title:"请输入手机号码",icon:"none",duration:1e3}):t.showToast({title:"请输入真实姓名",icon:"none",duration:1e3})):t.showToast({title:"请先查看分销协议并同意",icon:"none",duration:1e3})},submit:function(e){var n=this;t.showLoading({title:"提交中..."});var o={name:n.name,mobile:n.phone,agree:e};1==n.share_setting.form_status&&(o.form=JSON.stringify(n.form)),n.$request({url:n.$api.share.apply,data:o,method:"post"}).then(function(e){n.$store.dispatch("mallConfig/actionResetConfig"),n.$hideLoading(),0==e.code?(t.showToast({title:e.msg,duration:1e3}),setTimeout(function(){t.navigateBack({delta:1})},500)):0==n.share_setting.form_status&&"请填写表单"==e.msg?t.showToast({title:"申请条件有所变化，请重新填写",icon:"none",duration:1e3}):t.showToast({title:e.msg,icon:"none",duration:1e3})}).catch(function(e){n.$hideLoading(),t.showToast({title:response,icon:"none",duration:1e3})})}},onLoad:function(e){var n=this,o=this;this.$showLoading({type:"global",text:"加载中..."}),null!=e.template_message&&(o.template_message=JSON.parse(e.template_message)),t.setNavigationBarTitle({title:this.custom_setting.apply.share_apply.name?this.custom_setting.apply.share_apply.name:this.custom_setting.apply.share_apply.default}),this.$request({url:this.$api.user.user_info}).then(function(t){n.$hideLoading(),0===t.code&&(n.parent_name=t.data.identity.parent_name)})},onShow:function(){this.$store.dispatch("mallConfig/actionResetConfig")}};e.default=u}).call(this,n("5486")["default"])},"854e":function(t,e,n){"use strict";n.r(e);var o=n("c9c6"),a=n("b711");for(var i in a)"default"!==i&&function(t){n.d(e,t,function(){return a[t]})}(i);n("fd08");var r=n("2877"),s=Object(r["a"])(a["default"],o["a"],o["b"],!1,null,"0ca6cd84",null);e["default"]=s.exports},b1b9:function(t,e,n){},b711:function(t,e,n){"use strict";n.r(e);var o=n("2979"),a=n.n(o);for(var i in o)"default"!==i&&function(t){n.d(e,t,function(){return o[t]})}(i);e["default"]=a.a},c9c6:function(t,e,n){"use strict";var o=function(){var t=this,e=t.$createElement;t._self._c;t._isMounted||(t.e0=function(e){t.protocol=!0},t.e1=function(e){t.protocol=!1,t.read=!0})},a=[];n.d(e,"a",function(){return o}),n.d(e,"b",function(){return a})},fd08:function(t,e,n){"use strict";var o=n("b1b9"),a=n.n(o);a.a}},[["2a71","common/runtime","common/vendor"]]]);