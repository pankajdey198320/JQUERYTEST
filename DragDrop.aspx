<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DragDrop.aspx.cs" Inherits="JqueryTest.DragDrop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <title></title>

       <link href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" type="text/css" />
    <%--<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>--%>
    <script   src="development-bundle/jquery-1.7.1.js" type="text/javascript"></script>
    <%--<script src="development-bundle/ui/jquery.effects.core.js" type="text/javascript"></script>--%>
<%--    <script src="development-bundle/ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="development-bundle/ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="development-bundle/ui/jquery.ui.mouse.js" type="text/javascript"></script>
    <script src="development-bundle/ui/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="development-bundle/ui/jquery.ui.droppable.js" type="text/javascript"></script>
    <script src="development-bundle/ui/jquery.ui.selectable.js" type="text/javascript"></script>--%>
    <script src="js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <style type="text/css"  >
    #drag
    {
        width:100px;
        height:100px;
        background-color:Lime;
        border: 1px solid blue ;
        
        }
         #drop
    {
        width:150px;
        height:150px;
        background-color:Yellow;
        border: 1px solid blue ;
        
        }
       .ListValue
       {
           height:30px;
           border:1px solid blue;
           background-color:Gray;
           width:250px;
        }
     .grouped {
	border:1px solid greenYellow;
	background-color:honeyDew;
}
	#meain .ui-selecting { background: #FECA40; }
	#meain .ui-selected { background: #F39814; color: white; }
}
	</style>
	

    <script type="text/javascript">

        $(function () {
            $(".ListValue").draggable({
                revert: "invalid",
                containment: "#meain",
                helper: function () {
                    var selected = $('.grouped');
                    if (selected.length === 0) {
                     //   selected = $(this);
                    }
                    var container = $('<div/>').attr('id', 'draggingContainer');
                    container.append(selected.clone());
                    return container;
                },
                opacity: 0.35
            });
            $("#DropDiv").droppable({
                addClasses: false,
                // scope: 'tasks',
                //activeClass: "ui-state-hover",
                hoverClass: "ui-state-active",
                drop: function (event, ui) {
                    var parnt = this;
                    //alert($(ui.draggable).find('span').html());
                    $(ui.helper).find('div').each(function (index) {
                        $("<li></li>").text($(this).text()).appendTo(parnt);
                    });
                 //   $("<li></li>").text(ui.helper.html()).appendTo(this);
                }
            });
            ///$("div").disableSelection();
            $(".ListValue").bind("click", function (event) {
                //  if (event.ctrlKey) {
                $(this).toggleClass('grouped');
                //}
            });
        });
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>

    <ul style="list-style:none;display:block;height:350px;" id="meain">
        <li style="width:45%;float:left;" > 
               <%-- <select id="ListItem" multiple="multiple" style="height:300px;">
                    <option class='blue draggable'>1111</option>
                     <option>222</option>
                      <option>3333</option>
                       <option>4444</option>
                </select>  --%>    
            <div id="ListItem" style="height:300px;">
                    <div  class="ListValue">111111111111111111111111<span style="display:none">20</span></div>
                    <div  class="ListValue">222222222222222222222222<span style="display:none">33</span></div>
                    <div  class="ListValue">333333333333333333333333<span style="display:none">44</span></div>
                    <div  class="ListValue">444444444444444444444444<span style="display:none">5</span></div>
                    <div  class="ListValue">555555555555555555555555<span style="display:none">4</span></div>
                    <div  class="ListValue">666666666666666666666666<span style="display:none">2</span></div>
        
        </div>   </li>
        <li style="width:45%;float:left;">
        <ol id="DropDiv" style="height:300px;"></ol>
        
        </li>
    </ul>
    <div id="drag" class="ui-widget-content"></div>
    <div id="drop" class="ui-widget-header"></div>
</body>
</html>
