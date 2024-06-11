
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%
    
   
    File file = new File("C:/Users/sumit/Downloads/check_ins.txt"); 
  
                    BufferedReader br = new BufferedReader(new FileReader(file)); 
  
                   String st="",data=""; 
                   while ((st = br.readLine()) != null) 
                   {
                   System.out.println(st);
                   data=st;
                   }
                  if(data.equals("next"))
                  {
                      info.l=info.l+1;
                     info.r= info.r+2;
                  }
                  else if(data.equals("prev"))
                  {
                      info.l=info.l-1;
                     info.r= info.r+2;
                  }
                  FileWriter fw=new FileWriter(file);
                  fw.write("");
                  fw.close();
                   String bid=request.getParameter("bid");
                   if(session.getAttribute("bid")==null)
                   {
                       session.setAttribute("bid", bid);
                       info.bid=bid;
                        info.l=0;
                        info.r=1;
                   }
                   
                       
                        
//                   if(request.getParameter("bid")!=null)
//                   {
//                       System.out.println("reset");
//                       session.setAttribute("bid", request.getParameter("bid"));
//                       info.bid=session.getAttribute("bid").toString();
//                        info.l=0;
//                        info.r=1;
//                   }
   
    int max=info.max;
      int l=info.l;
    int r=info.r;
    
    String li="pdf_img/"+bid+"_"+l+".png";
    String ri="pdf_img/"+bid+"_"+r+".png";
    System.out.println(li+"----"+ri);
    if(max==l || max==r)
    {
        info.l=0;
        info.r=1;
        l=info.l;
        r=info.r;
        session.removeAttribute("bid");
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Book</title>
        <script type = "text/JavaScript">
         
            function AutoRefresh( t ) {
               setTimeout("location.reload(true);", t);
            }
         
      </script>
<!--        <script type="text/javascript">
            
            
            function check(){
                  var xmlDoc = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
 
  xmlDoc.open('POST', './check_ins', true);
  xmlDoc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 
  xmlDoc.onreadystatechange = function() {
    if (xmlDoc.readyState === 4 && xmlDoc.status === 200) {
        var d=xmlDoc.responseText;
        alert(d);
     //   var da=d.split('#');

    }
  };
  xmlDoc.send("");
       
       
            }     
            
            
        </script>-->
   <style>
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  /* The image used */
  background-image: url("book.jpg");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
<style>
div.left {
  position: relative;
  width: 1600px;
  height: 1000px;
  border: 3px solid #73AD21;
  top: 60px;
  right: 0;
  left: 50px;
} 
div.right {
  position: relative;
  width: 490px;
  height: 800px;
  border: 3px solid #73AD21;
  bottom:  745px;
  right: 0;
  left: 1050px;
} 
div.absolute {
  position: absolute;
  top: 80px;
  right: 0;
  width: 200px;
  height: 100px;
  border: 3px solid #73AD21;
}
</style>
    </head>
    <body onload = "JavaScript:AutoRefresh(10000);">
      <div class="bg">
          <div class="left">
              <img src="<%=li%>" width="1600px" height="1000px"/>
</div>
<!--           <div class="right">
                <img src="<%=ri%>" width="490px" height="800px"/>
</div>-->
</div>
    </body>
</html>
