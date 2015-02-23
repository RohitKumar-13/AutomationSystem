require 'rubygems'
require 'selenium-webdriver'

module WhyNestaway

	def getMainHeading
		script = "
		var element = document.getElementById('whyus')

		return element;
		"
		return $driver.execute_script(script)
	end

	def getPoints
		script = "
		function Point(cont, head, desc){
			this.content = cont;
			this.heading = head;
			this.paragraph = desc;
		}
		var E = document.getElementsByClassName('selectlist_sec');
		var B = new Array();
		for(var i = 0; i < E.length; i++){
			var cont=false, head, desc;
			var Q = new Array();
			Q.push(E[i]);
			while(Q.length > 0){
				var curr = Q.shift();
				for(var j = 0; j < curr.children.length; j++){
					var ele = curr.children[j];
					Q.push(ele);
					Tag = ele.tagName;
					if(Tag == 'span' || Tag == 'SPAN'){
						cont = true;
					} else if(Tag == 'h2' || Tag == 'H2'){
						head = ele.textContent;
					} else if(Tag == 'p' || Tag == 'P'){
						desc = ele.textContent;
					}
				}
			}
			var obj = new Point(cont, head, desc);
			B.push(obj);
		}

		return B;
		" 

		return $driver.execute_script(script)
	end
end