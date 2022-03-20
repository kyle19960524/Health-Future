package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint(value ="/chat/{selfName}/{targetName}/{loginName}")
public class Server {
	private Session session;
	
	
	@OnOpen
	public void open(Session session, @PathParam("selfName") String selfName,
			                          @PathParam("targetName") String targetName) throws IOException {
		this.session=session;
		Users.user.put(selfName, this);
		//Users.user.get(targetName).session.getBasicRemote().sendText(selfName+"已經進入聊天室");
		//Users.UserschatNumber.put(chatNumber, this);
		//Users.UsersandchatNumber.put(loginName, chatNumber);
	
	}
	
	
	
	
	@OnMessage
	public void message(String message,@PathParam("selfName") String selfName,
			                           @PathParam("targetName") String targetName) throws IOException {
		Users.user.get(selfName).session.getBasicRemote().sendText(message);
		Users.user.get(targetName).session.getBasicRemote().sendText(message);
		
		//Users.user.get("andy").session.getBasicRemote().sendText(message);
		//Users.user.get("leo").session.getBasicRemote().sendText(message);
		//System.out.println(loginName);
		//System.out.println(chatNumber);
		
//		for(Server server :Users.user.values() ) {
//				System.out.println(server);
//		}
//		for(Server server :Users.UserschatNumber.values() ) {
//			System.out.println(server);
//	}
		
//		for(String key :Users.UsersandchatNumber.keySet() ) {
//			String value =Users.UsersandchatNumber.get(key);
//			if(value==chatNumber) {
//				Users.user.get(key).session.getBasicRemote().sendText(message);
//				System.out.println(key+""+value);
//			}
			
//			//System.out.println(key+""+value);
		//}
		
		//Users.user.get(loginName).session.getBasicRemote().sendText(message);
		//Users.UserschatNumber.get(chatNumber).session.getBasicRemote().sendText(message);
		
		//Users.user.get("leo").session.getBasicRemote().sendText(message);
		
//		for(Server server : Users.user.values()) {
//			server.session.getBasicRemote().sendText(message);
//		}
	}
	
	@OnClose
	public void close(Session session) {
		System.out.println("close");
	}
	
	
	@OnError
	public void error( Throwable t,Session session) {
		System.out.println(t.getMessage());
		System.out.println("Error");
	}
	
	
}
