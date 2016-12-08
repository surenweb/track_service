<?php 
$version=isset($_GET['version'])? $_GET['version'] : "v_10" ;
?>

<html>
	
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<style>
pre {outline: 1px solid #ccc; padding: 5px; margin: 5px; }
.string { color: green; }
.number { color: darkorange; }
.boolean { color: blue; }
.null { color: magenta; }
.key { color: red; }
</style>

<script>
function syntaxHighlight(json) {
    json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}

$(document).ready (function () {		
		var api_version = $("#api_version").val() ;
		
		
		$.ajax({
				url: "http://localhost/apfLocation/api/"+api_version+"/apf_login.php",
				async: true,
				type: "POST",
				data: { task: "register",staffID:"3588",passCode:"test123",phoneNo:"988888",email:"api@test.com"},
				success: function (resData) {
					var str = JSON.stringify(resData, undefined, 4);
				   	$("#r1").html(syntaxHighlight(str));
					
					//IF Registered Then Check RegisterVerify
					$.ajax({	url: "http://localhost/apfLocation/api/"+api_version+"/apf_login.php",
								async: true,
								type: "POST",
								data: { task: "register_verify",staffID:"3588",mobileID:"3"},
								success: function (resData) {
									var str = JSON.stringify(resData, undefined, 4);
									$("#r2").html(syntaxHighlight(str));					
									}	
							});					
				}
		});	
		
		
		$.ajax({
				url: "http://localhost/apfLocation/api/"+api_version+"/apf_login.php",
				async: true,
				type: "POST",
				data: { task: "login",staffID:"3588",passCode:"test123"},
				success: function (resData) {
					var str = JSON.stringify(resData, undefined, 4);
					$("#r3").html(syntaxHighlight(str));					
				}
		});
		
		$.ajax({
				url: "http://localhost/apfLocation/api/"+api_version+"/apf_patrol.php",
				async: true,
				type: "POST",
				data: { task: "upload",value:"(3,3,'test','regular','foot',1,'2016-04-08 05:14:01','')"},
				success: function (resData) {
					var str = JSON.stringify(resData, undefined, 4);
					$("#r4").html(syntaxHighlight(str));					
				}
		});
		
		$.ajax({
				url: "http://localhost/apfLocation/api/"+api_version+"/apf_track.php",
				async: true,
				type: "POST",
				data: { task: "upload",value:"(3,3,3,27.719554,85.281772,'2016-04-08 05:14:01','3')"},
				success: function (resData) {
					var str = JSON.stringify(resData, undefined, 4);
					$("#r5").html(syntaxHighlight(str));					
				}
		});
		
		$.ajax({
				url: "http://localhost/apfLocation/api/"+api_version+"/apf_event.php",
				async: true,
				type: "POST",
				data: { task: "upload",
						value:"(3,3,'landslide','test event detail','',27.719554,85.281772,'3','2016-04-08 05:14:01')"
					},
				success: function (resData) {
					var str = JSON.stringify(resData, undefined, 4);
					$("#r6").html(syntaxHighlight(str));					
				}
		});
		
		$.ajax({
				url: "http://localhost/apfLocation/api/"+api_version+"/apf_image.php",
				async: true,
				type: "POST",
				data: { task: "upload",file_name:"ApiTest/3_3_hello.jpg",
						value:"/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCADpAV4DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDqoZ47mISQurpgcge1UdR0i31EbnXZKPuuo5/H1FYf2e90iUvbuSgA+mPT/wCsfzrZ0/XILsiObEM3TnoT/Q/WlGcZrUtwlDVA/jbxBosYgvJANqbIbhRlWwOAQR19+v1rv/DviKO70aye4nMs8m1Hl2jDSNkheO+K5C4tormJoZow6"
					},
				success: function (resData) {
					var str = JSON.stringify(resData, undefined, 4);
					$("#r7").html(syntaxHighlight(str));					
				}
		});
		
		
	});
</script>

</head>

<body>
	<input id="api_version" type="hidden" value="<?php echo $version; ?> "/>
	
	<h3 style="color:#1111ff;" >API Version : <?php echo $version; ?> </h3>
	
	<h3>login.php:register</h3>
	<pre><p id="r1"></p></pre>
	</br>
	
	<h3>login.php:register_verify</h3>
	<pre><p id="r2"></p></pre>
	</br>
	
	<h3>login.php:login</h3>
	<pre><p id="r3"></p></pre>
	</br>
	
	<h3>patrol:upload</h3>
	<pre><p id="r4"></p></pre>
	</br>
	
	<h3>track:upload</h3>
	<pre><p id="r5"></p></pre>
	</br>
	
	<h3>event:upload</h3>
	<pre><p id="r6"></p></pre>
	</br>
	
	<h3>Image:upload</h3>
	<pre><p id="r7"></p></pre>
	</br>
	
</body>
	
</html>