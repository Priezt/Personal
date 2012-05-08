// ==UserScript==
// @name           auto_fpr
// @namespace      z.q
// @description    Auto FPR
// @include        http://arm.ironport.com/rules/builder?zfrom=*
// @require        http://code.jquery.com/jquery-1.7.2.min.js
// ==/UserScript==

var url = window.location.toString();
//alert(url);
if(url.indexOf("zfrom=") >= 0){
	var from_addr = url.substring(url.indexOf("zfrom=") + 6);
	from_addr = from_addr.replace(/%40/, "@");
	add_from_addr_rule(from_addr);
}

function add_from_addr_rule(from_addr){
	$("input#button-publish-rules").focus();
	$("input#rule-input-editable-editable").val(from_addr);
	$("select#editable-header-selector").val("from_addr");
	$("input#add-rule-button-editable-editable").trigger("click");
	wait_for_delete_img();
}

function wait_for_delete_img(){
	var row_count = $("td.rules_deleter_td").size();
	if(row_count > 1){
		window.setTimeout(publish_fpr_rule, 1000);
		return;
	}
	window.setTimeout(wait_for_delete_img, 1000);
}

function publish_fpr_rule(){
	$("input#button-publish-rules").trigger("click");
}
