<%@ page import="java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
String filePath = "C:\\Users\\LENOVO\\eclipse-workspace\\TrendFurnish\\src\\main\\webapp\\admin\\images"; // Ensure it ends with a backslash
File file;
int maxFileSize = 5000 * 1024; // 5 MB
int maxMemSize = 5000 * 1024; // 5 MB

// Verify the content type
String contentType = request.getContentType();
if (contentType != null && contentType.indexOf("multipart/form-data") >= 0) {

    DiskFileItemFactory factory = new DiskFileItemFactory();
    // Maximum size that will be stored in memory
    factory.setSizeThreshold(maxMemSize);
    // Location to save data that is larger than maxMemSize.
    factory.setRepository(new File(filePath));

    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);
    // Maximum file size to be uploaded.
    upload.setSizeMax(maxFileSize);

    try { 
        // Parse the request to get file items.
        List<FileItem> fileItems = upload.parseRequest(request);

        // Process the uploaded file items
        Iterator<FileItem> i = fileItems.iterator();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>JSP File upload</title>");  
        out.println("</head>");
        out.println("<body>");

        while (i.hasNext()) {
            FileItem fi = i.next();
            if (!fi.isFormField()) {
                // Get the uploaded file parameters
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();

                // Write the file
                if (fileName.lastIndexOf("\\") >= 0) {
                    file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                } else {
                    file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                }
                fi.write(file);
                session.setAttribute("filepath", fileName.substring(fileName.lastIndexOf("\\") + 1));
                
                response.sendRedirect("addproduct.jsp");
            }
        }
        out.println("</body>");
        out.println("</html>");
    } catch (Exception ex) {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>File upload error</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<p>Error: " + ex.getMessage() + "</p>");
        out.println("</body>");
        out.println("</html>");
        ex.printStackTrace();
    }
} else {
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Servlet upload</title>");  
    out.println("</head>");
    out.println("<body>");
    out.println("<p>No file uploaded</p>"); 
    out.println("</body>");
    out.println("</html>");
}
%>
