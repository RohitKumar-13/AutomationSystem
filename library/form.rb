require 'rubygems'
require 'selenium-webdriver'

module Form
	def self.verifyInputText(id, type)
		script = "var Type = '#{type}'; switch(Type) { case 'id' : var E = document.getElementById('#{id}'); E.value = 'nestaway'; var str = E.value; if(str == 'nestaway'){ return true;} break; case 'class': break;	case 'name' : break; }	return false; "
		return $driver.execute_script(script);
	end

	def self.verifyInputTextarea(id, type)
		script = "var id = '#{id}';var Type = '#{type}';switch(Type) { case 'id' : var E = document.getElementById('#{id}'); E.value = 'nestaway'; var str = E.value; if(str == 'nestaway'){ return true;} break; case 'class': break; case 'name' : break;} return false;"
		return $driver.execute_script(script);
	end
	def verifyInputPassword
	end

	def verifyInputSubmit
	end

	def verifyInputRadio
	end

	def verifyInputCheckbox
	end

	def verifyInputButton
	end

	def self.verifyInputSelect(id, type)
		script = "var Id = '#{id}';	var Type = '#{type}';switch(Type) {	case 'id' :	var E = document.getElementById(Id); var Options = new Array();	var Q = new Array();Q.push(E);while(Q.length > 0){var curr = Q.shift();	for(var i = 0; i < curr.children.length; i++){var ele = curr.children[i];Q.push(ele);var Tag = ele.tagName;	if(Tag == 'option' || Tag == 'OPTION'){	Options.push(ele.value);}}}	var B = new Array();var flag = true;for(var i = 0; i < Options.length; i++){E.selectedIndex = i;if(E.options[E.selectedIndex].value != Options[i]){flag = false;}}return flag;	case 'class': break;case 'name' : break;}return false;"
		return $driver.execute_script(script);
	end
end