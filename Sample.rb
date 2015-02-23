require 'rubygems'
require 'selenium-webdriver'

module Sample
	def self.getMainHeading
		script = "
		var element = document.getElementsByClassName('sample-home-grid');
		return element[0].children[0].textContent;
		"

		return $driver.execute_script(script)
	end

	def getSampleTile
		script = "
		function sample(url, head, list){
			this.image = url;
			this.heading = head;
			this.list = list;
		}
        var E = document.getElementsByClassName('sample-tile');
		var B = new Array();
		for(var i = 0; i < E.length; i++){
    		var Q = new Array();
            var url;
            var heading;
            var item = new Array();
    		Q.push(E[i]);
    		while(Q.length > 0){
        		var curr = Q.shift();
        		for(var j = 0; j < curr.children.length; j++){
                    var ele = curr.children[j];
            		Q.push(ele);
                    var Tag = ele.tagName;
                    if(Tag == 'img' || Tag == 'IMG'){
						url = ele.src;
					} else if(Tag == 'li' || Tag == 'LI'){
						item.push(ele.textContent);
					} else if(Tag == 'h2' || Tag == 'H2'){
						heading = ele.textContent;
					} else if (Tag == 'ul' || Tag == 'UL' || Tag == 'div' || Tag == 'DIV'){
						continue;
					}
                }
            }
            var obj = new sample(url, heading, item);
            B.push(obj);
        }
    	return B;
		"

		return $driver.execute_script(script)
	end

	def getViewDetail
		script = "
		var btn = document.getElementsByClassName('btn-white');
		for(var i = 0; i < btn.length; i++){
			var ele = btn[i];
			if(ele.textContent.toLowerCase() == 'view details'){
				return ele.href;
			}
		}
		"
		return $driver.execute_script(script)
	end
end
