package connection;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

import org.springframework.http.HttpMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.resource.HttpResource;

import com.fasterxml.jackson.core.io.DataOutputAsStream;

public class Server extends Thread{

	public Server(){
		try {
			while(true) {
				ServerSocket SSsocket = new ServerSocket(5000);
				System.out.println("Ssocket is created waiting for client");
				Socket socket = SSsocket.accept();
				PrintStream printStream = new PrintStream(socket.getOutputStream());
				printStream.print("hello");
				String sendWord="hello";
				String sendWord2="jack";
				byte[] BendWord= sendWord.getBytes("UTF-8");
				byte[] BendWord2= sendWord2.getBytes("UTF-8");
				printStream.write(BendWord);
				printStream.write(BendWord2);
				//PrintWriter  PrintWriter = new PrintWriter(socket.getOutputStream(),true);
				//PrintWriter.print("hihihi");
				//System.out.println("server reply");
				printStream.flush();
				System.out.println("waiting");	
				socket.close();
				SSsocket.close();
				}
			
			//InetAddress add = socket.getLocalAddress();
			//OutputStream outPutStream = socket.getOutputStream();	
			//System.out.println("connected with client"+socket);
			
			//socket.setSoLinger(false, 1000);
			//System.out.println("iaddr"+add);
			
//			if(SSsocket.isClosed()) {
//				System.out.println("SSsocket is close");
//			}
//			if(socket.isClosed()) {
//				System.out.println("socket is close");
//			}
//			
			//System.out.println("socket disconnect");
		} catch (IOException e) {
			System.out.println("e"+e);
			
		}
		
	}
	
	public static void main(String[] args) {
		Server serverStart = new Server();
		
		
	}
}
