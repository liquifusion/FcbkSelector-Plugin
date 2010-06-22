(function($) { 
	/*
	 fcbkListSelection 1.10
	 - jQuery version required: 1.2.x, 1.3.x, 1.4.x
	 
	 Changelog:
	 - 1.1: added preselected items
	 - 1.0: project started
	 */
	/* Coded by: emposha <admin@emposha.com> */
	/* Copyright: Emposha.com <http://www.emposha.com/> - Distributed under MIT - Keep this message! */
	/* Modified by: Chris Peters <chris@clearcrystalmedia.com> */
	/*
	 * elem - ul element id or object
	 * width - width of ul
	 * height - height of each element
	 * row - number of items in row
	 */
	$.fcbkListSelection = function(elem, width, height, row){
		
		var bindEventsOnSearch = function(elem) {
			$("#" + elem.attr("id") + "_search").keyup(function(event){
				var filter = $(this).val();
				var count = 0;
				//if esc is pressed or nothing is entered
				if (event.keyCode == 27) {
					//if esc is pressed we want to clear the value of search box
					$(this).val('');
					//we want each row to be visible because if nothing is entered then all rows are matched.
					$("#" + elem.attr("id") + " .fcbklist_item").parent().removeClass('filtered');
				}
				else {
					$("#" + elem.attr("id") + " .fcbklist_item").each(function(){
						if ($(this).text().search(new RegExp(filter, "i")) < 0) {
							$(this).parent().removeClass("filtered");
						}
						else {
							$(this).parent().addClass("filtered");
							count++;
						}
					});
				}
				hiddenCheck();
			});
		}
		
		//get content of tabs
		var getContent = function(elem, tab) {
			var searchFilterLen = $("#" + elem.attr("id") + "_search").attr("value").length;
			switch(tab) {
				case "all":
					// Search filter in use
					if(searchFilterLen > 0) {
						elem.children("div.filtered").show();
						elem.children("div:not(.filtered)").hide();
					}
					// Search filter not in use
					else {
						elem.children("div").show();
					}
					break;
					
				case "selected":
					// Search filter in use
					elem.children("div:not(.selected)").hide();
					if(searchFilterLen > 0) {
						elem.children("div.selected").each(function(){
							if($(this).hasClass("filtered")) {
								$(this).show();
							}
							else {
								$(this).hide();
							}
						});
					}
					else {
						elem.children("div.selected").show();
					}
					break;
					
				case "unselected":
					// Search filter in use
					elem.children("div.selected").hide();
					if(searchFilterLen > 0) {
						elem.children("div:not(.selected)").each(function(){
							if($(this).hasClass("filtered")) {
								$(this).show();
							}
							else {
								$(this).hide();
							}
						});
					}
					else {
						elem.children("div:not(.selected)").show();
					}
					break;
			}
		}
		
		var hiddenCheck = function() {
			getContent(elem, curTab());
		}
		
		//add to selected items function
		var addToSelected = function(obj) {
			if(obj.hasClass("itemselected")) {
				$("#" + elem.attr("id") + "-view-selected-count").text(parseInt($("#" + elem.attr("id") + "-view-selected-count").text(), 10) - 1);
				obj.children(":checkbox").attr("checked", false);
				removeValue(obj);
			}
			else {
				$("#" + elem.attr("id") + "-view-selected-count").text(parseInt($("#" + elem.attr("id") + "-view-selected-count").text(), 10) + 1);
				obj.children(":checkbox").attr("checked", true);
				addValue(obj);
			}
		}
		
		var toggleSelected = function(obj, allowRemoval) {
			addToSelected(obj);
			obj.toggleClass("itemselected");
			obj.parents("div").toggleClass("selected");
			if(obj.hasClass("itemselected")) {
				$(document.createElement("img"))
					.attr("src", "../images/group-list-checked.png")
					.attr("alt", "")
					.addClass("checked")
					.prependTo(obj);
			}
			else if(allowRemoval) {
				obj.find("img.checked").remove();
			}
			hiddenCheck();
		}
		
		//bind onmouseover && click event on item
		var bindEventsOnItems = function(elem) {
			$.each(elem.children("div").children(".fcbklist_item"), function(i, obj){
				obj = $(obj);
				if(obj.children("input[checked]").length != 0) {
					addToSelected(obj);
					obj.addClass("itemselected");
					obj.parents("div").addClass("selected");
					if(obj.hasClass("itemselected")) {
						$(document.createElement("img"))
							.attr("src", "../images/group-list-checked.png")
							.attr("alt", "")
							.addClass("checked")
							.prependTo(obj);
					}
				}
				obj.click(function(){
					toggleSelected(obj, true);
				});
				obj.children("label").click(function(){
					toggleSelected(obj, true);
				});
				obj.mouseover(function(){
					obj.addClass("itemover");
				});
				obj.mouseout(function(){
					$(".itemover").removeClass("itemover");
				});
			});
		}
		
		//bind onclick event on filters
		var bindEventsOnTabs = function(elem) {
			$.each($("#selections_" + elem.attr("id") + " li"), function(i, obj){
				obj = $(obj);
				obj.click(function(){
					$(".view_on").removeClass("view_on");
					obj.addClass("view_on");
					getContent(elem, obj.attr("id").replace(elem.attr("id") + "_view_", ""));
				});
			});
		}
		
		//create control tabs
		var createTabs = function(elem, width) {
			var html =
				'<div class="list-selector-filters" style="width:' + (parseInt(width, 10) + 2) + 'px;">' +
					'<ul class="selections" id="selections_' + elem.attr("id") +'">' +
						'<li><h3>Show:</h3></li>' +
						'<li id="' + elem.attr("id") + '_view_all" class="view_on">' +
							'<a onclick="return false;" href="#">All</a>' +
						'</li>' +
						'<li id="' + elem.attr("id") + '_view_selected">' +
							'<a onclick="return false;" href="#">Selected (<span id="' + elem.attr("id") + '-view-selected-count">0</span>)</a>' +
						'</li>' +
						'<li id="' + elem.attr("id") + '_view_unselected">' +
							'<a onclick="return false;" href="#">Unselected</a>' +
						'</li>' +
						
					'</ul>' +
				'<div class="search">' +
					'<input id="' + elem.attr("id") + '_search" type="text" />' +
				'</div>' +
				'<div class="clearer"></div>' +
			'</div>';
			elem.before(html);
		}
		
		//wrap elements with div
		var wrapElements = function(elem, width, height, row) {
			elem.children("div").wrapInner('<div class="fcbklist_item"></div>');
			$(".fcbklist_item").css("height", height + "px");
			var newWidth = Math.ceil((parseInt(width, 10)) / parseInt(row, 10)) - 11;
			$(".fcbklist_item").css("width", newWidth + "px");
		}
		
		var addValue = function(obj, value) {
			var checkBox = obj.children("input:checkbox");
			checkBox.attr("checked", true);
		}
		
		var removeValue = function(obj) {
			var checkBox = obj.children("input:checkbox");
			checkBox.attr("checked", false);
		}
		
		var curTab = function() {
			return $(".view_on").attr("id").replace(elem.attr("id") + "_view_", "");
		}
		
		//main
		if (typeof(elem) != 'object') {
			elem = $(elem);
		}
		
		// + 30 to deal with vertical scrollbar
		elem.css("width", width + 30 + "px");
		elem.addClass("list-selector");
		
		createTabs(elem, width + 30);
		wrapElements(elem, width, height, row);
		
		bindEventsOnTabs(elem);
		bindEventsOnItems(elem);
		bindEventsOnSearch(elem);
		
	}

})(jQuery);