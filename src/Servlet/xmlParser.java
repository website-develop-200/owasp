package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import  org.xml.sax.InputSource;

import javax.xml.parsers.*;
import java.io.*;
@WebServlet("/xmlParser")
public class xmlParser extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String XML = request.getParameter("xml");
		//File XML = new File("secret.xml");
		System.out.println(XML);
		try {
		PrintWriter out = response.getWriter();
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
       String str = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
       String content = str + XML;
        Document doc = dBuilder.parse(new InputSource(new StringReader(content)));
       out.println("Hello :" + doc.getDocumentElement().getTextContent());
      
       
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

}
}
