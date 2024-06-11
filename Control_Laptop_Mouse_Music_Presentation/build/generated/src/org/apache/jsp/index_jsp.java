package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Presentation</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("    <script>\n");
      out.write("        function nextImage1() {\n");
      out.write("   // alert(\"aa\");\n");
      out.write("    //currentIndex = (currentIndex + 1) % images.length;\n");
      out.write("    var xhr = new XMLHttpRequest();\n");
      out.write("    var url = \"http://localhost:8084/Control_Laptop_Mouse_Music_Presentation/get_slide_number\"; // Replace this with the URL of your servlet\n");
      out.write("\n");
      out.write("    xhr.open(\"GET\", url, true);\n");
      out.write("\n");
      out.write("    // Set up the callback function to handle the response\n");
      out.write("    xhr.onreadystatechange = function () {\n");
      out.write("        if (xhr.readyState === 4 && xhr.status === 200) {\n");
      out.write("            // Request was successful, you can handle the response here\n");
      out.write("           // alert(xhr.responseText);\n");
      out.write("            if(xhr.responseText==\"right\")\n");
      out.write("            {\n");
      out.write("                currentIndex++;\n");
      out.write("                document.getElementById(\"fullscreen-img\").src =\"pdf_img/\"+currentIndex+\".png\";\n");
      out.write("            }\n");
      out.write("            else if(xhr.responseText==\"left\")\n");
      out.write("            {\n");
      out.write("                if (currentIndex==0)\n");
      out.write("                {\n");
      out.write("                    currentIndex=0;\n");
      out.write("                }\n");
      out.write("                else{\n");
      out.write("                currentIndex--;\n");
      out.write("            }\n");
      out.write("                document.getElementById(\"fullscreen-img\").src =\"pdf_img/\"+currentIndex+\".png\";\n");
      out.write("            }\n");
      out.write("        } else {\n");
      out.write("            // Handle any errors here\n");
      out.write("         //   alert(\"Error occurred while calling the servlet.\");\n");
      out.write("        }\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    xhr.send();\n");
      out.write("   // alert(currentIndex);\n");
      out.write("   // currentIndex++;\n");
      out.write("   // document.getElementById(\"fullscreen-img\").src =\"pdf_img/\"+currentIndex+\".png\";// images[currentIndex];\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(" var xhr = new XMLHttpRequest();\n");
      out.write("    var url = \"http://localhost:8084/Control_Laptop_Mouse_Music_Presentation/get_slide_number\"; // Replace this with the URL of your servlet\n");
      out.write("\n");
      out.write("    xhr.open(\"GET\", url, true);\n");
      out.write("\n");
      out.write("    // Set up the callback function to handle the response\n");
      out.write("    xhr.onreadystatechange = function () {\n");
      out.write("        if (xhr.readyState === 4 && xhr.status === 200) {\n");
      out.write("            // Request was successful, you can handle the response here\n");
      out.write("         currentIndex=   xhr.responseText;\n");
      out.write("         //alert(xhr.responseText);\n");
      out.write("//            if(xhr.responseText==\"right\")\n");
      out.write("//            {\n");
      out.write("               // currentIndex++;\n");
      out.write("                document.getElementById(\"fullscreen-img\").src =\"pdf_img/\"+currentIndex+\".png\";\n");
      out.write("//            }\n");
      out.write("//            else if(xhr.responseText==\"left\")\n");
      out.write("//            {\n");
      out.write("//                if (currentIndex==0)\n");
      out.write("//                {\n");
      out.write("//                    currentIndex=0;\n");
      out.write("//                }\n");
      out.write("//                else{\n");
      out.write("//                currentIndex--;\n");
      out.write("//            }\n");
      out.write("//                document.getElementById(\"fullscreen-img\").src =\"pdf_img/\"+currentIndex+\".png\";\n");
      out.write("//            }\n");
      out.write("        } else {\n");
      out.write("            // Handle any errors here\n");
      out.write("         //   alert(\"Error occurred while calling the servlet.\");\n");
      out.write("        }\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    xhr.send();\n");
      out.write("window.setTimeout( function() {\n");
      out.write("  window.location.reload();\n");
      out.write("}, 3000);\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("        \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"fullscreen-image\">\n");
      out.write("        <img id=\"fullscreen-img\" src=\"pdf_img/0.png\" alt=\"Full Screen Image\">\n");
      out.write("        <button id=\"next-btn\" onclick=\"nextImage1()\">Next Image</button>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"script.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
