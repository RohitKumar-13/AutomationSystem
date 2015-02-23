require 'rubygems'
require 'selenium-webdriver'

module PrebookForm
	def getMainHeading
		script = "var E = document.getElementById('prebook_main');
			var Q = new Array();
			Q.push(E);

			while(Q.length > 0){
				var curr = Q.shift();

				for(var i = 0; i < curr.children.length; i++){
					var C = curr.children[i];
					Q.push(C);
					var Tag = C.tagName;

					if(Tag == 'h2' || Tag == 'H2'){
						return C.textContent;
					}
				}
			}

			return '';
		"
		puts OneLine.convertOneLine(script)
		return $driver.execute_script(OneLine.convertOneLine(script))
	end

	def getFormDescription
		script = "var E = document.getElementById('prebook_main');
			var Q = new Array();
			Q.push(E);

			while(Q.length > 0){
				var curr = Q.shift();

				for(var i = 0; i < curr.children.length; i++){
					var C = curr.children[i];
					Q.push(C);
					var Tag = C.tagName;

					if(Tag == 'p' || Tag == 'P'){
						return C.textContent;
					}
				}
			}

			return '';
		"
		return $driver.execute_script(OneLine.convertOneLine(script))
	end

	def getForm
		script = "
		function input(type, id, idtype){
			this.type = type;
			this.id = id;
			this.idtype = idtype
		}

		var E = document.getElementById('new_tenant');
		var Q = new Array();
		var B = new Array();
		Q.push(E);

		while(Q.length > 0){
			var curr = Q.shift();
			var id, idtype, type;
			for(var  i = 0; i < curr.children.length; i++){
				var ele = curr.children[i];
				Q.push(ele);
				var flag = false;
				var Tag = ele.tagName;
				id = '';
				idtype = '';
				if(Tag == 'input' || Tag == 'INPUT'){
					if(ele.id != ''){
						id = ele.id;
						idtype = 'id';
						type = ele.type;
						flag = true;
					} else if(ele.className != ''){
						id = ele.className;
						idtype = 'class';
						type = ele.type;
						flag = true;
					}
				} else if(Tag == 'select' || Tag == 'SELECT'){
					if(ele.id != ''){
						id = ele.id;
						idtype = 'id';
						type = 'dropdown';
						flag = true;
					} else if(ele.className != ''){
						id = ele.className;
						idtype = 'class';
						type = 'dropdown';
						flag = true;
					}
				} else if(Tag == 'textarea' || Tag == 'TEXTAREA'){
					if(ele.id != ''){
						id = ele.id;
						idtype = 'id';
						type = 'textarea';
						flag = true;
					} else if(ele.className != ''){
						id = ele.className;
						idtype = 'class';
						type = 'textarea';
						flag = true;
					}
				}

				if(flag == true){
					var obj = new input(type, id, idtype);
					B.push(obj);
				}
			}
		}
		return B;
		"
		return $driver.execute_script(OneLine.convertOneLine(script))
	end

	def verifyPrebookForm
		result = getForm
		
		if !result.nil?
			result.each do |form|
				if form['type'] == 'text'
					res =  Form.verifyInputText(form['id'], form['idtype'])
					if res == true
						puts "\nText Verified"
					else
						puts "Something wrong with element id #{form['id']}"
					end
				elsif form['type'] == 'textarea'
					res = Form.verifyInputTextarea(form['id'], form['idtype'])
					if res == true
						puts "\nText Verified"
					else
						puts "Something wrong with element id #{form['id']}"
					end
				elsif form['type'] == 'dropdown'
					res = Form.verifyInputSelect(form['id'], form['idtype'])
					if res == true
						puts "\nDropdown Verified"
					else
						puts "Something wrong with element id #{form['id']}"
					end
				end	
			end
		end
	end
end