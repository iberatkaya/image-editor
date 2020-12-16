(this.webpackJsonpclient=this.webpackJsonpclient||[]).push([[0],{24:function(e,t,a){},26:function(e,t,a){},31:function(e,t,a){"use strict";a.r(t);var n=a(5),c=a(0),r=a.n(c),i=a(9),s=a.n(i),o=(a(24),a(14)),l=a.n(o),d=a(16),j=a(8),b=(a(26),a(38)),u=a(34),h=a(35),p=a(36),x=a(37),O=a(39),g=a(40);var m=function(){var e=Object(c.useState)(),t=Object(j.a)(e,2),a=t[0],r=t[1],i=Object(c.useState)(),s=Object(j.a)(i,2),o=s[0],m=s[1],v=Object(c.useState)(),f=Object(j.a)(v,2),y=f[0],k=f[1],S=Object(c.useState)(),C=Object(j.a)(S,2),N=C[0],w=C[1],I=Object(c.useState)(),L=Object(j.a)(I,2),T=L[0],F=L[1],G=Object(c.useState)(),J=Object(j.a)(G,2),R=J[0],E=J[1],D=Object(c.useState)(),P=Object(j.a)(D,2),B=P[0],H=P[1];return Object(n.jsxs)(n.Fragment,{children:[Object(n.jsx)(b.a,{bg:"dark",variant:"dark",sticky:"top",children:Object(n.jsx)(b.a.Brand,{children:"Welcome to Random Image!"})}),Object(n.jsxs)(u.a,{style:{display:"flex",flexDirection:"column",alignItems:"center",padding:"12px 0px 12px 0",justifyContent:"center"},children:[void 0!==a?Object(n.jsxs)(h.a,{style:{alignItems:"center"},children:[Object(n.jsx)(p.a,{style:{maxHeight:"320px",paddingRight:"12px"},src:URL.createObjectURL(a),rounded:!0}),void 0!==o?Object(n.jsx)(p.a,{style:{maxHeight:"320px"},src:"data:image/jpeg;base64,".concat(o),rounded:!0}):Object(n.jsx)("div",{}),y?Object(n.jsx)(x.a,{animation:"border"}):Object(n.jsx)("div",{})]}):Object(n.jsx)("div",{}),Object(n.jsxs)(O.a,{onSubmit:function(){var e=Object(d.a)(l.a.mark((function e(t){var n,c,r;return l.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(e.prev=0,void 0!==a){e.next=4;break}return alert("Must enter an image!"),e.abrupt("return");case 4:return t.preventDefault(),(n=new FormData).append("file",a),void 0!==B&&n.append("grayscale",JSON.stringify(B)),void 0!==N&&n.append("height",JSON.stringify(N)),void 0!==T&&n.append("width",JSON.stringify(T)),void 0!==R&&n.append("preserveAspectRatio",JSON.stringify(R)),m(void 0),k(!0),e.next=15,fetch("https://ibk-image-editor.herokuapp.com/upload",{method:"POST",body:n});case 15:return c=e.sent,e.next=18,c.json();case 18:if(r=e.sent,console.log(r),!0!==r.status){e.next=25;break}k(!1),m(r.file),e.next=26;break;case 25:throw r;case 26:e.next=33;break;case 28:e.prev=28,e.t0=e.catch(0),console.log(e.t0),k(!1),!0===e.t0.error?alert(e.t0.reason):!1===e.t0.status&&alert(e.t0.message);case 33:case"end":return e.stop()}}),e,null,[[0,28]])})));return function(t){return e.apply(this,arguments)}}(),children:[Object(n.jsxs)(O.a.Group,{children:[Object(n.jsx)(O.a.Label,{children:"Image"}),Object(n.jsx)(O.a.File,{onChange:function(e){var t=e.target.files[0];null!==t&&(r(t),m(void 0))},id:"custom-file",accept:"image/*",label:void 0!==a?null===a||void 0===a?void 0:a.name:"Image",custom:!0}),Object(n.jsx)(O.a.Text,{className:"text-muted",children:"Select your image."})]}),Object(n.jsxs)(O.a.Group,{children:[Object(n.jsx)(O.a.Label,{children:"Height"}),Object(n.jsx)(O.a.Control,{value:N,onChange:function(e){var t=parseInt(e.target.value);isNaN(t)?w(void 0):w(parseInt(e.target.value))},type:"number",placeholder:"Enter height",min:10}),Object(n.jsx)(O.a.Text,{className:"text-muted",children:"Enter new image height. Leave blank to not change it."})]}),Object(n.jsxs)(O.a.Group,{children:[Object(n.jsx)(O.a.Label,{children:"Width"}),Object(n.jsx)(O.a.Control,{value:T,onChange:function(e){var t=parseInt(e.target.value);isNaN(t)?F(void 0):F(parseInt(e.target.value))},type:"number",placeholder:"Enter width",min:10}),Object(n.jsx)(O.a.Text,{className:"text-muted",children:"Enter new image width. Leave blank to not change it."})]}),Object(n.jsxs)(O.a.Group,{children:[Object(n.jsx)(O.a.Check,{checked:null!==R&&void 0!==R&&R,onChange:function(e){E(void 0===R||!R)},type:"checkbox",label:"Preserve Aspect Ratio"}),Object(n.jsx)(O.a.Text,{className:"text-muted",children:"Check to preserve the aspect ratio if only height or width is provided."})]}),Object(n.jsxs)(O.a.Group,{children:[Object(n.jsx)(O.a.Check,{checked:null!==B&&void 0!==B&&B,onChange:function(e){H(void 0===B||!B)},type:"checkbox",label:"Grayscale"}),Object(n.jsx)(O.a.Text,{className:"text-muted",children:"Check to make the image grayscale."})]}),Object(n.jsx)(h.a,{style:{justifyContent:"center"},children:Object(n.jsx)(g.a,{variant:"primary",type:"submit",children:"Submit"})})]})]})]})},v=function(e){e&&e instanceof Function&&a.e(3).then(a.bind(null,41)).then((function(t){var a=t.getCLS,n=t.getFID,c=t.getFCP,r=t.getLCP,i=t.getTTFB;a(e),n(e),c(e),r(e),i(e)}))};a(30);s.a.render(Object(n.jsx)(r.a.StrictMode,{children:Object(n.jsx)(m,{})}),document.getElementById("root")),v()}},[[31,1,2]]]);
//# sourceMappingURL=main.4c4e35a1.chunk.js.map