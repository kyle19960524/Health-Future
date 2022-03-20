package connection;

import java.io.IOException;
import java.net.Socket;

public class Client {
	
	public Client(){
		try {
			Socket socket = new Socket("192.168.43.151",5000);
			socket.close();
		} catch (IOException e) {
			System.out.println("e"+e);
		}
	}

	public static void main(String[] args) {
		Client clientStart = new Client();

	}

}
