package servlet;

import adapters.SnSAdapter;
import com.amazonaws.services.sqs.model.Message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import adapters.SqSAdapter;

@WebServlet(name = "DemoServlet", urlPatterns = {"poll_messages"}, loadOnStartup = 1)
public class DemoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Retrieve published messages
        String queueUrl = new SqSAdapter().getQueueUrl(System.getenv("QUEUE_NAME"));

        List<Message> messages = new SqSAdapter().getMessages(queueUrl);
        response.getWriter().print(messages);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = request.getParameter("message");
        System.out.println(message);

        String topicArn = new SnSAdapter().createSnSTopic(System.getenv("TOPIC_NAME"));
        new SnSAdapter().publishMessage(topicArn, message);

        request.setAttribute("response", "Message successfully published.");
        request.getRequestDispatcher("response.jsp").forward(request, response);
    }
}