(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/mch/mch/config/config"],{"45ff":function(t,e,i){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;for(var a=function(){return i.e("components/page-component/app-area-picker/app-area-picker").then(i.bind(null,"8e44"))},o=function(){return i.e("components/basic-component/app-radio/app-radio").then(i.bind(null,"3ac8"))},s=new Date,n=[],r=[],c=[],l=[],h=[],u=[],m=s.getFullYear();m<=s.getFullYear()+10;m++)n.push(m);for(var d=1;d<=12;d++)r.push(d);for(var f=1;f<=31;f++)c.push(f);for(var _=1;_<=30;_++)l.push(_);for(var p=1;p<=28;p++)h.push(p);for(var v=1;v<=29;v++)u.push(v);var y={name:"config",components:{appAreaPicker:a,appRadio:o},data:function(){return{lineHeight:"72rpx",mch_id:-1,category_list:[],indicatorStyle:"",area:{province_id:0,city_id:0,district_id:0},date:[{label:"周一",value:"1",check:!1},{label:"周二",value:"2",check:!1},{label:"周三",value:"3",check:!1},{label:"周四",value:"4",check:!1},{label:"周五",value:"5",check:!1},{label:"周六",value:"6",check:!1},{label:"周日",value:"7",check:!1}],form:{},form_data:{},timeDialog:!1,choose:2,hour:[],minutes:[],startVal:[0,0,0],endVal:[0,0,0],autoDialog:!1,dateVal:[0,0,0],timeVal:[0,0,0],chooseAuto:1,years:n,months:r,days:c,bigDays:c,smallDays:l,secDays:h,otherDays:u}},onShow:function(){var e=this;t.getStorage({key:"openTime",success:function(t){e.form.time_list=t.data}})},onLoad:function(e){t.removeStorage({key:"openTime"}),this.indicatorStyle="height: 36px;font-size:14px;";var i=t.getSystemInfoSync().windowWidth,a=375/i;this.lineHeight=72*a+"rpx",this.mch_id=e.mch_id,this.getCategory();for(var o=0;o<60;o++)o<10&&(o="0"+o),o<24&&this.hour.push(o),this.minutes.push(o);var s=new Date,n=s.getFullYear(),r=s.getMonth()+1;r>=1&&r<=9&&(r="0"+r);var c=s.getDate();for(var l in this.years)n==this.years[l]&&(this.dateVal[0]=+l);for(var h in this.months)r==this.months[h]&&(this.dateVal[1]=+h);for(var u in this.days=2==r?n%4==0&&n%400!=0?this.otherDays:this.secDays:r<8&&r%2==1||r>7&&r%2==0?this.bigDays:this.smallDays,this.days)c==this.days[u]&&(this.dateVal[2]=+u)},methods:{toSettingTime:function(){t.navigateTo({url:"/plugins/mch/mch/open-time/open-time?time_list=".concat(JSON.stringify(this.form.time_list))})},chooseDate:function(t){t.check=!t.check},openTime:function(){var t=!0,e=!1,i=void 0;try{for(var a,o=this.date[Symbol.iterator]();!(t=(a=o.next()).done);t=!0){var s=a.value;s.check=!1;var n=!0,r=!1,c=void 0;try{for(var l,h=this.form.week_list[Symbol.iterator]();!(n=(l=h.next()).done);n=!0){var u=l.value;s.value==u&&(s.check=!0)}}catch(m){r=!0,c=m}finally{try{n||null==h.return||h.return()}finally{if(r)throw c}}}}catch(m){e=!0,i=m}finally{try{t||null==o.return||o.return()}finally{if(e)throw i}}this.timeDialog=!0},openAuto:function(){if(this.chooseAuto=this.form.is_auto_open,2==this.chooseAuto&&this.form.auto_open_time.length>0){for(var t in this.years)this.form.auto_open_time.substring(0,4)==this.years[t]&&(this.dateVal[0]=+t);for(var e in this.months)this.form.auto_open_time.substring(5,7)==this.months[e]&&(this.dateVal[1]=+e);var i=+this.dateVal[1]+1;for(var a in 2==i?year%4==0&&year%400!=0?this.days=this.otherDays:this.days=this.secDays:this.days=i<8&&i%2==1||i>7&&i%2==0?this.bigDays:this.smallDays,this.days)this.form.auto_open_time.substring(8,10)==this.days[a]&&(this.dateVal[2]=+a);var o=this.form.auto_open_time.substring(11);this.timeVal=o.split(":").map(Number)}this.autoDialog=!0},submitTime:function(){this.form.week_list=[];var t=!0,e=!1,i=void 0;try{for(var a,o=this.date[Symbol.iterator]();!(t=(a=o.next()).done);t=!0){var s=a.value;s.check&&this.form.week_list.push(s.value)}}catch(n){e=!0,i=n}finally{try{t||null==o.return||o.return()}finally{if(e)throw i}}this.timeDialog=!1},submitAutoTime:function(){if(this.form.is_auto_open=this.chooseAuto,2==this.form.is_auto_open){var t=this.months[this.dateVal[1]],e=this.days[this.dateVal[2]];t<10&&(t="0"+t),e<10&&(e="0"+e),this.form.auto_open_time=this.years[this.dateVal[0]]+"-"+t+"-"+e,this.form.auto_open_time+=" "+this.hour[this.timeVal[0]]+":"+this.minutes[this.timeVal[1]]+":"+this.minutes[this.timeVal[2]]}this.autoDialog=!1},cancel:function(){this.timeDialog=!1,this.autoDialog=!1},change:function(t){this.choose=t},changeAuto:function(t){this.chooseAuto=t},startChange:function(t){this.startVal=t.detail.value},endChange:function(t){this.endVal=t.detail.value},dateChange:function(t){var e=t.detail.value;this.dateVal=t.detail.value;this.years;var i=this.years[e[0]],a=this.months[e[1]];this.days=2==a?i%4==0&&i%400!=0?this.otherDays:this.secDays:a<8&&a%2==1||a>7&&a%2==0?this.bigDays:this.smallDays},timeChange:function(t){this.timeVal=t.detail.value},getCategory:function(){var t=this;t.$request({url:t.$api.mch.category,data:{id:t.mch_id}}).then(function(e){0==e.code&&(t.category_list=e.data.list,t.loadData())})},loadData:function(){var t=this;t.$showLoading(),t.$request({url:t.$api.mch.detail,data:{id:t.mch_id,review_status:1}}).then(function(e){if(t.$hideLoading(),0===e.code){var i=e.data.detail,a="",o=0;t.category_list.map(function(t,e){t.id==i.mch_common_cat_id&&(a=t.name,o=e)}),t.form={id:i.id,realname:i.realname,mobile:i.mobile,wechat:i.wechat,address:i.store.address,name:i.store.name,service_mobile:i.store.mobile,mch_common_cat_str:a,mch_common_cat_key:o,mch_common_cat_id:i.mch_common_cat_id,cover_url:i.store.cover_url,username:i.mchUser.username,pic_url:i.store.pic_url.length>0?i.store.pic_url[0].pic_url:"",form_data:i.form_data,is_open:i.is_open,open_type:i.open_type,is_auto_open:i.is_auto_open,auto_open_time:i.auto_open_time,time_list:i.time_list,week_list:i.week_list},t.area={province_id:i.store.province_id,city_id:i.store.city_id,district_id:i.store.district_id}}})},navPassword:function(){t.navigateTo({url:"/plugins/mch/mch/password/password?mch_id="+this.mch_id})},applyInput:function(t){var e=t.currentTarget.dataset.type;this.form[e]=t.detail.value},categoryChange:function(t){var e=this.category_list[t.detail.value];this.form.mch_common_cat_id=e.id,this.form.mch_common_cat_str=e.name,this.form.mch_common_cat_key=t.detail.value},areaEvent:function(t){t&&(this.area.province_id=t.province.id,this.area.city_id=t.city.id,this.area.district_id=t.district.id)},uploadCoverUrl:function(e){var i=this;t.chooseImage({count:1,success:function(e){t.uploadFile({url:i.$api.upload.file,filePath:e.tempFilePaths[0],name:"file",formData:{file:e.tempFilePaths[0]},success:function(e){var a=JSON.parse(e.data);0===a.code?(i.form.cover_url=a.data.url,t.showToast({title:"上传成功"})):t.showToast({icon:"none",title:a.msg})}})}})},uploadPicUrl:function(e){var i=this;t.chooseImage({count:1,success:function(e){t.uploadFile({url:i.$api.upload.file,filePath:e.tempFilePaths[0],name:"file",formData:{file:e.tempFilePaths[0]},success:function(e){var a=JSON.parse(e.data);0===a.code?(i.form.pic_url=a.data.url,i.form.pic_url_id=a.data.id,t.showToast({title:"上传成功"})):t.showToast({icon:"none",title:a.msg})}})}})},formSubmit:function(e){var i=this,a=i.form,o=i.area,s=function(){return 2==a.open_type&&0==a.week_list.length?"请选择营业时间":a.realname?a.mobile?a.username?a.mch_common_cat_id?!a.name&&"店铺名称不能为空":"类目不能为空":"账号不能为空":"联系电话不能为空":"联系人不能为空"}();s?t.showToast({icon:"none",title:s}):(i.$showLoading({title:"保存中"}),i.$request({url:i.$api.mch.apply,data:{id:a.id,mch_common_cat_id:a.mch_common_cat_id,address:a.address,username:a.username,name:a.name,service_mobile:a.service_mobile,realname:a.realname,mobile:a.mobile,wechat:a.wechat,form_data:JSON.stringify(a.form_data),province_id:o.province_id,city_id:o.city_id,district_id:o.district_id,logo:a.cover_url,bg_pic_url:JSON.stringify({pic_url:a.pic_url,id:a.pic_url_id}),is_open:a.is_open,open_type:a.open_type,is_auto_open:a.is_auto_open,auto_open_time:a.auto_open_time,time_list:JSON.stringify(a.time_list),week_list:JSON.stringify(a.week_list)},method:"POST"}).then(function(e){i.$hideLoading(),0===e.code?t.showModal({title:"提示",content:e.msg,showCancel:!1,success:function(e){e.confirm&&t.navigateBack({delta:1})}}):t.showToast({icon:"none",title:e.msg})}))}}};e.default=y}).call(this,i("5486")["default"])},5883:function(t,e,i){"use strict";var a=function(){var t=this,e=t.$createElement;t._self._c;t._isMounted||(t.e0=function(e){t.form.is_open=1==t.form.is_open?2:1},t.e1=function(e){t.form.open_type=1},t.e2=function(e){t.form.open_type=1},t.e3=function(e){t.form.open_type=2},t.e4=function(e){t.form.open_type=2})},o=[];i.d(e,"a",function(){return a}),i.d(e,"b",function(){return o})},"7ed3":function(t,e,i){},"9d09":function(t,e,i){},b928:function(t,e,i){"use strict";var a=i("7ed3"),o=i.n(a);o.a},c97c:function(t,e,i){"use strict";i.r(e);var a=i("45ff"),o=i.n(a);for(var s in a)"default"!==s&&function(t){i.d(e,t,function(){return a[t]})}(s);e["default"]=o.a},df7d:function(t,e,i){"use strict";var a=i("9d09"),o=i.n(a);o.a},e6ce:function(t,e,i){"use strict";i.r(e);var a=i("5883"),o=i("c97c");for(var s in o)"default"!==s&&function(t){i.d(e,t,function(){return o[t]})}(s);i("b928"),i("df7d");var n=i("2877"),r=Object(n["a"])(o["default"],a["a"],a["b"],!1,null,"25af25c0",null);e["default"]=r.exports}},[["0752","common/runtime","common/vendor"]]]);