function desobfuscateMail(){if(document.querySelectorAll){els=document.querySelectorAll("span.email");for(var b=0;b<els.length;b++){el=els[b];mail=new Array(el.getAttribute("data-user"),el.getAttribute("data-domain")).join("@");a=document.createElement("a");a.href="mailto:"+mail;a.title=el.getAttribute("data-title");a.className = "email";a.innerHTML=mail;el.parentNode.replaceChild(a,el)}}}(function(){desobfuscateMail();})();
